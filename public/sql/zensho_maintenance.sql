/*
 Navicat Premium Data Transfer

 Source Server         : tejima-vue-server
 Source Server Type    : MySQL
 Source Server Version : 50568
 Source Host           : localhost:3306
 Source Schema         : zensho_maintenance

 Target Server Type    : MySQL
 Target Server Version : 50568
 File Encoding         : 65001

 Date: 24/09/2021 22:41:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accounting_info
-- ----------------------------
DROP TABLE IF EXISTS `accounting_info`;
CREATE TABLE `accounting_info`  (
  `accounting_info_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `maintenance_id` bigint(20) UNSIGNED NOT NULL,
  `relation_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `relation_name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `accounting_amount` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0',
  `unincluding_price` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0',
  `including_price` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `accounting_year` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `editor` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `employee` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`accounting_info_id`) USING BTREE,
  INDEX `maintenance_progress_maintenance_id_foreign`(`maintenance_id`) USING BTREE,
  INDEX `maintenance_progress_progress_id_foreign`(`relation_code`) USING BTREE,
  INDEX `maintenance_progress_entered_by_foreign`(`including_price`) USING BTREE,
  CONSTRAINT `accounting_info_ibfk_1` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenances` (`maintenance_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 292 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of accounting_info
-- ----------------------------
INSERT INTO `accounting_info` VALUES (290, 101, '1111', 'abc', '2', '898', '900', '2021-05', '2021-09-11 12:01:21', '管理者', '2021-09-11 12:01:21', 'test');
INSERT INTO `accounting_info` VALUES (291, 100, '34', '34', '123', '21', '324', 'undefined-ed', '2021-09-24 11:06:55', '管理者', '2021-09-24 11:06:55', '12');

-- ----------------------------
-- Table structure for block_managers
-- ----------------------------
DROP TABLE IF EXISTS `block_managers`;
CREATE TABLE `block_managers`  (
  `block_manager_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `block_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`block_manager_id`) USING BTREE,
  INDEX `block_managers_block_id_foreign`(`block_id`) USING BTREE,
  INDEX `block_managers_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `block_managers_block_id_foreign` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`block_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `block_managers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of block_managers
-- ----------------------------
INSERT INTO `block_managers` VALUES (1, 1, 29, NULL, NULL);
INSERT INTO `block_managers` VALUES (2, 2, 30, NULL, NULL);
INSERT INTO `block_managers` VALUES (3, 3, 31, NULL, NULL);
INSERT INTO `block_managers` VALUES (4, 4, 32, NULL, NULL);
INSERT INTO `block_managers` VALUES (5, 5, 33, NULL, NULL);
INSERT INTO `block_managers` VALUES (6, 6, 34, NULL, NULL);
INSERT INTO `block_managers` VALUES (7, 7, 35, NULL, NULL);
INSERT INTO `block_managers` VALUES (8, 8, 36, NULL, NULL);
INSERT INTO `block_managers` VALUES (9, 9, 37, NULL, NULL);
INSERT INTO `block_managers` VALUES (10, 10, 38, NULL, NULL);
INSERT INTO `block_managers` VALUES (11, 11, 39, NULL, NULL);
INSERT INTO `block_managers` VALUES (12, 12, 40, NULL, NULL);
INSERT INTO `block_managers` VALUES (13, 13, 41, NULL, NULL);
INSERT INTO `block_managers` VALUES (14, 14, 42, NULL, NULL);
INSERT INTO `block_managers` VALUES (15, 15, 43, NULL, NULL);
INSERT INTO `block_managers` VALUES (16, 16, 44, NULL, NULL);
INSERT INTO `block_managers` VALUES (17, 17, 45, NULL, NULL);
INSERT INTO `block_managers` VALUES (18, 18, 46, NULL, NULL);
INSERT INTO `block_managers` VALUES (19, 19, 47, NULL, NULL);
INSERT INTO `block_managers` VALUES (20, 20, 48, NULL, NULL);
INSERT INTO `block_managers` VALUES (21, 21, 49, NULL, NULL);
INSERT INTO `block_managers` VALUES (22, 22, 50, NULL, NULL);
INSERT INTO `block_managers` VALUES (23, 23, 51, NULL, NULL);
INSERT INTO `block_managers` VALUES (24, 24, 52, NULL, NULL);
INSERT INTO `block_managers` VALUES (25, 25, 53, NULL, NULL);
INSERT INTO `block_managers` VALUES (26, 26, 54, NULL, NULL);
INSERT INTO `block_managers` VALUES (27, 27, 55, NULL, NULL);
INSERT INTO `block_managers` VALUES (28, 28, 56, NULL, NULL);
INSERT INTO `block_managers` VALUES (29, 29, 57, NULL, NULL);
INSERT INTO `block_managers` VALUES (30, 30, 58, NULL, NULL);
INSERT INTO `block_managers` VALUES (31, 31, 59, NULL, NULL);
INSERT INTO `block_managers` VALUES (32, 32, 60, NULL, NULL);
INSERT INTO `block_managers` VALUES (33, 33, 61, NULL, NULL);
INSERT INTO `block_managers` VALUES (34, 34, 62, NULL, NULL);
INSERT INTO `block_managers` VALUES (35, 35, 63, NULL, NULL);
INSERT INTO `block_managers` VALUES (36, 36, 64, NULL, NULL);
INSERT INTO `block_managers` VALUES (37, 37, 65, NULL, NULL);
INSERT INTO `block_managers` VALUES (38, 38, 66, NULL, NULL);
INSERT INTO `block_managers` VALUES (39, 39, 67, NULL, NULL);
INSERT INTO `block_managers` VALUES (40, 40, 68, NULL, NULL);
INSERT INTO `block_managers` VALUES (41, 41, 69, NULL, NULL);
INSERT INTO `block_managers` VALUES (42, 42, 70, NULL, NULL);
INSERT INTO `block_managers` VALUES (43, 43, 71, NULL, NULL);
INSERT INTO `block_managers` VALUES (44, 44, 72, NULL, NULL);
INSERT INTO `block_managers` VALUES (45, 45, 73, NULL, NULL);
INSERT INTO `block_managers` VALUES (46, 46, 74, NULL, NULL);
INSERT INTO `block_managers` VALUES (47, 47, 75, NULL, NULL);
INSERT INTO `block_managers` VALUES (48, 48, 76, NULL, NULL);
INSERT INTO `block_managers` VALUES (49, 49, 77, NULL, NULL);
INSERT INTO `block_managers` VALUES (50, 50, 78, NULL, NULL);
INSERT INTO `block_managers` VALUES (51, 51, 79, NULL, NULL);
INSERT INTO `block_managers` VALUES (52, 52, 80, NULL, NULL);
INSERT INTO `block_managers` VALUES (54, 53, 612, '2021-03-23 11:16:54', '2021-03-23 11:16:54');
INSERT INTO `block_managers` VALUES (55, 53, 615, NULL, NULL);
INSERT INTO `block_managers` VALUES (58, 58, 632, NULL, NULL);
INSERT INTO `block_managers` VALUES (59, 58, 634, NULL, NULL);

-- ----------------------------
-- Table structure for blocks
-- ----------------------------
DROP TABLE IF EXISTS `blocks`;
CREATE TABLE `blocks`  (
  `block_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `block_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `business_category_id` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bl_code` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`block_id`) USING BTREE,
  INDEX `blocks_district_id_foreign`(`district_id`) USING BTREE,
  INDEX `business_category_id`(`business_category_id`) USING BTREE,
  INDEX `bl_code`(`bl_code`) USING BTREE,
  INDEX `block_name`(`block_name`) USING BTREE,
  CONSTRAINT `blocks_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of blocks
-- ----------------------------
INSERT INTO `blocks` VALUES (1, '東北海道BL', 1, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (2, '西北海道BL', 1, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (3, '北東北BL', 1, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (4, '中東北BL', 1, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (5, '南東北BL', 1, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (6, '福島BL', 1, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (7, '南埼玉BL', 2, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (8, '北埼玉BL', 2, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (9, '東埼玉BL', 2, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (10, '西埼玉BL', 2, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (11, '北茨城BL', 3, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (12, '南茨城BL', 3, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (13, '西千葉BL', 3, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (14, '南千葉BL', 3, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (15, '東千葉BL', 3, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (16, '西東京BL', 4, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (17, '中東京BL', 4, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (18, '東東京BL', 4, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (19, '横浜・川崎BL', 4, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (20, '京浜BL', 4, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (21, '東神奈川BL', 5, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (22, '西神奈川BL', 5, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (23, '東静岡BL', 5, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (24, '西静岡BL', 5, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (25, '岐阜・一宮BL', 6, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (26, '東愛知BL', 6, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (27, '中愛知BL', 6, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (28, '西愛知BL', 6, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (29, '三重BL', 6, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (30, '長野・山梨BL', 7, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (31, '新潟BL', 7, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (32, '栃木BL', 7, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (33, '群馬BL', 7, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (34, '富山BL', 8, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (35, '石川BL', 8, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (36, '岐阜BL', 8, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (37, '福井BL', 8, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (38, '京滋BL', 8, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (39, '奈良BL', 9, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (40, '北大阪BL', 9, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (41, '南大阪・和歌山BL', 9, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (42, '兵庫BL', 9, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (43, '東四国BL', 10, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (44, '西四国BL', 10, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (45, '中国BL', 10, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (46, '広島BL', 10, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (47, '山口BL', 10, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (48, '北九州BL', 11, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (49, '福岡BL', 11, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (50, '西九州BL', 11, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (51, '南九州BL', 11, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (52, '沖縄BL', 11, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (53, 'テストBL', 12, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (54, '中千葉BL', 3, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (55, '南愛知BL', 6, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (56, '北神奈川BL', 5, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (57, '中埼玉BL', 2, 18, NULL, NULL, '');
INSERT INTO `blocks` VALUES (58, 'テストBL', 13, 2, NULL, NULL, '');

-- ----------------------------
-- Table structure for bmcategory_table
-- ----------------------------
DROP TABLE IF EXISTS `bmcategory_table`;
CREATE TABLE `bmcategory_table`  (
  `業態コード` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `業態名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `big_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `big_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `大分類表示順` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `middle_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `middle_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `中分類表示順` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `修繕指定大分類フラグ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `更新者コード` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `更新日` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bmcategory_table
-- ----------------------------
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '1', 'ウォークイン冷蔵庫', '1', '1', 'IKOU1', '2019/11/27');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '2', 'リーチイン冷蔵庫', '2', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '3', 'ドロアー冷蔵庫', '3', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '4', 'ドロアー冷凍庫', '4', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '5', 'ウォークイン冷凍庫', '5', '1', 'IKOU1', '2019/11/27');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '6', 'リーチイン冷凍庫', '6', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '7', '製氷機', '7', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '8', '冷蔵ショーケース', '8', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '9', 'アイスストッカー', '9', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '10', 'フライヤー', '10', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '11', 'スープジャー', '11', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '12', '電磁調理器', '12', '1', 'Z93968', '2020/06/03');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '13', '電子レンジ', '13', '1', 'Z93968', '2020/06/03');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '14', '炊飯器', '14', '1', 'Z93968', '2020/06/03');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '15', 'ウォーマー類', '15', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '16', '保温ジャー', '16', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '17', 'コーヒーマシン', '17', '1', 'Z93968', '2020/06/03');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '18', 'おろし機', '18', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '19', '飯盛機（ライスロボ）', '19', '1', 'IKOU1', '2018/05/31');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '20', '洗米機', '20', '1', 'Z93968', '2020/06/03');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '21', '食器洗浄機', '21', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '73', 'コールドテーブル・ドロワーテーブル', '73', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '74', 'ネタケース', '74', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '75', '冷水機', '75', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '80', '温蔵庫', '80', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '88', 'その他厨房機器', '88', '1', 'IKOU1', '2018/05/31');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '90', 'ガスレンジ', '90', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '94', 'パスタスチーマ', '94', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '121', '酢合わせ機', '121', '1', 'IKOU1', '2018/06/27');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '144', '巻きロボ', '144', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '145', '軍艦ロボ', '145', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '147', '巻きカッター', '147', '1', 'IKOU1', '2018/05/31');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '148', 'シャリロボ', '148', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '149', 'レーン', '149', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '150', '給茶器', '150', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '151', '下げ搬送', '151', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '152', '蒸し器', '152', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '153', '解凍機', '153', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '154', 'シャリ玉整列機', '154', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '209', 'タイマー', '209', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '236', '皿洗浄機', '226', '1', 'Z93968', '2019/11/13');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '258', 'マルチディスペンサー', '232', '1', 'Z93968', '2019/01/18');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '1', '厨房機器', '1', '264', '空皿搬送用レーン', '261', '1', 'Z93968', '2019/11/13');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '2', '給排水', '2', '22', '給水・給水管', '22', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '2', '給排水', '2', '23', '受水槽', '23', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '2', '給排水', '2', '24', 'シンク／シンクふた', '24', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '2', '給排水', '2', '25', '排水・排水管', '25', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '2', '給排水', '2', '26', '排水溝・グレーチング', '26', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '2', '給排水', '2', '27', 'グリストラップ', '27', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '2', '給排水', '2', '28', '浄化槽', '28', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '2', '給排水', '2', '29', 'トイレ', '29', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '2', '給排水', '2', '30', '手洗い器', '30', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '2', '給排水', '2', '31', '手乾燥機・エアータオル', '31', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '2', '給排水', '2', '32', '浄水器', '32', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '3', '電気', '3', '33', '電気設備', '33', '1', 'IKOU1', '2018/05/31');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '3', '電気', '3', '34', '照明器具', '34', '1', 'IKOU1', '2018/06/27');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '3', '電気', '3', '35', '受電設備', '35', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '4', '空調', '4', '36', 'エアコン', '36', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '4', '空調', '4', '37', '換気扇', '37', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '4', '空調', '4', '38', 'ダクト', '38', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '4', '空調', '4', '39', '給排気', '39', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '4', '空調', '4', '224', '冷蔵ゴミ庫', '224', '1', 'IKOU1', '2018/03/29');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '5', 'ガス設備', '5', '40', '給湯器（湯沸し器）', '40', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '5', 'ガス設備', '5', '41', 'ガス器具・ガス設備', '41', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '6', 'リフト', '6', '42', 'ダムウェダー', '42', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '6', 'リフト', '6', '220', 'エレベーター', '220', '1', 'IKOU1', '2018/02/27');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '7', '開口部', '7', '43', 'ドア', '43', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '7', '開口部', '7', '44', '鍵・シリンダー', '44', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '7', '開口部', '7', '45', '窓・サッシ', '45', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '8', '内外装', '8', '46', '内装（壁・床・天井・クロス他）', '46', '1', 'IKOU1', '2018/06/27');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '8', '内外装', '8', '47', '外装（屋根・外壁・雨どい他）', '47', '1', 'IKOU1', '2018/06/27');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '8', '内外装', '8', '48', 'ブラインド・ロールスクリーン', '48', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '8', '内外装', '8', '49', '家具（イス・テーブル・ソファ他）', '49', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '8', '内外装', '8', '50', '建物', '50', '1', 'IKOU1', '2018/06/27');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '8', '内外装', '8', '163', 'ＤＴ', '163', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '9', '外構', '9', '51', '駐車場', '51', '1', 'IKOU1', '2018/05/31');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '9', '外構', '9', '52', '植栽剪定', '52', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '9', '外構', '9', '166', 'バリカー', '166', '1', 'IKOU1', '2018/05/31');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '9', '外構', '9', '167', '車止め', '167', '1', 'IKOU1', '2018/05/31');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '9', '外構', '9', '168', '側溝', '168', '1', 'IKOU1', '2018/05/31');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '9', '外構', '9', '169', 'フェンス', '169', '1', 'IKOU1', '2018/05/31');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '9', '外構', '9', '170', 'ブロック塀', '170', '1', 'IKOU1', '2018/05/31');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '9', '外構', '9', '171', 'その他外構関連', '171', '1', 'IKOU1', '2018/05/31');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '10', '看板・テント', '10', '53', '看板（ポール・ファサード・イン他）', '53', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '10', '看板・テント', '10', '54', '懸垂幕', '54', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '10', '看板・テント', '10', '55', '管球交換', '55', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '10', '看板・テント', '10', '174', 'テント', '174', '1', 'IKOU1', '2017/07/06');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '11', '通信機器', '11', '56', '有線', '56', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '11', '通信機器', '11', '57', '電話・ＦＡＸ', '57', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '11', '通信機器', '11', '58', 'ラベラー', '58', '1', 'IKOU1', '2018/05/31');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '11', '通信機器', '11', '59', '入店センサー', '59', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '11', '通信機器', '11', '60', 'ＡＣＣＳ', '60', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '11', '通信機器', '11', '61', 'ベルスター', '61', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '11', '通信機器', '11', '177', 'モニター・ＴＶ', '177', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '11', '通信機器', '11', '183', 'タッチパネル', '183', '1', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '11', '通信機器', '11', '184', 'マイク・インカム', '184', '1', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '11', '通信機器', '11', '218', 'POS', '218', '1', 'IKOU1', '2018/05/31');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '11', '通信機器', '11', '228', 'ハンディ', '228', '1', 'IKOU1', '2018/05/31');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '11', '通信機器', '11', '237', 'ペッパー君', '229', '1', 'Z93968', '2018/08/31');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '12', '害虫駆除', '12', '62', '害虫駆除', '62', '0', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '13', '清掃', '13', '63', 'エアコン清掃', '63', '0', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '13', '清掃', '13', '64', 'ダクト清掃', '64', '0', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '13', '清掃', '13', '65', 'グリストラップ清掃', '65', '0', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '13', '清掃', '13', '66', 'フロア清掃', '66', '0', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '14', '防災設備', '14', '67', '防災設備（消火器他）', '67', '0', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '15', '廃棄物', '15', '68', '廃油', '68', '0', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '15', '廃棄物', '15', '69', '産業廃棄物', '69', '0', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '15', '廃棄物', '15', '70', '粗大ごみ', '70', '0', 'IKOU1', '2017/04/28');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '16', '備品', '16', '189', '掃除機', '189', '0', 'IKOU1', '2017/07/06');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '16', '備品', '16', '191', '洗濯機', '191', '0', 'IKOU1', '2017/08/02');
INSERT INTO `bmcategory_table` VALUES ('111', 'HS', '16', '備品', '16', '9999', 'その他', '999', '0', 'IKOU1', '2018/08/30');

-- ----------------------------
-- Table structure for business_categories
-- ----------------------------
DROP TABLE IF EXISTS `business_categories`;
CREATE TABLE `business_categories`  (
  `business_category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_category_code` bigint(20) UNSIGNED NOT NULL,
  `business_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`business_category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of business_categories
-- ----------------------------
INSERT INTO `business_categories` VALUES (1, 0, 'ZHD', '');
INSERT INTO `business_categories` VALUES (2, 1, 'SK', 'img_sukiya.png');
INSERT INTO `business_categories` VALUES (3, 2, 'GFF', '');
INSERT INTO `business_categories` VALUES (4, 12, 'TOJ', '');
INSERT INTO `business_categories` VALUES (5, 33, 'ST', '');
INSERT INTO `business_categories` VALUES (6, 36, 'ON', '');
INSERT INTO `business_categories` VALUES (7, 37, 'TA', '');
INSERT INTO `business_categories` VALUES (8, 38, 'IY', '');
INSERT INTO `business_categories` VALUES (9, 42, 'JP', '');
INSERT INTO `business_categories` VALUES (10, 43, 'JO', '');
INSERT INTO `business_categories` VALUES (11, 51, 'Q', '');
INSERT INTO `business_categories` VALUES (12, 61, 'PC', '');
INSERT INTO `business_categories` VALUES (13, 71, 'GM', '');
INSERT INTO `business_categories` VALUES (14, 72, 'TK', '');
INSERT INTO `business_categories` VALUES (15, 90, 'N-事・TC', '');
INSERT INTO `business_categories` VALUES (16, 91, 'N', '');
INSERT INTO `business_categories` VALUES (17, 101, 'C', '');
INSERT INTO `business_categories` VALUES (18, 111, 'HS', 'img_hamazushi.png');
INSERT INTO `business_categories` VALUES (19, 121, 'ET', '');
INSERT INTO `business_categories` VALUES (20, 131, 'TJ', '');
INSERT INTO `business_categories` VALUES (21, 132, 'TJミート', '');
INSERT INTO `business_categories` VALUES (22, 133, 'G', '');
INSERT INTO `business_categories` VALUES (23, 134, 'IB', '');
INSERT INTO `business_categories` VALUES (24, 135, 'NIB', '');
INSERT INTO `business_categories` VALUES (25, 136, 'YCP', '');
INSERT INTO `business_categories` VALUES (26, 181, 'BB', '');
INSERT INTO `business_categories` VALUES (27, 182, 'VS', '');
INSERT INTO `business_categories` VALUES (28, 183, 'MW', '');
INSERT INTO `business_categories` VALUES (29, 211, 'SB', '');
INSERT INTO `business_categories` VALUES (30, 281, 'ZE', '');
INSERT INTO `business_categories` VALUES (31, 341, 'HY', '');
INSERT INTO `business_categories` VALUES (32, 342, 'WY', '');
INSERT INTO `business_categories` VALUES (33, 343, 'NBK', '');
INSERT INTO `business_categories` VALUES (34, 351, 'ML', '');
INSERT INTO `business_categories` VALUES (35, 361, 'MC', '');
INSERT INTO `business_categories` VALUES (36, 371, 'UV', '');
INSERT INTO `business_categories` VALUES (37, 431, 'ZR', '');
INSERT INTO `business_categories` VALUES (38, 441, 'YTS', '');
INSERT INTO `business_categories` VALUES (39, 461, 'KA', '');
INSERT INTO `business_categories` VALUES (40, 471, 'VF', '');
INSERT INTO `business_categories` VALUES (41, 481, 'TR', '');
INSERT INTO `business_categories` VALUES (42, 501, 'KH', '');
INSERT INTO `business_categories` VALUES (43, 551, 'MF', '');
INSERT INTO `business_categories` VALUES (44, 561, 'KN', '');
INSERT INTO `business_categories` VALUES (45, 601, 'RHI', '');
INSERT INTO `business_categories` VALUES (46, 611, 'SLS', '');
INSERT INTO `business_categories` VALUES (47, 621, 'HL', '');
INSERT INTO `business_categories` VALUES (48, 661, 'ZCE', '');
INSERT INTO `business_categories` VALUES (49, 861, 'ATK', '');
INSERT INTO `business_categories` VALUES (50, 870, 'FCO', '');
INSERT INTO `business_categories` VALUES (51, 871, 'FMA', '');
INSERT INTO `business_categories` VALUES (52, 872, 'AVN', '');
INSERT INTO `business_categories` VALUES (53, 873, 'MRC', '');
INSERT INTO `business_categories` VALUES (54, 874, 'DEL', '');
INSERT INTO `business_categories` VALUES (55, 881, 'MY', '');
INSERT INTO `business_categories` VALUES (56, 882, 'YG', '');
INSERT INTO `business_categories` VALUES (57, 883, 'JF', '');
INSERT INTO `business_categories` VALUES (58, 891, 'ME', '');

-- ----------------------------
-- Table structure for business_category_options
-- ----------------------------
DROP TABLE IF EXISTS `business_category_options`;
CREATE TABLE `business_category_options`  (
  `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_category_id` int(10) UNSIGNED NOT NULL,
  `option_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `option_value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`option_id`) USING BTREE,
  INDEX `business_category_options_business_category_id_foreign`(`business_category_id`) USING BTREE,
  CONSTRAINT `business_category_options_business_category_id_foreign` FOREIGN KEY (`business_category_id`) REFERENCES `business_categories` (`business_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of business_category_options
-- ----------------------------
INSERT INTO `business_category_options` VALUES (1, 18, 'notification_time', '6', NULL, NULL);
INSERT INTO `business_category_options` VALUES (2, 18, 'renotification_time', '24', NULL, NULL);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `category_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, '厨房機器');
INSERT INTO `categories` VALUES (2, '給排水');
INSERT INTO `categories` VALUES (3, '電気');
INSERT INTO `categories` VALUES (4, '空調');
INSERT INTO `categories` VALUES (5, 'ガス設備');
INSERT INTO `categories` VALUES (6, 'リフト');
INSERT INTO `categories` VALUES (7, '開口部');
INSERT INTO `categories` VALUES (8, '内外装');
INSERT INTO `categories` VALUES (9, '外構');
INSERT INTO `categories` VALUES (10, '看板・テント');
INSERT INTO `categories` VALUES (11, '通信機器');
INSERT INTO `categories` VALUES (12, '害虫駆除');
INSERT INTO `categories` VALUES (13, '清掃');
INSERT INTO `categories` VALUES (14, '防災設備');
INSERT INTO `categories` VALUES (15, '廃棄物');
INSERT INTO `categories` VALUES (16, '備品');

-- ----------------------------
-- Table structure for customer_information
-- ----------------------------
DROP TABLE IF EXISTS `customer_information`;
CREATE TABLE `customer_information`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `有効フラグ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `郵便番号` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `都道府県コード` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `都道府県` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `住所` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ビル名` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TEL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FAX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `代表者名` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `代表者役職` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `工事請負等基本契約日` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `機密保持契約締結日` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `業態コード` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `業態名称` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customergroup_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customergroup` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `担当者NO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `担当者氏名` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `担当者部署` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `担当者役職` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `担当者TEL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `担当者FAX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `担当者携帯電話` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `担当者メールアドレス` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `担当者備考` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `情報管理責任者フラグ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `統括管理者フラグ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `離職フラグ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `更新者コード` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updated_at` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 408 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_information
-- ----------------------------
INSERT INTO `customer_information` VALUES (1, '1750', '1', '1100001327', '山陰酸素工業株式会社　松江支店', 'ｻﾝｲﾝｻﾝｿｺｳｷﾞｮｳｶﾌﾞｼｷｶﾞｲｼｬ ﾏﾂｴｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '0852-23-3600', '0852-27-6037', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (2, '1766', '1', '1100001858', '中野水土工業所', 'ﾅｶﾉﾐｽﾞﾄﾞｺｳｷﾞｮｳｼｮ', NULL, NULL, NULL, NULL, NULL, '0745-53-2753', '0745-53-7155', NULL, NULL, NULL, NULL, '111', 'HS', '7', '空調換気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (3, '1766', '1', '1100001858', '中野水土工業所', 'ﾅｶﾉﾐｽﾞﾄﾞｺｳｷﾞｮｳｼｮ', NULL, NULL, NULL, NULL, NULL, '0745-53-2753', '0745-53-7155', NULL, NULL, NULL, NULL, '111', 'HS', '5', '給排水衛生', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (4, '1772', '1', '1100001301', '上野ガス株式会社', 'ｶﾐﾉｶﾞｽｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '0595-21-3611', '0595-23-6712', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (5, '1774', '1', '1100001938', '株式会社ＣＡＲＲＹ', 'CARRY', NULL, NULL, NULL, NULL, NULL, '059-329-7768', '059-329-7820', NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/11', NULL);
INSERT INTO `customer_information` VALUES (6, '1790', '1', '1100001947', '第一商事', 'ﾀﾞｲｲﾁｼｮｳｼﾞ', NULL, NULL, NULL, NULL, NULL, '0538-32-5181', '0538-37-3708', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (7, '1791', '1', '1100001910', '株式会社ヨシオ', 'ﾖｼｵ', NULL, NULL, NULL, NULL, NULL, '0537-61-4400', '0537-23-0112', NULL, NULL, NULL, NULL, '111', 'HS', '10', '窓ガラスサッシ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/29', NULL);
INSERT INTO `customer_information` VALUES (8, '1793', '1', '1100001902', '宮吉硝子株式会社', 'ﾐﾔｷﾁｶﾞﾗｽｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '052-882-7722', '052-884-6470', NULL, NULL, NULL, NULL, '111', 'HS', '9', '内装', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/09/14', NULL);
INSERT INTO `customer_information` VALUES (9, '1793', '1', '1100001902', '宮吉硝子株式会社', 'ﾐﾔｷﾁｶﾞﾗｽｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '052-882-7722', '052-884-6470', NULL, NULL, NULL, NULL, '111', 'HS', '8', '建具工事', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/09/14', NULL);
INSERT INTO `customer_information` VALUES (10, '1800', '1', '1100000116', 'イワタニ関東', 'ｲﾜﾀﾆｶﾝﾄｳ', NULL, NULL, NULL, NULL, NULL, '048-646-7070', '048-814-3681', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (11, '1814', '1', '1100001899', 'トーショーエンジニアリング', 'ﾄｰｼｮｰｴﾝｼﾞﾆｱﾘﾝｸﾞ', NULL, NULL, NULL, NULL, NULL, '043-464-0900', '043-464-0901', NULL, NULL, NULL, NULL, '111', 'HS', '5', '給排水衛生', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (12, '1816', '1', '1100000571', 'ウチノ看板', 'ｳﾁﾉｶﾝﾊﾞﾝ', NULL, NULL, NULL, NULL, NULL, '042-947-8888', '042-947-3333', NULL, NULL, NULL, NULL, '111', 'HS', '15', '看板テント', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (13, '2650', '1', '1199100030', 'テクノサポート', 'ﾃｸﾉｻﾎﾟｰﾄ', NULL, NULL, NULL, NULL, NULL, NULL, '03-5783-8772', NULL, NULL, NULL, NULL, '111', 'HS', '13', '受水槽', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS105122', '2017/07/01', NULL);
INSERT INTO `customer_information` VALUES (14, '2650', '1', '1199100030', 'テクノサポート', 'ﾃｸﾉｻﾎﾟｰﾄ', NULL, NULL, NULL, NULL, NULL, NULL, '03-5783-8772', NULL, NULL, NULL, NULL, '111', 'HS', '5', '給排水衛生', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS105122', '2017/07/01', NULL);
INSERT INTO `customer_information` VALUES (15, '1830', '1', '1100001798', 'シードトラスト', 'ｼｰﾄﾞﾄﾗｽﾄ', NULL, NULL, NULL, NULL, NULL, '03-5780-9330', '03-5780-9107', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (16, '1832', '1', '1100001627', '明成通信株式会社', 'ﾒｲｾｲﾂｳｼﾝｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '03-5733-2514', '03-3298-2261', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (17, '1836', '1', '1100001578', 'シーティディーネットワークス株式会社', 'ｼｰﾃｨﾃﾞｨｰﾈｯﾄﾜｰｸｽｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '03-5644-0911', '03-5644-0915', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (18, '1838', '1', '1100001958', 'gCストーリー', 'ｼﾞｰｼｰｽﾄｰﾘｰ', NULL, NULL, NULL, NULL, NULL, '03-5639-3801', '03-5639-3802', NULL, NULL, NULL, NULL, '111', 'HS', '15', '看板テント', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2017/11/15', NULL);
INSERT INTO `customer_information` VALUES (19, '1840', '1', '1100000035', 'マザー・テクノサービス', 'ﾏｻﾞｰ･ﾃｸﾉｻｰﾋﾞｽ', NULL, NULL, NULL, NULL, NULL, '03-5615-2431', '03-5615-2408', NULL, NULL, NULL, NULL, '111', 'HS', '10', '窓ガラスサッシ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (20, '1840', '1', '1100000035', 'マザー・テクノサービス', 'ﾏｻﾞｰ･ﾃｸﾉｻｰﾋﾞｽ', NULL, NULL, NULL, NULL, NULL, '03-5615-2431', '03-5615-2408', NULL, NULL, NULL, NULL, '111', 'HS', '8', '建具工事', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (21, '1845', '1', '1100000073', '前田道路', 'ﾏｴﾀﾞﾄﾞｳﾛ', NULL, NULL, NULL, NULL, NULL, '03-5487-0022', '03-5487-0039', NULL, NULL, NULL, NULL, '111', 'HS', '8', '建具工事', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (22, '1846', '1', '1100000096', '平安コーポレーション', 'ﾍｲｱﾝｺｰﾎﾟﾚｰｼｮﾝ', NULL, NULL, NULL, NULL, NULL, '03-5486-5501', '03-5486-0555', NULL, NULL, NULL, NULL, '111', 'HS', '9', '内装', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (23, '1846', '1', '1100000096', '平安コーポレーション', 'ﾍｲｱﾝｺｰﾎﾟﾚｰｼｮﾝ', NULL, NULL, NULL, NULL, NULL, '03-5486-5501', '03-5486-0555', NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (24, '1848', '1', '200001564', '北沢産業', 'ｷﾀｻﾞﾜｻﾝｷﾞｮｳ', NULL, NULL, NULL, NULL, NULL, '03-5485-5090', '03-5485-5144', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (25, '1853', '1', '1100001604', 'TOTOエムテック株式会社', 'TOTOｴﾑﾃｯｸｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '03-5339-0707', '03-5339-0748', NULL, NULL, NULL, NULL, '111', 'HS', '7', '空調換気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS105122', '2017/07/31', NULL);
INSERT INTO `customer_information` VALUES (26, '1869', '1', '1100001901', '佐藤金物', 'ｻﾄｳｶﾅﾓﾉ', NULL, NULL, NULL, NULL, NULL, '03-3745-6431', '03-3745-6435', NULL, NULL, NULL, NULL, '111', 'HS', '10', '窓ガラスサッシ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (27, '1881', '1', '1100000069', '清和工業', 'ｾｲﾜｺｳｷﾞｮｳ', NULL, NULL, NULL, NULL, NULL, '0298-32-4780', '0298-32-4784', NULL, NULL, NULL, NULL, '111', 'HS', '7', '空調換気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (28, '1883', '1', '1100000317', 'アキラ建設', 'ｱｷﾗｹﾝｾﾂ', NULL, NULL, NULL, NULL, NULL, '0296-24-2005', '0296-25-2188', NULL, NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (29, '1887', '1', '1100001871', '佐野ｶﾞｽ', 'ｻﾉｶﾞｽ', NULL, NULL, NULL, NULL, NULL, '0283-22-6262', '0283-22-6264', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (30, '1895', '1', '1100001893', 'エナキス（上田支店）', 'ｴﾅｷｽ(ｳｴﾀﾞｼﾃﾝ)', NULL, NULL, NULL, NULL, NULL, '0268-38-8585', '0268-38-8667', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/07/04', NULL);
INSERT INTO `customer_information` VALUES (31, '1898', '1', '1100001194', 'エナキス（長野支店）', 'ｴﾅｷｽ(ﾅｶﾞﾉｼﾃﾝ)', NULL, NULL, NULL, NULL, NULL, '026-293-9110', '026-293-8320', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/07/04', NULL);
INSERT INTO `customer_information` VALUES (32, '1902', '1', '1100001842', 'トーケンコンサル', 'ﾄｰｹﾝｺﾝｻﾙ', NULL, NULL, NULL, NULL, NULL, '024-935-0313', '024-935-0331', NULL, NULL, NULL, NULL, '111', 'HS', '10', '窓ガラスサッシ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (33, '1909', '1', '1100001925', '㈱カミヤマ', 'ｶﾌﾞｶﾐﾔﾏ', NULL, NULL, NULL, NULL, NULL, '019-643-6211', '019-643-6215', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (34, '1926', '1', '1100001550', 'アネシス', 'ｱﾈｼｽ', NULL, NULL, NULL, NULL, NULL, '03-6433-5921', '03-6433-5920', NULL, NULL, NULL, NULL, '111', 'HS', '7', '空調換気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2019/06/16', NULL);
INSERT INTO `customer_information` VALUES (35, '1927', '1', '1100000479', 'クラシアン', 'ｸﾗｼｱﾝ', NULL, NULL, NULL, NULL, NULL, '0120-48-1155', '045-473-7059', NULL, NULL, NULL, NULL, '111', 'HS', '5', '給排水衛生', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (36, '2732', '1', '1100000000', '東洋プロパン瓦斯（株）本社・日向営業所', 'ﾄｳﾖｳﾌﾟﾛﾊﾟﾝｶﾞｽｶﾌﾞｼｷｶﾞｲｼｬﾎﾝｼｬ･ﾋｭｳｶﾞｴｲｷﾞｮｳｼｮ', '883-0062', '45', '宮崎県', '日向市大字日知屋字亀川17330', NULL, '0982-52-2615', '0982-52-8927', NULL, NULL, NULL, NULL, '111', 'HS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2019/09/08', NULL);
INSERT INTO `customer_information` VALUES (37, '2663', '1', '1199720004', 'TOTOｴﾑﾃｯｸ株式会社', 'ﾄｰﾄｰｴﾑﾃｯｸｶﾌﾞｼｷｶｲｼｬ', NULL, NULL, NULL, NULL, NULL, '03-5339-0708', '03-53390748', NULL, NULL, NULL, NULL, '111', 'HS', '9', '内装', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/07/07', NULL);
INSERT INTO `customer_information` VALUES (38, '2539', '1', '1199625004', 'ノザキ株式会社', 'ﾉｻﾞｷｶﾌﾞｼｷｶｲｼｬ', NULL, NULL, NULL, NULL, NULL, '052-431-1351', '052-431-4424', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/05/31', NULL);
INSERT INTO `customer_information` VALUES (39, '2555', '1', '1199620031', '富山アムズ', 'ﾄﾔﾏｱﾑｽﾞ', NULL, NULL, NULL, NULL, NULL, '076-441-8847', '076-441-3876', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/05/31', NULL);
INSERT INTO `customer_information` VALUES (40, '2557', '1', '1199612036', '株式会社昭和興業', 'ｼｮｳﾜｺｳｷﾞｮｳ', NULL, NULL, NULL, NULL, NULL, '0184-23-4444', '0184-23-4447', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/28', NULL);
INSERT INTO `customer_information` VALUES (41, '2566', '1', '1199622032', '株式会社日本電気安全協会', 'ﾆﾎﾝﾃﾞﾝｷｱﾝｾﾞﾝｷｮｳｶｲ', NULL, NULL, NULL, NULL, NULL, '044-862-0311', '044-862-0386', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/29', NULL);
INSERT INTO `customer_information` VALUES (42, '2678', '1', '1199631008', 'マルイファシリティーズ', 'ﾏﾙｲﾌｧｼﾘﾃｨｰｽﾞ', NULL, NULL, NULL, NULL, NULL, '03-3229-5291', '03-3229-0312', NULL, NULL, NULL, NULL, '111', 'HS', '5', '給排水衛生', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/07/21', NULL);
INSERT INTO `customer_information` VALUES (43, '2681', '1', '100', '（請求処理用）スズモメンテナンス㈱', 'ﾒﾝﾃﾅﾝｽ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (44, '2803', '1', '1199999989', 'カメイ（株）青森支店', 'ｶﾒｲｶﾌﾞｼｷｶﾞｲｼｬｱｵﾓﾘｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '017-736-8410', '017-737-1661', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2017/11/06', NULL);
INSERT INTO `customer_information` VALUES (45, '2933', '1', '1199999970', 'イワタニ九州（本社）', 'ｲﾜﾀﾆｷｭｳｼｭｳ(ﾎﾝｼｬ)', NULL, NULL, NULL, NULL, NULL, '092-483-5850', '092-483-5870', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/03/20', NULL);
INSERT INTO `customer_information` VALUES (46, '2782', '1', '1199999993', 'ｸﾞﾘｰﾝｻﾝﾃﾞｰ', 'ｸﾞﾘｰﾝｻﾝﾃﾞｰ', NULL, NULL, NULL, NULL, NULL, '042-499-1113', '042-499-1114', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/10/05', NULL);
INSERT INTO `customer_information` VALUES (47, '2892', '1', '1199999978', 'コーアガス日本　姶良支店', 'ｺｰｱｶﾞｽﾆﾎﾝ ｱｲﾗ', NULL, NULL, NULL, NULL, NULL, '0995-66-3611', '0995-66-3612', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/29', NULL);
INSERT INTO `customer_information` VALUES (48, '2905', '1', '1199999975', '大阿蘇水質管理（株）', 'ｵｵｱｿｽｲｼﾂｶﾝﾘ', NULL, NULL, NULL, NULL, NULL, '048-974-8011', '048-974-8019', NULL, NULL, NULL, NULL, '111', 'HS', '13', '受水槽', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/02/16', NULL);
INSERT INTO `customer_information` VALUES (49, '2923', '1', '9998', '★ガス会社様依頼（未登録）', 'ｶﾞｽｶﾞｲｼｬｻﾏｻﾏ(ﾐﾄｳﾛｸ)ﾎｼ', NULL, NULL, NULL, NULL, NULL, '000-0000-0000', '000-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', '15', '看板テント', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (50, '2923', '1', '9998', '★ガス会社様依頼（未登録）', 'ｶﾞｽｶﾞｲｼｬｻﾏｻﾏ(ﾐﾄｳﾛｸ)ﾎｼ', NULL, NULL, NULL, NULL, NULL, '000-0000-0000', '000-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', '12', '弱電（ACCS）', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (51, '2923', '1', '9998', '★ガス会社様依頼（未登録）', 'ｶﾞｽｶﾞｲｼｬｻﾏｻﾏ(ﾐﾄｳﾛｸ)ﾎｼ', NULL, NULL, NULL, NULL, NULL, '000-0000-0000', '000-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (52, '3193', '1', '1199999964', 'シンコー㈱', 'ｼﾝｺｰｶﾌﾞ', NULL, NULL, NULL, NULL, NULL, '022-794-7895', '022-794-7897', NULL, NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2019/07/08', NULL);
INSERT INTO `customer_information` VALUES (53, '3104', '1', '1199999966', '（株）三義　仙台営業所', 'ｻﾝｷﾞ ｾﾝﾀﾞｲｴｲｷﾞｮｳｼｮ', NULL, NULL, NULL, NULL, NULL, '022-304-5755', '022-304-5755', NULL, NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2019/01/04', NULL);
INSERT INTO `customer_information` VALUES (54, '3052', '1', '1199999968', '（株）沖縄日立', '(ｶﾌﾞ)ｵｷﾅﾜﾋﾀﾁ', NULL, NULL, NULL, NULL, NULL, '098-865-2640', '098-865-2641', NULL, NULL, NULL, NULL, '111', 'HS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/09/13', NULL);
INSERT INTO `customer_information` VALUES (55, '1733', '1', '1100001191', 'イワタニ九州（大分支店）', 'ｲﾜﾀﾆｷｭｳｼｭｳｵｵｲﾀｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '097-536-4000', '097-534-7886', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/03/20', NULL);
INSERT INTO `customer_information` VALUES (56, '1737', '1', '1100001965', '吉武産業', 'ﾖｼﾀｹｻﾝｷﾞｮｳ', NULL, NULL, NULL, NULL, NULL, '093-561-2286', '093-561-3848', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2019/05/15', NULL);
INSERT INTO `customer_information` VALUES (57, '1738', '1', '1100001889', '西部ガスリビングメイト', 'ｻｲﾌﾞｶﾞｽﾘﾋﾞﾝｸﾞﾒｲﾄ', NULL, NULL, NULL, NULL, NULL, '093-551-3681', '093-511-1158', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (58, '1740', '1', '1100001887', '大和ﾊｳｽ工業（株）福岡支店', 'ﾀﾞｲﾜﾊｳｽｺｳｷﾞｮｳ(ｶﾌﾞ)ﾌｸｵｶｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '092-411-7446', '092-473-9524', NULL, NULL, NULL, NULL, '111', 'HS', '10', '窓ガラスサッシ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (59, '1756', '1', '1100001944', 'ネクスト･ワン株式会社 明石営業所', 'ﾈｸｽﾄ･ﾜﾝｶﾌﾞｼｷｶﾞｲｼｬ ｱｶｼｴｲｷﾞｮｳｼｮ', NULL, NULL, NULL, NULL, NULL, '078-974-0131', '078-974-8906', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (60, '1764', '1', '1100001943', '兆建', 'ﾁｮｳｹﾝ', NULL, NULL, NULL, NULL, NULL, '076-249-6678', '076-249-2167', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/11', NULL);
INSERT INTO `customer_information` VALUES (61, '1782', '1', '1100000478', '大和ハウス沼津', 'ﾀﾞｲﾜﾊｳｽﾇﾏﾂﾞ', NULL, NULL, NULL, NULL, NULL, '055-923-8182', '055-923-8465', NULL, NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (62, '1787', '1', '1100001929', '株式会社カジマヤ', 'ｶｼﾞﾏﾔ', NULL, NULL, NULL, NULL, NULL, '0550-88-0111', '0550-89-2619', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/29', NULL);
INSERT INTO `customer_information` VALUES (63, '1788', '1', '1100001848', '鈴与商事藤枝支店', 'ｽｽﾞﾖｼｮｳｼﾞﾌｼﾞｴﾀﾞｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '054-636-6211', '054-636-5121', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (64, '1804', '1', '1100000038', 'ユメール', 'ﾕﾒｰﾙ', NULL, NULL, NULL, NULL, NULL, '047-702-3088', '047-702-3068', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2019/11/01', NULL);
INSERT INTO `customer_information` VALUES (65, '1805', '1', '1100000080', '田中建設', 'ﾀﾅｶｹﾝｾﾂ', NULL, NULL, NULL, NULL, NULL, '0471-64-6633', '0471-64-6788', NULL, NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (66, '1812', '1', '1100000020', 'シーバイエス', 'ｼｰﾊﾞｲｴｽ', NULL, NULL, NULL, NULL, NULL, '045-277-1931', '045-277-1941', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (67, '1823', '1', '1100001881', '丹青社', 'ﾀﾝｾｲｼｬ', NULL, NULL, NULL, NULL, NULL, '0120-28-1420', '03-6860-4006', NULL, NULL, NULL, NULL, '111', 'HS', '7', '空調換気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/10/02', NULL);
INSERT INTO `customer_information` VALUES (68, '1827', '1', '1100000037', 'ヤザワコーポレーション', 'ﾔｻﾞﾜｺｰﾎﾟﾚｰｼｮﾝ', NULL, NULL, NULL, NULL, NULL, '03-5812-0751', '03-5812-0755 ', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/12/26', NULL);
INSERT INTO `customer_information` VALUES (69, '1843', '1', '1100000026', 'タニコー', 'ﾀﾆｺｰ', NULL, NULL, NULL, NULL, NULL, '03-5498-7987', '03-5498-7982', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (70, '1855', '1', '200001557', 'キッチンテクノ', 'ｷｯﾁﾝﾃｸﾉ', NULL, NULL, NULL, NULL, NULL, '03-5285-3301', '03-5285-3309', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (71, '1857', '1', '1100001783', '使用しない', 'ｼﾖｳｼﾅｲ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '111', 'HS', '9', '内装', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/07/18', NULL);
INSERT INTO `customer_information` VALUES (72, '1863', '1', '1100000078', '直本工業', 'ﾅｵﾓﾄｺｳｷﾞｮｳ', NULL, NULL, NULL, NULL, NULL, '03-3864-5575', '03-3864-5579', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (73, '1868', '1', '1100000338', '日本洗浄機（株', 'ﾆﾎﾝｾﾝｼﾞｮｳｷ(ｶﾌﾞ', NULL, NULL, NULL, NULL, NULL, '03-3750-6871', '03-3750-4452', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (74, '1871', '1', '1100001864', 'パナソニック電材', 'ﾊﾟﾅｿﾆｯｸﾃﾞﾝｻﾞｲ', NULL, NULL, NULL, NULL, NULL, '03-3621-1231', '03-3621-1240', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (75, '1874', '1', '1100001830', 'エコプラン', 'ｴｺﾌﾟﾗﾝ', NULL, NULL, NULL, NULL, NULL, '03-3366-3700', '03-3366-3701', NULL, NULL, NULL, NULL, '111', 'HS', '5', '給排水衛生', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (76, '1875', '1', '1100000590', 'GHP東京ｶﾞｽ（株）', 'GHPﾄｳｷｮｳｶﾞｽ(ｶ)', NULL, NULL, NULL, NULL, NULL, '03-3291-6139', '03-3291-6137', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (77, '1894', '1', '1100000488', '新栄工業（株', 'ｼﾝｻｶｴｺｳｷﾞｮｳ(ｶﾌﾞ', NULL, NULL, NULL, NULL, NULL, '0268-75-3121', '0268-73-2407', NULL, NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (78, '1897', '1', '1100001189', 'エナキス（塩尻支店）', 'ｴﾅｷｽ(ｼｵｼﾞﾘｼﾃﾝ)', NULL, NULL, NULL, NULL, NULL, '0263-52-0672', '0263-54-2694', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/07/04', NULL);
INSERT INTO `customer_information` VALUES (79, '1900', '1', '1100001260', 'ライフコメリ', 'ﾗｲﾌｺﾒﾘ', NULL, NULL, NULL, NULL, NULL, '0256-32-3531', '0256-35-4568', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (80, '1901', '1', '1100001954', 'TOHOピクス（株）', 'TOHOﾋﾟｸｽ(ｶﾌﾞ)', NULL, NULL, NULL, NULL, NULL, '024-944-3900', '024-944-5533', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (81, '1907', '1', '1100000315', 'ユニコンエージェンシー', 'ﾕﾆｺﾝｴｰｼﾞｪﾝｼｰ', NULL, NULL, NULL, NULL, NULL, '022-304-8850', '022-304-8870', NULL, NULL, NULL, NULL, '111', 'HS', '8', '建具工事', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (82, '1911', '1', '1100001980', '東部液化石油㈱秋田支店', 'ﾄｳﾌﾞｴｷｶｾｷﾕｶﾌﾞｱｷﾀｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '018-835-3248', '018-835-3278', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (83, '1916', '1', '1100001936', '(有)タイセー設備サービス', 'ﾀｲｾｰｾﾂﾋﾞｻｰﾋﾞｽ', NULL, NULL, NULL, NULL, NULL, '0154-60-5502', '0154-60-5503', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/13', NULL);
INSERT INTO `customer_information` VALUES (84, '1918', '1', '1100001915', '小島商事', 'ｺｼﾞﾏｼｮｳｼﾞ', NULL, NULL, NULL, NULL, NULL, '0143-22-9091', '0143-22-6096', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (85, '1924', '1', '1100001863', 'USEN', 'USEN', NULL, NULL, NULL, NULL, NULL, '0120-737-440', '098-897-2862', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (86, '1926', '1', '1100001550', 'アネシス', 'ｱﾈｼｽ', NULL, NULL, NULL, NULL, NULL, '03-6433-5921', '03-6433-5920', NULL, NULL, NULL, NULL, '111', 'HS', '5', '給排水衛生', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2019/06/16', NULL);
INSERT INTO `customer_information` VALUES (87, '2561', '1', '1199638004', '有限会社行橋玄洋社', 'ｲｸﾊｼｹﾞﾝﾖｳｼｬ', NULL, NULL, NULL, NULL, NULL, '0930-24-6488', '0930-25-2410', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/29', NULL);
INSERT INTO `customer_information` VALUES (88, '2565', '1', '1199614009', '全電協株式会社', 'ｾﾞﾝﾃﾞﾝｷｮｳｶﾌﾞｼｷｶｲｼｬ', NULL, NULL, NULL, NULL, NULL, '03-3808-2411', '03-3808-2421', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/05/31', NULL);
INSERT INTO `customer_information` VALUES (89, '2678', '1', '1199631008', 'マルイファシリティーズ', 'ﾏﾙｲﾌｧｼﾘﾃｨｰｽﾞ', NULL, NULL, NULL, NULL, NULL, '03-3229-5291', '03-3229-0312', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/07/21', NULL);
INSERT INTO `customer_information` VALUES (90, '2724', '1', '1199730002', 'ホシザキ東京', 'ﾎｼｻﾞｷﾄｳｷｮｳ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/08/31', NULL);
INSERT INTO `customer_information` VALUES (91, '2785', '1', '1199999992', 'イワタニ島根（株）　益田支店', 'ｲﾜﾀﾆｼﾏﾈﾏｽﾀﾞｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '0856-23-1800', '0856-23-1804', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2017/10/09', NULL);
INSERT INTO `customer_information` VALUES (92, '2801', '1', '1199999990', '四国ガス燃料（株）今治営業所', 'ｼｺｸｶﾞｽﾈﾝﾘｮｳｶﾌﾞｼｷｶﾞｲｼｬｲﾏﾊﾞﾘｴｲｷﾞｮｳｼｮ', NULL, NULL, NULL, NULL, NULL, '0898-32-4145', '0898-32-0728', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2017/11/02', NULL);
INSERT INTO `customer_information` VALUES (93, '2881', '1', '1199999980', 'エナキス（飯田営業所）', 'ｴﾅｷｽ(ｲｲﾀﾞｴｲｷﾞｮｳｼｮ)', NULL, NULL, NULL, NULL, NULL, '0265-34-3121', '0265-49-8630', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/07/04', NULL);
INSERT INTO `customer_information` VALUES (94, '2936', '1', '9996', '★新店対応', 'ｼﾝﾃﾝﾀｲｵｳ', NULL, NULL, NULL, NULL, NULL, NULL, '00-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (95, '2937', '1', '9995', '★改装対応', 'ｶｲｿｳﾀｲｵｳ', NULL, NULL, NULL, NULL, NULL, NULL, '00-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (96, '2923', '1', '9998', '★ガス会社様依頼（未登録）', 'ｶﾞｽｶﾞｲｼｬｻﾏｻﾏ(ﾐﾄｳﾛｸ)ﾎｼ', NULL, NULL, NULL, NULL, NULL, '000-0000-0000', '000-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (97, '3163', '1', '1011500', 'エルティーライト株式会社', 'ｴﾙﾃｨｰﾗｲﾄｶﾌﾞｼｷｶﾞｲｼｬ', '140-0004', '13', '東京都', '品川区南品川2-2-13', '南品川JNビル6階', '354793513', '354796274', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Z96553', '2019/04/22', NULL);
INSERT INTO `customer_information` VALUES (98, '3192', '1', '1199999965', '㈱創和建設', 'ｶﾌﾞｿｳﾜｹﾝｾﾂ', NULL, NULL, NULL, NULL, NULL, '0986-23-8580', '0986-23-8590', '土屋　たかふみ', NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2019/07/08', NULL);
INSERT INTO `customer_information` VALUES (99, '3249', '1', '1199999963', '東３冷機（株）', 'ﾄｳｻﾝﾚｲｷ', NULL, '13', '東京都', NULL, NULL, '03-6459-1952', '03-6459-1953', NULL, NULL, NULL, NULL, '111', 'HS', '7', '空調換気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2020/02/21', NULL);
INSERT INTO `customer_information` VALUES (100, '1730', '1', '1100001933', '白石', 'ｼﾗｲｼ', NULL, NULL, NULL, NULL, NULL, '098-867-4614', '098-863-3248', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/07/05', NULL);
INSERT INTO `customer_information` VALUES (101, '1732', '1', '1100001339', '福井プロパン商事株式会社', 'ﾌｸｲﾌﾟﾛﾊﾟﾝｼｮｳｼﾞｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '0985-41-1001', '0985-41-1002', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (102, '1735', '1', '1100001819', 'マエダ企画', 'ﾏｴﾀﾞｷｶｸ', NULL, NULL, NULL, NULL, NULL, '096-223-2341', '096-223-2346', NULL, NULL, NULL, NULL, '111', 'HS', '10', '窓ガラスサッシ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (103, '1736', '1', '1100001305', '辻商店', 'ﾂｼﾞｼｮｳﾃﾝ', NULL, NULL, NULL, NULL, NULL, '0952-30-2155', '0952-30-2156', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (104, '1739', '1', '1100001964', '西部ガス.', 'ｻｲﾌﾞｶﾞｽ.', NULL, NULL, NULL, NULL, NULL, '092-633-2345', '092-633-2735', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (105, '1740', '1', '1100001887', '大和ﾊｳｽ工業（株）福岡支店', 'ﾀﾞｲﾜﾊｳｽｺｳｷﾞｮｳ(ｶﾌﾞ)ﾌｸｵｶｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '092-411-7446', '092-473-9524', NULL, NULL, NULL, NULL, '111', 'HS', '8', '建具工事', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (106, '1740', '1', '1100001887', '大和ﾊｳｽ工業（株）福岡支店', 'ﾀﾞｲﾜﾊｳｽｺｳｷﾞｮｳ(ｶﾌﾞ)ﾌｸｵｶｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '092-411-7446', '092-473-9524', NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (107, '1742', '1', '1100001962', '南予プロパン株式会社', 'ﾅﾝﾖﾌﾟﾛﾊﾟﾝｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '0893-25-2000', '0893-25-3555', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (108, '1744', '1', '1100001922', '大和ハウス　香川支店', 'ﾀﾞｲﾜﾊｳｽ ｶｶﾞﾜｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '087-865-2259', '087-865-2099', NULL, NULL, NULL, NULL, '111', 'HS', '9', '内装', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (109, '1759', '1', '1100001921', 'ＪＡ敦賀　購買課', 'JAﾂﾙｶﾞ ｺｳﾊﾞｲｶ', NULL, NULL, NULL, NULL, NULL, '0770-22-2500', '0770-24-4015', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (110, '1760', '1', '1100001924', '㈱広和', 'ｶﾌﾞﾋﾛｶｽﾞ', NULL, NULL, NULL, NULL, NULL, '0766-28-6111', '0766-28-3456', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (111, '1774', '1', '1100001938', '株式会社ＣＡＲＲＹ', 'CARRY', NULL, NULL, NULL, NULL, NULL, '059-329-7768', '059-329-7820', NULL, NULL, NULL, NULL, '111', 'HS', '10', '窓ガラスサッシ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/11', NULL);
INSERT INTO `customer_information` VALUES (112, '1789', '1', '1100000440', '鈴与商事（株', 'ｽｽﾞﾖｼｮｳｼﾞ(ｶﾌﾞ', NULL, NULL, NULL, NULL, NULL, '054-273-7764', '054-273-7789', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (113, '1794', '1', '1100001646', '株式会社プラントシステム', 'ｶﾌﾞｼｷｶﾞｲｼｬﾌﾟﾗﾝﾄｼｽﾃﾑ', NULL, NULL, NULL, NULL, NULL, '052-703-7115', '052-703-7488', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (114, '1797', '0', '1100001897', 'イーグル産業', 'ｲｰｸﾞﾙｻﾝｷﾞｮｳ', NULL, NULL, NULL, NULL, NULL, '049-239-1881', '049-233-9945', NULL, NULL, NULL, NULL, '111', 'HS', '15', '看板テント', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/11', NULL);
INSERT INTO `customer_information` VALUES (115, '1820', '1', '1100001905', '飯島電気工業', 'ｲｲｼﾞﾏﾃﾞﾝｷｺｳｷﾞｮｳ', NULL, NULL, NULL, NULL, NULL, '03-6379-7150', '03-6379-7152', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Z92373', '2018/02/26', NULL);
INSERT INTO `customer_information` VALUES (116, '2650', '1', '1199100030', 'テクノサポート', 'ﾃｸﾉｻﾎﾟｰﾄ', NULL, NULL, NULL, NULL, NULL, NULL, '03-5783-8772', NULL, NULL, NULL, NULL, '111', 'HS', '9', '内装', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS105122', '2017/07/01', NULL);
INSERT INTO `customer_information` VALUES (117, '2650', '1', '1199100030', 'テクノサポート', 'ﾃｸﾉｻﾎﾟｰﾄ', NULL, NULL, NULL, NULL, NULL, NULL, '03-5783-8772', NULL, NULL, NULL, NULL, '111', 'HS', '7', '空調換気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS105122', '2017/07/01', NULL);
INSERT INTO `customer_information` VALUES (118, '1829', '1', '1100000581', 'ＧＴＳ', 'GTS', NULL, NULL, NULL, NULL, NULL, '03-5783-8870', '03-5783-8858', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (119, '1841', '1', '1100000019', 'タテヤマアドバンス', 'ﾀﾃﾔﾏｱﾄﾞﾊﾞﾝｽ', NULL, NULL, NULL, NULL, NULL, '03-5614-1214', '03-5641-1298', NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (120, '1845', '1', '1100000073', '前田道路', 'ﾏｴﾀﾞﾄﾞｳﾛ', NULL, NULL, NULL, NULL, NULL, '03-5487-0022', '03-5487-0039', NULL, NULL, NULL, NULL, '111', 'HS', '10', '窓ガラスサッシ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (121, '2654', '1', '1100001982', '株式会社 日立ビルシステム 関西支社 京都営業所', 'ﾋﾀﾁﾋﾞﾙｼｽﾃﾑ ｶﾝｻｲｼｼｬ ｷｮｳﾄｴｲｷﾞｮｳｼｮ', '604-8151', '26', '京都府', '京都市中京区蛸薬師通烏丸西入ル橋弁慶町227', '第12長谷ビル', '075-254-4181', '075-223-2453', NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/13', NULL);
INSERT INTO `customer_information` VALUES (122, '1852', '1', '1100000412', '東京ガス', 'ﾄｳｷｮｳｶﾞｽ', NULL, NULL, NULL, NULL, NULL, '0570-002-211', '03-3344-9357', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/04/17', NULL);
INSERT INTO `customer_information` VALUES (123, '1864', '1', '1100001884', '藤田建装', 'ﾌｼﾞﾀｹﾝｿｳ', NULL, NULL, NULL, NULL, NULL, '03-3841-6423', '03-3841-3884', NULL, NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (124, '1869', '1', '1100001901', '佐藤金物', 'ｻﾄｳｶﾅﾓﾉ', NULL, NULL, NULL, NULL, NULL, '03-3745-6431', '03-3745-6435', NULL, NULL, NULL, NULL, '111', 'HS', '9', '内装', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (125, '1873', '1', '1100001632', 'リンナイ株式会社', 'ﾘﾝﾅｲｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '03-3471-7554', '03-3471-8974', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (126, '1902', '1', '1100001842', 'トーケンコンサル', 'ﾄｰｹﾝｺﾝｻﾙ', NULL, NULL, NULL, NULL, NULL, '024-935-0313', '024-935-0331', NULL, NULL, NULL, NULL, '111', 'HS', '8', '建具工事', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (127, '1906', '1', '1100001959', 'ヤマリョー㈱', 'ﾔﾏﾘｮｰｶﾌﾞ', NULL, NULL, NULL, NULL, NULL, '023-643-7711', '023-643-1420', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (128, '1914', '1', '1100001953', '斉藤建築', 'ｻｲﾄｳｹﾝﾁｸ', NULL, NULL, NULL, NULL, NULL, '0172-35-4263', '0172-35-4269', NULL, NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (129, '1921', '1', '1100001894', 'シンプロメンテ', 'ｼﾝﾌﾟﾛﾒﾝﾃ', NULL, NULL, NULL, NULL, NULL, '03-5767-3610', '03-5767-3625', NULL, NULL, NULL, NULL, '111', 'HS', '7', '空調換気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/03/05', NULL);
INSERT INTO `customer_information` VALUES (130, '1925', '1', '1100001955', '大和ハウスコールセンター', 'ﾀﾞｲﾜﾊｳｽｺｰﾙｾﾝﾀｰ', NULL, NULL, NULL, NULL, NULL, '0120-691-588', NULL, NULL, NULL, NULL, NULL, '111', 'HS', '5', '給排水衛生', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (131, '1929', '1', '1100001892', 'フランケ（修理）', 'ﾌﾗﾝｹ', NULL, NULL, NULL, NULL, NULL, '0120-12-7661', '0120-111-559', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/08/24', NULL);
INSERT INTO `customer_information` VALUES (132, '1931', '1', '1100001820', 'サワゼン', 'ｻﾜｾﾞﾝ', NULL, NULL, NULL, NULL, NULL, '011-859-2247', '011-859-2248', NULL, NULL, NULL, NULL, '111', 'HS', '5', '給排水衛生', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (133, '1935', '1', '1100001795', 'ナブコドア', 'ﾅﾌﾞｺﾄﾞｱ', NULL, NULL, NULL, NULL, NULL, NULL, '072-624-8345', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (134, '1937', '1', '1100000369', '関彰商事', 'ｾｷｱｷﾗｼｮｳｼﾞ', NULL, NULL, NULL, NULL, NULL, NULL, '029-858-7340', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (135, '2663', '1', '1199720004', 'TOTOｴﾑﾃｯｸ株式会社', 'ﾄｰﾄｰｴﾑﾃｯｸｶﾌﾞｼｷｶｲｼｬ', NULL, NULL, NULL, NULL, NULL, '03-5339-0708', '03-53390748', NULL, NULL, NULL, NULL, '111', 'HS', '5', '給排水衛生', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/07/07', NULL);
INSERT INTO `customer_information` VALUES (136, '2663', '1', '1199720004', 'TOTOｴﾑﾃｯｸ株式会社', 'ﾄｰﾄｰｴﾑﾃｯｸｶﾌﾞｼｷｶｲｼｬ', NULL, NULL, NULL, NULL, NULL, '03-5339-0708', '03-53390748', NULL, NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/07/07', NULL);
INSERT INTO `customer_information` VALUES (137, '2540', '1', '1199622028', '日化メンテナンス株式会社・北関東営業所', 'ﾆｯｶﾒﾝﾃﾅﾝｽｶﾌﾞｼｷｶｲｼｬ･ｷﾀｶﾝﾄｳｴｲｷﾞｮｳｼｮ', NULL, NULL, NULL, NULL, NULL, '042-989-7199', '042-989-7142', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2019/11/18', NULL);
INSERT INTO `customer_information` VALUES (138, '2553', '1', '1199610012', '壽総合建設', 'ｺﾄﾌﾞｷｿｳｺﾞｳｹﾝｾﾂ', NULL, NULL, NULL, NULL, NULL, '0947-45-6100', '0947-44-8145', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/05/31', NULL);
INSERT INTO `customer_information` VALUES (139, '2558', '1', '1199602038', '有限会社岩掃', 'ｲﾜｿｳ', NULL, NULL, NULL, NULL, NULL, '0995-63-3777', '0995-62-3602', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/28', NULL);
INSERT INTO `customer_information` VALUES (140, '2567', '1', '1199622031', '株式会社日本電気保安協会', 'ﾆﾎﾝﾃﾞﾝｷﾎｱﾝｷｮｳｶｲ', NULL, NULL, NULL, NULL, NULL, '06-6223-0015', '06-6222-4027', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/28', NULL);
INSERT INTO `customer_information` VALUES (141, '2667', '1', '1100001983', 'グローリーエンジニアリング', 'ｸﾞﾛｰﾘｰｴﾝｼﾞﾆｱﾘﾝｸﾞ', NULL, '1', '北海道', NULL, NULL, '011-688-9810', '011-688-9810', NULL, NULL, NULL, NULL, '111', 'HS', '8', '建具工事', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/11/08', NULL);
INSERT INTO `customer_information` VALUES (142, '2678', '1', '1199631008', 'マルイファシリティーズ', 'ﾏﾙｲﾌｧｼﾘﾃｨｰｽﾞ', NULL, NULL, NULL, NULL, NULL, '03-3229-5291', '03-3229-0312', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/07/21', NULL);
INSERT INTO `customer_information` VALUES (143, '2727', '1', '1100001984', '日立ビルシステム（コールセンター）', 'ﾋﾀﾁﾋﾞﾙｼｽﾃﾑ(ｺｰﾙｾﾝﾀｰ)', NULL, NULL, NULL, NULL, NULL, '045-641-8726', '03-5682-1002', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2019/01/03', NULL);
INSERT INTO `customer_information` VALUES (144, '2790', '1', '1199999991', '四国ガス燃料　東温営業所', 'ｼｺｸｶﾞｽﾈﾝﾘｮｳ ﾄｳｵﾝｴｲｷﾞｮｳｼｮ', NULL, NULL, NULL, NULL, NULL, '089-990-1200', '089-990-1300', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/10/12', NULL);
INSERT INTO `customer_information` VALUES (145, '2799', '1', '1199631004', 'マシンテック中澤', 'ﾏｼﾝﾃｯｸﾅｶｻﾞﾜ', NULL, NULL, NULL, NULL, NULL, '047-193-2073', '047-193-2083', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/10/28', NULL);
INSERT INTO `customer_information` VALUES (146, '2930', '1', '1199999971', '三菱電機ビルテクノサービス（株）東京東支社蒲田営業所', 'ﾐﾂﾋﾞｼﾃﾞﾝｷﾋﾞﾙﾃｸﾉｻｰﾋﾞｽ(ｶﾌﾞ)ﾄｳｷｮｳﾋｶﾞｼｼｼｬｶﾏﾀｴｲｷﾞｮｳｼｮ', NULL, NULL, NULL, NULL, NULL, '03-3732-7490', '03-3732-7491', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/03/14', NULL);
INSERT INTO `customer_information` VALUES (147, '3014', '1', '1199999969', 'リコークリエイティブサービス', 'ﾘｺｰｸﾘｴｲﾃｨﾌﾞｻｰﾋﾞｽ', NULL, '13', '東京都', NULL, NULL, '03-3777-4233', '03-5742-2845', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/07/20', NULL);
INSERT INTO `customer_information` VALUES (148, '2902', '1', '1199999976', 'リンナイ（休日用）', 'ﾘﾝﾅｲ', NULL, NULL, NULL, NULL, NULL, '0120-054-321', '03-3471-3659', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/02/11', NULL);
INSERT INTO `customer_information` VALUES (149, '2924', '1', '9997', '★電気保安協会様依頼（未登録）', 'ﾃﾞﾝｷﾎｱﾝｷｮｳｶｲｻﾏｲﾗｲ(ﾐﾄｳﾛｸ)ﾎｼ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (150, '2929', '1', '1199999972', '彩広舎', 'ｻｲｺｳｼｬ', NULL, NULL, NULL, NULL, NULL, '0154-55-1070', '0154-55-1071', NULL, NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/03/13', NULL);
INSERT INTO `customer_information` VALUES (151, '2923', '1', '9998', '★ガス会社様依頼（未登録）', 'ｶﾞｽｶﾞｲｼｬｻﾏｻﾏ(ﾐﾄｳﾛｸ)ﾎｼ', NULL, NULL, NULL, NULL, NULL, '000-0000-0000', '000-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', '18', '廃棄物', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (152, '3163', '1', '1011500', 'エルティーライト株式会社', 'ｴﾙﾃｨｰﾗｲﾄｶﾌﾞｼｷｶﾞｲｼｬ', '140-0004', '13', '東京都', '品川区南品川2-2-13', '南品川JNビル6階', '354793513', '354796274', NULL, NULL, NULL, NULL, '111', 'HS', '16', '管球交換', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Z96553', '2019/04/22', NULL);
INSERT INTO `customer_information` VALUES (153, '1734', '1', '1100001977', '㈲山本学商店', 'ﾔﾏﾓﾄﾏﾅﾌﾞｼｮｳﾃﾝ', NULL, NULL, NULL, NULL, NULL, '096-383-1506', '096-383-3932', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/28', NULL);
INSERT INTO `customer_information` VALUES (154, '1744', '1', '1100001922', '大和ハウス　香川支店', 'ﾀﾞｲﾜﾊｳｽ ｶｶﾞﾜｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '087-865-2259', '087-865-2099', NULL, NULL, NULL, NULL, '111', 'HS', '8', '建具工事', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (155, '1751', '1', '1100001961', '㈱カドス・コーポレーション', 'ｶﾄﾞｽ･ｺｰﾎﾟﾚｰｼｮﾝ', NULL, NULL, NULL, NULL, NULL, '083-974-5007', '083-974-5008', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/13', NULL);
INSERT INTO `customer_information` VALUES (156, '1757', '1', '1100001956', 'ツボサカ（イオン明石　給湯器）', 'ﾂﾎﾞｻｶ(ｲｵﾝｱｶｼ ｷｭｳﾄｳｷ)', NULL, NULL, NULL, NULL, NULL, '078-967-2122', '078-967-2577', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (157, '1758', '1', '1100001960', 'セキュリティーサポート株式会社', 'ｾｷｭﾘﾃｨｰｻﾎﾟｰﾄｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '077-547-3103', '077-547-3104', NULL, NULL, NULL, NULL, '111', 'HS', '7', '空調換気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (158, '1765', '1', '1100001334', '上原成商事株式会社', 'ｳｴﾊﾗｾｲｼｮｳｼﾞｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '075-212-6006', '075-211-0468', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (159, '1769', '1', '1100001913', 'シェル石油大阪発売所・堺石原LPG事業所', 'ｼｪﾙｾｷﾕｵｵｻｶﾊﾂﾊﾞｲｼﾞｮ･ｻｶｲｲｼﾊﾗｴﾙﾋﾟｰｼﾞｰｼﾞｷﾞｮｳｼｮ', NULL, NULL, NULL, NULL, NULL, '072-259-4651', '072-255-2249', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2019/10/03', NULL);
INSERT INTO `customer_information` VALUES (160, '1776', '1', '1100001572', '株式会社三昭堂', 'ｻﾝｼｮｳﾄﾞｳ', NULL, NULL, NULL, NULL, NULL, '0586-77-0360', '0586-76-1831', NULL, NULL, NULL, NULL, '111', 'HS', '15', '看板テント', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/11', NULL);
INSERT INTO `customer_information` VALUES (161, '1783', '1', '1100001963', '伊東ガス', 'ｲﾄｳｶﾞｽ', NULL, NULL, NULL, NULL, NULL, '0557-37-0061', '0557-37-4112', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (162, '1792', '1', '1100000434', '東邦液化ガス（株）', 'ﾄｳﾎｳｴｷｶｶﾞｽ(ｶﾌﾞ)', NULL, NULL, NULL, NULL, NULL, '052-882-3750', '052-872-1750', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (163, '1793', '1', '1100001902', '宮吉硝子株式会社', 'ﾐﾔｷﾁｶﾞﾗｽｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '052-882-7722', '052-884-6470', NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/09/14', NULL);
INSERT INTO `customer_information` VALUES (164, '1798', '1', '1100000006', 'アトリー', 'ｱﾄﾘｰ', NULL, NULL, NULL, NULL, NULL, '048-838-7111', '048-838-7117', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (165, '1802', '1', '1100001939', 'アイエスガステム（コールセンター）', 'ｱｲｴｽｶﾞｽﾃﾑ(ｺｰﾙｾﾝﾀｰ)', NULL, NULL, NULL, NULL, NULL, '047-429-1234', '047-429-1247', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2020/01/25', NULL);
INSERT INTO `customer_information` VALUES (166, '1807', '1', '1100001949', 'シンカンパニー', 'ｼﾝｶﾝﾊﾟﾆｰ', NULL, NULL, NULL, NULL, NULL, '046-264-4955', '246-264-4956', NULL, NULL, NULL, NULL, '111', 'HS', '8', '建具工事', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (167, '1811', '1', '1100001554', 'エイシン産業株式会社', 'ｴｲｼﾝｻﾝｷﾞｮｳｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '045-332-3270', '045-331-6957', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (168, '2650', '1', '1199100030', 'テクノサポート', 'ﾃｸﾉｻﾎﾟｰﾄ', NULL, NULL, NULL, NULL, NULL, NULL, '03-5783-8772', NULL, NULL, NULL, NULL, '111', 'HS', '8', '建具工事', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS105122', '2017/07/01', NULL);
INSERT INTO `customer_information` VALUES (169, '1840', '1', '1100000035', 'マザー・テクノサービス', 'ﾏｻﾞｰ･ﾃｸﾉｻｰﾋﾞｽ', NULL, NULL, NULL, NULL, NULL, '03-5615-2431', '03-5615-2408', NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (170, '1841', '1', '1100000019', 'タテヤマアドバンス', 'ﾀﾃﾔﾏｱﾄﾞﾊﾞﾝｽ', NULL, NULL, NULL, NULL, NULL, '03-5614-1214', '03-5641-1298', NULL, NULL, NULL, NULL, '111', 'HS', '9', '内装', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (171, '1841', '1', '1100000019', 'タテヤマアドバンス', 'ﾀﾃﾔﾏｱﾄﾞﾊﾞﾝｽ', NULL, NULL, NULL, NULL, NULL, '03-5614-1214', '03-5641-1298', NULL, NULL, NULL, NULL, '111', 'HS', '8', '建具工事', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (172, '1844', '1', '1100001595', '株式会社寺岡精工', 'ﾃﾗｵｶｾｲｺｳ', NULL, NULL, NULL, NULL, NULL, '03-5496-7612', '03-6685-0160', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/10/31', NULL);
INSERT INTO `customer_information` VALUES (173, '1845', '1', '1100000073', '前田道路', 'ﾏｴﾀﾞﾄﾞｳﾛ', NULL, NULL, NULL, NULL, NULL, '03-5487-0022', '03-5487-0039', NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (174, '2653', '1', '1199611003', 'サガミ', 'ｻｶﾞﾐ', NULL, '14', '神奈川県', NULL, NULL, '046-833-3131', '046-836-9891', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/07/03', NULL);
INSERT INTO `customer_information` VALUES (175, '1850', '1', '1100000502', 'バウハウス', 'ﾊﾞｳﾊｳｽ', NULL, NULL, NULL, NULL, NULL, '03-5436-7332', '03-5436-7339', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (176, '1853', '1', '1100001604', 'TOTOエムテック株式会社', 'TOTOｴﾑﾃｯｸｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '03-5339-0707', '03-5339-0748', NULL, NULL, NULL, NULL, '111', 'HS', '5', '給排水衛生', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS105122', '2017/07/31', NULL);
INSERT INTO `customer_information` VALUES (177, '1856', '1', '1100000009', 'エコラボ', 'ｴｺﾗﾎﾞ', NULL, NULL, NULL, NULL, NULL, '0120-103-144', '0120-103-197', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2020/03/02', NULL);
INSERT INTO `customer_information` VALUES (178, '1866', '1', '1100000051', '日立コンシューママーケティング', 'ﾋﾀﾁｺﾝｼｭｰﾏﾏｰｹﾃｨﾝｸﾞ', NULL, NULL, NULL, NULL, NULL, '03-3834-8607', '03-5688-4104', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (179, '1886', '1', '1100000458', '両毛丸善', 'ﾘｮｳﾓｳﾏﾙｾﾞﾝ', NULL, NULL, NULL, NULL, NULL, '0284-70-2122', '0284-71-1263', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (180, '1902', '1', '1100001842', 'トーケンコンサル', 'ﾄｰｹﾝｺﾝｻﾙ', NULL, NULL, NULL, NULL, NULL, '024-935-0313', '024-935-0331', NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (181, '1905', '1', '1100001234', '株式会社ミツウロコ　山形支店', 'ｶﾌﾞｼｷｶﾞｲｼｬﾐﾂｳﾛｺ ﾔﾏｶﾞﾀｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '023-655-2326', '023-655-5266', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (182, '1907', '1', '1100000315', 'ユニコンエージェンシー', 'ﾕﾆｺﾝｴｰｼﾞｪﾝｼｰ', NULL, NULL, NULL, NULL, NULL, '022-304-8850', '022-304-8870', NULL, NULL, NULL, NULL, '111', 'HS', '9', '内装', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (183, '1920', '1', '1100000437', '三菱重工空調システム', 'ﾐﾂﾋﾞｼｼﾞｭｳｺｳｸｳﾁｮｳｼｽﾃﾑ', NULL, NULL, NULL, NULL, NULL, '0120-975-365', '03-3819-5291', NULL, NULL, NULL, NULL, '111', 'HS', '5', '給排水衛生', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (184, '1936', '1', '1100000355', '大和ハウス四日市支社（建築設計課）', 'ﾀﾞｲﾜﾊｳｽ', NULL, NULL, NULL, NULL, NULL, NULL, '0593-55-2792', NULL, NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2017/10/18', NULL);
INSERT INTO `customer_information` VALUES (185, '2699', '1', '1000', '（請求処理用）鈴茂器工', 'ｽｽﾞﾓｷｺｳｾｲｷｭｳｼｮﾖｳ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (186, '2552', '1', '1199620027', '株式会社トスマク', 'ﾄｽﾏｸ', NULL, NULL, NULL, NULL, NULL, '0761-23-0088', '0761-23-0158', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/28', NULL);
INSERT INTO `customer_information` VALUES (187, '2564', '1', '1199606014', '関西電気保安協会', 'ｶﾝｻｲﾃﾞﾝｷﾎｱﾝｷｮｳｶｲ', NULL, NULL, NULL, NULL, NULL, '06-6363-0731', '06-6363-0738', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/05/31', NULL);
INSERT INTO `customer_information` VALUES (188, '2665', '1', '1199999999', '★社内対応', 'ｼｬﾅｲﾀｲｵｳ', NULL, NULL, NULL, NULL, NULL, NULL, '00-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/03/23', NULL);
INSERT INTO `customer_information` VALUES (189, '2682', '1', '111', 'パナ産機１（IUO　中央）', 'ﾊﾟﾅｻﾝｷﾐﾂｲ ﾁｭｳｵｳ IUOIUO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2019/12/07', NULL);
INSERT INTO `customer_information` VALUES (190, '2683', '1', '113', 'パナ産機３（三井　あじさい）', 'ﾊﾟﾅｻﾝｷ3ﾐﾂｲ ｱｼﾞｻｲ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2020/03/30', NULL);
INSERT INTO `customer_information` VALUES (191, '2685', '1', '114', 'パナ産機４（首都圏支店）', 'ﾊﾟﾅｻﾝｷ4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (192, '2702', '1', '1019', '北海道鈴茂（請求書処理用）', 'ﾎｯｶｲﾄﾞｳｽｽﾞﾓ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (193, '2698', '1', '115', 'ハ゜ナ産機５（三井　しらゆり支店）', 'ﾊﾟﾅｻﾝｷ ﾐﾂｲ ｼﾗﾕﾘｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (194, '2710', '1', '1199999998', '★★未使用★★パーパス港北サービス', 'ﾊﾟｰﾊﾟｽｺｳﾎｸｻｰﾋﾞｽ', NULL, NULL, NULL, NULL, NULL, NULL, '045-530-9988', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/08/14', NULL);
INSERT INTO `customer_information` VALUES (195, '2791', '1', '9999', '★その他（箱のみ・特殊案件）', 'ｿﾉﾀﾎｼ･ﾄｸｼｭｱﾝｹﾝ', NULL, NULL, NULL, NULL, NULL, '000-0000-0000', '000-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (196, '2872', '1', '1199999982', 'トーホーピクス', 'ﾄｰﾎｰﾋﾟｸｽ', NULL, NULL, NULL, NULL, NULL, '024-944-5300', '024-944-5533', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/11', NULL);
INSERT INTO `customer_information` VALUES (197, '2923', '1', '9998', '★ガス会社様依頼（未登録）', 'ｶﾞｽｶﾞｲｼｬｻﾏｻﾏ(ﾐﾄｳﾛｸ)ﾎｼ', NULL, NULL, NULL, NULL, NULL, '000-0000-0000', '000-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', '17', '防災設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (198, '2923', '1', '9998', '★ガス会社様依頼（未登録）', 'ｶﾞｽｶﾞｲｼｬｻﾏｻﾏ(ﾐﾄｳﾛｸ)ﾎｼ', NULL, NULL, NULL, NULL, NULL, '000-0000-0000', '000-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', '7', '空調換気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (199, '3265', '1', '1199999962', 'ジャパンエレベーターサービス(株)', 'ｼﾞｬﾊﾟﾝｴﾚﾍﾞｰﾀｰｻｰﾋﾞｽｶﾌﾞ', NULL, NULL, NULL, NULL, NULL, '03-5825-4511', '03-3851-8252', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2020/05/25', NULL);
INSERT INTO `customer_information` VALUES (200, '1729', '1', '1100001932', '㈱オーエスディー', 'ｵｰｴｽﾃﾞｨｰ', NULL, NULL, NULL, NULL, NULL, '098-983-7888', '098-983-7889', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/11', NULL);
INSERT INTO `customer_information` VALUES (201, '1735', '1', '1100001819', 'マエダ企画', 'ﾏｴﾀﾞｷｶｸ', NULL, NULL, NULL, NULL, NULL, '096-223-2341', '096-223-2346', NULL, NULL, NULL, NULL, '111', 'HS', '8', '建具工事', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (202, '1741', '1', '1100001320', '四国ガス燃料株式会社　東予営業所', 'ｼｺｸｶﾞｽﾈﾝﾘｮｳｶﾌﾞｼｷｶﾞｲｼｬ ﾄｳﾖｴｲｷﾞｮｳｼｮ', NULL, NULL, NULL, NULL, NULL, '0897-55-6655', '0897-55-3556', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (203, '1749', '1', '1100001920', 'イワタニ山陰（出雲支店）', 'ｲﾜﾀﾆｻﾝｲﾝ(ｲｽﾞﾓｼﾃﾝ)', NULL, NULL, NULL, NULL, NULL, '0853-23-0101', '0853-23-0104', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2019/08/31', NULL);
INSERT INTO `customer_information` VALUES (204, '1754', '1', '1100001914', '大昌工芸㈱', 'ﾀﾞｲｼｮｳｺｳｹﾞｲｶﾌﾞ', NULL, NULL, NULL, NULL, NULL, '082-291-6211', '082-291-6216', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (205, '1755', '1', '1100001975', '扇港興産㈱小野支店', 'ｾﾝｺｳｺｳｻﾝｶﾌﾞｵﾉｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '0794-62-4947', '0794-62-6973', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (206, '1768', '1', '1100001265', '大崎産業株式会社', 'ｵｵｻｷｻﾝｷﾞｮｳｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '073-492-1411', '073-492-3977', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (207, '1771', '1', '1100001903', '未来建築工芸', 'ﾐﾗｲｹﾝﾁｸｺｳｹﾞｲ', NULL, NULL, NULL, NULL, NULL, '06-4302-3822', '06-4302-3823', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (208, '1773', '1', '1100000598', 'ビコーインプレス', 'ﾋﾞｺｰｲﾝﾌﾟﾚｽ', NULL, NULL, NULL, NULL, NULL, '0593-61-3923', '0593-61-3959', NULL, NULL, NULL, NULL, '111', 'HS', '15', '看板テント', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (209, '1781', '1', '1100001911', '静岡ガス', 'ｼｽﾞｵｶｶﾞｽ', NULL, NULL, NULL, NULL, NULL, '055-927-2811', '055-927-2858', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (210, '1784', '1', '1100001335', '吉田瓦斯株式会社', 'ﾖｼﾀﾞｶﾞｽｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '0555-22-2161', '0555-24-0948', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (211, '1785', '1', '1100000350', '関山建設', 'ｾｷﾔﾏｹﾝｾﾂ', NULL, NULL, NULL, NULL, NULL, '055-4437203', '055-445-1584', NULL, NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (212, '1791', '1', '1100001910', '株式会社ヨシオ', 'ﾖｼｵ', NULL, NULL, NULL, NULL, NULL, '0537-61-4400', '0537-23-0112', NULL, NULL, NULL, NULL, '111', 'HS', '8', '建具工事', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/29', NULL);
INSERT INTO `customer_information` VALUES (213, '1808', '1', '1100001161', 'トモプロ株式会社・再生エネルギー特需課', 'ﾄﾓﾌﾟﾛｶﾌﾞｼｷｶﾞｲｼｬ･ｻｲｾｲｴﾈﾙｷﾞｰﾄｸｼﾞｭｶ', NULL, NULL, NULL, NULL, NULL, '046-206-7177', '046-221-3352', NULL, NULL, NULL, NULL, '111', 'HS', '5', '給排水衛生', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2019/10/26', NULL);
INSERT INTO `customer_information` VALUES (214, '2650', '1', '1199100030', 'テクノサポート', 'ﾃｸﾉｻﾎﾟｰﾄ', NULL, NULL, NULL, NULL, NULL, NULL, '03-5783-8772', NULL, NULL, NULL, NULL, '111', 'HS', '12', '弱電（ACCS）', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS105122', '2017/07/01', NULL);
INSERT INTO `customer_information` VALUES (215, '1826', '1', '1100001896', 'ケント照明', 'ｹﾝﾄｼｮｳﾒｲ', NULL, NULL, NULL, NULL, NULL, '03-5822-2511', '03-5822-2512', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (216, '1831', '1', '1100000036', 'メイスイ', 'ﾒｲｽｲ', NULL, NULL, NULL, NULL, NULL, '03-5753-2110', '03-5753-4001', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (217, '1846', '1', '1100000096', '平安コーポレーション', 'ﾍｲｱﾝｺｰﾎﾟﾚｰｼｮﾝ', NULL, NULL, NULL, NULL, NULL, '03-5486-5501', '03-5486-0555', NULL, NULL, NULL, NULL, '111', 'HS', '10', '窓ガラスサッシ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (218, '1849', '1', '1100001928', 'レモンガス', 'ﾚﾓﾝｶﾞｽ', NULL, NULL, NULL, NULL, NULL, '03-5461-7081', '03-5462-3259', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (219, '1857', '1', '1100001783', '使用しない', 'ｼﾖｳｼﾅｲ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '111', 'HS', '10', '窓ガラスサッシ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/07/18', NULL);
INSERT INTO `customer_information` VALUES (220, '1861', '1', '1100000091', '日本設備保全', 'ﾆﾎﾝｾﾂﾋﾞﾎｾﾞﾝ', NULL, NULL, NULL, NULL, NULL, '03-3975-5881', '03-3976-1780', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (221, '1862', '1', '1100001906', '下田エコテック', 'ｼﾓﾀﾞｴｺﾃｯｸ', NULL, NULL, NULL, NULL, NULL, '03-3864-5710', '03-3864-5733', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (222, '1869', '1', '1100001901', '佐藤金物', 'ｻﾄｳｶﾅﾓﾉ', NULL, NULL, NULL, NULL, NULL, '03-3745-6431', '03-3745-6435', NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (223, '1876', '1', '1100001973', '㈱クレスト', 'ｸﾚｽﾄ', NULL, NULL, NULL, NULL, NULL, '03-3239-3136', '03-5226-8616', NULL, NULL, NULL, NULL, '111', 'HS', '15', '看板テント', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/28', NULL);
INSERT INTO `customer_information` VALUES (224, '1882', '1', '1100000324', '筑浦住建', 'ﾂｸﾎｼﾞｭｳｹﾝ', NULL, NULL, NULL, NULL, NULL, '0298-24-6711', '0298-24-6713', NULL, NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/07/29', NULL);
INSERT INTO `customer_information` VALUES (225, '1884', '1', '1100001909', '有限会社児玉電気工事', 'ﾕｳｹﾞﾝｶﾞｲｼｬｺﾀﾞﾏﾃﾞﾝｷｺｳｼﾞ', NULL, NULL, NULL, NULL, NULL, '028-655-2919', '028-655-3372', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (226, '1885', '1', '1100001923', 'ミライフ・カスタマーセンター', 'ﾐﾗｲﾌ･ｶｽﾀﾏｰｾﾝﾀｰ', NULL, NULL, NULL, NULL, NULL, '0120-046-370', '03-6658-8394', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2020/01/08', NULL);
INSERT INTO `customer_information` VALUES (227, '1888', '1', '1100001267', '株式会社ミツウロコ　栃木支店', 'ｶﾌﾞｼｷｶﾞｲｼｬﾐﾂｳﾛｺ ﾄﾁｷﾞｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '0282-22-0369', '0282-23-3591', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (228, '1890', '1', '1100000060', 'パナソニック産機システムズＣＣ', 'ﾊﾟﾅｿﾆｯｸｻﾝｷｼｽﾃﾑｽﾞCC', NULL, NULL, NULL, NULL, NULL, '0276-51-3479', '0276-20-0232', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (229, '1893', '1', '1100001900', '群馬燃料', 'ｸﾞﾝﾏﾈﾝﾘｮｳ', NULL, NULL, NULL, NULL, NULL, '0276-45-6158', '0276-45-1814', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (230, '1904', '1', '1100001255', '東部液化石油平支店', 'ﾄｳﾌﾞｴｷｶｾｷﾕﾍｲｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '024-622-4004', '024-622-4005', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (231, '1908', '1', '1100001315', 'カメイ㈱宮城支店', 'ｶﾒｲｶﾌﾞｼｷｶﾞｲｼｬﾐﾔｷﾞｼﾃﾝｶﾌﾞ', NULL, NULL, NULL, NULL, NULL, '022-239-1117', '022-239-1123', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2019/03/22', NULL);
INSERT INTO `customer_information` VALUES (232, '1915', '1', '1100001937', '吉宮建設', 'ﾖｼﾐﾔｹﾝｾﾂ', NULL, NULL, NULL, NULL, NULL, '0166-31-1476', '0166-31-1475', NULL, NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (233, '2734', '1', '1100001993', '白石 南部営業所', 'ｼﾗｲｼ　ﾅﾝﾌﾞｴｲｷﾞｮｳｼｮ', '901-0224', '47', '沖縄県', '豊見城市字与根50-52', NULL, '098-840-5000', '098-840-5611', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/11/05', NULL);
INSERT INTO `customer_information` VALUES (234, '2663', '1', '1199720004', 'TOTOｴﾑﾃｯｸ株式会社', 'ﾄｰﾄｰｴﾑﾃｯｸｶﾌﾞｼｷｶｲｼｬ', NULL, NULL, NULL, NULL, NULL, '03-5339-0708', '03-53390748', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/07/07', NULL);
INSERT INTO `customer_information` VALUES (235, '2538', '1', '1199728008', 'フジクリーン工業株式会社', 'ﾌｼﾞｸﾘｰﾝｺｳｷﾞｮｳｶﾌﾞｼｷｶｲｼｬ', NULL, NULL, NULL, NULL, NULL, '03-3288-4512', '03-3288-5112', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/05/31', NULL);
INSERT INTO `customer_information` VALUES (236, '2560', '1', '1199628031', '有限会社藤中工業', 'ﾌｼﾞﾅｶｺｳｷﾞｮｳ', NULL, NULL, NULL, NULL, NULL, '0256-93-2479', '0256-93-3088', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/29', NULL);
INSERT INTO `customer_information` VALUES (237, '2666', '1', '1199728006', '不二精機', 'ﾌｼﾞｾｲｷ', NULL, NULL, NULL, NULL, NULL, '03-3364-2885', '03-3371-0186', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/07/07', NULL);
INSERT INTO `customer_information` VALUES (238, '2667', '1', '1100001983', 'グローリーエンジニアリング', 'ｸﾞﾛｰﾘｰｴﾝｼﾞﾆｱﾘﾝｸﾞ', NULL, '1', '北海道', NULL, NULL, '011-688-9810', '011-688-9810', NULL, NULL, NULL, NULL, '111', 'HS', '9', '内装', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/11/08', NULL);
INSERT INTO `customer_information` VALUES (239, '2667', '1', '1100001983', 'グローリーエンジニアリング', 'ｸﾞﾛｰﾘｰｴﾝｼﾞﾆｱﾘﾝｸﾞ', NULL, '1', '北海道', NULL, NULL, '011-688-9810', '011-688-9810', NULL, NULL, NULL, NULL, '111', 'HS', '7', '空調換気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/11/08', NULL);
INSERT INTO `customer_information` VALUES (240, '2684', '1', '112', 'パナ産機２（掃除機など）', 'ﾊﾟﾅｻﾝｷ2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (241, '2713', '1', '691300', '株式会社クレスト', 'ｸﾚｽﾄ', '101-0061', '13', '東京都', '千代田区三崎町3-8-5', '千代田区CBビル６F', '050-1748-9482', '03-6721-1198', NULL, NULL, NULL, NULL, '111', 'HS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/11/06', NULL);
INSERT INTO `customer_information` VALUES (242, '2730', '1', '1199999996', 'リフテック', 'ﾘﾌﾃｯｸ', NULL, NULL, NULL, NULL, NULL, '03-6868-6064', '03-6751-0820', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/09/09', NULL);
INSERT INTO `customer_information` VALUES (243, '2923', '1', '9998', '★ガス会社様依頼（未登録）', 'ｶﾞｽｶﾞｲｼｬｻﾏｻﾏ(ﾐﾄｳﾛｸ)ﾎｼ', NULL, NULL, NULL, NULL, NULL, '000-0000-0000', '000-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', '16', '管球交換', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (244, '2923', '1', '9998', '★ガス会社様依頼（未登録）', 'ｶﾞｽｶﾞｲｼｬｻﾏｻﾏ(ﾐﾄｳﾛｸ)ﾎｼ', NULL, NULL, NULL, NULL, NULL, '000-0000-0000', '000-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', '11', '弱電', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (245, '2923', '1', '9998', '★ガス会社様依頼（未登録）', 'ｶﾞｽｶﾞｲｼｬｻﾏｻﾏ(ﾐﾄｳﾛｸ)ﾎｼ', NULL, NULL, NULL, NULL, NULL, '000-0000-0000', '000-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', '8', '建具工事', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (246, '2923', '1', '9998', '★ガス会社様依頼（未登録）', 'ｶﾞｽｶﾞｲｼｬｻﾏｻﾏ(ﾐﾄｳﾛｸ)ﾎｼ', NULL, NULL, NULL, NULL, NULL, '000-0000-0000', '000-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (247, '3267', '1', '1200000000', 'ラッキーコーヒーマシン', 'ﾗｯｷｰｺｰﾋｰﾏｼﾝ', NULL, NULL, NULL, NULL, NULL, '044-223-7318', '078-940-0051', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2020/05/29', NULL);
INSERT INTO `customer_information` VALUES (248, '3055', '1', '1199999967', '四国ガス燃料（株）　徳島営業所', 'ｼｺｸｶﾞｽﾈﾝﾘｮｳ  ﾄｸｼﾏｴｲｷﾞｮｳｼｮ', NULL, NULL, NULL, NULL, NULL, '088-699-3811', '088-699-6167', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/09/21', NULL);
INSERT INTO `customer_information` VALUES (249, '1728', '1', '1100001307', '南国殖産株式会社国分支店', 'ﾅﾝｺﾞｸｼｮｸｻﾝｶﾌﾞｼｷｶﾞｲｼｬｺｸﾌﾞｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '0995-67-3363', '0995-67-3061', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (250, '1731', '1', '1100001972', '南九州マルヰ㈱', 'ﾐﾅﾐｷｭｳｼｭｳﾏﾙｲｶﾌﾞｼｷｶｲｼｬ', NULL, NULL, NULL, NULL, NULL, '096-389-1112', '096-389-4101', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (251, '1740', '1', '1100001887', '大和ﾊｳｽ工業（株）福岡支店', 'ﾀﾞｲﾜﾊｳｽｺｳｷﾞｮｳ(ｶﾌﾞ)ﾌｸｵｶｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '092-411-7446', '092-473-9524', NULL, NULL, NULL, NULL, '111', 'HS', '9', '内装', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (252, '1743', '1', '1100001950', '大同ガス（株）南営業所', 'ﾀﾞｲﾄﾞｳｶﾞｽ(ｶﾌﾞ)ﾐﾅﾐｴｲｷﾞｮｳｼﾞｮ', NULL, NULL, NULL, NULL, NULL, '087-876-3377', '087-876-4428', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (253, '1744', '1', '1100001922', '大和ハウス　香川支店', 'ﾀﾞｲﾜﾊｳｽ ｶｶﾞﾜｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '087-865-2259', '087-865-2099', NULL, NULL, NULL, NULL, '111', 'HS', '10', '窓ガラスサッシ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (254, '1744', '1', '1100001922', '大和ハウス　香川支店', 'ﾀﾞｲﾜﾊｳｽ ｶｶﾞﾜｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '087-865-2259', '087-865-2099', NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (255, '1775', '1', '1100001935', '太陽日酸エネルギー㈱　三重支店　四日市営業所', 'ﾀｲﾖｳｼﾞﾂｻﾝｴﾈﾙｷﾞｰｶﾌﾞ ﾐｴｼﾃﾝ ﾖｯｶｲﾁｴｲｷﾞｮｳｼｮ', NULL, NULL, NULL, NULL, NULL, '059-321-8080', '059-321-1668', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (256, '1795', '1', '1100001912', '名古屋エネルギー', 'ﾅｺﾞﾔｴﾈﾙｷﾞｰ', NULL, NULL, NULL, NULL, NULL, '052-501-1832', '052-501-1849', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (257, '1796', '1', '1100001787', 'スズモメンテナンス', 'ｽｽﾞﾓﾒﾝﾃﾅﾝｽ', NULL, NULL, NULL, NULL, NULL, '049-297-7666', '049-297-5062', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (258, '1808', '1', '1100001161', 'トモプロ株式会社・再生エネルギー特需課', 'ﾄﾓﾌﾟﾛｶﾌﾞｼｷｶﾞｲｼｬ･ｻｲｾｲｴﾈﾙｷﾞｰﾄｸｼﾞｭｶ', NULL, NULL, NULL, NULL, NULL, '046-206-7177', '046-221-3352', NULL, NULL, NULL, NULL, '111', 'HS', '7', '空調換気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2019/10/26', NULL);
INSERT INTO `customer_information` VALUES (259, '1819', '1', '1100001931', 'エネアーク関東（高崎支店）', 'ｴﾈｱｰｸｶﾝﾄｳ(ﾀｶｻｷｼﾃﾝ)', NULL, NULL, NULL, NULL, NULL, '027-343-5073', '027-343-3475', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2019/11/30', NULL);
INSERT INTO `customer_information` VALUES (260, '2650', '1', '1199100030', 'テクノサポート', 'ﾃｸﾉｻﾎﾟｰﾄ', NULL, NULL, NULL, NULL, NULL, NULL, '03-5783-8772', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS105122', '2017/07/01', NULL);
INSERT INTO `customer_information` VALUES (261, '2650', '1', '1199100030', 'テクノサポート', 'ﾃｸﾉｻﾎﾟｰﾄ', NULL, NULL, NULL, NULL, NULL, NULL, '03-5783-8772', NULL, NULL, NULL, NULL, '111', 'HS', '15', '看板テント', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS105122', '2017/07/01', NULL);
INSERT INTO `customer_information` VALUES (262, '2650', '1', '1199100030', 'テクノサポート', 'ﾃｸﾉｻﾎﾟｰﾄ', NULL, NULL, NULL, NULL, NULL, NULL, '03-5783-8772', NULL, NULL, NULL, NULL, '111', 'HS', '11', '弱電', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS105122', '2017/07/01', NULL);
INSERT INTO `customer_information` VALUES (263, '2650', '1', '1199100030', 'テクノサポート', 'ﾃｸﾉｻﾎﾟｰﾄ', NULL, NULL, NULL, NULL, NULL, NULL, '03-5783-8772', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS105122', '2017/07/01', NULL);
INSERT INTO `customer_information` VALUES (264, '1841', '1', '1100000019', 'タテヤマアドバンス', 'ﾀﾃﾔﾏｱﾄﾞﾊﾞﾝｽ', NULL, NULL, NULL, NULL, NULL, '03-5614-1214', '03-5641-1298', NULL, NULL, NULL, NULL, '111', 'HS', '10', '窓ガラスサッシ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (265, '1842', '1', '1100001625', '株式会社マルゼン', 'ﾏﾙｾﾞﾝ', NULL, NULL, NULL, NULL, NULL, '03-5603-7766', '03-5603-7760', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/11', NULL);
INSERT INTO `customer_information` VALUES (266, '1845', '1', '1100000073', '前田道路', 'ﾏｴﾀﾞﾄﾞｳﾛ', NULL, NULL, NULL, NULL, NULL, '03-5487-0022', '03-5487-0039', NULL, NULL, NULL, NULL, '111', 'HS', '9', '内装', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (267, '1857', '1', '1100001783', '使用しない', 'ｼﾖｳｼﾅｲ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '111', 'HS', '8', '建具工事', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/07/18', NULL);
INSERT INTO `customer_information` VALUES (268, '1857', '1', '1100001783', '使用しない', 'ｼﾖｳｼﾅｲ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/07/18', NULL);
INSERT INTO `customer_information` VALUES (269, '1869', '1', '1100001901', '佐藤金物', 'ｻﾄｳｶﾅﾓﾉ', NULL, NULL, NULL, NULL, NULL, '03-3745-6431', '03-3745-6435', NULL, NULL, NULL, NULL, '111', 'HS', '8', '建具工事', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (270, '1874', '1', '1100001830', 'エコプラン', 'ｴｺﾌﾟﾗﾝ', NULL, NULL, NULL, NULL, NULL, '03-3366-3700', '03-3366-3701', NULL, NULL, NULL, NULL, '111', 'HS', '7', '空調換気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (271, '1879', '1', '1100000134', '大堀メンテナンス', 'ｵｵﾎﾘﾒﾝﾃﾅﾝｽ', NULL, NULL, NULL, NULL, NULL, '0298-67-0141', '0298-67-3237', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (272, '1881', '1', '1100000069', '清和工業', 'ｾｲﾜｺｳｷﾞｮｳ', NULL, NULL, NULL, NULL, NULL, '0298-32-4780', '0298-32-4784', NULL, NULL, NULL, NULL, '111', 'HS', '5', '給排水衛生', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (273, '1902', '1', '1100001842', 'トーケンコンサル', 'ﾄｰｹﾝｺﾝｻﾙ', NULL, NULL, NULL, NULL, NULL, '024-935-0313', '024-935-0331', NULL, NULL, NULL, NULL, '111', 'HS', '9', '内装', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (274, '1910', '1', '1100001868', '東部液化ガス秋田支店', 'ﾄｳﾌﾞｴｷｶｶﾞｽｱｷﾀｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '018-835-3248', '018-835-3278', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (275, '1919', '1', '1100001930', '小泉建設', 'ｺｲｽﾞﾐｹﾝｾﾂ', NULL, NULL, NULL, NULL, NULL, '0138-45-7777', '0138-45-7778', NULL, NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (276, '1920', '1', '1100000437', '三菱重工空調システム', 'ﾐﾂﾋﾞｼｼﾞｭｳｺｳｸｳﾁｮｳｼｽﾃﾑ', NULL, NULL, NULL, NULL, NULL, '0120-975-365', '03-3819-5291', NULL, NULL, NULL, NULL, '111', 'HS', '7', '空調換気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (277, '1927', '1', '1100000479', 'クラシアン', 'ｸﾗｼｱﾝ', NULL, NULL, NULL, NULL, NULL, '0120-48-1155', '045-473-7059', NULL, NULL, NULL, NULL, '111', 'HS', '7', '空調換気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (278, '1930', '1', '1100001603', 'TOTOメンテナンス株式会社', 'ﾄｰﾄｰﾒﾝﾃﾅﾝｽｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '0120-1010-05', '025-246-1060', NULL, NULL, NULL, NULL, '111', 'HS', '7', '空調換気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/06/29', NULL);
INSERT INTO `customer_information` VALUES (279, '1930', '1', '1100001603', 'TOTOメンテナンス株式会社', 'ﾄｰﾄｰﾒﾝﾃﾅﾝｽｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '0120-1010-05', '025-246-1060', NULL, NULL, NULL, NULL, '111', 'HS', '5', '給排水衛生', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/06/29', NULL);
INSERT INTO `customer_information` VALUES (280, '1938', '1', '1100001788', '大阪ガス', 'ｵｵｻｶｶﾞｽ', NULL, NULL, NULL, NULL, NULL, NULL, '06-6586-1073', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (281, '2745', '1', '1199999994', '株式会社九酸ガス住設　直方営業所', 'ｷｭｳｻﾝｶﾞｽｼﾞｭｳｾﾂ ﾅｵｶﾀｴｲｷﾞｮｳｼｮ', NULL, NULL, NULL, NULL, NULL, '0949-22-0678', '0949-22-0878', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/13', NULL);
INSERT INTO `customer_information` VALUES (282, '2541', '1', '1199626011', '有限会社白鳳清掃', 'ﾊｸﾎｳｾｲｿｳ', NULL, NULL, NULL, NULL, NULL, '0595-37-0128', '0595-37-0067', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/29', NULL);
INSERT INTO `customer_information` VALUES (283, '2544', '1', '1199611008', '有限会社サニタリー', 'ｻﾆﾀﾘｰ', NULL, NULL, NULL, NULL, NULL, '0996-25-2137', '0996-25-3807', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/13', NULL);
INSERT INTO `customer_information` VALUES (284, '2546', '1', '1199627012', '有限会社光エンテックス', 'ﾋｶﾘｴﾝﾃｯｸｽ', NULL, NULL, NULL, NULL, NULL, '088-641-6611', '088-641-6622', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/29', NULL);
INSERT INTO `customer_information` VALUES (285, '2550', '1', '1199606024', '環企画', 'ｶﾝｷｶｸ', NULL, NULL, NULL, NULL, NULL, '052-702-0035', '052-703-7488', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/11/09', NULL);
INSERT INTO `customer_information` VALUES (286, '2566', '1', '1199622032', '株式会社日本電気安全協会', 'ﾆﾎﾝﾃﾞﾝｷｱﾝｾﾞﾝｷｮｳｶｲ', NULL, NULL, NULL, NULL, NULL, '044-862-0311', '044-862-0386', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/29', NULL);
INSERT INTO `customer_information` VALUES (287, '2660', '1', '1199632003', 'ミツウロコ', 'ﾐﾂｳﾛｺ', NULL, NULL, NULL, NULL, NULL, '03-3275-6313', '03-3275-6354', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS011201', '2017/08/03', NULL);
INSERT INTO `customer_information` VALUES (288, '2678', '1', '1199631008', 'マルイファシリティーズ', 'ﾏﾙｲﾌｧｼﾘﾃｨｰｽﾞ', NULL, NULL, NULL, NULL, NULL, '03-3229-5291', '03-3229-0312', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/07/21', NULL);
INSERT INTO `customer_information` VALUES (289, '2678', '1', '1199631008', 'マルイファシリティーズ', 'ﾏﾙｲﾌｧｼﾘﾃｨｰｽﾞ', NULL, NULL, NULL, NULL, NULL, '03-3229-5291', '03-3229-0312', NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/07/21', NULL);
INSERT INTO `customer_information` VALUES (290, '2840', '1', '1199999984', '東京サラヤ株式会社', 'ｻﾗﾔ', NULL, NULL, NULL, NULL, NULL, '03-3472-1521', '03-5461-8109', NULL, NULL, NULL, NULL, '111', 'HS', '5', '給排水衛生', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/12/13', NULL);
INSERT INTO `customer_information` VALUES (291, '2907', '1', '1199999973', 'イワタニ北陸（株）小松営業所 ', 'ｲﾜﾀﾆﾎｸﾘｸｺﾏﾂｴｲｷﾞｮｳｼｮ', NULL, NULL, NULL, NULL, NULL, '0761-77-1008', '0761-76-0977', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/02/18', NULL);
INSERT INTO `customer_information` VALUES (292, '2923', '1', '9998', '★ガス会社様依頼（未登録）', 'ｶﾞｽｶﾞｲｼｬｻﾏｻﾏ(ﾐﾄｳﾛｸ)ﾎｼ', NULL, NULL, NULL, NULL, NULL, '000-0000-0000', '000-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (293, '2923', '1', '9998', '★ガス会社様依頼（未登録）', 'ｶﾞｽｶﾞｲｼｬｻﾏｻﾏ(ﾐﾄｳﾛｸ)ﾎｼ', NULL, NULL, NULL, NULL, NULL, '000-0000-0000', '000-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (294, '2923', '1', '9998', '★ガス会社様依頼（未登録）', 'ｶﾞｽｶﾞｲｼｬｻﾏｻﾏ(ﾐﾄｳﾛｸ)ﾎｼ', NULL, NULL, NULL, NULL, NULL, '000-0000-0000', '000-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', '10', '窓ガラスサッシ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (295, '2923', '1', '9998', '★ガス会社様依頼（未登録）', 'ｶﾞｽｶﾞｲｼｬｻﾏｻﾏ(ﾐﾄｳﾛｸ)ﾎｼ', NULL, NULL, NULL, NULL, NULL, '000-0000-0000', '000-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (296, '2923', '1', '9998', '★ガス会社様依頼（未登録）', 'ｶﾞｽｶﾞｲｼｬｻﾏｻﾏ(ﾐﾄｳﾛｸ)ﾎｼ', NULL, NULL, NULL, NULL, NULL, '000-0000-0000', '000-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', '5', '給排水衛生', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (297, '3265', '1', '1199999962', 'ジャパンエレベーターサービス(株)', 'ｼﾞｬﾊﾟﾝｴﾚﾍﾞｰﾀｰｻｰﾋﾞｽｶﾌﾞ', NULL, NULL, NULL, NULL, NULL, '03-5825-4511', '03-3851-8252', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2020/05/25', NULL);
INSERT INTO `customer_information` VALUES (298, '1748', '1', '1100001261', '山陰酸素工業株式会社西部販売カンパニー　出雲支店', 'ｻﾝｲﾝｻﾝｿｺｳｷﾞｮｳｶﾌﾞｼｷｶﾞｲｼｬｾｲﾌﾞﾊﾝﾊﾞｲｶﾝﾊﾟﾆｰ ｲｽﾞﾓｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '0853-28-2866', '0853-28-2870', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (299, '1761', '1', '1100001778', '北日本カコー', 'ｷﾀﾆﾎﾝｶｺｰ', NULL, NULL, NULL, NULL, NULL, '076-277-3570', '076-277-3574', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (300, '1770', '1', '1100001826', '山岡金属工業', 'ﾔﾏｵｶｷﾝｿﾞｸｺｳｷﾞｮｳ', NULL, NULL, NULL, NULL, NULL, '06-6996-2351', '06-6997-3045', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (301, '1780', '1', '1100001273', '鈴与商事　岡崎営業所', 'ｽｽﾞﾖｼｮｳｼﾞ ｵｶｻﾞｷｴｲｷﾞｮｳｼｮ', NULL, NULL, NULL, NULL, NULL, '0564-21-6464', '0564-23-0589', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (302, '1791', '1', '1100001910', '株式会社ヨシオ', 'ﾖｼｵ', NULL, NULL, NULL, NULL, NULL, '0537-61-4400', '0537-23-0112', NULL, NULL, NULL, NULL, '111', 'HS', '9', '内装', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/29', NULL);
INSERT INTO `customer_information` VALUES (303, '1793', '1', '1100001902', '宮吉硝子株式会社', 'ﾐﾔｷﾁｶﾞﾗｽｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '052-882-7722', '052-884-6470', NULL, NULL, NULL, NULL, '111', 'HS', '10', '窓ガラスサッシ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/09/14', NULL);
INSERT INTO `customer_information` VALUES (304, '1799', '1', '1100000314', '北洋', 'ﾎｸﾖｳ', NULL, NULL, NULL, NULL, NULL, '048-721-7477', '048-721-7444', NULL, NULL, NULL, NULL, '111', 'HS', '18', '廃棄物', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (305, '1803', '1', '1100000459', '京葉ガス', 'ｹｲﾖｳｶﾞｽ', NULL, NULL, NULL, NULL, NULL, '047-361-0211', '047-364-9231', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (306, '1806', '1', '1100001344', '株式会社サガミ', 'ｻｶﾞﾐ', NULL, NULL, NULL, NULL, NULL, '046-833-3131', '046-836-9891', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/11', NULL);
INSERT INTO `customer_information` VALUES (307, '1810', '1', '1100000329', 'トーエル', 'ﾄｰｴﾙ', NULL, NULL, NULL, NULL, NULL, '045-592-2224', '045-592-7896', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (308, '1813', '1', '1100001859', '東芝ライテック', 'ﾄｳｼﾊﾞﾗｲﾃｯｸ', NULL, NULL, NULL, NULL, NULL, '044-331-7602', '044-548-9613', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (309, '1815', '1', '1100001895', '日本ガス（株　狭山営業所', 'ﾆﾎﾝｶﾞｽ(ｶﾌﾞ ｻﾔﾏｴｲｷﾞｮｳｼｮ', NULL, NULL, NULL, NULL, NULL, '04-2957-7701', '04-2958-5700', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (310, '2650', '1', '1199100030', 'テクノサポート', 'ﾃｸﾉｻﾎﾟｰﾄ', NULL, NULL, NULL, NULL, NULL, NULL, '03-5783-8772', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS105122', '2017/07/01', NULL);
INSERT INTO `customer_information` VALUES (311, '2650', '1', '1199100030', 'テクノサポート', 'ﾃｸﾉｻﾎﾟｰﾄ', NULL, NULL, NULL, NULL, NULL, NULL, '03-5783-8772', NULL, NULL, NULL, NULL, '111', 'HS', '10', '窓ガラスサッシ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS105122', '2017/07/01', NULL);
INSERT INTO `customer_information` VALUES (312, '2650', '1', '1199100030', 'テクノサポート', 'ﾃｸﾉｻﾎﾟｰﾄ', NULL, NULL, NULL, NULL, NULL, NULL, '03-5783-8772', NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS105122', '2017/07/01', NULL);
INSERT INTO `customer_information` VALUES (313, '1833', '1', '1100000012', 'オリバー', 'ｵﾘﾊﾞｰ', NULL, NULL, NULL, NULL, NULL, '03-5674-9514', '03-5674-9524', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (314, '1839', '1', '1100000447', 'ダイキンエアテクノ', 'ﾀﾞｲｷﾝｴｱﾃｸﾉ', NULL, NULL, NULL, NULL, NULL, '03-5624-6420', '03-5624-6421', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (315, '1840', '1', '1100000035', 'マザー・テクノサービス', 'ﾏｻﾞｰ･ﾃｸﾉｻｰﾋﾞｽ', NULL, NULL, NULL, NULL, NULL, '03-5615-2431', '03-5615-2408', NULL, NULL, NULL, NULL, '111', 'HS', '9', '内装', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (316, '1846', '1', '1100000096', '平安コーポレーション', 'ﾍｲｱﾝｺｰﾎﾟﾚｰｼｮﾝ', NULL, NULL, NULL, NULL, NULL, '03-5486-5501', '03-5486-0555', NULL, NULL, NULL, NULL, '111', 'HS', '8', '建具工事', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (317, '2654', '1', '1100001982', '株式会社 日立ビルシステム 関西支社 京都営業所', 'ﾋﾀﾁﾋﾞﾙｼｽﾃﾑ ｶﾝｻｲｼｼｬ ｷｮｳﾄｴｲｷﾞｮｳｼｮ', '604-8151', '26', '京都府', '京都市中京区蛸薬師通烏丸西入ル橋弁慶町227', '第12長谷ビル', '075-254-4181', '075-223-2453', NULL, NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/13', NULL);
INSERT INTO `customer_information` VALUES (318, '1865', '1', '1100000014', 'クマリフトコーポレーション', 'ｸﾏﾘﾌﾄｺｰﾎﾟﾚｰｼｮﾝ', NULL, NULL, NULL, NULL, NULL, '03-3839-3030', '03-3839-1811', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2017/09/18', NULL);
INSERT INTO `customer_information` VALUES (319, '1877', '1', '1100001738', '菱電エレベータ（依頼受付のみ）', 'ﾘｮｳﾃﾞﾝｴﾚﾍﾞｰﾀ', NULL, NULL, NULL, NULL, NULL, '0120-525-220', '0120-337-114', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2020/02/05', NULL);
INSERT INTO `customer_information` VALUES (320, '1880', '1', '1100001786', 'ともえ', 'ﾄﾓｴ', NULL, NULL, NULL, NULL, NULL, '029-843-6611', '029-843-4500', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (321, '1896', '1', '1100001945', '千村住建', 'ﾁﾑﾗｼﾞｭｳｹﾝ', NULL, NULL, NULL, NULL, NULL, '0264-26-2335', '0264-26-2353', NULL, NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (322, '1907', '1', '1100000315', 'ユニコンエージェンシー', 'ﾕﾆｺﾝｴｰｼﾞｪﾝｼｰ', NULL, NULL, NULL, NULL, NULL, '022-304-8850', '022-304-8870', NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (323, '1913', '1', '1100001761', '三義', 'ﾐﾂﾖｼ', NULL, NULL, NULL, NULL, NULL, '0184-24-2327', '0184-22-0202', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (324, '1917', '1', '1100000467', '彩広舎', 'ｱﾔﾋﾛｼｬ', NULL, NULL, NULL, NULL, NULL, '0154-55-1070', '0154-55-1071', NULL, NULL, NULL, NULL, '111', 'HS', '15', '看板テント', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (325, '1932', '1', '1100000354', '森谷商事', 'ﾓﾘﾔｼｮｳｼﾞ', NULL, NULL, NULL, NULL, NULL, '011-716-6346', '011-758-2389', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (326, '2545', '1', '1199607006', 'キョクトウ有限会社', 'ｷｮｸﾄｳﾕｳｹﾞﾝｶｲｼｬ', NULL, NULL, NULL, NULL, NULL, '086-952-0384', '086-952-1977', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/05/31', NULL);
INSERT INTO `customer_information` VALUES (327, '2551', '1', '1199611013', '株式会社サニコン', 'ｻﾆｺﾝ', NULL, NULL, NULL, NULL, NULL, '072-244-3288', '072-244-3277', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/28', NULL);
INSERT INTO `customer_information` VALUES (328, '2556', '1', '1199622033', 'ニッコー株式会社', 'ﾆｯｺｰｶﾌﾞｼｷｶｲｼｬ', NULL, NULL, NULL, NULL, NULL, '048-554-3110', '048-554-3119', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/05/31', NULL);
INSERT INTO `customer_information` VALUES (329, '2559', '1', '1199631014', 'マルナカ興業有限会社', 'ﾏﾙﾅｶｺｳｷﾞｮｳﾕｳｹﾞﾝｶｲｼｬ', NULL, NULL, NULL, NULL, NULL, '0887-57-1230', '0887-57-1233', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/05/31', NULL);
INSERT INTO `customer_information` VALUES (330, '2562', '1', '1199630011', '北海道電気保安協会', 'ﾎｯｶｲﾄﾞｳﾃﾞﾝｷﾎｱﾝｷｮｳｶｲ', NULL, NULL, NULL, NULL, NULL, '011-555-5012', '011-555-5003', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/05/31', NULL);
INSERT INTO `customer_information` VALUES (331, '2667', '1', '1100001983', 'グローリーエンジニアリング', 'ｸﾞﾛｰﾘｰｴﾝｼﾞﾆｱﾘﾝｸﾞ', NULL, '1', '北海道', NULL, NULL, '011-688-9810', '011-688-9810', NULL, NULL, NULL, NULL, '111', 'HS', '5', '給排水衛生', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/11/08', NULL);
INSERT INTO `customer_information` VALUES (332, '2667', '1', '1100001983', 'グローリーエンジニアリング', 'ｸﾞﾛｰﾘｰｴﾝｼﾞﾆｱﾘﾝｸﾞ', NULL, '1', '北海道', NULL, NULL, '011-688-9810', '011-688-9810', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/11/08', NULL);
INSERT INTO `customer_information` VALUES (333, '2711', '1', '1199999997', 'パーパス（ハイブリッド給湯器用）', 'ﾊﾟｰﾊﾟｽ(ﾊｲﾌﾞﾘｯﾄﾞｷｭｳﾄｳｷﾖｳ)ﾖｳ)', NULL, NULL, NULL, NULL, NULL, '0120-194-884', '0120-261-884', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/11/10', NULL);
INSERT INTO `customer_information` VALUES (334, '2808', '1', '1199999987', '日南マルヰガス株式会社', 'ﾆﾁﾅﾝﾏﾙｲｶﾞｽｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '0987-23-3441', '0987-23-5665', NULL, NULL, NULL, NULL, '111', 'HS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2017/11/11', NULL);
INSERT INTO `customer_information` VALUES (335, '3014', '1', '1199999969', 'リコークリエイティブサービス', 'ﾘｺｰｸﾘｴｲﾃｨﾌﾞｻｰﾋﾞｽ', NULL, '13', '東京都', NULL, NULL, '03-3777-4233', '03-5742-2845', NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/07/20', NULL);
INSERT INTO `customer_information` VALUES (336, '2923', '1', '9998', '★ガス会社様依頼（未登録）', 'ｶﾞｽｶﾞｲｼｬｻﾏｻﾏ(ﾐﾄｳﾛｸ)ﾎｼ', NULL, NULL, NULL, NULL, NULL, '000-0000-0000', '000-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', '13', '受水槽', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (337, '2923', '1', '9998', '★ガス会社様依頼（未登録）', 'ｶﾞｽｶﾞｲｼｬｻﾏｻﾏ(ﾐﾄｳﾛｸ)ﾎｼ', NULL, NULL, NULL, NULL, NULL, '000-0000-0000', '000-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (338, '3192', '1', '1199999965', '㈱創和建設', 'ｶﾌﾞｿｳﾜｹﾝｾﾂ', NULL, NULL, NULL, NULL, NULL, '0986-23-8580', '0986-23-8590', '土屋　たかふみ', NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2019/07/08', NULL);
INSERT INTO `customer_information` VALUES (339, '3193', '1', '1199999964', 'シンコー㈱', 'ｼﾝｺｰｶﾌﾞ', NULL, NULL, NULL, NULL, NULL, '022-794-7895', '022-794-7897', NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2019/07/08', NULL);
INSERT INTO `customer_information` VALUES (340, '1735', '1', '1100001819', 'マエダ企画', 'ﾏｴﾀﾞｷｶｸ', NULL, NULL, NULL, NULL, NULL, '096-223-2341', '096-223-2346', NULL, NULL, NULL, NULL, '111', 'HS', '9', '内装', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (341, '1735', '1', '1100001819', 'マエダ企画', 'ﾏｴﾀﾞｷｶｸ', NULL, NULL, NULL, NULL, NULL, '096-223-2341', '096-223-2346', NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (342, '1745', '1', '1100001898', '四国岩谷', 'ｼｺｸｲﾜﾀﾆ', NULL, NULL, NULL, NULL, NULL, '087-814-8130', '087-867-2130', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (343, '1747', '1', '200001250', '鳥取ガス産業株式会社', 'ﾄｯﾄﾘｶﾞｽｻﾝｷﾞｮｳｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '0857-28-8822', '0857-28-8800', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (344, '1752', '1', '1100001904', 'エネックス', 'ｴﾈｯｸｽ', NULL, NULL, NULL, NULL, NULL, '0836-41-7810', '0836-41-6640', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (345, '1753', '1', '1100001927', 'イワタニ山陽', 'ｲﾜﾀﾆｻﾝﾖｳ', NULL, NULL, NULL, NULL, NULL, '082-893-3055', '086-523-5232', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (346, '1763', '1', '1100001806', '発絋電機', 'ﾊｯｺｳﾃﾞﾝｷ', NULL, NULL, NULL, NULL, NULL, '076-274-6911', '076-276-6006', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2017/08/05', NULL);
INSERT INTO `customer_information` VALUES (347, '1767', '1', '1100001970', '松倉商事', 'ﾏﾂｸﾗｼｮｳｼﾞ', NULL, NULL, NULL, NULL, NULL, '0745-53-0271', '0745-53-1770', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (348, '1774', '1', '1100001938', '株式会社ＣＡＲＲＹ', 'CARRY', NULL, NULL, NULL, NULL, NULL, '059-329-7768', '059-329-7820', NULL, NULL, NULL, NULL, '111', 'HS', '9', '内装', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/11', NULL);
INSERT INTO `customer_information` VALUES (349, '1774', '1', '1100001938', '株式会社ＣＡＲＲＹ', 'CARRY', NULL, NULL, NULL, NULL, NULL, '059-329-7768', '059-329-7820', NULL, NULL, NULL, NULL, '111', 'HS', '8', '建具工事', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/11', NULL);
INSERT INTO `customer_information` VALUES (350, '1777', '1', '1100001951', '東邦ガス', 'ﾄｳﾎｳｶﾞｽ', NULL, NULL, NULL, NULL, NULL, '0586-73-0101', '052-847-1940', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (351, '1778', '1', '1100001916', '松屋', 'ﾏﾂﾔ', NULL, NULL, NULL, NULL, NULL, '0567-95-2041', '0567-95-5111', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (352, '1779', '1', '1100001981', '中部熔材弥富', 'ﾁｭｳﾌﾞﾖｳｻﾞｲﾔﾄﾐ', NULL, NULL, NULL, NULL, NULL, '0567-67-1556', '0567-65-3408', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (353, '1786', '1', '1100001918', '株式会社　ライズ', 'ﾗｲｽﾞ', NULL, NULL, NULL, NULL, NULL, '0551-45-9699', '0551-45-7762', NULL, NULL, NULL, NULL, '111', 'HS', '17', '防災設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/11', NULL);
INSERT INTO `customer_information` VALUES (354, '1791', '1', '1100001910', '株式会社ヨシオ', 'ﾖｼｵ', NULL, NULL, NULL, NULL, NULL, '0537-61-4400', '0537-23-0112', NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/29', NULL);
INSERT INTO `customer_information` VALUES (355, '1801', '1', '1100001942', '東上ガス', 'ﾄｳｼﾞｮｳｶﾞｽ', NULL, NULL, NULL, NULL, NULL, '048-471-2311', '048-473-3283', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/04/05', NULL);
INSERT INTO `customer_information` VALUES (356, '1807', '1', '1100001949', 'シンカンパニー', 'ｼﾝｶﾝﾊﾟﾆｰ', NULL, NULL, NULL, NULL, NULL, '046-264-4955', '246-264-4956', NULL, NULL, NULL, NULL, '111', 'HS', '10', '窓ガラスサッシ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (357, '1807', '1', '1100001949', 'シンカンパニー', 'ｼﾝｶﾝﾊﾟﾆｰ', NULL, NULL, NULL, NULL, NULL, '046-264-4955', '246-264-4956', NULL, NULL, NULL, NULL, '111', 'HS', '9', '内装', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (358, '1807', '1', '1100001949', 'シンカンパニー', 'ｼﾝｶﾝﾊﾟﾆｰ', NULL, NULL, NULL, NULL, NULL, '046-264-4955', '246-264-4956', NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (359, '1809', '1', '1100001968', '熊谷商事', 'ｸﾏｶﾞｲｼｮｳｼﾞ', NULL, NULL, NULL, NULL, NULL, '045-802-0255', '045-803-5888', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (360, '1814', '1', '1100001899', 'トーショーエンジニアリング', 'ﾄｰｼｮｰｴﾝｼﾞﾆｱﾘﾝｸﾞ', NULL, NULL, NULL, NULL, NULL, '043-464-0900', '043-464-0901', NULL, NULL, NULL, NULL, '111', 'HS', '7', '空調換気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (361, '1818', '1', '1100001940', 'グリーンサンデー', 'ｸﾞﾘｰﾝｻﾝﾃﾞｰ', NULL, NULL, NULL, NULL, NULL, '042-499-1113', '042-499-1114', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/10/17', NULL);
INSERT INTO `customer_information` VALUES (362, '1821', '1', '1100000087', '東芝テック', 'ﾄｳｼﾊﾞﾃｯｸ', NULL, NULL, NULL, NULL, NULL, '03-6830-9264', '03-6684-4026', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (363, '1823', '1', '1100001881', '丹青社', 'ﾀﾝｾｲｼｬ', NULL, NULL, NULL, NULL, NULL, '0120-28-1420', '03-6860-4006', NULL, NULL, NULL, NULL, '111', 'HS', '5', '給排水衛生', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/10/02', NULL);
INSERT INTO `customer_information` VALUES (364, '2650', '1', '1199100030', 'テクノサポート', 'ﾃｸﾉｻﾎﾟｰﾄ', NULL, NULL, NULL, NULL, NULL, NULL, '03-5783-8772', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS105122', '2017/07/01', NULL);
INSERT INTO `customer_information` VALUES (365, '2650', '1', '1199100030', 'テクノサポート', 'ﾃｸﾉｻﾎﾟｰﾄ', NULL, NULL, NULL, NULL, NULL, NULL, '03-5783-8772', NULL, NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS105122', '2017/07/01', NULL);
INSERT INTO `customer_information` VALUES (366, '1828', '1', '1100000034', 'ホシザキ首都圏', 'ﾎｼｻﾞｷｼｭﾄｹﾝ', NULL, NULL, NULL, NULL, NULL, '03-5791-8061', '03-5791-8098', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (367, '1834', '1', '1100000030', 'ニチワ電機', 'ﾆﾁﾜﾃﾞﾝｷ', NULL, NULL, NULL, NULL, NULL, '03-5645-2691', '03-5645-2692', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (368, '1837', '1', '1100001978', 'フランケ（発注）', 'ﾌﾗﾝｹ(ﾊｯﾁｭｳ)', NULL, NULL, NULL, NULL, NULL, '03-6858-9081', '03-6672-0069', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/08/24', NULL);
INSERT INTO `customer_information` VALUES (369, '1857', '1', '1100001783', '使用しない', 'ｼﾖｳｼﾅｲ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/07/18', NULL);
INSERT INTO `customer_information` VALUES (370, '1858', '1', '1100001779', '鈴茂器工', 'ｽｽﾞﾓｷｺｳ', NULL, NULL, NULL, NULL, NULL, '03-3993-1419', '03-3993-1537', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Z92373', '2017/10/13', NULL);
INSERT INTO `customer_information` VALUES (371, '1867', '1', '1100001785', '菱熱工業', 'ﾘｮｳﾈﾂｺｳｷﾞｮｳ', NULL, NULL, NULL, NULL, NULL, '03-3778-2110', '03-3778-2117', NULL, NULL, NULL, NULL, '111', 'HS', '3', '厨房設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (372, '1870', '1', '1100000572', 'ジーク(株）', 'ｼﾞｰｸ(ｶﾌﾞ)', NULL, NULL, NULL, NULL, NULL, '03-3646-2191', '03-3646-2139', NULL, NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (373, '1889', '1', '1100001756', '藤井建設', 'ﾌｼﾞｲｹﾝｾﾂ', NULL, NULL, NULL, NULL, NULL, '0279-52-3152', '0279-52-3847', NULL, NULL, NULL, NULL, '111', 'HS', '1', '施工会社', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (374, '1899', '1', '1100001974', '北陸ガス', 'ﾎｸﾘｸｶﾞｽ', NULL, NULL, NULL, NULL, NULL, '0258-39-9000', '0258-33-0763', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (375, '1903', '1', '1100001869', '東部液化石油・郡山支店', 'ﾄｳﾌﾞｴｷｶｾｷﾕ･ｺｵﾘﾔﾏｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '024-933-4191', '024-933-0091', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2020/02/10', NULL);
INSERT INTO `customer_information` VALUES (376, '1907', '1', '1100000315', 'ユニコンエージェンシー', 'ﾕﾆｺﾝｴｰｼﾞｪﾝｼｰ', NULL, NULL, NULL, NULL, NULL, '022-304-8850', '022-304-8870', NULL, NULL, NULL, NULL, '111', 'HS', '10', '窓ガラスサッシ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (377, '1912', '1', '1100001948', 'カメイ（株）秋田支店', 'ｶﾒｲ(ｶﾌﾞ)ｱｷﾀｼﾃﾝ', NULL, NULL, NULL, NULL, NULL, '018-823-2171', '018-864-3540', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (378, '1923', '1', '1100001629', '株式会社USEN', 'ﾕｳｾﾝ', NULL, NULL, NULL, NULL, NULL, '0120-737-440', '098-897-2862', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/12/07', NULL);
INSERT INTO `customer_information` VALUES (379, '1928', '1', '1100001907', '日本海ガス', 'ﾆﾎﾝｶｲｶﾞｽ', NULL, NULL, NULL, NULL, NULL, '0570-024-077', '076-441-1882', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2019/04/27', NULL);
INSERT INTO `customer_information` VALUES (380, '1934', '1', '1100000347', 'アートプロジェクト', 'ｱｰﾄﾌﾟﾛｼﾞｪｸﾄ', NULL, NULL, NULL, NULL, NULL, '045-842-5229', '045-842-5208', NULL, NULL, NULL, NULL, '111', 'HS', '15', '看板テント', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/06/27', NULL);
INSERT INTO `customer_information` VALUES (381, '2731', '1', '1100001992', '新和テック株式会社', 'ｼﾝﾜﾃｯｸｶﾌﾞｼｷｶﾞｲｼｬ', '559-0015', '27', '大阪府', '大阪市住之江区南加賀屋2丁目10番16号', NULL, '06-6683-0601', '06-6683-0631', NULL, NULL, NULL, NULL, '111', 'HS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/02/02', NULL);
INSERT INTO `customer_information` VALUES (382, '2738', '1', '1199999995', 'イオンディライト', 'ｲｵﾝﾃﾞｨﾗｲﾄ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/09/15', NULL);
INSERT INTO `customer_information` VALUES (383, '2704', '1', '114514', '山本学商店', 'ﾔﾏﾓﾄﾏﾅﾌﾞｼｮｳﾃﾝ', NULL, NULL, NULL, NULL, NULL, '096-383-1506', '963833932', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (384, '2542', '1', '1199636012', '株式会社REFヤマモト', 'ｱｰﾙｲｰｴﾌﾔﾏﾓﾄ', NULL, NULL, NULL, NULL, NULL, '0555-22-5220', '0555-72-8849', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/13', NULL);
INSERT INTO `customer_information` VALUES (385, '2543', '1', '1199611009', '有限会社サンクリーン', 'ｻﾝｸﾘｰﾝ', NULL, NULL, NULL, NULL, NULL, '0875-52-2458', '0875-52-6483', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/13', NULL);
INSERT INTO `customer_information` VALUES (386, '2547', '1', '1199606017', '株式会社カトウ', 'ｶﾄｳ', NULL, NULL, NULL, NULL, NULL, '089-933-7900', '089-933-3975', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/28', NULL);
INSERT INTO `customer_information` VALUES (387, '2548', '1', '1199612027', '株式会社静岡環境保全センター', 'ｼｽﾞｵｶｶﾝｷｮｳﾎｾﾞﾝｾﾝﾀｰ', NULL, NULL, NULL, NULL, NULL, '054-636-1511', '054-636-1500', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/28', NULL);
INSERT INTO `customer_information` VALUES (388, '2549', '1', '1199611011', '株式会社ザイマックスファシリティズ', 'ｻﾞｲﾏｯｸｽﾌｧｼﾘﾃｨｽﾞ', NULL, NULL, NULL, NULL, NULL, '03-5544-6888', '03-5544-6887', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/13', NULL);
INSERT INTO `customer_information` VALUES (389, '2554', '1', '1199628022', '株式会社フジ・コンサル', 'ﾌｼﾞｺﾝｻﾙ', NULL, NULL, NULL, NULL, NULL, '0893-25-2349', '050-3432-6137', NULL, NULL, NULL, NULL, '111', 'HS', '14', '浄化槽保守', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/29', NULL);
INSERT INTO `customer_information` VALUES (390, '2563', '1', '1199720013', '東北電気保安協会', 'ﾄｳﾎｸﾃﾞﾝｷﾎｱﾝｷｮｳｶｲ', NULL, NULL, NULL, NULL, NULL, '022-748-0240', '022-748-1275', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2017/05/31', NULL);
INSERT INTO `customer_information` VALUES (391, '2567', '1', '1199622031', '株式会社日本電気保安協会', 'ﾆﾎﾝﾃﾞﾝｷﾎｱﾝｷｮｳｶｲ', NULL, NULL, NULL, NULL, NULL, '06-6223-0015', '06-6222-4027', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/28', NULL);
INSERT INTO `customer_information` VALUES (392, '2667', '1', '1100001983', 'グローリーエンジニアリング', 'ｸﾞﾛｰﾘｰｴﾝｼﾞﾆｱﾘﾝｸﾞ', NULL, '1', '北海道', NULL, NULL, '011-688-9810', '011-688-9810', NULL, NULL, NULL, NULL, '111', 'HS', '10', '窓ガラスサッシ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/11/08', NULL);
INSERT INTO `customer_information` VALUES (393, '2678', '1', '1199631008', 'マルイファシリティーズ', 'ﾏﾙｲﾌｧｼﾘﾃｨｰｽﾞ', NULL, NULL, NULL, NULL, NULL, '03-3229-5291', '03-3229-0312', NULL, NULL, NULL, NULL, '111', 'HS', '7', '空調換気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/07/21', NULL);
INSERT INTO `customer_information` VALUES (394, '2697', '1', '1199732006', '三菱電機ビルテクノサービス（吉祥寺支店）', 'ﾐﾂﾋﾞｼﾃﾞﾝｷﾋﾞﾙﾃｸﾋﾞｻｰﾋﾞｽ', NULL, NULL, NULL, NULL, NULL, '0422-45-1873', NULL, NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/07/28', NULL);
INSERT INTO `customer_information` VALUES (395, '2890', '1', '1199999979', '㈱エネサンス新潟', 'ｴﾈｻﾝｽﾆｲｶﾞﾀ', NULL, NULL, NULL, NULL, NULL, '025-382-5161', '025-382-5164', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/01/29', NULL);
INSERT INTO `customer_information` VALUES (396, '2829', '1', '1199999985', 'ソフトバンクロボティクス', 'ソフトバンクロボティクス', NULL, NULL, NULL, NULL, NULL, NULL, '044-388-7484', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/11/29', NULL);
INSERT INTO `customer_information` VALUES (397, '2807', '1', '1199999988', '谷口酸素工業株式会社', 'ﾀﾆｸﾞﾁｻﾝｿｺｳｷﾞｮｳｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '0748-23-3000', '0748-22-1279', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2017/11/09', NULL);
INSERT INTO `customer_information` VALUES (398, '2876', '1', '1199999981', '㈱コーアガス日本　川内支店', 'ｺｰｱｶﾞｽ', NULL, NULL, NULL, NULL, NULL, '0996-22-6111', '0996-20-5324', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/12/26', NULL);
INSERT INTO `customer_information` VALUES (399, '3014', '1', '1199999969', 'リコークリエイティブサービス', 'ﾘｺｰｸﾘｴｲﾃｨﾌﾞｻｰﾋﾞｽ', NULL, '13', '東京都', NULL, NULL, '03-3777-4233', '03-5742-2845', NULL, NULL, NULL, NULL, '111', 'HS', '7', '空調換気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/07/20', NULL);
INSERT INTO `customer_information` VALUES (400, '2906', '1', '1199999974', 'カメイ（株）岩手支店　水沢営業所', 'ｶﾒｲｲﾜﾃｼﾃﾝﾐｽﾞｻﾜｴｲｷﾞｮｳｼｮ', NULL, NULL, NULL, NULL, NULL, '0197-22-5860', '0197-22-5861', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS114582', '2018/02/17', NULL);
INSERT INTO `customer_information` VALUES (401, '2827', '1', '1199999986', '高橋商事株式会社', 'ﾀｶﾊｼｼｮｳｼﾞｶﾌﾞｼｷｶﾞｲｼｬ', NULL, '8', '茨城県', NULL, NULL, '029-269-3066', '029-269-4130', NULL, NULL, NULL, NULL, '111', 'HS', '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS038602', '2017/11/28', NULL);
INSERT INTO `customer_information` VALUES (402, '2899', '1', '1199999977', 'ソフトバンク株式会社', 'ｿﾌﾄﾊﾞﾝｸ', NULL, NULL, NULL, NULL, NULL, NULL, '044-388-7484', NULL, NULL, NULL, NULL, '111', 'HS', '999', 'その他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2018/02/09', NULL);
INSERT INTO `customer_information` VALUES (403, '2923', '1', '9998', '★ガス会社様依頼（未登録）', 'ｶﾞｽｶﾞｲｼｬｻﾏｻﾏ(ﾐﾄｳﾛｸ)ﾎｼ', NULL, NULL, NULL, NULL, NULL, '000-0000-0000', '000-0000-0000', NULL, NULL, NULL, NULL, '111', 'HS', '9', '内装', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/08/29', NULL);
INSERT INTO `customer_information` VALUES (404, '3270', '1', '1199999961', 'ABC商会', 'ABCｼｮｳｶｲ', NULL, NULL, NULL, NULL, NULL, '03-3507-7236', '03-3507-7237', NULL, NULL, NULL, NULL, '111', 'HS', '2', '建築', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HS004110', '2020/06/12', NULL);
INSERT INTO `customer_information` VALUES (405, '3176', '1', '1100000081', '日本高圧電気', 'ﾆﾎﾝｺｳｱﾂﾃﾞﾝｷ', NULL, '23', '愛知県', '大府市柊山町8-288', NULL, '0562-45-6061', '0562-45-6168', NULL, NULL, NULL, NULL, '111', 'HS', '4', '電気設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Z94447', '2019/05/28', NULL);
INSERT INTO `customer_information` VALUES (406, '3054', '1', '43000', '財団法人関西電気保安協会', 'ｻﾞｲﾀﾞﾝﾎｳｼﾞﾝｶﾝｻｲﾃﾞﾝｷﾎｱﾝｷｮｳｶｲ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '111', 'HS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'IKOU1', '2019/11/06', NULL);
INSERT INTO `customer_information` VALUES (407, NULL, NULL, '343333', '上野ガス株式会社', 'ｶﾐﾉｶﾞｽｶﾌﾞｼｷｶﾞｲｼｬ', NULL, NULL, NULL, NULL, NULL, '0595-21-3611', '0595-23-6712', NULL, NULL, NULL, NULL, NULL, NULL, '6', 'ガス設備', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-24 10:47:59', '2021-09-24 10:47:59');

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments`  (
  `department_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `business_category_id` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sales_code` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`department_id`) USING BTREE,
  INDEX `sales_code`(`sales_code`) USING BTREE,
  INDEX `department_name`(`department_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES (1, '東日本営業部', 18, NULL, NULL, '');
INSERT INTO `departments` VALUES (2, '中日本営業部', 18, NULL, NULL, '');
INSERT INTO `departments` VALUES (3, '西日本営業部', 18, NULL, NULL, '');
INSERT INTO `departments` VALUES (4, 'テスト営業部', 18, NULL, NULL, '');
INSERT INTO `departments` VALUES (5, '東日本営業部', 2, NULL, NULL, '');
INSERT INTO `departments` VALUES (6, '中日本営業部', 2, NULL, NULL, '');
INSERT INTO `departments` VALUES (7, '西日本営業部', 2, NULL, NULL, '');
INSERT INTO `departments` VALUES (8, 'テスト営業部', 2, NULL, NULL, '');

-- ----------------------------
-- Table structure for district_managers
-- ----------------------------
DROP TABLE IF EXISTS `district_managers`;
CREATE TABLE `district_managers`  (
  `district_manager_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`district_manager_id`) USING BTREE,
  INDEX `district_managers_district_id_foreign`(`district_id`) USING BTREE,
  INDEX `district_managers_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `district_managers_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `district_managers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of district_managers
-- ----------------------------
INSERT INTO `district_managers` VALUES (1, 1, 18, NULL, NULL);
INSERT INTO `district_managers` VALUES (2, 2, 19, NULL, NULL);
INSERT INTO `district_managers` VALUES (3, 3, 20, NULL, NULL);
INSERT INTO `district_managers` VALUES (4, 4, 21, NULL, NULL);
INSERT INTO `district_managers` VALUES (5, 5, 22, NULL, NULL);
INSERT INTO `district_managers` VALUES (6, 6, 23, NULL, NULL);
INSERT INTO `district_managers` VALUES (7, 7, 24, NULL, NULL);
INSERT INTO `district_managers` VALUES (8, 8, 25, NULL, NULL);
INSERT INTO `district_managers` VALUES (9, 9, 26, NULL, NULL);
INSERT INTO `district_managers` VALUES (10, 10, 27, NULL, NULL);
INSERT INTO `district_managers` VALUES (11, 11, 28, NULL, NULL);
INSERT INTO `district_managers` VALUES (12, 12, 618, NULL, NULL);
INSERT INTO `district_managers` VALUES (13, 13, 633, NULL, NULL);

-- ----------------------------
-- Table structure for districts
-- ----------------------------
DROP TABLE IF EXISTS `districts`;
CREATE TABLE `districts`  (
  `district_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `district_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `business_category_id` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ds_code` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`district_id`) USING BTREE,
  INDEX `districts_department_id_foreign`(`department_id`) USING BTREE,
  INDEX `ds_code`(`ds_code`) USING BTREE,
  INDEX `district_name`(`district_name`) USING BTREE,
  CONSTRAINT `districts_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of districts
-- ----------------------------
INSERT INTO `districts` VALUES (1, '北日本DS', 1, 18, NULL, NULL, '0');
INSERT INTO `districts` VALUES (2, '埼玉DS', 1, 18, NULL, NULL, '0');
INSERT INTO `districts` VALUES (3, '千葉・茨城DS', 1, 18, NULL, NULL, '0');
INSERT INTO `districts` VALUES (4, '東京・神奈川DS', 2, 18, NULL, NULL, '0');
INSERT INTO `districts` VALUES (5, '神奈川・静岡DS', 2, 18, NULL, NULL, '0');
INSERT INTO `districts` VALUES (6, '東海DS', 2, 18, NULL, NULL, '0');
INSERT INTO `districts` VALUES (7, '甲信越・北関東DS', 2, 18, NULL, NULL, '0');
INSERT INTO `districts` VALUES (8, '北陸・京滋DS', 3, 18, NULL, NULL, '0');
INSERT INTO `districts` VALUES (9, '関西DS', 3, 18, NULL, NULL, '0');
INSERT INTO `districts` VALUES (10, '中国・四国DS', 3, 18, NULL, NULL, '0');
INSERT INTO `districts` VALUES (11, '九州DS', 3, 18, NULL, NULL, '0');
INSERT INTO `districts` VALUES (12, 'テストDS', 4, 18, NULL, NULL, '0');
INSERT INTO `districts` VALUES (13, 'テストDS', 8, 2, NULL, NULL, '0');

-- ----------------------------
-- Table structure for general_managers
-- ----------------------------
DROP TABLE IF EXISTS `general_managers`;
CREATE TABLE `general_managers`  (
  `general_manager_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `department_id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`general_manager_id`) USING BTREE,
  INDEX `general_managers_department_id_foreign`(`department_id`) USING BTREE,
  INDEX `general_managers_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `general_managers_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `general_managers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of general_managers
-- ----------------------------
INSERT INTO `general_managers` VALUES (1, 1, 15, NULL, NULL);
INSERT INTO `general_managers` VALUES (2, 2, 16, NULL, NULL);
INSERT INTO `general_managers` VALUES (3, 3, 17, NULL, NULL);
INSERT INTO `general_managers` VALUES (4, 4, 631, NULL, NULL);
INSERT INTO `general_managers` VALUES (5, 5, 34, NULL, NULL);
INSERT INTO `general_managers` VALUES (6, 6, 78, NULL, NULL);
INSERT INTO `general_managers` VALUES (7, 7, 90, NULL, NULL);
INSERT INTO `general_managers` VALUES (8, 8, 111, NULL, NULL);

-- ----------------------------
-- Table structure for maintenance_images
-- ----------------------------
DROP TABLE IF EXISTS `maintenance_images`;
CREATE TABLE `maintenance_images`  (
  `maintenance_image_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `maintenance_id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`maintenance_image_id`) USING BTREE,
  INDEX `maintenance_images_maintenance_id_foreign`(`maintenance_id`) USING BTREE,
  CONSTRAINT `maintenance_images_maintenance_id_foreign` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenances` (`maintenance_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 406 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of maintenance_images
-- ----------------------------
INSERT INTO `maintenance_images` VALUES (233, 78, 'M000000078_HS_999999_20210325_1.jpg', '2021-03-25 16:49:17', '2021-03-25 16:49:17');
INSERT INTO `maintenance_images` VALUES (234, 78, 'M000000078_HS_999999_20210325_2.jpg', '2021-03-25 16:49:17', '2021-03-25 16:49:17');
INSERT INTO `maintenance_images` VALUES (235, 78, 'M000000078_HS_999999_20210325_3.jpg', '2021-03-25 16:49:17', '2021-03-25 16:49:17');
INSERT INTO `maintenance_images` VALUES (284, 83, 'M000000083_HS_999999_20210513_1.jpg', '2021-05-13 02:34:12', '2021-05-13 02:34:12');
INSERT INTO `maintenance_images` VALUES (285, 83, 'M000000083_HS_999999_20210513_2.jpg', '2021-05-13 02:34:12', '2021-05-13 02:34:12');
INSERT INTO `maintenance_images` VALUES (286, 83, 'M000000083_HS_999999_20210513_3.jpg', '2021-05-13 02:34:12', '2021-05-13 02:34:12');
INSERT INTO `maintenance_images` VALUES (287, 80, 'M000000080_HS_999999_20210511_1.jpg', '2021-05-26 10:26:50', '2021-05-26 10:26:50');
INSERT INTO `maintenance_images` VALUES (288, 80, 'M000000080_HS_999999_20210506_2.jpg', '2021-05-26 10:26:50', '2021-05-26 10:26:50');
INSERT INTO `maintenance_images` VALUES (289, 80, 'M000000080_HS_999999_20210507_3.jpg', '2021-05-26 10:26:50', '2021-05-26 10:26:50');
INSERT INTO `maintenance_images` VALUES (290, 84, 'M000000084_HS_999999_20210526_1.jpg', '2021-05-26 18:19:09', '2021-05-26 18:19:09');
INSERT INTO `maintenance_images` VALUES (291, 84, 'M000000084_HS_999999_20210526_2.jpg', '2021-05-26 18:19:10', '2021-05-26 18:19:10');
INSERT INTO `maintenance_images` VALUES (292, 84, 'M000000084_HS_999999_20210526_3.jpg', '2021-05-26 18:19:10', '2021-05-26 18:19:10');
INSERT INTO `maintenance_images` VALUES (293, 85, 'M000000085_HS_999999_20210527_1.jpg', '2021-05-27 09:26:42', '2021-05-27 09:26:42');
INSERT INTO `maintenance_images` VALUES (294, 85, 'M000000085_HS_999999_20210527_2.jpg', '2021-05-27 09:26:43', '2021-05-27 09:26:43');
INSERT INTO `maintenance_images` VALUES (295, 85, 'M000000085_HS_999999_20210527_3.jpg', '2021-05-27 09:26:43', '2021-05-27 09:26:43');
INSERT INTO `maintenance_images` VALUES (296, 86, 'M000000086_HS_999999_20210527_1.jpg', '2021-05-27 10:08:41', '2021-05-27 10:08:41');
INSERT INTO `maintenance_images` VALUES (297, 86, 'M000000086_HS_999999_20210527_2.jpg', '2021-05-27 10:08:41', '2021-05-27 10:08:41');
INSERT INTO `maintenance_images` VALUES (298, 86, 'M000000086_HS_999999_20210527_3.jpg', '2021-05-27 10:08:41', '2021-05-27 10:08:41');
INSERT INTO `maintenance_images` VALUES (299, 87, 'M000000087_HS_999999_20210527_1.jpg', '2021-05-27 14:26:27', '2021-05-27 14:26:27');
INSERT INTO `maintenance_images` VALUES (300, 87, 'M000000087_HS_999999_20210527_2.jpg', '2021-05-27 14:26:27', '2021-05-27 14:26:27');
INSERT INTO `maintenance_images` VALUES (301, 87, 'M000000087_HS_999999_20210527_3.jpg', '2021-05-27 14:26:27', '2021-05-27 14:26:27');
INSERT INTO `maintenance_images` VALUES (305, 88, 'M000000088_HS_999999_20210602_1.jpg', '2021-06-03 12:08:31', '2021-06-03 12:08:31');
INSERT INTO `maintenance_images` VALUES (306, 88, 'M000000088_HS_999999_20210602_2.jpg', '2021-06-03 12:08:31', '2021-06-03 12:08:31');
INSERT INTO `maintenance_images` VALUES (307, 88, 'M000000088_HS_999999_20210602_3.jpg', '2021-06-03 12:08:31', '2021-06-03 12:08:31');
INSERT INTO `maintenance_images` VALUES (308, 89, 'M000000089_HS_999999_20210622_1.jpg', '2021-06-22 15:55:53', '2021-06-22 15:55:53');
INSERT INTO `maintenance_images` VALUES (309, 89, 'M000000089_HS_999999_20210622_2.jpg', '2021-06-22 15:55:53', '2021-06-22 15:55:53');
INSERT INTO `maintenance_images` VALUES (310, 89, 'M000000089_HS_999999_20210622_3.jpg', '2021-06-22 15:55:53', '2021-06-22 15:55:53');
INSERT INTO `maintenance_images` VALUES (354, 90, 'M000000090_HS_999999_20210623_1.jpg', '2021-06-24 17:23:17', '2021-06-24 17:23:17');
INSERT INTO `maintenance_images` VALUES (355, 90, 'M000000090_HS_999999_20210624_2.jpg', '2021-06-24 17:23:17', '2021-06-24 17:23:17');
INSERT INTO `maintenance_images` VALUES (356, 90, 'M000000090_HS_999999_20210623_3.jpg', '2021-06-24 17:23:17', '2021-06-24 17:23:17');
INSERT INTO `maintenance_images` VALUES (357, 90, 'M000000090_HS_999999_20210624_4.jpg', '2021-06-24 17:23:17', '2021-06-24 17:23:17');
INSERT INTO `maintenance_images` VALUES (364, 91, 'M000000091_HS_999999_20210702_1.jpg', '2021-07-02 10:49:16', '2021-07-02 10:49:16');
INSERT INTO `maintenance_images` VALUES (365, 91, 'M000000091_HS_999999_20210702_2.jpg', '2021-07-02 10:49:16', '2021-07-02 10:49:16');
INSERT INTO `maintenance_images` VALUES (366, 91, 'M000000091_HS_999999_20210702_3.jpg', '2021-07-02 10:49:16', '2021-07-02 10:49:16');
INSERT INTO `maintenance_images` VALUES (370, 93, 'M000000093_HS_999999_20210702_1.jpg', '2021-07-02 14:17:22', '2021-07-02 14:17:22');
INSERT INTO `maintenance_images` VALUES (371, 93, 'M000000093_HS_999999_20210702_2.jpg', '2021-07-02 14:17:23', '2021-07-02 14:17:23');
INSERT INTO `maintenance_images` VALUES (372, 93, 'M000000093_HS_999999_20210702_3.jpg', '2021-07-02 14:17:23', '2021-07-02 14:17:23');
INSERT INTO `maintenance_images` VALUES (373, 92, 'M000000092_HS_999999_20210709_1.jpg', '2021-07-09 16:45:38', '2021-07-09 16:45:38');
INSERT INTO `maintenance_images` VALUES (374, 92, 'M000000092_HS_999999_20210702_2.jpg', '2021-07-09 16:45:38', '2021-07-09 16:45:38');
INSERT INTO `maintenance_images` VALUES (375, 92, 'M000000092_HS_999999_20210702_3.jpg', '2021-07-09 16:45:38', '2021-07-09 16:45:38');
INSERT INTO `maintenance_images` VALUES (379, 94, 'M000000094_SK_999998_20210716_1.jpg', '2021-07-16 15:20:49', '2021-07-16 15:20:49');
INSERT INTO `maintenance_images` VALUES (380, 94, 'M000000094_SK_999998_20210716_2.jpg', '2021-07-16 15:20:49', '2021-07-16 15:20:49');
INSERT INTO `maintenance_images` VALUES (381, 94, 'M000000094_SK_999998_20210716_3.jpg', '2021-07-16 15:20:49', '2021-07-16 15:20:49');
INSERT INTO `maintenance_images` VALUES (382, 95, 'M000000095_SK_999998_20210716_1.jpg', '2021-07-16 15:35:18', '2021-07-16 15:35:18');
INSERT INTO `maintenance_images` VALUES (383, 95, 'M000000095_SK_999998_20210716_2.jpg', '2021-07-16 15:35:18', '2021-07-16 15:35:18');
INSERT INTO `maintenance_images` VALUES (384, 95, 'M000000095_SK_999998_20210716_3.jpg', '2021-07-16 15:35:18', '2021-07-16 15:35:18');
INSERT INTO `maintenance_images` VALUES (385, 96, 'M000000096_SK_999998_20210716_1.jpg', '2021-07-16 15:40:11', '2021-07-16 15:40:11');
INSERT INTO `maintenance_images` VALUES (386, 96, 'M000000096_SK_999998_20210716_2.jpg', '2021-07-16 15:40:11', '2021-07-16 15:40:11');
INSERT INTO `maintenance_images` VALUES (387, 96, 'M000000096_SK_999998_20210716_3.jpg', '2021-07-16 15:40:11', '2021-07-16 15:40:11');
INSERT INTO `maintenance_images` VALUES (388, 97, 'M000000097_SK_999998_20210716_1.jpg', '2021-07-16 15:47:31', '2021-07-16 15:47:31');
INSERT INTO `maintenance_images` VALUES (389, 97, 'M000000097_SK_999998_20210716_2.jpg', '2021-07-16 15:47:31', '2021-07-16 15:47:31');
INSERT INTO `maintenance_images` VALUES (390, 97, 'M000000097_SK_999998_20210716_3.jpg', '2021-07-16 15:47:31', '2021-07-16 15:47:31');
INSERT INTO `maintenance_images` VALUES (391, 98, 'M000000098_SK_999998_20210716_1.jpg', '2021-07-16 16:03:49', '2021-07-16 16:03:49');
INSERT INTO `maintenance_images` VALUES (392, 98, 'M000000098_SK_999998_20210716_2.jpg', '2021-07-16 16:03:49', '2021-07-16 16:03:49');
INSERT INTO `maintenance_images` VALUES (393, 98, 'M000000098_SK_999998_20210716_3.jpg', '2021-07-16 16:03:49', '2021-07-16 16:03:49');
INSERT INTO `maintenance_images` VALUES (394, 99, 'M000000099_SK_999998_20210716_1.jpg', '2021-07-16 16:14:04', '2021-07-16 16:14:04');
INSERT INTO `maintenance_images` VALUES (395, 99, 'M000000099_SK_999998_20210716_2.jpg', '2021-07-16 16:14:05', '2021-07-16 16:14:05');
INSERT INTO `maintenance_images` VALUES (396, 99, 'M000000099_SK_999998_20210716_3.jpg', '2021-07-16 16:14:05', '2021-07-16 16:14:05');
INSERT INTO `maintenance_images` VALUES (397, 100, 'M000000100_SK_999998_20210716_1.jpg', '2021-07-16 16:25:00', '2021-07-16 16:25:00');
INSERT INTO `maintenance_images` VALUES (398, 100, 'M000000100_SK_999998_20210716_2.jpg', '2021-07-16 16:25:00', '2021-07-16 16:25:00');
INSERT INTO `maintenance_images` VALUES (399, 100, 'M000000100_SK_999998_20210716_3.jpg', '2021-07-16 16:25:00', '2021-07-16 16:25:00');
INSERT INTO `maintenance_images` VALUES (400, 101, 'M000000101_SK_999998_20210720_1.jpg', '2021-07-20 10:35:24', '2021-07-20 10:35:24');
INSERT INTO `maintenance_images` VALUES (401, 101, 'M000000101_SK_999998_20210720_2.jpg', '2021-07-20 10:35:24', '2021-07-20 10:35:24');
INSERT INTO `maintenance_images` VALUES (402, 101, 'M000000101_SK_999998_20210720_3.jpg', '2021-07-20 10:35:24', '2021-07-20 10:35:24');

-- ----------------------------
-- Table structure for maintenance_matters
-- ----------------------------
DROP TABLE IF EXISTS `maintenance_matters`;
CREATE TABLE `maintenance_matters`  (
  `maintenance_matter_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `maintenance_id` bigint(20) UNSIGNED NOT NULL,
  `matter_option_id` int(10) UNSIGNED NOT NULL,
  `matter_value_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`maintenance_matter_id`) USING BTREE,
  INDEX `maintenance_matters_maintenance_id_foreign`(`maintenance_id`) USING BTREE,
  INDEX `maintenance_matters_matter_option_id_foreign`(`matter_option_id`) USING BTREE,
  INDEX `maintenance_matters_matter_value_id_foreign`(`matter_value_id`) USING BTREE,
  CONSTRAINT `maintenance_matters_matter_value_id_foreign` FOREIGN KEY (`matter_value_id`) REFERENCES `matter_values` (`matter_value_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `maintenance_matters_maintenance_id_foreign` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenances` (`maintenance_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `maintenance_matters_matter_option_id_foreign` FOREIGN KEY (`matter_option_id`) REFERENCES `matter_options` (`matter_option_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of maintenance_matters
-- ----------------------------
INSERT INTO `maintenance_matters` VALUES (1, 100, 2, 2, '2021-08-30 13:13:02', '2021-08-30 13:13:02');
INSERT INTO `maintenance_matters` VALUES (2, 100, 2, 3, '2021-08-30 13:13:02', '2021-08-30 13:13:02');
INSERT INTO `maintenance_matters` VALUES (3, 101, 1, 1, '2021-08-31 21:34:44', '2021-08-31 21:34:44');

-- ----------------------------
-- Table structure for maintenance_order_reasons
-- ----------------------------
DROP TABLE IF EXISTS `maintenance_order_reasons`;
CREATE TABLE `maintenance_order_reasons`  (
  `maintenance_order_reason_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `maintenance_id` bigint(20) UNSIGNED NOT NULL,
  `order_reason_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`maintenance_order_reason_id`) USING BTREE,
  INDEX `maintenance_order_reasons_maintenance_id_foreign`(`maintenance_id`) USING BTREE,
  INDEX `maintenance_order_reasons_order_reason_id_foreign`(`order_reason_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of maintenance_order_reasons
-- ----------------------------
INSERT INTO `maintenance_order_reasons` VALUES (19, 87, 1, '2021-05-27 14:26:27', '2021-05-27 14:26:27');
INSERT INTO `maintenance_order_reasons` VALUES (20, 87, 2, '2021-05-27 14:26:27', '2021-05-27 14:26:27');
INSERT INTO `maintenance_order_reasons` VALUES (21, 87, 3, '2021-05-27 14:26:27', '2021-05-27 14:26:27');
INSERT INTO `maintenance_order_reasons` VALUES (22, 87, 4, '2021-05-27 14:26:27', '2021-05-27 14:26:27');
INSERT INTO `maintenance_order_reasons` VALUES (23, 95, 1, '2021-07-16 15:35:18', '2021-07-16 15:35:18');
INSERT INTO `maintenance_order_reasons` VALUES (24, 100, 2, '2021-07-16 16:25:00', '2021-07-16 16:25:00');
INSERT INTO `maintenance_order_reasons` VALUES (25, 100, 4, '2021-07-16 16:25:00', '2021-07-16 16:25:00');

-- ----------------------------
-- Table structure for maintenance_progress
-- ----------------------------
DROP TABLE IF EXISTS `maintenance_progress`;
CREATE TABLE `maintenance_progress`  (
  `maintenance_progress_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `maintenance_id` bigint(20) UNSIGNED NOT NULL,
  `progress_id` int(10) UNSIGNED NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `faxed_to_client` tinyint(1) NOT NULL DEFAULT 0,
  `faxed_to_shop` tinyint(1) NOT NULL DEFAULT 0,
  `entered_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`maintenance_progress_id`) USING BTREE,
  INDEX `maintenance_progress_maintenance_id_foreign`(`maintenance_id`) USING BTREE,
  INDEX `maintenance_progress_progress_id_foreign`(`progress_id`) USING BTREE,
  INDEX `maintenance_progress_entered_by_foreign`(`entered_by`) USING BTREE,
  CONSTRAINT `maintenance_progress_entered_by_foreign` FOREIGN KEY (`entered_by`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `maintenance_progress_maintenance_id_foreign` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenances` (`maintenance_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `maintenance_progress_progress_id_foreign` FOREIGN KEY (`progress_id`) REFERENCES `progress` (`progress_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 219 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of maintenance_progress
-- ----------------------------
INSERT INTO `maintenance_progress` VALUES (34, 78, 2, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-03-26 12:20:38', '2021-03-26 12:20:38');
INSERT INTO `maintenance_progress` VALUES (35, 80, 3, '差戻し', 0, 0, 615, '2021-04-27 10:07:22', '2021-04-27 10:07:22');
INSERT INTO `maintenance_progress` VALUES (36, 80, 1, NULL, 0, 0, 611, '2021-04-27 13:53:19', '2021-04-27 13:53:19');
INSERT INTO `maintenance_progress` VALUES (37, 80, 3, '差戻しテストです', 0, 0, 615, '2021-04-28 09:07:01', '2021-04-28 09:07:01');
INSERT INTO `maintenance_progress` VALUES (38, 80, 1, NULL, 0, 0, 611, '2021-05-06 14:35:16', '2021-05-06 14:35:16');
INSERT INTO `maintenance_progress` VALUES (39, 80, 3, '', 0, 0, 615, '2021-05-06 16:04:37', '2021-05-06 16:04:37');
INSERT INTO `maintenance_progress` VALUES (40, 80, 1, NULL, 0, 0, 611, '2021-05-06 16:05:19', '2021-05-06 16:05:19');
INSERT INTO `maintenance_progress` VALUES (41, 80, 3, '', 0, 0, 615, '2021-05-06 16:18:37', '2021-05-06 16:18:37');
INSERT INTO `maintenance_progress` VALUES (42, 80, 1, NULL, 0, 0, 611, '2021-05-06 16:32:34', '2021-05-06 16:32:34');
INSERT INTO `maintenance_progress` VALUES (43, 80, 3, '', 0, 0, 615, '2021-05-06 16:33:30', '2021-05-06 16:33:30');
INSERT INTO `maintenance_progress` VALUES (44, 80, 1, NULL, 0, 0, 611, '2021-05-06 16:34:45', '2021-05-06 16:34:45');
INSERT INTO `maintenance_progress` VALUES (45, 80, 3, '', 0, 0, 615, '2021-05-06 16:38:09', '2021-05-06 16:38:09');
INSERT INTO `maintenance_progress` VALUES (46, 80, 1, NULL, 0, 0, 611, '2021-05-06 16:38:46', '2021-05-06 16:38:46');
INSERT INTO `maintenance_progress` VALUES (47, 80, 3, '', 0, 0, 615, '2021-05-06 16:39:44', '2021-05-06 16:39:44');
INSERT INTO `maintenance_progress` VALUES (48, 80, 1, NULL, 0, 0, 611, '2021-05-06 16:40:19', '2021-05-06 16:40:19');
INSERT INTO `maintenance_progress` VALUES (49, 80, 3, '', 0, 0, 615, '2021-05-06 16:41:13', '2021-05-06 16:41:13');
INSERT INTO `maintenance_progress` VALUES (50, 80, 1, NULL, 0, 0, 611, '2021-05-06 16:41:50', '2021-05-06 16:41:50');
INSERT INTO `maintenance_progress` VALUES (51, 80, 3, '', 0, 0, 615, '2021-05-06 16:42:47', '2021-05-06 16:42:47');
INSERT INTO `maintenance_progress` VALUES (52, 80, 1, NULL, 0, 0, 611, '2021-05-06 16:43:15', '2021-05-06 16:43:15');
INSERT INTO `maintenance_progress` VALUES (53, 80, 3, '', 0, 0, 615, '2021-05-06 16:43:34', '2021-05-06 16:43:34');
INSERT INTO `maintenance_progress` VALUES (54, 80, 1, NULL, 0, 0, 611, '2021-05-06 16:44:43', '2021-05-06 16:44:43');
INSERT INTO `maintenance_progress` VALUES (55, 80, 3, '', 0, 0, 615, '2021-05-06 16:48:09', '2021-05-06 16:48:09');
INSERT INTO `maintenance_progress` VALUES (56, 80, 1, NULL, 0, 0, 611, '2021-05-06 16:48:39', '2021-05-06 16:48:39');
INSERT INTO `maintenance_progress` VALUES (57, 80, 3, '', 0, 0, 615, '2021-05-06 16:50:02', '2021-05-06 16:50:02');
INSERT INTO `maintenance_progress` VALUES (58, 80, 1, NULL, 0, 0, 611, '2021-05-06 16:50:53', '2021-05-06 16:50:53');
INSERT INTO `maintenance_progress` VALUES (59, 80, 3, '', 0, 0, 615, '2021-05-06 17:03:10', '2021-05-06 17:03:10');
INSERT INTO `maintenance_progress` VALUES (60, 80, 1, NULL, 0, 0, 611, '2021-05-06 17:03:53', '2021-05-06 17:03:53');
INSERT INTO `maintenance_progress` VALUES (61, 80, 3, '', 0, 0, 615, '2021-05-07 11:33:31', '2021-05-07 11:33:31');
INSERT INTO `maintenance_progress` VALUES (62, 80, 1, NULL, 0, 0, 611, '2021-05-07 11:34:04', '2021-05-07 11:34:04');
INSERT INTO `maintenance_progress` VALUES (63, 80, 3, '', 0, 0, 615, '2021-05-07 23:49:48', '2021-05-07 23:49:48');
INSERT INTO `maintenance_progress` VALUES (64, 80, 1, NULL, 0, 0, 611, '2021-05-11 10:53:00', '2021-05-11 10:53:00');
INSERT INTO `maintenance_progress` VALUES (65, 80, 3, '', 0, 0, 615, '2021-05-12 13:15:27', '2021-05-12 13:15:27');
INSERT INTO `maintenance_progress` VALUES (67, 83, 5, '', 0, 0, 615, '2021-05-17 09:26:55', '2021-05-17 09:26:55');
INSERT INTO `maintenance_progress` VALUES (68, 80, 1, NULL, 0, 0, 611, '2021-05-26 10:26:50', '2021-05-26 10:26:50');
INSERT INTO `maintenance_progress` VALUES (72, 85, 6, '', 0, 0, 615, '2021-05-27 09:30:22', '2021-05-27 09:30:22');
INSERT INTO `maintenance_progress` VALUES (73, 83, 6, '', 0, 0, 615, '2021-05-27 09:49:02', '2021-05-27 09:49:02');
INSERT INTO `maintenance_progress` VALUES (74, 86, 6, '', 0, 0, 615, '2021-05-27 10:09:23', '2021-05-27 10:09:23');
INSERT INTO `maintenance_progress` VALUES (75, 87, 6, '', 0, 0, 615, '2021-05-27 14:28:05', '2021-05-27 14:28:05');
INSERT INTO `maintenance_progress` VALUES (76, 80, 6, '', 0, 0, 615, '2021-05-27 17:02:59', '2021-05-27 17:02:59');
INSERT INTO `maintenance_progress` VALUES (77, 84, 6, '', 0, 0, 615, '2021-05-27 18:21:22', '2021-05-27 18:21:22');
INSERT INTO `maintenance_progress` VALUES (78, 78, 2, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-27 19:04:26', '2021-05-27 19:04:26');
INSERT INTO `maintenance_progress` VALUES (79, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-27 21:02:43', '2021-05-27 21:02:43');
INSERT INTO `maintenance_progress` VALUES (80, 87, 6, '管理画面より進捗状況が変更されました。', 0, 0, 615, '2021-05-27 21:03:22', '2021-05-27 21:03:22');
INSERT INTO `maintenance_progress` VALUES (81, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-27 21:45:11', '2021-05-27 21:45:11');
INSERT INTO `maintenance_progress` VALUES (82, 87, 6, '管理画面より進捗状況が変更されました。', 0, 0, 615, '2021-05-27 21:45:46', '2021-05-27 21:45:46');
INSERT INTO `maintenance_progress` VALUES (83, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-28 10:11:19', '2021-05-28 10:11:19');
INSERT INTO `maintenance_progress` VALUES (84, 87, 6, '管理画面より進捗状況が変更されました。', 0, 0, 615, '2021-05-28 10:12:01', '2021-05-28 10:12:01');
INSERT INTO `maintenance_progress` VALUES (85, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-28 10:13:20', '2021-05-28 10:13:20');
INSERT INTO `maintenance_progress` VALUES (86, 87, 6, '管理画面より進捗状況が変更されました。', 0, 0, 615, '2021-05-28 10:13:48', '2021-05-28 10:13:48');
INSERT INTO `maintenance_progress` VALUES (87, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-28 10:21:25', '2021-05-28 10:21:25');
INSERT INTO `maintenance_progress` VALUES (88, 87, 6, '管理画面より進捗状況が変更されました。', 0, 0, 615, '2021-05-28 10:21:58', '2021-05-28 10:21:58');
INSERT INTO `maintenance_progress` VALUES (89, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-28 10:33:57', '2021-05-28 10:33:57');
INSERT INTO `maintenance_progress` VALUES (90, 87, 6, '管理画面より進捗状況が変更されました。', 0, 0, 615, '2021-05-28 10:34:10', '2021-05-28 10:34:10');
INSERT INTO `maintenance_progress` VALUES (91, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-28 10:38:46', '2021-05-28 10:38:46');
INSERT INTO `maintenance_progress` VALUES (92, 87, 6, '管理画面より進捗状況が変更されました。', 0, 0, 615, '2021-05-28 12:03:52', '2021-05-28 12:03:52');
INSERT INTO `maintenance_progress` VALUES (93, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-28 12:07:04', '2021-05-28 12:07:04');
INSERT INTO `maintenance_progress` VALUES (94, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-28 13:51:02', '2021-05-28 13:51:02');
INSERT INTO `maintenance_progress` VALUES (95, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-28 13:51:20', '2021-05-28 13:51:20');
INSERT INTO `maintenance_progress` VALUES (96, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-28 13:53:33', '2021-05-28 13:53:33');
INSERT INTO `maintenance_progress` VALUES (97, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-28 14:13:02', '2021-05-28 14:13:02');
INSERT INTO `maintenance_progress` VALUES (98, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-28 14:34:36', '2021-05-28 14:34:36');
INSERT INTO `maintenance_progress` VALUES (99, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-28 16:25:43', '2021-05-28 16:25:43');
INSERT INTO `maintenance_progress` VALUES (100, 87, 6, '管理画面より進捗状況が変更されました。', 0, 0, 615, '2021-05-28 16:45:37', '2021-05-28 16:45:37');
INSERT INTO `maintenance_progress` VALUES (101, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-28 17:00:07', '2021-05-28 17:00:07');
INSERT INTO `maintenance_progress` VALUES (102, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-28 17:07:01', '2021-05-28 17:07:01');
INSERT INTO `maintenance_progress` VALUES (103, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-28 18:04:45', '2021-05-28 18:04:45');
INSERT INTO `maintenance_progress` VALUES (104, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-28 18:32:18', '2021-05-28 18:32:18');
INSERT INTO `maintenance_progress` VALUES (105, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-28 23:24:57', '2021-05-28 23:24:57');
INSERT INTO `maintenance_progress` VALUES (106, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-28 23:25:51', '2021-05-28 23:25:51');
INSERT INTO `maintenance_progress` VALUES (107, 87, 6, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-28 23:28:10', '2021-05-28 23:28:10');
INSERT INTO `maintenance_progress` VALUES (108, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-31 08:29:39', '2021-05-31 08:29:39');
INSERT INTO `maintenance_progress` VALUES (109, 87, 7, '', 0, 0, 1, '2021-05-31 08:30:21', '2021-05-31 08:30:21');
INSERT INTO `maintenance_progress` VALUES (110, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-31 08:30:49', '2021-05-31 08:30:49');
INSERT INTO `maintenance_progress` VALUES (111, 87, 7, '', 0, 0, 1, '2021-05-31 08:31:28', '2021-05-31 08:31:28');
INSERT INTO `maintenance_progress` VALUES (112, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-31 08:33:28', '2021-05-31 08:33:28');
INSERT INTO `maintenance_progress` VALUES (113, 87, 7, '', 0, 0, 1, '2021-05-31 08:40:10', '2021-05-31 08:40:10');
INSERT INTO `maintenance_progress` VALUES (114, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-31 08:45:52', '2021-05-31 08:45:52');
INSERT INTO `maintenance_progress` VALUES (116, 87, 6, '管理画面より進捗状況が変更されました。', 0, 0, 615, '2021-05-31 08:47:36', '2021-05-31 08:47:36');
INSERT INTO `maintenance_progress` VALUES (117, 87, 7, '', 0, 0, 1, '2021-05-31 08:48:33', '2021-05-31 08:48:33');
INSERT INTO `maintenance_progress` VALUES (118, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-31 08:52:16', '2021-05-31 08:52:16');
INSERT INTO `maintenance_progress` VALUES (121, 87, 6, '管理画面より進捗状況が変更されました。', 0, 0, 615, '2021-05-31 08:53:58', '2021-05-31 08:53:58');
INSERT INTO `maintenance_progress` VALUES (122, 87, 10, '', 0, 0, 1, '2021-05-31 08:54:36', '2021-05-31 08:54:36');
INSERT INTO `maintenance_progress` VALUES (123, 87, 22, '', 0, 0, 1, '2021-05-31 10:17:21', '2021-05-31 10:17:21');
INSERT INTO `maintenance_progress` VALUES (124, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-31 15:09:46', '2021-05-31 15:09:46');
INSERT INTO `maintenance_progress` VALUES (125, 87, 6, '管理画面より進捗状況が変更されました。', 0, 0, 615, '2021-05-31 15:10:34', '2021-05-31 15:10:34');
INSERT INTO `maintenance_progress` VALUES (126, 87, 7, '', 0, 0, 1, '2021-05-31 15:11:54', '2021-05-31 15:11:54');
INSERT INTO `maintenance_progress` VALUES (127, 87, 22, '', 0, 0, 1, '2021-05-31 15:12:02', '2021-05-31 15:12:02');
INSERT INTO `maintenance_progress` VALUES (128, 87, 10, '', 0, 0, 1, '2021-05-31 15:12:07', '2021-05-31 15:12:07');
INSERT INTO `maintenance_progress` VALUES (129, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-31 16:29:06', '2021-05-31 16:29:06');
INSERT INTO `maintenance_progress` VALUES (130, 87, 6, '管理画面より進捗状況が変更されました。', 0, 0, 615, '2021-05-31 16:29:33', '2021-05-31 16:29:33');
INSERT INTO `maintenance_progress` VALUES (131, 87, 7, '', 0, 0, 1, '2021-05-31 16:30:36', '2021-05-31 16:30:36');
INSERT INTO `maintenance_progress` VALUES (132, 87, 10, '', 0, 0, 1, '2021-05-31 16:31:24', '2021-05-31 16:31:24');
INSERT INTO `maintenance_progress` VALUES (133, 87, 7, '', 0, 0, 1, '2021-05-31 17:02:30', '2021-05-31 17:02:30');
INSERT INTO `maintenance_progress` VALUES (134, 87, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-05-31 17:03:39', '2021-05-31 17:03:39');
INSERT INTO `maintenance_progress` VALUES (135, 87, 3, '差戻しです。', 0, 0, 615, '2021-06-01 22:15:05', '2021-06-01 22:15:05');
INSERT INTO `maintenance_progress` VALUES (136, 88, 6, '', 0, 0, 615, '2021-06-02 14:57:47', '2021-06-02 14:57:47');
INSERT INTO `maintenance_progress` VALUES (137, 88, 22, '', 0, 0, 1, '2021-06-02 14:58:51', '2021-06-02 14:58:51');
INSERT INTO `maintenance_progress` VALUES (138, 88, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-06-02 15:51:03', '2021-06-02 15:51:03');
INSERT INTO `maintenance_progress` VALUES (139, 88, 22, '', 0, 0, 1, '2021-06-02 16:58:37', '2021-06-02 16:58:37');
INSERT INTO `maintenance_progress` VALUES (140, 88, 7, '', 0, 0, 1, '2021-06-02 16:59:02', '2021-06-02 16:59:02');
INSERT INTO `maintenance_progress` VALUES (141, 88, 22, '', 0, 0, 1, '2021-06-02 16:59:58', '2021-06-02 16:59:58');
INSERT INTO `maintenance_progress` VALUES (142, 87, 9, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-06-03 10:06:27', '2021-06-03 10:06:27');
INSERT INTO `maintenance_progress` VALUES (143, 88, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-06-03 10:27:49', '2021-06-03 10:27:49');
INSERT INTO `maintenance_progress` VALUES (144, 88, 3, '差戻しテストです', 0, 0, 615, '2021-06-03 11:30:58', '2021-06-03 11:30:58');
INSERT INTO `maintenance_progress` VALUES (145, 88, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-06-03 11:33:03', '2021-06-03 11:33:03');
INSERT INTO `maintenance_progress` VALUES (146, 88, 3, '差戻しテスト', 0, 0, 615, '2021-06-03 11:34:08', '2021-06-03 11:34:08');
INSERT INTO `maintenance_progress` VALUES (147, 88, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-06-03 11:37:49', '2021-06-03 11:37:49');
INSERT INTO `maintenance_progress` VALUES (148, 88, 2, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-06-03 11:58:50', '2021-06-03 11:58:50');
INSERT INTO `maintenance_progress` VALUES (149, 88, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-06-03 12:01:16', '2021-06-03 12:01:16');
INSERT INTO `maintenance_progress` VALUES (150, 88, 5, '保留テストです', 0, 0, 615, '2021-06-03 12:02:03', '2021-06-03 12:02:03');
INSERT INTO `maintenance_progress` VALUES (151, 88, 4, '却下テストです', 0, 0, 615, '2021-06-03 12:03:13', '2021-06-03 12:03:13');
INSERT INTO `maintenance_progress` VALUES (152, 88, 3, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-06-03 12:05:13', '2021-06-03 12:05:13');
INSERT INTO `maintenance_progress` VALUES (153, 88, 1, NULL, 0, 0, 611, '2021-06-03 12:08:31', '2021-06-03 12:08:31');
INSERT INTO `maintenance_progress` VALUES (154, 88, 6, '', 0, 0, 615, '2021-06-03 12:09:51', '2021-06-03 12:09:51');
INSERT INTO `maintenance_progress` VALUES (155, 88, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-06-03 12:10:34', '2021-06-03 12:10:34');
INSERT INTO `maintenance_progress` VALUES (156, 88, 6, '承認します', 0, 0, 615, '2021-06-03 12:10:50', '2021-06-03 12:10:50');
INSERT INTO `maintenance_progress` VALUES (157, 90, 3, '差戻し', 0, 0, 615, '2021-06-23 16:33:23', '2021-06-23 16:33:23');
INSERT INTO `maintenance_progress` VALUES (158, 90, 1, NULL, 0, 0, 611, '2021-06-23 16:47:33', '2021-06-23 16:47:33');
INSERT INTO `maintenance_progress` VALUES (159, 90, 3, '差戻し', 0, 0, 615, '2021-06-23 16:49:01', '2021-06-23 16:49:01');
INSERT INTO `maintenance_progress` VALUES (160, 90, 1, NULL, 0, 0, 611, '2021-06-24 16:48:57', '2021-06-24 16:48:57');
INSERT INTO `maintenance_progress` VALUES (161, 90, 1, NULL, 0, 0, 611, '2021-06-24 16:57:47', '2021-06-24 16:57:47');
INSERT INTO `maintenance_progress` VALUES (162, 90, 1, NULL, 0, 0, 611, '2021-06-24 17:06:08', '2021-06-24 17:06:08');
INSERT INTO `maintenance_progress` VALUES (163, 90, 1, NULL, 0, 0, 611, '2021-06-24 17:14:58', '2021-06-24 17:14:58');
INSERT INTO `maintenance_progress` VALUES (164, 90, 1, NULL, 0, 0, 611, '2021-06-24 17:18:36', '2021-06-24 17:18:36');
INSERT INTO `maintenance_progress` VALUES (165, 90, 1, NULL, 0, 0, 611, '2021-06-24 17:20:07', '2021-06-24 17:20:07');
INSERT INTO `maintenance_progress` VALUES (166, 90, 1, NULL, 0, 0, 611, '2021-06-24 17:21:18', '2021-06-24 17:21:18');
INSERT INTO `maintenance_progress` VALUES (167, 90, 1, NULL, 0, 0, 611, '2021-06-24 17:23:17', '2021-06-24 17:23:17');
INSERT INTO `maintenance_progress` VALUES (168, 89, 5, '保留', 0, 0, 615, '2021-06-25 17:52:20', '2021-06-25 17:52:20');
INSERT INTO `maintenance_progress` VALUES (169, 90, 5, '保留', 0, 0, 615, '2021-06-25 17:52:32', '2021-06-25 17:52:32');
INSERT INTO `maintenance_progress` VALUES (170, 89, 3, '差戻し', 0, 0, 615, '2021-06-30 16:56:30', '2021-06-30 16:56:30');
INSERT INTO `maintenance_progress` VALUES (171, 91, 3, '差戻し', 0, 0, 615, '2021-07-02 10:28:14', '2021-07-02 10:28:14');
INSERT INTO `maintenance_progress` VALUES (172, 91, 1, NULL, 0, 0, 611, '2021-07-02 10:31:25', '2021-07-02 10:31:25');
INSERT INTO `maintenance_progress` VALUES (173, 91, 5, '保留', 0, 0, 615, '2021-07-02 10:43:34', '2021-07-02 10:43:34');
INSERT INTO `maintenance_progress` VALUES (174, 91, 3, '差戻し', 0, 0, 615, '2021-07-02 10:44:30', '2021-07-02 10:44:30');
INSERT INTO `maintenance_progress` VALUES (175, 91, 1, NULL, 0, 0, 611, '2021-07-02 10:49:15', '2021-07-02 10:49:15');
INSERT INTO `maintenance_progress` VALUES (176, 91, 4, '却下', 0, 0, 615, '2021-07-02 10:53:32', '2021-07-02 10:53:32');
INSERT INTO `maintenance_progress` VALUES (177, 90, 6, '', 0, 0, 615, '2021-07-02 11:37:32', '2021-07-02 11:37:32');
INSERT INTO `maintenance_progress` VALUES (178, 92, 6, '', 0, 0, 615, '2021-07-02 11:52:45', '2021-07-02 11:52:45');
INSERT INTO `maintenance_progress` VALUES (179, 93, 5, 'テスト', 0, 0, 612, '2021-07-02 14:22:42', '2021-07-02 14:22:42');
INSERT INTO `maintenance_progress` VALUES (180, 93, 4, 'やっぱり却下します', 0, 0, 612, '2021-07-02 14:23:24', '2021-07-02 14:23:24');
INSERT INTO `maintenance_progress` VALUES (181, 92, 3, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-07-08 15:37:18', '2021-07-08 15:37:18');
INSERT INTO `maintenance_progress` VALUES (182, 92, 15, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-07-09 16:28:37', '2021-07-09 16:28:37');
INSERT INTO `maintenance_progress` VALUES (183, 92, 2, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-07-09 16:28:49', '2021-07-09 16:28:49');
INSERT INTO `maintenance_progress` VALUES (184, 92, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-07-09 16:42:39', '2021-07-09 16:42:39');
INSERT INTO `maintenance_progress` VALUES (185, 92, 3, '写真が不鮮明です。撮り直してください。', 0, 0, 612, '2021-07-09 16:44:40', '2021-07-09 16:44:40');
INSERT INTO `maintenance_progress` VALUES (186, 92, 1, NULL, 0, 0, 611, '2021-07-09 16:45:38', '2021-07-09 16:45:38');
INSERT INTO `maintenance_progress` VALUES (187, 92, 6, '', 0, 0, 612, '2021-07-09 16:53:44', '2021-07-09 16:53:44');
INSERT INTO `maintenance_progress` VALUES (188, 92, 11, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-07-09 16:54:37', '2021-07-09 16:54:37');
INSERT INTO `maintenance_progress` VALUES (189, 94, 3, 'sk差戻しテスト', 0, 0, 632, '2021-07-16 15:13:26', '2021-07-16 15:13:26');
INSERT INTO `maintenance_progress` VALUES (190, 94, 1, NULL, 0, 0, 631, '2021-07-16 15:20:48', '2021-07-16 15:20:48');
INSERT INTO `maintenance_progress` VALUES (191, 94, 5, 'sk保留テスト', 0, 0, 632, '2021-07-16 15:21:38', '2021-07-16 15:21:38');
INSERT INTO `maintenance_progress` VALUES (192, 94, 6, '', 0, 0, 632, '2021-07-16 15:29:46', '2021-07-16 15:29:46');
INSERT INTO `maintenance_progress` VALUES (193, 95, 4, 'sk却下テスト', 0, 0, 632, '2021-07-16 15:36:19', '2021-07-16 15:36:19');
INSERT INTO `maintenance_progress` VALUES (194, 96, 4, 'sk取下げテスト', 0, 0, 632, '2021-07-16 15:41:31', '2021-07-16 15:41:31');
INSERT INTO `maintenance_progress` VALUES (195, 97, 5, 'sk保留テスト', 0, 0, 632, '2021-07-16 15:48:02', '2021-07-16 15:48:02');
INSERT INTO `maintenance_progress` VALUES (196, 98, 3, 'sk差戻しテスト', 0, 0, 632, '2021-07-16 16:12:39', '2021-07-16 16:12:39');
INSERT INTO `maintenance_progress` VALUES (197, 99, 5, '保留', 0, 0, 634, '2021-07-19 16:45:27', '2021-07-19 16:45:27');
INSERT INTO `maintenance_progress` VALUES (198, 100, 5, '保留', 0, 0, 634, '2021-07-19 16:45:45', '2021-07-19 16:45:45');
INSERT INTO `maintenance_progress` VALUES (199, 101, 6, '', 0, 0, 632, '2021-07-20 13:16:07', '2021-07-20 13:16:07');
INSERT INTO `maintenance_progress` VALUES (200, 100, 5, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-07-22 18:16:31', '2021-07-22 18:16:31');
INSERT INTO `maintenance_progress` VALUES (201, 100, 13, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-07-23 01:09:06', '2021-07-23 01:09:06');
INSERT INTO `maintenance_progress` VALUES (202, 101, 1, '', 0, 0, 1, '2021-08-31 14:12:04', '2021-08-31 14:12:04');
INSERT INTO `maintenance_progress` VALUES (203, 90, 16, 'こちらテスト中', 0, 0, 1, '2021-08-31 22:04:36', '2021-08-31 22:04:36');
INSERT INTO `maintenance_progress` VALUES (204, 101, 21, '', 0, 0, 1, '2021-08-31 23:52:51', '2021-08-31 23:52:51');
INSERT INTO `maintenance_progress` VALUES (205, 101, 4, 'test', 0, 0, 1, '2021-09-03 16:40:20', '2021-09-03 16:40:20');
INSERT INTO `maintenance_progress` VALUES (206, 101, 16, '', 0, 0, 1, '2021-09-05 02:21:09', '2021-09-05 02:21:09');
INSERT INTO `maintenance_progress` VALUES (207, 101, 16, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-09-05 02:31:50', '2021-09-05 02:31:50');
INSERT INTO `maintenance_progress` VALUES (208, 101, 16, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-09-05 02:31:52', '2021-09-05 02:31:52');
INSERT INTO `maintenance_progress` VALUES (209, 101, 16, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-09-05 02:59:50', '2021-09-05 02:59:50');
INSERT INTO `maintenance_progress` VALUES (210, 99, 5, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-09-05 02:59:54', '2021-09-05 02:59:54');
INSERT INTO `maintenance_progress` VALUES (211, 101, 16, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-09-05 03:00:04', '2021-09-05 03:00:04');
INSERT INTO `maintenance_progress` VALUES (212, 101, 2, '経過情報', 0, 0, 1, '2021-09-06 16:54:51', '2021-09-06 16:54:51');
INSERT INTO `maintenance_progress` VALUES (213, 101, 1, '', 0, 0, 1, '2021-09-06 18:26:43', '2021-09-06 18:26:43');
INSERT INTO `maintenance_progress` VALUES (214, 101, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-09-08 11:09:42', '2021-09-08 11:09:42');
INSERT INTO `maintenance_progress` VALUES (215, 101, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-09-16 14:11:13', '2021-09-16 14:11:13');
INSERT INTO `maintenance_progress` VALUES (216, 101, 1, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-09-16 14:11:20', '2021-09-16 14:11:20');
INSERT INTO `maintenance_progress` VALUES (217, 88, 6, '管理画面より進捗状況が変更されました。', 0, 0, 1, '2021-09-16 14:11:24', '2021-09-16 14:11:24');
INSERT INTO `maintenance_progress` VALUES (218, 101, 3, 'wwww', 0, 0, 1, '2021-09-24 11:03:56', '2021-09-24 11:03:56');

-- ----------------------------
-- Table structure for maintenances
-- ----------------------------
DROP TABLE IF EXISTS `maintenances`;
CREATE TABLE `maintenances`  (
  `maintenance_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `maintenance_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `shop_id` int(10) UNSIGNED NOT NULL,
  `applicant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `equipment` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `manufacturer` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `model_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `order_type_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `order_type_other_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `when` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `situation` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `order` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `is_emergency` tinyint(1) NOT NULL DEFAULT 0,
  `is_disaster` tinyint(1) NOT NULL DEFAULT 0,
  `progress_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `completed_date` date NULL DEFAULT NULL,
  `judge_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `judge` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `notify_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `sub_category_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `customer_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `order_reason_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`maintenance_id`) USING BTREE,
  INDEX `maintenances_shop_id_foreign`(`shop_id`) USING BTREE,
  INDEX `maintenances_applicant_id_foreign`(`applicant_id`) USING BTREE,
  INDEX `maintenances_order_type_id_foreign`(`order_type_id`) USING BTREE,
  INDEX `maintenances_progress_id_foreign`(`progress_id`) USING BTREE,
  INDEX `maintenances_category_id_foreign`(`category_id`) USING BTREE,
  INDEX `maintenances_sub_category_id_foreign`(`sub_category_id`) USING BTREE,
  CONSTRAINT `maintenances_applicant_id_foreign` FOREIGN KEY (`applicant_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `maintenances_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `maintenances_order_type_id_foreign` FOREIGN KEY (`order_type_id`) REFERENCES `order_types` (`order_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `maintenances_progress_id_foreign` FOREIGN KEY (`progress_id`) REFERENCES `progress` (`progress_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `maintenances_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`shop_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `maintenances_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`sub_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of maintenances
-- ----------------------------
INSERT INTO `maintenances` VALUES (78, 'M000000078', 541, 611, '2021-03-25 16:49:17', '2021-03-26 12:20:38', '再送メールテスト', 'テスト', 'テスト', 1, '', 'テスト', 'テスト', '再送メールテスト テスト:テスト テスト テスト 手配お願いします。', NULL, 0, 0, 2, NULL, NULL, NULL, NULL, NULL, 5, 9, '1100001301', 1);
INSERT INTO `maintenances` VALUES (80, 'M000000080', 541, 611, '2021-04-27 09:49:55', '2021-05-27 17:02:59', 'idsSTG環境からのテスト申請１', 'idsSTG環境からのテスト申請１', 'idsSTG環境からのテスト申請１', 1, '', 'idsSTG環境からのテスト申請１', 'これはテストです。無視してください。', 'idsSTG環境からのテスト申請１ idsSTG環境からのテスト申請１:idsSTG環境からのテスト申請１ idsSTG環境からのテスト申請１ これはテストです。無視してください。手配お願いします。', NULL, 0, 0, 6, NULL, NULL, NULL, '2021-05-24 10:26:50', NULL, 2, 9, '1100001301', 1);
INSERT INTO `maintenances` VALUES (83, 'M000000083', 541, 611, '2021-05-13 02:34:11', '2021-05-27 09:49:02', 'STGテスト申請', 'STGテスト申請', 'STGテスト申請', 1, '', 'STGテスト申請', 'STGテスト申請', 'STGテスト申請 STGテスト申請:STGテスト申請 STGテスト申請 STGテスト申請 手配お願いします。', NULL, 0, 0, 6, NULL, NULL, NULL, '2021-05-13 07:00:00', NULL, 7, 11, '1100001301', 1);
INSERT INTO `maintenances` VALUES (84, 'M000000084', 541, 611, '2021-05-26 18:19:09', '2021-05-27 18:21:22', 'idsSTG環境テスト申請２', 'idsSTG環境テスト申請２', 'idsSTG環境テスト申請２', 1, '', 'idsSTG環境テスト申請２', 'idsSTG環境テスト申請２idsSTG環境テスト申請２', 'idsSTG環境テスト申請２ idsSTG環境テスト申請２:idsSTG環境テスト申請２ idsSTG環境テスト申請２ idsSTG環境テスト申請２idsSTG環境テスト申請２ 手配お願いします。', NULL, 0, 0, 6, NULL, NULL, NULL, '2021-05-27 07:00:00', NULL, 10, 13, '1100001301', 1);
INSERT INTO `maintenances` VALUES (85, 'M000000085', 541, 611, '2021-05-27 09:26:42', '2021-05-27 09:30:22', 'idsSTG環境テスト申請３', 'idsSTG環境テスト申請３', 'idsSTG環境テスト申請３', 4, 'その他', 'idsSTG環境テスト申請３', 'idsSTG環境テスト申請３idsSTG環境テスト申請３', 'idsSTG環境テスト申請３ idsSTG環境テスト申請３:idsSTG環境テスト申請３ idsSTG環境テスト申請３ idsSTG環境テスト申請３idsSTG環境テスト申請３ 手配お願いします。', NULL, 0, 0, 6, NULL, NULL, NULL, '2021-05-27 09:26:42', NULL, 12, 5, '1100001301', 2);
INSERT INTO `maintenances` VALUES (86, 'M000000086', 541, 611, '2021-05-27 10:08:40', '2021-05-27 10:09:23', 'idsSTG環境テスト申請４', 'idsSTG環境テスト申請４', 'idsSTG環境テスト申請４', 3, '', 'idsSTG環境テスト申請４', 'idsSTG環境テスト申請４idsSTG環境テスト申請４', 'idsSTG環境テスト申請４ idsSTG環境テスト申請４:idsSTG環境テスト申請４ idsSTG環境テスト申請４ idsSTG環境テスト申請４idsSTG環境テスト申請４ 手配お願いします。', NULL, 0, 0, 6, NULL, NULL, NULL, '2021-05-27 10:08:40', NULL, 7, 14, '1100001301', 3);
INSERT INTO `maintenances` VALUES (87, 'M000000087', 541, 611, '2021-05-27 14:26:27', '2021-09-01 10:40:31', 'idsSTG環境テスト申請５', 'idsSTG環境テスト申請５', 'idsSTG環境テスト申請５', 1, '', 'idsSTG環境テスト申請５', 'idsSTG環境テスト申請５idsSTG環境テスト申請５', 'idsSTG環境テスト申請５ idsSTG環境テスト申請５:idsSTG環境テスト申請５ idsSTG環境テスト申請５ idsSTG環境テスト申請５idsSTG環境テスト申請５ 手配お願いします。', NULL, 0, 0, 9, NULL, NULL, NULL, '2021-05-27 14:26:27', NULL, 3, 9, '1100001301', 1);
INSERT INTO `maintenances` VALUES (88, 'M000000088', 541, 611, '2021-06-02 13:20:46', '2021-06-03 12:10:50', 'idsSTG環境テスト申請6', 'idsSTG環境テスト申請6', 'idsSTG環境テスト申請6', 1, '', 'idsSTG環境テスト申請6', 'idsSTG環境テスト申請6 idsSTG環境テスト申請6 idsSTG環境テスト申請6', 'idsSTG環境テスト申請6 idsSTG環境テスト申請6:idsSTG環境テスト申請6 idsSTG環境テスト申請6 idsSTG環境テスト申請6 idsSTG環境テスト申請6 idsSTG環境テスト申請6手配お願いします。', NULL, 0, 0, 6, NULL, NULL, NULL, '2021-06-03 12:08:31', NULL, 1, 30, '1100001301', 1);
INSERT INTO `maintenances` VALUES (89, 'M000000089', 541, 611, '2021-06-22 15:55:53', '2021-07-02 10:30:09', 'idsSTG環境申請テスト', 'idsSTG環境申請テスト', 'idsSTG環境申請テスト', 1, '', 'idsSTG環境申請テスト', 'idsSTG環境申請テスト', 'idsSTG環境申請テスト idsSTG環境申請テスト:idsSTG環境申請テスト idsSTG環境申請テスト idsSTG環境申請テスト 手配お願いします。', NULL, 0, 0, 3, NULL, NULL, NULL, '2021-06-22 15:55:53', '2021-07-02 10:30:09', 2, 34, '1100001301', 1);
INSERT INTO `maintenances` VALUES (90, 'M000000090', 541, 611, '2021-06-23 15:46:23', '2021-09-01 09:12:45', 'idsSTG テスト申請', 'idsSTG テスト申請', 'idsSTG テスト申請', 1, '', 'idsSTG テスト申請', 'idsSTG テスト申請', 'idsSTG テスト申請 idsSTG テスト申請:idsSTG テスト申請 idsSTG テスト申請 idsSTG テスト申請手配お願いします。', 'テスト', 0, 0, 16, NULL, NULL, NULL, '2021-06-24 17:23:17', NULL, 1, 2, '1100001301', 1);
INSERT INTO `maintenances` VALUES (91, 'M000000091', 541, 611, '2021-07-02 09:21:24', '2021-07-02 11:44:35', 'a', 'a', 'a', 1, '', 'a', 'a', 'a a:a a a手配お願いします。', NULL, 0, 0, 4, NULL, NULL, NULL, '2021-07-02 10:49:15', '2021-07-02 11:44:35', 14, 55, '1100001301', 1);
INSERT INTO `maintenances` VALUES (92, 'M000000092', 541, 611, '2021-07-02 11:50:39', '2021-09-21 09:29:55', 'idsSTG 通信チェックテスト', 'idsSTG 通信チェックテスト', 'idsSTG 通信チェックテスト', 3, '', 'idsSTG 通信チェックテスト', 'idsSTG 通信チェックテスト', 'idsSTG 通信チェックテスト idsSTG 通信チェックテスト:idsSTG 通信チェックテスト idsSTG 通信チェックテスト idsSTG 通信チェックテスト手配お願いします。', NULL, 0, 0, 11, NULL, NULL, NULL, '2021-07-09 16:45:38', NULL, 6, 33, '1100001301', 1);
INSERT INTO `maintenances` VALUES (93, 'M000000093', 541, 611, '2021-07-02 14:17:22', '2021-07-02 14:24:08', 'テスト', 'テスト', 'テスト', 1, '', 'テスト', 'テスト', 'テスト テスト:テスト テスト テスト 手配お願いします。', NULL, 0, 0, 4, NULL, NULL, NULL, '2021-07-02 14:17:22', '2021-07-02 14:24:08', 4, 78, '1100001301', 1);
INSERT INTO `maintenances` VALUES (94, 'M000000094', 545, 631, '2021-07-16 14:54:52', '2021-07-16 15:29:46', 'SKテストユーザーで申請テスト１', 'SKテストユーザーで申請テスト１', 'SKテストユーザーで申請テスト１', 1, '', 'SKテストユーザーで申請テスト１', 'SKテストユーザーで申請テスト１SKテストユーザーで申請テスト１SKテストユーザーで申請テスト１', 'SKテストユーザーで申請テスト１ SKテストユーザーで申請テスト１:SKテストユーザーで申請テスト１ SKテストユーザーで申請テスト１ SKテストユーザーで申請テスト１SKテストユーザーで申請テスト１SKテストユーザーで申請テスト１手配お願いします。', NULL, 0, 0, 6, NULL, NULL, NULL, '2021-07-16 15:20:48', NULL, 7, 7, '1100001301', 1);
INSERT INTO `maintenances` VALUES (95, 'M000000095', 545, 631, '2021-07-16 15:35:18', '2021-07-16 15:41:57', 'SKテストユーザーで申請テスト２', 'SKテストユーザーで申請テスト２', 'SKテストユーザーで申請テスト２', 2, '', 'SKテストユーザーで申請テスト２', 'SKテストユーザーで申請テスト２', 'SKテストユーザーで申請テスト２ SKテストユーザーで申請テスト２:SKテストユーザーで申請テスト２ SKテストユーザーで申請テスト２ SKテストユーザーで申請テスト２ 手配お願いします。', NULL, 0, 0, 4, NULL, NULL, NULL, '2021-07-16 15:35:18', '2021-07-16 15:41:57', 8, 90, '1100001301', 2);
INSERT INTO `maintenances` VALUES (96, 'M000000096', 545, 631, '2021-07-16 15:40:11', '2021-07-16 15:41:31', 'SKテストユーザーで申請テスト3', 'SKテストユーザーで申請テスト3', 'SKテストユーザーで申請テスト3', 3, '', 'SKテストユーザーで申請テスト3', 'SKテストユーザーで申請テスト3SKテストユーザーで申請テスト3SKテストユーザーで申請テスト3SKテストユーザーで申請テスト3', 'SKテストユーザーで申請テスト3 SKテストユーザーで申請テスト3:SKテストユーザーで申請テスト3 SKテストユーザーで申請テスト3 SKテストユーザーで申請テスト3SKテストユーザーで申請テスト3SKテストユーザーで申請テスト3SKテストユーザーで申請テスト3 手配お願いします。', NULL, 0, 0, 4, NULL, NULL, NULL, '2021-07-16 15:40:11', NULL, 2, 55, '1100001301', 3);
INSERT INTO `maintenances` VALUES (97, 'M000000097', 545, 631, '2021-07-16 15:47:31', '2021-07-16 15:48:02', 'SKテストユーザーで申請テスト４', 'SKテストユーザーで申請テスト４', 'SKテストユーザーで申請テスト４', 4, 'その他テキスト', 'SKテストユーザーで申請テスト４', 'SKテストユーザーで申請テスト４SKテストユーザーで申請テスト４SKテストユーザーで申請テスト４', 'SKテストユーザーで申請テスト４ SKテストユーザーで申請テスト４:SKテストユーザーで申請テスト４ SKテストユーザーで申請テスト４ SKテストユーザーで申請テスト４SKテストユーザーで申請テスト４SKテストユーザーで申請テスト４ 手配お願いします。', NULL, 0, 0, 5, NULL, NULL, NULL, '2021-07-16 15:47:31', NULL, 4, 33, '1100001301', 2);
INSERT INTO `maintenances` VALUES (98, 'M000000098', 545, 631, '2021-07-16 16:03:49', '2021-07-16 16:12:39', 'SKテストユーザーで申請テスト５', 'SKテストユーザーで申請テスト５', 'SKテストユーザーで申請テスト５', 1, '', 'SKテストユーザーで申請テスト５', 'SKテストユーザーで申請テスト５', 'SKテストユーザーで申請テスト５ SKテストユーザーで申請テスト５:SKテストユーザーで申請テスト５ SKテストユーザーで申請テスト５ SKテストユーザーで申請テスト５ 手配お願いします。', NULL, 0, 0, 3, NULL, NULL, NULL, '2021-07-16 16:03:49', NULL, 3, 78, '1100001301', 1);
INSERT INTO `maintenances` VALUES (99, 'M000000099', 545, 631, '2021-07-16 16:14:04', '2021-07-19 16:45:27', 'SKテストユーザーで申請テスト６', 'SKテストユーザーで申請テスト６', 'SKテストユーザーで申請テスト６', 1, '', 'SKテストユーザーで申請テスト６', 'SKテストユーザーで申請テスト６SKテストユーザーで申請テスト６SKテストユーザーで申請テスト６', 'SKテストユーザーで申請テスト６ SKテストユーザーで申請テスト６:SKテストユーザーで申請テスト６ SKテストユーザーで申請テスト６ SKテストユーザーで申請テスト６SKテストユーザーで申請テスト６SKテストユーザーで申請テスト６ 手配お願いします。', NULL, 0, 0, 5, NULL, NULL, NULL, '2021-07-16 16:14:04', NULL, 10, 7, '1100001301', 1);
INSERT INTO `maintenances` VALUES (100, 'M000000100', 545, 631, '2021-07-16 16:25:00', '2021-09-21 09:22:06', 'SKテストユーザーで申請テスト７', 'SKテストユーザーで申請テスト７', 'SKテストユーザーで申請テスト７', 3, '', 'SKテストユーザーで申請テスト７', 'SKテストユーザーで申請テスト７SKテストユーザーで申請テスト７SKテストユーザーで申請テスト７SKテストユーザーで申請テスト７', 'SKテストユーザーで申請テスト７ SKテストユーザーで申請テスト７:SKテストユーザーで申請テスト７ SKテストユーザーで申請テスト７ SKテストユーザーで申請テスト７SKテストユーザーで申請テスト７SKテストユーザーで申請テスト７SKテストユーザーで申請テスト７ 手配お願いします。', NULL, 0, 0, 13, NULL, NULL, NULL, '2021-07-16 16:25:00', NULL, 2, 90, '1100001301', 2);
INSERT INTO `maintenances` VALUES (101, 'M000000101', 545, 632, '2021-07-20 10:35:23', '2021-09-24 11:03:56', 'SKのBMで申請テスト１', 'SKのBMで申請テスト１', 'SKのBMで申請テスト１', 4, 'その他テキスト', 'SKのBMで申請テスト１', 'SKのBMで申請テスト１SKのBMで申請テスト１SKのBMで申請テスト１', 'SKのBMで申請テスト１ SKのBMで申請テスト１:SKのBMで申請テスト１ SKのBMで申請テスト１ SKのBMで申請テスト１SKのBMで申請テスト１SKのBMで申請テスト１ 手配お願いします。', NULL, 0, 0, 3, NULL, NULL, NULL, '2021-07-20 10:35:23', NULL, 1, 3, '343333', 2);

-- ----------------------------
-- Table structure for matter_options
-- ----------------------------
DROP TABLE IF EXISTS `matter_options`;
CREATE TABLE `matter_options`  (
  `matter_option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`matter_option_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of matter_options
-- ----------------------------
INSERT INTO `matter_options` VALUES (1, '系統', '2021-08-27 22:46:33', NULL);
INSERT INTO `matter_options` VALUES (2, '発生現象', '2021-08-27 22:46:33', NULL);
INSERT INTO `matter_options` VALUES (3, 'エラーコード', '2021-08-27 22:46:33', NULL);
INSERT INTO `matter_options` VALUES (4, '原因', '2021-08-27 22:46:33', NULL);
INSERT INTO `matter_options` VALUES (5, '原因箇所', '2021-08-27 22:46:33', NULL);

-- ----------------------------
-- Table structure for matter_values
-- ----------------------------
DROP TABLE IF EXISTS `matter_values`;
CREATE TABLE `matter_values`  (
  `matter_value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`matter_value_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of matter_values
-- ----------------------------
INSERT INTO `matter_values` VALUES (1, 'AC2', '2021-08-27 22:46:33', NULL);
INSERT INTO `matter_values` VALUES (2, 'エラー', '2021-08-27 22:46:33', NULL);
INSERT INTO `matter_values` VALUES (3, 'P15', '2021-08-27 22:46:33', NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 321 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (287, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (288, '2019_12_18_210428_create_departments_table', 1);
INSERT INTO `migrations` VALUES (289, '2019_12_19_060833_create_business_categories_table', 1);
INSERT INTO `migrations` VALUES (290, '2019_12_19_080000_create_districts_table', 1);
INSERT INTO `migrations` VALUES (291, '2019_12_19_080001_create_blocks_table', 1);
INSERT INTO `migrations` VALUES (292, '2019_12_19_090232_create_shops_table', 1);
INSERT INTO `migrations` VALUES (293, '2019_12_20_074511_create_categories_table', 1);
INSERT INTO `migrations` VALUES (294, '2019_12_20_080445_create_sub_categories_table', 1);
INSERT INTO `migrations` VALUES (295, '2019_12_20_080816_create_manufacturers_table', 1);
INSERT INTO `migrations` VALUES (296, '2019_12_26_044137_create_notices_table', 1);
INSERT INTO `migrations` VALUES (297, '2019_12_26_050221_create_asset_classifications_table', 1);
INSERT INTO `migrations` VALUES (298, '2019_12_26_052748_create_equipments_table', 1);
INSERT INTO `migrations` VALUES (299, '2019_12_26_054240_create_clients_table', 1);
INSERT INTO `migrations` VALUES (300, '2019_12_26_054607_create_order_types_table', 1);
INSERT INTO `migrations` VALUES (301, '2019_12_26_054933_create_progress_table', 1);
INSERT INTO `migrations` VALUES (302, '2019_12_26_055137_create_final_statuses_table', 1);
INSERT INTO `migrations` VALUES (303, '2020_01_21_003944_create_roles_table', 1);
INSERT INTO `migrations` VALUES (304, '2020_01_21_003945_create_users_table', 1);
INSERT INTO `migrations` VALUES (305, '2020_01_21_003946_create_maintenances_table', 1);
INSERT INTO `migrations` VALUES (306, '2020_02_25_142009_create_block_managers_table', 1);
INSERT INTO `migrations` VALUES (307, '2020_02_26_053319_create_district_managers_table', 1);
INSERT INTO `migrations` VALUES (308, '2020_03_11_070111_create_negozio_links_table', 1);
INSERT INTO `migrations` VALUES (309, '2020_03_12_020452_create_client_equipments_table', 1);
INSERT INTO `migrations` VALUES (310, '2020_12_17_101014_create_maintenance_progress_table', 1);
INSERT INTO `migrations` VALUES (311, '2021_01_05_064903_create_maintenance_images_table', 1);
INSERT INTO `migrations` VALUES (312, '2021_02_09_211354_create_general_managers_table', 1);
INSERT INTO `migrations` VALUES (313, '2021_04_13_002003_create_sessions_table', 2);
INSERT INTO `migrations` VALUES (314, '2021_04_28_094434_create_business_category_options_table', 3);
INSERT INTO `migrations` VALUES (315, '2021_08_26_151929_add_fields_to_maintenances', 4);
INSERT INTO `migrations` VALUES (316, '2021_08_26_222412_create_matter_options_table', 5);
INSERT INTO `migrations` VALUES (317, '2021_08_26_223111_create_matter_values_table', 5);
INSERT INTO `migrations` VALUES (318, '2021_08_26_223541_create_maintenance_matters_table', 5);
INSERT INTO `migrations` VALUES (319, '2021_08_31_001003_create_report_files_table', 6);
INSERT INTO `migrations` VALUES (320, '2021_08_31_001101_create_photo_files_table', 6);

-- ----------------------------
-- Table structure for order_reasons
-- ----------------------------
DROP TABLE IF EXISTS `order_reasons`;
CREATE TABLE `order_reasons`  (
  `order_reason_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`order_reason_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order_reasons
-- ----------------------------
INSERT INTO `order_reasons` VALUES (1, '紛失');
INSERT INTO `order_reasons` VALUES (2, '劣化');
INSERT INTO `order_reasons` VALUES (3, '破損');
INSERT INTO `order_reasons` VALUES (4, '追加');

-- ----------------------------
-- Table structure for order_types
-- ----------------------------
DROP TABLE IF EXISTS `order_types`;
CREATE TABLE `order_types`  (
  `order_type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`order_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order_types
-- ----------------------------
INSERT INTO `order_types` VALUES (1, '修繕依頼');
INSERT INTO `order_types` VALUES (2, '発注依頼');
INSERT INTO `order_types` VALUES (3, '見積依頼');
INSERT INTO `order_types` VALUES (4, 'その他');

-- ----------------------------
-- Table structure for photo_files
-- ----------------------------
DROP TABLE IF EXISTS `photo_files`;
CREATE TABLE `photo_files`  (
  `photo_file_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `maintenance_id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`photo_file_id`) USING BTREE,
  INDEX `photo_files_maintenance_id_foreign`(`maintenance_id`) USING BTREE,
  CONSTRAINT `photo_files_maintenance_id_foreign` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenances` (`maintenance_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of photo_files
-- ----------------------------
INSERT INTO `photo_files` VALUES (1, 101, 'slider2.jpg', 'public/photos/34eab27854b59aba0c566f493ebb8c42.jpeg', '2021-09-06 16:54:52', '2021-09-06 16:54:52');
INSERT INTO `photo_files` VALUES (2, 101, 'スクリーンショット 2021-09-06 18.26.03.png', 'public/photos/3c9d7d5a3f18a2da6899cd5f00f88489.png', '2021-09-06 18:26:43', '2021-09-06 18:26:43');
INSERT INTO `photo_files` VALUES (3, 100, 'why1.png', 'public/photos/49fa1b7ae01f3ceb6d21f6e3077b41a4.png', '2021-09-24 11:06:27', '2021-09-24 11:06:27');

-- ----------------------------
-- Table structure for progress
-- ----------------------------
DROP TABLE IF EXISTS `progress`;
CREATE TABLE `progress`  (
  `progress_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`progress_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of progress
-- ----------------------------
INSERT INTO `progress` VALUES (1, 'BM承認待ち', 1);
INSERT INTO `progress` VALUES (2, 'BM承認', 2);
INSERT INTO `progress` VALUES (3, 'BM差戻し', 3);
INSERT INTO `progress` VALUES (4, 'BM却下', 4);
INSERT INTO `progress` VALUES (5, 'BM保留', 5);
INSERT INTO `progress` VALUES (6, '本部受付前', 6);
INSERT INTO `progress` VALUES (7, '本部差戻し', 8);
INSERT INTO `progress` VALUES (8, '本部見送り', 9);
INSERT INTO `progress` VALUES (9, '依頼確定', 10);
INSERT INTO `progress` VALUES (10, '依頼済', 11);
INSERT INTO `progress` VALUES (11, '見積待ち', 12);
INSERT INTO `progress` VALUES (12, '見積精査中', 13);
INSERT INTO `progress` VALUES (13, '入荷待ち', 14);
INSERT INTO `progress` VALUES (14, 'DM承認待ち', 15);
INSERT INTO `progress` VALUES (15, '稟議中', 16);
INSERT INTO `progress` VALUES (16, '見積発注済み', 17);
INSERT INTO `progress` VALUES (17, '日程調整中', 18);
INSERT INTO `progress` VALUES (18, '訪問待ち', 19);
INSERT INTO `progress` VALUES (19, '報告待ち', 20);
INSERT INTO `progress` VALUES (20, '店完了', 21);
INSERT INTO `progress` VALUES (21, '取完了', 22);
INSERT INTO `progress` VALUES (22, '問合せ中', 7);

-- ----------------------------
-- Table structure for quotation_files
-- ----------------------------
DROP TABLE IF EXISTS `quotation_files`;
CREATE TABLE `quotation_files`  (
  `quotation_file_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `maintenance_id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`quotation_file_id`) USING BTREE,
  INDEX `report_files_maintenance_id_foreign`(`maintenance_id`) USING BTREE,
  CONSTRAINT `quotation_files_ibfk_1` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenances` (`maintenance_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of quotation_files
-- ----------------------------
INSERT INTO `quotation_files` VALUES (7, 101, 'テストファイル.pdf', 'public/reports/fcdd8251e2482f07bebcf1e00e89826f.pdf', '2021-09-08 09:46:20', '2021-09-08 09:46:20');
INSERT INTO `quotation_files` VALUES (8, 100, 'Untitled Document.pdf', 'public/reports/f3c8d2a70c3e15f989699b85bb367aef.pdf', '2021-09-24 11:06:33', '2021-09-24 11:06:33');

-- ----------------------------
-- Table structure for quotation_info
-- ----------------------------
DROP TABLE IF EXISTS `quotation_info`;
CREATE TABLE `quotation_info`  (
  `quotation_info_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `maintenance_id` bigint(20) UNSIGNED NOT NULL,
  `amount` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `quotation_files_cnt` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0',
  `photo_files_cnt` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0',
  `report_files_cnt` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `date` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `editor` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`quotation_info_id`) USING BTREE,
  INDEX `maintenance_progress_maintenance_id_foreign`(`maintenance_id`) USING BTREE,
  INDEX `maintenance_progress_progress_id_foreign`(`amount`) USING BTREE,
  INDEX `maintenance_progress_entered_by_foreign`(`report_files_cnt`) USING BTREE,
  CONSTRAINT `quotation_info_ibfk_2` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenances` (`maintenance_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 299 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of quotation_info
-- ----------------------------
INSERT INTO `quotation_info` VALUES (289, 101, '', '', '0', '1', '1', '2021-12-20 00:00:00', '2021-09-06 17:54:51', '管理者', '2021-09-06 17:54:51');
INSERT INTO `quotation_info` VALUES (290, 101, '20000', 'テストです。', '0', '2', '1', '2021-09-05 00:00:00', '2021-09-08 09:46:20', '管理者', '2021-09-08 09:46:20');
INSERT INTO `quotation_info` VALUES (291, 101, '9898', 'test', '1', '2', '1', '2021-09-17 12:00', '2021-09-11 12:02:03', '管理者', '2021-09-11 12:02:03');
INSERT INTO `quotation_info` VALUES (292, 78, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `quotation_info` VALUES (298, 100, '32', 'we', '0', '0', '0', '2021-09-18 11:00', '2021-09-24 11:06:28', '管理者', '2021-09-24 11:06:28');

-- ----------------------------
-- Table structure for report_files
-- ----------------------------
DROP TABLE IF EXISTS `report_files`;
CREATE TABLE `report_files`  (
  `report_file_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `maintenance_id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`report_file_id`) USING BTREE,
  INDEX `report_files_maintenance_id_foreign`(`maintenance_id`) USING BTREE,
  CONSTRAINT `report_files_maintenance_id_foreign` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenances` (`maintenance_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of report_files
-- ----------------------------
INSERT INTO `report_files` VALUES (1, 90, 'テスト見積書.pdf', 'public/reports/5f33217e50665ed0caf271c787d96077.pdf', '2021-08-31 22:04:36', '2021-08-31 22:04:36');
INSERT INTO `report_files` VALUES (2, 101, 'File Compare.pdf', 'public/reports/5f6fb2652eeaba7f8c6e177e6c68d2e6.pdf', '2021-09-06 16:54:51', '2021-09-06 16:54:51');
INSERT INTO `report_files` VALUES (3, 100, 'Untitled Document.pdf', 'public/reports/f3c8d2a70c3e15f989699b85bb367aef.pdf', '2021-09-24 11:06:28', '2021-09-24 11:06:28');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '管理者', NULL, NULL);
INSERT INTO `roles` VALUES (10, 'GM', NULL, NULL);
INSERT INTO `roles` VALUES (20, 'DM', NULL, NULL);
INSERT INTO `roles` VALUES (30, 'BM', NULL, NULL);
INSERT INTO `roles` VALUES (50, '一般社員', NULL, NULL);

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `payload` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE INDEX `sessions_id_unique`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sessions
-- ----------------------------

-- ----------------------------
-- Table structure for shops
-- ----------------------------
DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops`  (
  `shop_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `shop_code` mediumint(8) UNSIGNED NOT NULL,
  `shop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `business_category_id` int(10) UNSIGNED NOT NULL,
  `block_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `shop_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `shop_phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `shop_fax_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `shop_open_date` date NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`shop_id`) USING BTREE,
  UNIQUE INDEX `shops_shop_code_unique`(`shop_code`) USING BTREE,
  INDEX `shops_business_category_id_foreign`(`business_category_id`) USING BTREE,
  INDEX `shops_block_id_foreign`(`block_id`) USING BTREE,
  CONSTRAINT `shops_block_id_foreign` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`block_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shops_business_category_id_foreign` FOREIGN KEY (`business_category_id`) REFERENCES `business_categories` (`business_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 546 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shops
-- ----------------------------
INSERT INTO `shops` VALUES (1, 1, '本部', 1, NULL, '', '', '', NULL, '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (11, 1408, '足利', 18, 33, '', '', '', '2002-11-06', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (12, 1501, '竜ヶ崎', 18, 12, '', '', '', '2004-06-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (13, 1503, '駒込白山', 18, 18, '', '', '', '2005-03-19', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (14, 1504, '阿見住吉', 18, 12, '', '', '', '2005-06-06', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (15, 1508, '浦和', 18, 7, '', '', '', '2005-07-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (16, 1502, '真岡', 18, 32, '', '', '', '2005-07-14', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (17, 1507, '焼津', 18, 24, '', '', '', '2005-08-15', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (18, 1506, '宇都宮IP', 18, 32, '', '', '', '2005-09-19', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (19, 1505, 'つくば小野崎', 18, 12, '', '', '', '2005-10-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (20, 1510, '栃木駅前', 18, 32, '', '', '', '2006-08-11', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (21, 1511, '石岡', 18, 11, '', '', '', '2006-11-02', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (22, 1512, 'ひたちなか田彦', 18, 11, '', '', '', '2007-09-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (23, 1516, 'イオンタウン富士南', 18, 23, '', '', '', '2007-11-28', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (24, 1513, '水戸内原', 18, 11, '', '', '', '2007-12-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (25, 1514, '市原五井', 18, 14, '', '', '', '2008-03-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (26, 1515, '宇都宮今泉', 18, 32, '', '', '', '2008-04-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (27, 1519, '町田小山ヶ丘', 18, 16, '', '', '', '2008-05-29', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (28, 1657, 'フレスポ八潮', 18, 9, '', '', '', '2008-09-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (29, 1647, '茂原高師台', 18, 14, '', '', '', '2008-09-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (30, 1650, 'イオンモール大曲', 18, 3, '', '', '', '2008-10-08', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (31, 1646, 'ララガーデン川口', 18, 7, '', '', '', '2008-11-11', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (32, 1661, '東松山', 18, 8, '', '', '', '2008-11-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (33, 1658, '館山八幡', 18, 14, '', '', '', '2008-12-11', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (34, 1518, '成田飯仲', 18, 15, '', '', '', '2008-12-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (35, 1663, '常陸大宮', 18, 11, '', '', '', '2009-01-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (36, 1648, '結城', 18, 12, '', '', '', '2009-02-07', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (37, 1645, '高浜稗田', 18, 28, '', '', '', '2009-02-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (38, 1662, '福島伊達', 18, 6, '', '', '', '2009-03-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (39, 1517, '水戸笠原', 18, 11, '', '', '', '2009-03-26', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (40, 1669, '下館', 18, 12, '', '', '', '2009-04-08', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (41, 1664, '柏十余二', 18, 13, '', '', '', '2009-04-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (42, 1656, '鶴ヶ島', 18, 10, '', '', '', '2009-05-08', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (43, 1671, '日野神明', 18, 16, '', '', '', '2009-05-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (44, 1659, '八街', 18, 15, '', '', '', '2009-06-18', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (45, 1674, '鹿嶋佐田', 18, 11, '', '', '', '2009-07-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (46, 1682, 'イオンモール佐野', 18, 33, '', '', '', '2009-07-20', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (47, 1698, '新潟女池', 18, 31, '', '', '', '2009-08-05', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (48, 1679, '館林松原', 18, 33, '', '', '', '2009-08-08', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (49, 1680, '高崎問屋町', 18, 33, '', '', '', '2009-10-15', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (50, 1724, '堺浜寺', 18, 41, '', '', '', '2009-10-26', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (51, 1681, '大仁', 18, 23, '', '', '', '2009-11-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (52, 1701, '秋田広面', 18, 3, '', '', '', '2009-11-02', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (53, 1702, '桐生相生町', 18, 33, '', '', '', '2009-11-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (54, 1725, '高松今里', 18, 43, '', '', '', '2009-11-11', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (55, 1703, 'フォレオせんだい', 18, 4, '', '', '', '2009-11-20', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (56, 1713, 'ウィラ大井', 18, 20, '', '', '', '2009-12-02', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (57, 1712, 'アクロスモール守谷', 18, 13, '', '', '', '2009-12-04', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (58, 1704, '昭和町飯喰', 18, 30, '', '', '', '2009-12-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (59, 1717, '伊東湯川', 18, 23, '', '', '', '2009-12-19', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (60, 1718, '秦野平沢', 18, 22, '', '', '', '2010-01-20', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (61, 1684, '相模原城山', 18, 16, '', '', '', '2010-01-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (62, 1685, '瀬谷二ツ橋', 18, 19, '', '', '', '2010-01-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (63, 1705, '富山二口', 18, 34, '', '', '', '2010-02-08', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (64, 1726, '宇部恩田町', 18, 47, '', '', '', '2010-02-17', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (65, 1715, '小田原酒匂', 18, 22, '', '', '', '2010-02-19', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (66, 1714, '豊田朝日', 18, 27, '', '', '', '2010-02-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (67, 1722, '昭島昭和の森', 18, 16, '', '', '', '2010-03-15', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (68, 1720, '弥富イオンタウン前', 18, 28, '', '', '', '2010-03-19', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (69, 1706, 'アクロスプラザ長岡', 18, 31, '', '', '', '2010-03-19', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (70, 1727, '深谷荒川', 18, 8, '', '', '', '2010-03-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (71, 1707, '郡山芳賀', 18, 6, '', '', '', '2010-04-08', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (72, 1731, '岡山久米', 18, 45, '', '', '', '2010-04-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (73, 1686, 'フォレオ菖蒲', 18, 8, '', '', '', '2010-04-22', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (74, 1708, '太田浜町', 18, 33, '', '', '', '2010-04-22', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (75, 1730, '岡崎大西', 18, 26, '', '', '', '2010-04-28', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (76, 1736, '大分高城', 18, 48, '', '', '', '2010-05-28', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (77, 1729, '新座野火止', 18, 10, '', '', '', '2010-06-02', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (78, 1740, '佐賀本庄', 18, 49, '', '', '', '2010-06-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (79, 1709, '泉区上谷刈', 18, 4, '', '', '', '2010-06-17', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (80, 1739, '四日市羽津', 18, 29, '', '', '', '2010-07-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (81, 1749, '日立鹿島', 18, 11, '', '', '', '2010-07-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (82, 1741, '泉佐野樫井', 18, 41, '', '', '', '2010-07-14', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (83, 1751, '上田常入', 18, 30, '', '', '', '2010-07-15', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (84, 1732, '船橋海神', 18, 13, '', '', '', '2010-07-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (85, 1735, '新狭山', 18, 10, '', '', '', '2010-08-02', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (86, 1737, '下関幡生', 18, 47, '', '', '', '2010-08-12', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (87, 1738, '日進', 18, 28, '', '', '', '2010-08-13', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (88, 1752, '盛岡上田', 18, 4, '', '', '', '2010-08-19', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (89, 1733, '甲賀水口', 18, 38, '', '', '', '2010-08-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (90, 1763, '大崎古川諏訪', 18, 4, '', '', '', '2010-09-02', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (91, 1747, '鹿沼西茂呂', 18, 32, '', '', '', '2010-09-14', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (92, 1723, 'ライフガーデン新浦安', 18, 13, '', '', '', '2010-09-15', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (93, 1728, '越谷レイクタウン', 18, 9, '', '', '', '2010-09-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (94, 1753, '松江本郷', 18, 45, '', '', '', '2010-10-14', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (95, 1746, '小山喜沢', 18, 32, '', '', '', '2010-10-15', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (96, 1734, '裾野平松', 18, 23, '', '', '', '2010-10-19', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (97, 1754, '福山三吉町', 18, 45, '', '', '', '2010-10-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (98, 1742, '野田堤台', 18, 9, '', '', '', '2010-10-26', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (99, 1744, '宮崎新別府', 18, 51, '', '', '', '2010-10-29', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (100, 1764, '鉾田', 18, 11, '', '', '', '2010-11-11', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (101, 1755, '鳥取千代水', 18, 45, '', '', '', '2010-11-11', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (102, 1748, '安城横山', 18, 26, '', '', '', '2010-11-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (103, 1743, '入間宮寺', 18, 10, '', '', '', '2010-11-19', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (104, 1745, '41号扶桑', 18, 27, '', '', '', '2010-11-26', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (105, 1756, '金沢中村', 18, 35, '', '', '', '2010-12-03', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (106, 1757, '鹿児島城南', 18, 51, '', '', '', '2010-12-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (107, 1766, '伊勢崎八寸町', 18, 33, '', '', '', '2010-12-15', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (108, 1765, '浜松入野', 18, 24, '', '', '', '2010-12-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (109, 1767, '浜松西IC', 18, 24, '', '', '', '2011-03-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (110, 1758, '松山保免', 18, 44, '', '', '', '2011-04-07', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (111, 1768, '船橋咲が丘', 18, 13, '', '', '', '2011-04-15', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (112, 1759, '鹿児島卸本町', 18, 51, '', '', '', '2011-04-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (113, 1771, '山形馬見ヶ崎', 18, 5, '', '', '', '2011-05-13', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (114, 1770, 'ベイドリーム清水', 18, 23, '', '', '', '2011-06-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (115, 1773, '新三郷', 18, 9, '', '', '', '2011-06-08', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (116, 1772, 'イオンタウン須賀川', 18, 6, '', '', '', '2011-06-13', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (117, 1774, 'クロスガーデン富士中央', 18, 23, '', '', '', '2011-06-23', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (118, 1775, '大田原美原', 18, 32, '', '', '', '2011-07-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (119, 1776, '京王堀之内', 18, 16, '', '', '', '2011-07-08', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (120, 1777, '福岡志免', 18, 49, '', '', '', '2011-07-20', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (121, 1769, '御前崎浜岡', 18, 24, '', '', '', '2011-07-26', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (122, 1779, '千葉おゆみ野', 18, 14, '', '', '', '2011-08-02', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (123, 1780, '伊賀上野', 18, 29, '', '', '', '2011-08-08', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (124, 1760, 'チャチャタウン小倉', 18, 48, '', '', '', '2011-08-10', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (125, 1778, '福井羽水', 18, 37, '', '', '', '2011-08-20', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (126, 1782, '津乙部', 18, 29, '', '', '', '2011-09-12', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (127, 1784, '印西西の原', 18, 15, '', '', '', '2011-09-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (128, 1783, '本庄', 18, 8, '', '', '', '2011-09-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (129, 1786, '磐田', 18, 24, '', '', '', '2011-09-22', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (130, 1787, '八千代大和田', 18, 15, '', '', '', '2011-10-07', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (131, 1785, '土浦若松', 18, 12, '', '', '', '2011-10-07', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (132, 1788, '17号鴻巣新宿', 18, 8, '', '', '', '2011-10-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (133, 1789, '千葉小倉町', 18, 14, '', '', '', '2011-10-26', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (134, 1790, '天白荒池', 18, 27, '', '', '', '2011-10-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (135, 1793, '深谷上野台', 18, 8, '', '', '', '2011-10-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (136, 1795, '厚木IC', 18, 22, '', '', '', '2011-11-08', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (137, 1791, '横須賀中央', 18, 21, '', '', '', '2011-11-22', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (138, 1794, '富士吉田', 18, 30, '', '', '', '2011-11-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (139, 1797, '知多武豊', 18, 28, '', '', '', '2011-11-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (140, 1792, '横浜岡野', 18, 19, '', '', '', '2011-11-30', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (141, 1796, '248号関', 18, 36, '', '', '', '2011-12-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (142, 1798, '鹿浜', 18, 18, '', '', '', '2011-12-22', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (143, 1721, '東金', 18, 14, '', '', '', '2011-12-26', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (144, 1815, '横須賀衣笠', 18, 21, '', '', '', '2011-12-29', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (145, 1817, '新潟宝町', 18, 31, '', '', '', '2011-12-29', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (146, 1800, '八日市場', 18, 15, '', '', '', '2012-01-18', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (147, 1799, '沼津双葉町', 18, 23, '', '', '', '2012-01-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (148, 1819, '122号羽生', 18, 8, '', '', '', '2012-01-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (149, 1814, '羽島竹鼻', 18, 25, '', '', '', '2012-01-26', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (150, 1818, '新居浜西の土居', 18, 44, '', '', '', '2012-01-30', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (151, 1820, '8号鯖江', 18, 37, '', '', '', '2012-01-30', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (152, 1816, '宇都宮中戸祭', 18, 32, '', '', '', '2012-02-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (153, 1821, '新潟寺尾台', 18, 31, '', '', '', '2012-02-23', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (154, 1824, '鈴鹿中央通', 18, 29, '', '', '', '2012-02-23', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (155, 1822, '札幌苗穂', 18, 1, '', '', '', '2012-02-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (156, 1825, '豊橋新栄', 18, 26, '', '', '', '2012-02-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (157, 1826, '経堂', 18, 17, '', '', '', '2012-03-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (158, 1827, '掛川', 18, 24, '', '', '', '2012-03-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (159, 1829, '海老名ビナウォーク', 18, 22, '', '', '', '2012-03-23', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (160, 1828, '彦根戸賀', 18, 37, '', '', '', '2012-03-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (161, 1830, '東浦', 18, 28, '', '', '', '2012-03-30', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (162, 1832, '岸和田八阪', 18, 41, '', '', '', '2012-04-12', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (163, 1833, '41号高山', 18, 34, '', '', '', '2012-04-13', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (164, 1834, '山口湯田', 18, 47, '', '', '', '2012-04-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (165, 1823, 'イオンモール福津', 18, 48, '', '', '', '2012-04-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (166, 1835, '札幌栄町', 18, 2, '', '', '', '2012-04-23', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (167, 1836, '松山中央', 18, 44, '', '', '', '2012-04-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (168, 1837, '敦賀', 18, 37, '', '', '', '2012-04-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (169, 1838, '観音寺坂本', 18, 43, '', '', '', '2012-05-18', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (170, 1839, '倉敷連島', 18, 45, '', '', '', '2012-05-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (171, 1840, '東海荒尾', 18, 27, '', '', '', '2012-05-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (172, 1841, '岐阜前一色', 18, 36, '', '', '', '2012-05-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (173, 1842, 'いわき小名浜', 18, 6, '', '', '', '2012-05-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (174, 1165, '加平', 18, 18, '', '', '', '2012-06-29', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (175, 1843, 'ベイタウン本牧', 18, 21, '', '', '', '2012-07-02', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (176, 1831, '平塚四之宮', 18, 22, '', '', '', '2012-07-13', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (177, 1168, '松戸高塚新田', 18, 13, '', '', '', '2012-07-19', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (178, 1169, '高岡赤祖父', 18, 34, '', '', '', '2012-08-03', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (179, 1170, '石狩樽川', 18, 2, '', '', '', '2012-08-06', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (180, 1171, '薩摩川内', 18, 51, '', '', '', '2012-08-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (181, 1172, '名張', 18, 29, '', '', '', '2012-08-13', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (182, 1173, '岡山平島', 18, 45, '', '', '', '2012-08-23', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (183, 1174, '札幌新道発寒', 18, 2, '', '', '', '2012-08-28', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (184, 1175, '綾瀬大上', 18, 19, '', '', '', '2012-09-10', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (185, 1176, '熊谷', 18, 8, '', '', '', '2012-09-14', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (186, 1177, '我孫子若松', 18, 13, '', '', '', '2012-09-18', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (187, 1178, '登別若草', 18, 1, '', '', '', '2012-09-19', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (188, 1179, '滋賀守山', 18, 38, '', '', '', '2012-09-20', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (189, 1180, '三島中央町', 18, 23, '', '', '', '2012-09-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (190, 1181, '旭川旭町', 18, 2, '', '', '', '2012-09-26', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (191, 1182, '岩槻本宿', 18, 9, '', '', '', '2012-10-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (192, 1183, '花巻桜台', 18, 4, '', '', '', '2012-10-04', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (193, 1184, '千葉畑町', 18, 15, '', '', '', '2012-10-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (194, 1185, '富士宮矢立町', 18, 23, '', '', '', '2012-10-17', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (195, 1186, '厚木及川', 18, 22, '', '', '', '2012-10-17', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (196, 1187, '小平中島町', 18, 16, '', '', '', '2012-10-19', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (197, 1188, '福井大宮', 18, 37, '', '', '', '2012-10-22', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (198, 1189, '宇部厚南', 18, 47, '', '', '', '2012-10-23', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (199, 1190, '浜松天王', 18, 24, '', '', '', '2012-10-26', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (200, 1191, '草加花栗', 18, 9, '', '', '', '2012-10-30', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (201, 1192, '今治別宮', 18, 44, '', '', '', '2012-11-05', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (202, 1193, 'Mr.Max湘南藤沢', 18, 21, '', '', '', '2012-11-05', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (203, 1194, '越谷平方', 18, 9, '', '', '', '2012-11-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (204, 1195, '蒲田駅東区役所前本通', 18, 20, '', '', '', '2012-11-19', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (205, 1196, '新守山', 18, 28, '', '', '', '2012-11-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (206, 1197, '川崎生田', 18, 19, '', '', '', '2012-11-28', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (207, 1198, '大野城南ヶ丘', 18, 49, '', '', '', '2012-12-07', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (208, 1199, '川口前川', 18, 7, '', '', '', '2012-12-13', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (209, 1200, '岐阜北方', 18, 25, '', '', '', '2012-12-14', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (210, 1201, '千葉山王町', 18, 14, '', '', '', '2012-12-17', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (211, 1202, '旭川永山', 18, 2, '', '', '', '2012-12-18', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (212, 1203, '稲沢陸田宮前', 18, 25, '', '', '', '2012-12-19', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (213, 1204, '戸塚平戸', 18, 21, '', '', '', '2012-12-26', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (214, 1205, '北見', 18, 2, '', '', '', '2013-01-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (215, 1206, '湘南台', 18, 21, '', '', '', '2013-01-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (216, 1207, '四日市東日野', 18, 29, '', '', '', '2013-01-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (217, 1208, '徳島松茂', 18, 43, '', '', '', '2013-01-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (218, 1209, '1国豊明', 18, 27, '', '', '', '2013-01-29', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (219, 1210, '江戸川松江', 18, 18, '', '', '', '2013-02-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (220, 1214, '日向原町', 18, 51, '', '', '', '2013-02-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (221, 1216, '21号可児', 18, 36, '', '', '', '2013-02-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (222, 1213, '蒲田東邦医大通り', 18, 20, '', '', '', '2013-03-04', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (223, 1218, '岐阜南鶉', 18, 25, '', '', '', '2013-03-04', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (224, 1212, '出雲大塚', 18, 45, '', '', '', '2013-03-11', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (225, 1217, '札幌月寒', 18, 1, '', '', '', '2013-03-11', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (226, 1215, '長岡寺島', 18, 31, '', '', '', '2013-03-13', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (227, 1219, '行徳', 18, 13, '', '', '', '2013-03-13', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (228, 1220, '千葉末広', 18, 14, '', '', '', '2013-03-14', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (229, 1222, '田園調布', 18, 20, '', '', '', '2013-03-22', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (230, 1211, '南足柄', 18, 22, '', '', '', '2013-03-26', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (231, 1223, '日吉', 18, 20, '', '', '', '2013-04-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (232, 1224, '長崎小ヶ倉', 18, 50, '', '', '', '2013-04-02', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (233, 1221, '東広島西条', 18, 46, '', '', '', '2013-04-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (234, 1226, '新発田', 18, 31, '', '', '', '2013-04-11', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (235, 1225, '亀山', 18, 29, '', '', '', '2013-04-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (236, 1228, '湖西', 18, 24, '', '', '', '2013-04-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (237, 1229, '松戸六高台', 18, 13, '', '', '', '2013-04-29', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (238, 1230, '越谷七左', 18, 9, '', '', '', '2013-04-30', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (239, 1231, '松山鷹子', 18, 44, '', '', '', '2013-05-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (240, 1227, '柳井', 18, 47, '', '', '', '2013-05-20', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (241, 1234, '藤枝高洲', 18, 24, '', '', '', '2013-05-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (242, 1233, '旭', 18, 15, '', '', '', '2013-05-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (243, 1235, '浜北', 18, 24, '', '', '', '2013-05-29', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (244, 1236, '徳島石井', 18, 43, '', '', '', '2013-05-31', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (245, 1232, '徳島西新浜', 18, 43, '', '', '', '2013-06-05', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (246, 1237, '木更津請西', 18, 14, '', '', '', '2013-06-11', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (247, 1238, '東久留米前沢', 18, 17, '', '', '', '2013-06-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (248, 1239, '草津新浜', 18, 38, '', '', '', '2013-06-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (249, 1241, '坂井春江', 18, 37, '', '', '', '2013-07-11', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (250, 1242, '港区新川', 18, 28, '', '', '', '2013-07-12', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (251, 1243, '長野篠ノ井', 18, 30, '', '', '', '2013-07-12', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (252, 1244, '中津川', 18, 36, '', '', '', '2013-07-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (253, 1246, '南風原津嘉山', 18, 52, '', '', '', '2013-07-19', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (254, 1247, '喜多方', 18, 6, '', '', '', '2013-07-22', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (255, 1240, '綾川', 18, 43, '', '', '', '2013-07-26', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (256, 1245, '帯広大通', 18, 1, '', '', '', '2013-07-26', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (257, 1248, 'イオン大宮', 18, 7, '', '', '', '2013-08-05', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (258, 1249, '玉城', 18, 29, '', '', '', '2013-08-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (259, 1250, '函館桔梗', 18, 3, '', '', '', '2013-08-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (260, 1251, 'うるま前原', 18, 52, '', '', '', '2013-08-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (261, 1252, 'さくら氏家', 18, 32, '', '', '', '2013-08-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (262, 1255, '横手', 18, 3, '', '', '', '2013-08-29', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (263, 1253, '豊田高岡', 18, 27, '', '', '', '2013-09-03', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (264, 1254, '宇土', 18, 50, '', '', '', '2013-09-05', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (265, 1256, '東近江八日市', 18, 38, '', '', '', '2013-09-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (266, 1257, '盛岡三本柳', 18, 4, '', '', '', '2013-09-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (267, 1258, '上尾', 18, 7, '', '', '', '2013-09-10', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (268, 1260, '南与野', 18, 7, '', '', '', '2013-09-19', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (269, 1261, '練馬関町', 18, 17, '', '', '', '2013-09-20', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (270, 1262, '板橋徳丸', 18, 18, '', '', '', '2013-09-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (271, 1259, '4号白河', 18, 6, '', '', '', '2013-10-03', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (272, 1263, '諫早栗面', 18, 50, '', '', '', '2013-10-04', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (273, 1264, '広島海田', 18, 46, '', '', '', '2013-10-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (274, 1265, '大和郡山下三橋', 18, 39, '', '', '', '2013-10-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (275, 1266, '葛飾水元', 18, 18, '', '', '', '2013-10-15', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (276, 1267, '北谷伊平', 18, 52, '', '', '', '2013-10-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (277, 1268, '静岡IC', 18, 23, '', '', '', '2013-10-29', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (278, 1269, '奈良上牧', 18, 39, '', '', '', '2013-10-29', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (279, 1270, '岐阜則武', 18, 25, '', '', '', '2013-11-05', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (280, 1271, '坂東岩井', 18, 12, '', '', '', '2013-11-08', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (281, 1272, '三鷹北野', 18, 17, '', '', '', '2013-11-11', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (282, 1273, 'イオン明石', 18, 42, '', '', '', '2013-11-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (283, 1275, '金沢松村', 18, 35, '', '', '', '2013-11-28', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (284, 1276, 'テラスウォーク一宮', 18, 25, '', '', '', '2013-12-04', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (285, 1277, '倉敷水江', 18, 45, '', '', '', '2013-12-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (286, 1278, '稲沢平和町', 18, 25, '', '', '', '2013-12-11', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (287, 1279, '松本出川', 18, 30, '', '', '', '2013-12-13', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (288, 1274, '苫小牧日吉', 18, 1, '', '', '', '2013-12-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (289, 1280, '杉並井草', 18, 17, '', '', '', '2013-12-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (290, 1281, '富田林中野町', 18, 40, '', '', '', '2013-12-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (291, 1282, '栗原築館', 18, 4, '', '', '', '2014-01-15', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (292, 1283, '蒲郡竹谷', 18, 26, '', '', '', '2014-01-28', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (293, 1284, '7号能代', 18, 3, '', '', '', '2014-01-28', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (294, 1285, '179号太子', 18, 42, '', '', '', '2014-01-31', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (295, 1286, '東根', 18, 5, '', '', '', '2014-02-06', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (296, 1287, '167号志摩', 18, 29, '', '', '', '2014-02-10', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (297, 1288, '堺草尾', 18, 40, '', '', '', '2014-02-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (298, 1289, '木更津金田', 18, 14, '', '', '', '2014-02-26', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (299, 1290, '高田馬場', 18, 18, '', '', '', '2014-02-26', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (300, 1291, 'イオンタウン長野三輪', 18, 30, '', '', '', '2014-03-07', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (301, 1292, '8号野々市', 18, 35, '', '', '', '2014-03-10', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (302, 1294, 'フォレストモール富士川', 18, 30, '', '', '', '2014-03-20', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (303, 1296, '古河旭町', 18, 12, '', '', '', '2014-04-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (304, 1299, '長崎時津', 18, 50, '', '', '', '2014-04-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (305, 1295, '周南新地', 18, 47, '', '', '', '2014-04-02', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (306, 1297, '垂井', 18, 36, '', '', '', '2014-04-02', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (307, 1298, '御殿場', 18, 23, '', '', '', '2014-04-03', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (308, 1302, '東村山久米川', 18, 17, '', '', '', '2014-04-08', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (309, 1293, '高松十川', 18, 43, '', '', '', '2014-04-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (310, 1301, '富山新庄', 18, 34, '', '', '', '2014-04-11', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (311, 1300, 'ポンテポルタ千住', 18, 18, '', '', '', '2014-04-17', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (312, 1303, '釧路鳥取大通', 18, 1, '', '', '', '2014-04-22', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (313, 1305, '横浜上白根', 18, 19, '', '', '', '2014-04-23', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (314, 1306, 'イオンモール北戸田', 18, 7, '', '', '', '2014-04-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (315, 1304, '常総石下', 18, 12, '', '', '', '2014-05-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (316, 1308, '山鹿鹿本', 18, 50, '', '', '', '2014-05-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (317, 1307, '福山駅家', 18, 45, '', '', '', '2014-05-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (318, 1311, '天童', 18, 5, '', '', '', '2014-05-13', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (319, 1309, '越前', 18, 37, '', '', '', '2014-05-14', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (320, 1310, '北本深井', 18, 8, '', '', '', '2014-05-14', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (321, 1312, '笛吹石和', 18, 30, '', '', '', '2014-05-20', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (322, 1313, '八代', 18, 50, '', '', '', '2014-05-23', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (323, 1314, '千葉土気', 18, 14, '', '', '', '2014-05-26', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (324, 1316, '富岡', 18, 33, '', '', '', '2014-05-30', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (325, 1317, '海老名上河内', 18, 22, '', '', '', '2014-05-30', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (326, 1318, '松阪三雲', 18, 29, '', '', '', '2014-06-03', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (327, 1319, '田川', 18, 48, '', '', '', '2014-06-12', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (328, 1315, '三次', 18, 46, '', '', '', '2014-06-13', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (329, 1322, '松原南新町', 18, 40, '', '', '', '2014-06-13', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (330, 1321, '土岐', 18, 36, '', '', '', '2014-06-18', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (331, 1323, '北茨城', 18, 11, '', '', '', '2014-06-20', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (332, 1324, '和歌山島崎', 18, 41, '', '', '', '2014-06-23', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (333, 1327, 'ららぽーと甲子園', 18, 42, '', '', '', '2014-06-26', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (334, 1325, '加賀', 18, 35, '', '', '', '2014-06-30', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (335, 1326, '56号大洲', 18, 44, '', '', '', '2014-06-30', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (336, 1328, '射水', 18, 34, '', '', '', '2014-07-11', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (337, 1329, '明石魚住', 18, 42, '', '', '', '2014-07-14', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (338, 1330, '熊本嘉島', 18, 50, '', '', '', '2014-07-14', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (339, 1320, '佐倉下志津', 18, 15, '', '', '', '2014-07-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (340, 1331, '門真岸和田', 18, 40, '', '', '', '2014-07-18', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (341, 1332, '相模原下九沢', 18, 16, '', '', '', '2014-07-23', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (342, 1333, 'ニューポートひたちなか', 18, 11, '', '', '', '2014-07-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (343, 1334, '甲府荒川', 18, 30, '', '', '', '2014-07-28', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (344, 1335, '八女蒲原', 18, 49, '', '', '', '2014-07-30', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (345, 1336, '名取杜せきのした', 18, 5, '', '', '', '2014-08-05', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (346, 1337, '十和田', 18, 3, '', '', '', '2014-08-08', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (347, 1338, '鎌倉手広', 18, 21, '', '', '', '2014-08-08', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (348, 1339, '七尾', 18, 35, '', '', '', '2014-08-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (349, 1340, '草津東矢倉', 18, 38, '', '', '', '2014-08-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (350, 1341, '春日部中央', 18, 9, '', '', '', '2014-09-05', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (351, 1342, '奥州水沢', 18, 4, '', '', '', '2014-09-11', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (352, 1343, 'イオンタウン黒崎', 18, 48, '', '', '', '2014-09-11', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (353, 1344, '岩見沢', 18, 2, '', '', '', '2014-09-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (354, 1345, '幸手上高野', 18, 9, '', '', '', '2014-09-18', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (355, 1346, '仙台富谷', 18, 4, '', '', '', '2014-09-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (356, 1347, '海南', 18, 41, '', '', '', '2014-10-15', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (357, 1348, '福島吉倉', 18, 6, '', '', '', '2014-10-17', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (358, 1349, '函館本通', 18, 3, '', '', '', '2014-10-17', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (359, 1351, '足立花畑', 18, 9, '', '', '', '2014-10-22', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (360, 1350, '奈良押熊', 18, 39, '', '', '', '2014-10-23', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (361, 1352, '蟹江', 18, 28, '', '', '', '2014-10-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (362, 1353, '日光今市', 18, 32, '', '', '', '2014-10-29', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (363, 1354, '福山高西', 18, 45, '', '', '', '2014-11-17', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (364, 1355, '岩倉川井町', 18, 27, '', '', '', '2014-11-20', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (365, 1356, '日立金沢', 18, 11, '', '', '', '2014-11-20', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (366, 1358, '姶良加治木', 18, 51, '', '', '', '2014-11-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (367, 1357, '糸満潮平', 18, 52, '', '', '', '2014-12-03', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (368, 1359, '菰野', 18, 29, '', '', '', '2014-12-05', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (369, 1360, '前橋上泉', 18, 33, '', '', '', '2014-12-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (370, 1361, '那須塩原', 18, 32, '', '', '', '2014-12-22', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (371, 1362, '小松', 18, 35, '', '', '', '2014-12-22', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (372, 1363, '都城', 18, 51, '', '', '', '2014-12-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (373, 1364, '佐久中込', 18, 30, '', '', '', '2015-01-28', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (374, 1365, '伊丹昆陽', 18, 42, '', '', '', '2015-02-05', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (375, 1366, '青森石江', 18, 3, '', '', '', '2015-02-10', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (376, 1367, '小牧下末', 18, 27, '', '', '', '2015-02-12', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (377, 1368, 'つがる柏', 18, 3, '', '', '', '2015-02-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (378, 1369, '田原', 18, 26, '', '', '', '2015-03-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (379, 1371, '箕輪', 18, 30, '', '', '', '2015-03-18', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (380, 1372, '稲敷江戸崎', 18, 12, '', '', '', '2015-03-19', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (381, 1373, '郡山堤', 18, 6, '', '', '', '2015-03-20', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (382, 1374, '富士見羽沢', 18, 10, '', '', '', '2015-03-30', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (383, 1370, '君津東坂田', 18, 14, '', '', '', '2015-04-08', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (384, 1376, '加西', 18, 42, '', '', '', '2015-04-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (385, 1377, '那覇古島', 18, 52, '', '', '', '2015-04-20', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (386, 1378, 'つくば研究学園', 18, 12, '', '', '', '2015-04-20', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (387, 1379, '仙台六丁の目', 18, 5, '', '', '', '2015-04-30', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (388, 1380, '一関', 18, 4, '', '', '', '2015-05-12', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (389, 1381, '桜井東新堂', 18, 39, '', '', '', '2015-05-22', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (390, 1382, '所沢下安松', 18, 10, '', '', '', '2015-05-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (391, 1383, '駒ヶ根', 18, 30, '', '', '', '2015-05-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (392, 1384, '丸亀土器', 18, 43, '', '', '', '2015-05-28', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (393, 1385, '三沢', 18, 3, '', '', '', '2015-06-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (394, 1386, '姫路野里', 18, 42, '', '', '', '2015-06-05', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (395, 1375, '黒部', 18, 34, '', '', '', '2015-06-12', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (396, 1387, '南国', 18, 44, '', '', '', '2015-06-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (397, 1388, '二本松安達', 18, 6, '', '', '', '2015-06-29', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (398, 1389, '三条', 18, 31, '', '', '', '2015-07-06', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (399, 1390, '美濃加茂', 18, 36, '', '', '', '2015-07-13', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (400, 1391, '仙台中野', 18, 5, '', '', '', '2015-07-15', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (401, 1392, '小林', 18, 51, '', '', '', '2015-07-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (402, 1393, '滑川', 18, 34, '', '', '', '2015-07-22', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (403, 1394, '北上藤沢', 18, 4, '', '', '', '2015-08-03', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (404, 1395, '燕吉田', 18, 31, '', '', '', '2015-08-06', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (405, 1396, '一宮木曽川', 18, 25, '', '', '', '2015-08-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (406, 1397, '長浜', 18, 37, '', '', '', '2015-08-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (407, 1398, '札幌桑園', 18, 1, '', '', '', '2015-08-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (408, 1400, '福島矢野目', 18, 6, '', '', '', '2015-09-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (409, 1401, '中城', 18, 52, '', '', '', '2015-09-14', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (410, 1402, 'ふじみ野', 18, 10, '', '', '', '2015-09-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (411, 1403, '4号柴田', 18, 5, '', '', '', '2015-09-28', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (412, 1404, '加古川平岡', 18, 42, '', '', '', '2015-09-28', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (413, 1405, '尾張旭', 18, 28, '', '', '', '2015-09-30', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (414, 1406, '上越', 18, 31, '', '', '', '2015-10-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (415, 1399, '砺波', 18, 34, '', '', '', '2015-10-14', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (416, 1407, '泉大津松之浜', 18, 41, '', '', '', '2015-10-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (417, 1409, '横浜立場', 18, 21, '', '', '', '2015-10-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (418, 1410, 'あきる野秋川', 18, 16, '', '', '', '2015-10-29', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (419, 1411, '日南', 18, 51, '', '', '', '2015-10-29', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (420, 1412, '都島本通', 18, 40, '', '', '', '2015-11-02', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (421, 1413, '有田', 18, 41, '', '', '', '2015-11-11', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (422, 1414, '川崎野川', 18, 20, '', '', '', '2015-11-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (423, 1416, '西尾', 18, 26, '', '', '', '2015-11-18', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (424, 1420, '坂戸にっさい', 18, 8, '', '', '', '2015-11-18', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (425, 1419, 'イオンモール常滑', 18, 28, '', '', '', '2015-12-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (426, 1417, '直方感田', 18, 48, '', '', '', '2015-12-02', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (427, 1418, '会津若松門田', 18, 6, '', '', '', '2015-12-02', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (428, 1421, '米子', 18, 45, '', '', '', '2015-12-14', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (429, 1423, '川越上寺山', 18, 10, '', '', '', '2015-12-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (430, 1424, '銚子', 18, 15, '', '', '', '2015-12-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (431, 1425, '呉焼山', 18, 46, '', '', '', '2016-01-13', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (432, 1426, '帯広西', 18, 1, '', '', '', '2016-01-15', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (433, 1427, '金沢神谷内', 18, 35, '', '', '', '2016-01-28', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (434, 1428, '茅ヶ崎松が丘', 18, 21, '', '', '', '2016-01-28', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (435, 1429, '高知河ノ瀬', 18, 44, '', '', '', '2016-01-29', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (436, 1430, '橋本隅田町', 18, 41, '', '', '', '2016-02-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (437, 1431, 'マーケットスクエア川崎イースト', 18, 20, '', '', '', '2016-02-18', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (438, 1415, '名護', 18, 52, '', '', '', '2016-02-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (439, 1433, '博多千代', 18, 49, '', '', '', '2016-03-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (440, 1422, '港北インター', 18, 20, '', '', '', '2016-03-18', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (441, 1434, '横浜上郷', 18, 21, '', '', '', '2016-03-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (442, 1435, '知多新知', 18, 27, '', '', '', '2016-04-11', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (443, 1432, '伊万里', 18, 49, '', '', '', '2016-04-18', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (444, 1436, '山科椥辻', 18, 38, '', '', '', '2016-04-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (445, 1437, '行橋', 18, 48, '', '', '', '2016-04-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (446, 1438, '名古屋東茶屋', 18, 28, '', '', '', '2016-05-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (447, 1439, '神栖', 18, 11, '', '', '', '2016-05-24', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (448, 1440, '練馬土支田', 18, 17, '', '', '', '2016-05-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (449, 1441, '福岡曰佐', 18, 49, '', '', '', '2016-06-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (450, 1442, '釧路愛国', 18, 1, '', '', '', '2016-06-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (451, 1443, '静岡平和', 18, 23, '', '', '', '2016-07-14', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (452, 1444, '佐野赤坂', 18, 33, '', '', '', '2016-07-22', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (453, 1445, '名古屋鳴子', 18, 27, '', '', '', '2016-07-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (454, 1446, '広島八木', 18, 46, '', '', '', '2016-08-04', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (455, 1447, '石巻蛇田', 18, 5, '', '', '', '2016-09-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (456, 1448, '千歳', 18, 1, '', '', '', '2016-09-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (457, 1449, '茨木新和町', 18, 40, '', '', '', '2016-09-23', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (458, 1450, '三原', 18, 46, '', '', '', '2016-10-17', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (459, 1451, '洲本', 18, 42, '', '', '', '2016-10-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (460, 1452, '米沢', 18, 6, '', '', '', '2016-11-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (461, 1453, '沖縄登川', 18, 52, '', '', '', '2016-11-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (462, 1454, '神戸上津台', 18, 42, '', '', '', '2016-12-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (463, 1455, '横浜菊名', 18, 20, '', '', '', '2016-12-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (464, 1456, '島田', 18, 24, '', '', '', '2017-01-23', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (465, 1457, '豊中小曽根', 18, 40, '', '', '', '2017-01-30', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (466, 1458, '久留米南町', 18, 49, '', '', '', '2017-01-30', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (467, 1459, 'ウニクス伊奈', 18, 7, '', '', '', '2017-02-03', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (468, 1460, '大和つきみ野', 18, 19, '', '', '', '2017-02-22', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (469, 1461, '八尾東久宝寺', 18, 40, '', '', '', '2017-03-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (470, 1462, '垂水多聞', 18, 42, '', '', '', '2017-03-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (471, 1463, '前橋元総社', 18, 33, '', '', '', '2017-03-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (472, 1464, '平塚南原', 18, 22, '', '', '', '2017-03-31', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (473, 1465, '金閣寺', 18, 38, '', '', '', '2017-03-31', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (474, 1466, '町田野津田', 18, 19, '', '', '', '2017-04-06', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (475, 1467, 'マチニワ豊川', 18, 26, '', '', '', '2017-04-28', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (476, 1468, '下松', 18, 47, '', '', '', '2017-05-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (477, 1469, '幕張IC', 18, 15, '', '', '', '2017-05-12', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (478, 1470, '横浜笹下', 18, 21, '', '', '', '2017-05-26', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (479, 1471, '新潟新津', 18, 31, '', '', '', '2017-05-29', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (480, 1472, '小郡大保', 18, 49, '', '', '', '2017-06-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (481, 1473, '西東京北町', 18, 17, '', '', '', '2017-06-14', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (482, 1474, '広島宇品', 18, 46, '', '', '', '2017-06-26', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (483, 1475, '朝霞溝沼', 18, 10, '', '', '', '2017-08-07', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (484, 1476, '大宮ラクーン', 18, 7, '', '', '', '2017-08-31', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (485, 1477, '豊田御立町', 18, 27, '', '', '', '2017-09-20', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (486, 1478, '旭川東光', 18, 2, '', '', '', '2017-09-22', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (487, 1479, '門真殿島', 18, 40, '', '', '', '2017-09-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (488, 1480, '益田', 18, 47, '', '', '', '2017-10-02', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (489, 1481, '421号東員', 18, 29, '', '', '', '2017-10-23', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (490, 1482, '恵庭', 18, 1, '', '', '', '2017-10-23', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (491, 1483, '佐世保中里', 18, 49, '', '', '', '2017-10-30', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (492, 1484, '広島楽々園', 18, 46, '', '', '', '2017-11-02', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (493, 1485, 'スーパービバホーム豊洲', 18, 18, '', '', '', '2017-11-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (494, 1486, '東新小岩', 18, 18, '', '', '', '2017-12-06', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (495, 1487, '三鷹野崎', 18, 17, '', '', '', '2017-12-13', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (496, 1488, '南大沢駅前', 18, 16, '', '', '', '2018-01-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (497, 1489, '松戸小金原', 18, 13, '', '', '', '2018-02-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (498, 1490, '下妻', 18, 12, '', '', '', '2018-03-05', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (499, 1491, '座間ひばりが丘', 18, 19, '', '', '', '2018-03-14', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (500, 1492, '南船橋', 18, 15, '', '', '', '2018-03-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (501, 1493, '葛城東室', 18, 39, '', '', '', '2018-03-19', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (502, 1494, '新城', 18, 26, '', '', '', '2018-06-20', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (503, 1495, '熊本佐土原', 18, 50, '', '', '', '2018-06-20', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (504, 1496, '新百合ヶ丘駅前', 18, 19, '', '', '', '2018-06-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (505, 1497, '東海大学前', 18, 22, '', '', '', '2018-08-08', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (506, 1498, '武蔵野八幡町', 18, 17, '', '', '', '2018-09-19', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (507, 1499, '武蔵村山', 18, 16, '', '', '', '2018-09-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (508, 2500, '岩国', 18, 47, '', '', '', '2018-10-22', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (509, 2501, '鶴見中央', 18, 20, '', '', '', '2018-12-05', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (510, 2502, '泉佐野鶴原', 18, 41, '', '', '', '2018-12-06', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (511, 2503, '松戸新田駅北', 18, 13, '', '', '', '2019-02-07', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (512, 2504, '若松ひびきの', 18, 48, '', '', '', '2019-04-19', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (513, 2505, '春日井大和通', 18, 28, '', '', '', '2019-04-22', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (514, 2506, '相模原光が丘', 18, 16, '', '', '', '2019-05-22', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (515, 2507, '天理', 18, 39, '', '', '', '2019-05-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (516, 2508, '西条周布', 18, 44, '', '', '', '2019-08-08', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (517, 2509, '江別', 18, 2, '', '', '', '2019-09-12', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (518, 2510, '横浜岡津', 18, 21, '', '', '', '2019-09-17', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (519, 2511, '小樽築港', 18, 2, '', '', '', '2019-11-01', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (520, 2512, 'フォレストモール木津川', 18, 39, '', '', '', '2019-11-22', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (521, 2513, '京都洛西', 18, 38, '', '', '', '2019-12-09', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (522, 2514, '足立東和', 18, 18, '', '', '', '2020-01-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (523, 2515, '練馬春日町', 18, 17, '', '', '', '2020-02-12', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (524, 2516, '市川菅野', 18, 13, '', '', '', '2020-03-23', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (525, 2517, '熊本東バイパス', 18, 50, '', '', '', '2020-04-23', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (526, 2518, '船橋習志野台', 18, 15, '', '', '', '2020-04-27', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (527, 2520, '川崎下麻生', 18, 19, '', '', '', '2020-06-25', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (528, 2519, '羽村小作台', 18, 16, '', '', '', '2020-06-26', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (529, 2522, '南相馬原町', 18, 5, '', '', '', '2020-08-21', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (530, 2521, '飯能', 18, 10, '', '', '', '2020-09-03', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (531, 2523, '蕨', 18, 7, '', '', '', '2020-09-18', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (532, 2524, '酒田', 18, 5, '', '', '', '2020-10-02', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (533, 2525, '港北高田', 18, 20, '', '', '', '2020-10-16', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (534, 2526, '那覇小禄', 18, 52, '', '', '', '2020-11-05', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (535, 2527, '東大宮', 18, 7, '', '', '', '2020-11-13', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (536, 2528, '42号御坊', 18, 41, '', '', '', '2020-12-11', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (537, 2530, '所沢トコトコスクエア', 18, 10, '', '', '', '2020-12-11', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (538, 2529, '小松島', 18, 43, '', '', '', '2020-12-18', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (539, 2531, 'オーケーみなとみらい', 18, 19, '', '', '', '2021-01-08', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (540, 2532, '蒲田駅西口', 18, 20, '', '', '', '2021-01-14', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (541, 999999, 'テスト店舗', 18, 53, NULL, '053-39-4393', '053-37-4392', '2021-01-20', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (542, 2538, '喜連瓜破', 18, 40, NULL, NULL, NULL, '2021-04-06', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (543, 2539, '中間', 18, 48, NULL, NULL, NULL, '2021-04-10', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (544, 2540, '松井山手', 18, 38, NULL, '059-39-4393', '053-09-4393', '2021-05-20', '2021-07-16 13:43:50', '2021-07-16 13:46:16');
INSERT INTO `shops` VALUES (545, 999998, 'テスト店舗', 2, 58, NULL, '053-39-4293', '053-19-4393', '2021-05-29', '2021-07-16 13:43:50', '2021-07-16 13:46:16');

-- ----------------------------
-- Table structure for sub_categories
-- ----------------------------
DROP TABLE IF EXISTS `sub_categories`;
CREATE TABLE `sub_categories`  (
  `sub_category_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sub_category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`sub_category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sub_categories
-- ----------------------------
INSERT INTO `sub_categories` VALUES (1, 'ウォークイン冷蔵庫', 1);
INSERT INTO `sub_categories` VALUES (2, 'リーチイン冷蔵庫', 1);
INSERT INTO `sub_categories` VALUES (3, 'ドロアー冷蔵庫', 1);
INSERT INTO `sub_categories` VALUES (4, 'ドロアー冷凍庫', 1);
INSERT INTO `sub_categories` VALUES (5, 'ウォークイン冷凍庫', 1);
INSERT INTO `sub_categories` VALUES (6, 'リーチイン冷凍庫', 1);
INSERT INTO `sub_categories` VALUES (7, '製氷機', 1);
INSERT INTO `sub_categories` VALUES (8, '冷蔵ショーケース', 1);
INSERT INTO `sub_categories` VALUES (9, 'アイスストッカー', 1);
INSERT INTO `sub_categories` VALUES (10, 'フライヤー', 1);
INSERT INTO `sub_categories` VALUES (11, 'スープジャー', 1);
INSERT INTO `sub_categories` VALUES (12, '電磁調理器', 1);
INSERT INTO `sub_categories` VALUES (13, '電子レンジ', 1);
INSERT INTO `sub_categories` VALUES (14, '炊飯器', 1);
INSERT INTO `sub_categories` VALUES (15, 'ウォーマー類', 1);
INSERT INTO `sub_categories` VALUES (16, '保温ジャー', 1);
INSERT INTO `sub_categories` VALUES (17, 'コーヒーマシン', 1);
INSERT INTO `sub_categories` VALUES (18, 'おろし機', 1);
INSERT INTO `sub_categories` VALUES (19, '飯盛機（ライスロボ）', 1);
INSERT INTO `sub_categories` VALUES (20, '洗米機', 1);
INSERT INTO `sub_categories` VALUES (21, '食器洗浄機', 1);
INSERT INTO `sub_categories` VALUES (22, 'コールドテーブル・ドロワーテーブル', 1);
INSERT INTO `sub_categories` VALUES (23, 'ネタケース', 1);
INSERT INTO `sub_categories` VALUES (24, '冷水機', 1);
INSERT INTO `sub_categories` VALUES (25, '温蔵庫', 1);
INSERT INTO `sub_categories` VALUES (26, 'その他厨房機器', 1);
INSERT INTO `sub_categories` VALUES (27, 'ガスレンジ', 1);
INSERT INTO `sub_categories` VALUES (28, 'パスタスチーマ', 1);
INSERT INTO `sub_categories` VALUES (29, '酢合わせ機', 1);
INSERT INTO `sub_categories` VALUES (30, '巻きロボ', 1);
INSERT INTO `sub_categories` VALUES (31, '軍艦ロボ', 1);
INSERT INTO `sub_categories` VALUES (32, '巻きカッター', 1);
INSERT INTO `sub_categories` VALUES (33, 'シャリロボ', 1);
INSERT INTO `sub_categories` VALUES (34, 'レーン', 1);
INSERT INTO `sub_categories` VALUES (35, '給茶器', 1);
INSERT INTO `sub_categories` VALUES (36, '下げ搬送', 1);
INSERT INTO `sub_categories` VALUES (37, '蒸し器', 1);
INSERT INTO `sub_categories` VALUES (38, '解凍機', 1);
INSERT INTO `sub_categories` VALUES (39, 'シャリ玉整列機', 1);
INSERT INTO `sub_categories` VALUES (40, 'タイマー', 1);
INSERT INTO `sub_categories` VALUES (41, '皿洗浄機', 1);
INSERT INTO `sub_categories` VALUES (42, 'マルチディスペンサー', 1);
INSERT INTO `sub_categories` VALUES (43, '空皿搬送用レーン', 1);
INSERT INTO `sub_categories` VALUES (44, '給水・給水管', 2);
INSERT INTO `sub_categories` VALUES (45, '受水槽', 2);
INSERT INTO `sub_categories` VALUES (46, 'シンク／シンクふた', 2);
INSERT INTO `sub_categories` VALUES (47, '排水・排水管', 2);
INSERT INTO `sub_categories` VALUES (48, '排水溝・グレーチング', 2);
INSERT INTO `sub_categories` VALUES (49, 'グリストラップ', 2);
INSERT INTO `sub_categories` VALUES (50, '浄化槽', 2);
INSERT INTO `sub_categories` VALUES (51, 'トイレ', 2);
INSERT INTO `sub_categories` VALUES (52, '手洗い器', 2);
INSERT INTO `sub_categories` VALUES (53, '手乾燥機・エアータオル', 2);
INSERT INTO `sub_categories` VALUES (54, '浄水器', 2);
INSERT INTO `sub_categories` VALUES (55, '電気設備', 3);
INSERT INTO `sub_categories` VALUES (56, '照明器具', 3);
INSERT INTO `sub_categories` VALUES (57, '受電設備', 3);
INSERT INTO `sub_categories` VALUES (58, 'エアコン', 4);
INSERT INTO `sub_categories` VALUES (59, '換気扇', 4);
INSERT INTO `sub_categories` VALUES (60, 'ダクト', 4);
INSERT INTO `sub_categories` VALUES (61, '給排気', 4);
INSERT INTO `sub_categories` VALUES (62, '冷蔵ゴミ庫', 4);
INSERT INTO `sub_categories` VALUES (63, '給湯器（湯沸し器）', 5);
INSERT INTO `sub_categories` VALUES (64, 'ガス器具・ガス設備', 5);
INSERT INTO `sub_categories` VALUES (65, 'ダムウェダー', 6);
INSERT INTO `sub_categories` VALUES (66, 'エレベーター', 6);
INSERT INTO `sub_categories` VALUES (67, 'ドア', 7);
INSERT INTO `sub_categories` VALUES (68, '鍵・シリンダー', 7);
INSERT INTO `sub_categories` VALUES (69, '窓・サッシ', 7);
INSERT INTO `sub_categories` VALUES (70, '内装（壁・床・天井・クロス他）', 8);
INSERT INTO `sub_categories` VALUES (71, '外装（屋根・外壁・雨どい他）', 8);
INSERT INTO `sub_categories` VALUES (72, 'ブラインド・ロールスクリーン', 8);
INSERT INTO `sub_categories` VALUES (73, '家具（イス・テーブル・ソファ他）', 8);
INSERT INTO `sub_categories` VALUES (74, '建物', 8);
INSERT INTO `sub_categories` VALUES (75, 'ＤＴ', 8);
INSERT INTO `sub_categories` VALUES (76, '駐車場', 9);
INSERT INTO `sub_categories` VALUES (77, '植栽剪定', 9);
INSERT INTO `sub_categories` VALUES (78, 'バリカー', 9);
INSERT INTO `sub_categories` VALUES (79, '車止め', 9);
INSERT INTO `sub_categories` VALUES (80, '側溝', 9);
INSERT INTO `sub_categories` VALUES (81, 'フェンス', 9);
INSERT INTO `sub_categories` VALUES (82, 'ブロック塀', 9);
INSERT INTO `sub_categories` VALUES (83, 'その他外構関連', 9);
INSERT INTO `sub_categories` VALUES (84, '看板（ポール・ファサード・イン他）', 10);
INSERT INTO `sub_categories` VALUES (85, '懸垂幕', 10);
INSERT INTO `sub_categories` VALUES (86, '管球交換', 10);
INSERT INTO `sub_categories` VALUES (87, 'テント', 10);
INSERT INTO `sub_categories` VALUES (88, '有線', 11);
INSERT INTO `sub_categories` VALUES (89, '電話・ＦＡＸ', 11);
INSERT INTO `sub_categories` VALUES (90, 'ラベラー', 11);
INSERT INTO `sub_categories` VALUES (91, '入店センサー', 11);
INSERT INTO `sub_categories` VALUES (92, 'ＡＣＣＳ', 11);
INSERT INTO `sub_categories` VALUES (93, 'ベルスター', 11);
INSERT INTO `sub_categories` VALUES (94, 'モニター・ＴＶ', 11);
INSERT INTO `sub_categories` VALUES (95, 'タッチパネル', 11);
INSERT INTO `sub_categories` VALUES (96, 'マイク・インカム', 11);
INSERT INTO `sub_categories` VALUES (97, 'POS', 11);
INSERT INTO `sub_categories` VALUES (98, 'ハンディ', 11);
INSERT INTO `sub_categories` VALUES (99, 'ペッパー君', 11);
INSERT INTO `sub_categories` VALUES (100, '害虫駆除', 12);
INSERT INTO `sub_categories` VALUES (101, 'エアコン清掃', 13);
INSERT INTO `sub_categories` VALUES (102, 'ダクト清掃', 13);
INSERT INTO `sub_categories` VALUES (103, 'グリストラップ清掃', 13);
INSERT INTO `sub_categories` VALUES (104, 'フロア清掃', 13);
INSERT INTO `sub_categories` VALUES (105, '防災設備（消火器他）', 14);
INSERT INTO `sub_categories` VALUES (106, '廃油', 15);
INSERT INTO `sub_categories` VALUES (107, '産業廃棄物', 15);
INSERT INTO `sub_categories` VALUES (108, '粗大ごみ', 15);
INSERT INTO `sub_categories` VALUES (109, '掃除機', 16);
INSERT INTO `sub_categories` VALUES (110, '洗濯機', 16);
INSERT INTO `sub_categories` VALUES (111, 'その他', 16);

-- ----------------------------
-- Table structure for temp_districts
-- ----------------------------
DROP TABLE IF EXISTS `temp_districts`;
CREATE TABLE `temp_districts`  (
  `ds_code` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tel` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of temp_districts
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `business_category_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL COMMENT '権限 1:Admin 10:GM 20:DM 30:BM 50:Staff',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `users_shop_id_foreign`(`shop_id`) USING BTREE,
  INDEX `users_business_category_id_foreign`(`business_category_id`) USING BTREE,
  INDEX `users_role_id_foreign`(`role_id`) USING BTREE,
  INDEX `staff_id`(`staff_id`) USING BTREE,
  CONSTRAINT `users_business_category_id_foreign` FOREIGN KEY (`business_category_id`) REFERENCES `business_categories` (`business_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`shop_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 635 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '1', '管理者', 'admin@admin', NULL, 'isI6zCDqH8XQKnZIYTb6lJj0jFe4s3qz9HfsmV0JSkgWYOEIGWiZFin7NtuE', NULL, '2021-09-16 12:15:47', NULL, 1, 1);
INSERT INTO `users` VALUES (15, '004576', '髙木　裕之', 'hiroyuki.takagi@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 10);
INSERT INTO `users` VALUES (16, '004544', '町野　岳', 'gaku.machino@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 10);
INSERT INTO `users` VALUES (17, '003288', '塚原　裕貴', 'yuuki.tsukahara@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 10);
INSERT INTO `users` VALUES (18, '004486', '髙橋　誠', 'makoto.takahashi@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 20);
INSERT INTO `users` VALUES (19, '004550', '石橋　健治', 'kenji.ishibashi@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 20);
INSERT INTO `users` VALUES (20, '003262', '松嶋　信介', 'shinsuke.matsushima@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 20);
INSERT INTO `users` VALUES (21, '004111', '竹浪　一行', 'k-takenami@zensho.com', NULL, NULL, NULL, NULL, NULL, 18, 20);
INSERT INTO `users` VALUES (22, '004379', '澤成　智英', 'tomohide.sawanari@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 20);
INSERT INTO `users` VALUES (23, '003179', '佐藤　智治', 'tomoharu.satou@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 20);
INSERT INTO `users` VALUES (24, '003270', '井上　裕', 'hiroshi.inoue@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 20);
INSERT INTO `users` VALUES (25, '004392', '上赤　雅人', 'masato.kamiaka@hamazushi.com', NULL, 'df805u1ZK05we2PktezNLb31LqjyuWHkQrOZ65bZVYrshJ6kRbQawv51ZEGX', NULL, '2021-03-10 23:36:00', NULL, 18, 20);
INSERT INTO `users` VALUES (26, '004474', '石田　康夫', 'yasuo.ishida@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 20);
INSERT INTO `users` VALUES (27, '003087', '鬼澤　貴裕', 'takahiro.onizawa@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 20);
INSERT INTO `users` VALUES (28, '003772', '小林　洋介', 'yousuke.kobayashi@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 20);
INSERT INTO `users` VALUES (29, '004565', '斉藤　幸平', 'kouhei.saitou@hamazushi.com', NULL, 'SwEmoVvFOGXPH199DiBtvXek7gBLnuGnuIkngaDyfkAVg5lI8gC6YbRJ03sQ', NULL, '2021-03-02 13:31:37', NULL, 18, 30);
INSERT INTO `users` VALUES (30, '027008', '関澤　進也', 'shinya.sekizawa@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (31, '004569', '佐々木　昌將', 'masayuki.sasaki@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (32, '003285', '高野　芳彰', 'yoshiaki.kouno@hamazushi.com', NULL, 'kOXDUJwFi5z3SVxYt1qYJ19GV5P4FDkojUbdW0C0S0bWJ6LY73s2xI7Ucb2I', NULL, '2021-03-02 23:09:15', NULL, 18, 30);
INSERT INTO `users` VALUES (33, '004571', '佐藤　裕布', 'yuu.satou@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (34, '004562', '木村　良太', 'ryouta.kimura@hamazushi.com', NULL, 'zM0Kwn71KlclEG46YDuLqbXneqybq6oMLeLSRgfXsGbOHDXfI57uzC2Dl0KY', NULL, '2021-03-15 14:33:56', NULL, 18, 30);
INSERT INTO `users` VALUES (35, '004097', '竹村　宜晃', 'yoshiaki.takemura@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (36, '003181', '鈴木　高行', 'takayuki.suzuki@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (37, '004463', '山﨑　健太郎', 'kentarou.yamazaki@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (38, '003212', '赤沢　準', 'jun.akazawa@hamazushi.com', NULL, 'HC6px8ack8rQbWFG2jqvtAKcF3pN1YwsF1h3fahujuCW9Z0k9Vos6COVO4oF', NULL, '2021-03-06 00:03:31', NULL, 18, 30);
INSERT INTO `users` VALUES (39, '003437', '猪狩　直志', 'naoyuki.igari@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (40, '003261', '八重樫　邦夫', 'kunio.yaegashi@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (41, '004396', '森川　明久', 'akihisa.morikawa@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (42, '003428', '森　裕棋', 'hiroki.mori@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (43, '004088', '小堀　公寛', 'masahiro.kobori@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (44, '003177', '池田　徹', 'tooru.ikeda@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (45, '004086', '新町　健一', 'kenichi.shinmachi@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (46, '003197', '白幡　嘉伸', 'yoshinobu.shirahata@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (47, '003276', '菊池　孝展', 'takanobu.kikuchi@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (48, '004795', '三浦　一晃', 'kazuaki.miura@hamazushi.com', NULL, 'niir6EXaqaeCY3DQ3P89qrdkZnPNZr8IhTzl1fIEUF673wALoY4VeOo821kC', NULL, '2021-03-02 23:23:13', NULL, 18, 30);
INSERT INTO `users` VALUES (49, '004091', '小松　修平', 'shuuhei.komatsu@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (50, '003178', '米嶋　洋輝', 'hiroki.yoneshima@hamazushi.com', NULL, 'OrcuEy5nd3LYCfM6Qa72GaWf8CkbQGNyUlC3z7juarOPpF2dqWJeajxOYImq', NULL, '2021-03-10 23:37:06', NULL, 18, 30);
INSERT INTO `users` VALUES (51, '023794', '高井　国夫', 'kunio.takai@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (52, '095835', '磯　慶多', 'keita.iso@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (53, '004654', '香西　成人', 'naruhito.kouzai@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (54, '025349', '細川　智永', 'chie.hosokawa@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (55, '004408', '奥谷　俊也', 'toshiya.okutani@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (56, '004594', '山田　克瑛', 'katsuaki.yamada@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (57, '004471', '角南　慶卓', 'keita.sunami@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (58, '003195', '根本　浩行', 'hiroyuki.nemoto@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (59, '004528', '濱中　雄大', 'yuudai.hamanaka@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (60, '015149', '並木　孝憲', 'takanori.namiki@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (61, '004384', '野村　学', 'manabu.nomura@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (62, '004549', '石井　和幸', 'kazuyuki.ishii@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (63, '003174', '根岸　将史', 'masafumi.negishi@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (64, '003404', '濵口　純', 'jun.hamaguchi@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (65, '004667', '田中　博之', 'hiroyuki.tanaka@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (66, '003284', '新井　雅夫', 'masao.arai@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (67, '004705', '芝田　朋和', 'tomokazu.shibata@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (68, '004506', '金城　直人', 'naoto.kaneshiro@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (69, '004508', '桐畑　智樹', 'tomoki.kirihata@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (70, '003277', '有馬　拓治', 'takuji.arima@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (71, '092042', '井門　晃子', 'akiko.ikado@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (72, '004074', '吉田  大智', 'daichi.yoshida@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (73, '004387', '山下　直人', 'naoto.yamashita@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (74, '004428', '中堂　正美', 'masami.nakadou@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (75, '003328', '三浦  航平', 'kouhei.miura@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (76, '073430', '前嶋　竜二', 'ryuuji.maeshima@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (77, '004353', '小池　裕之', 'hiroyuki.koike@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (78, '004570', '佐藤　昭宏', 'akihiro.satou@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (79, '004075', '吉村　啓佐', 'keisuke.yoshimura@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (80, '003283', '與儀　勇人', 'hayato.yogi@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (81, '001408', '足利ユーザー', 'HS1408dummy@hamazushi.com', NULL, 'MtIbtiZmXLteLvBTrdzIRoPHtm9PGfQxjHjwwgSqS3st0nnRV8AQRte7eSKB', NULL, '2021-03-02 23:20:45', 11, 18, 50);
INSERT INTO `users` VALUES (82, '001501', '竜ヶ崎ユーザー', 'HS1501dummy@hamazushi.com', NULL, '', NULL, NULL, 12, 18, 50);
INSERT INTO `users` VALUES (83, '001503', '駒込白山ユーザー', 'HS1503dummy@hamazushi.com', NULL, '', NULL, NULL, 13, 18, 50);
INSERT INTO `users` VALUES (84, '001504', '阿見住吉ユーザー', 'HS1504dummy@hamazushi.com', NULL, '', NULL, NULL, 14, 18, 50);
INSERT INTO `users` VALUES (85, '001508', '浦和ユーザー', 'HS1508dummy@hamazushi.com', NULL, '', NULL, NULL, 15, 18, 50);
INSERT INTO `users` VALUES (86, '001502', '真岡ユーザー', 'HS1502dummy@hamazushi.com', NULL, '', NULL, NULL, 16, 18, 50);
INSERT INTO `users` VALUES (87, '001507', '焼津ユーザー', 'HS1507dummy@hamazushi.com', NULL, '', NULL, NULL, 17, 18, 50);
INSERT INTO `users` VALUES (88, '001506', '宇都宮IPユーザー', 'HS1506dummy@hamazushi.com', NULL, '', NULL, NULL, 18, 18, 50);
INSERT INTO `users` VALUES (89, '001505', 'つくば小野崎ユーザー', 'HS1505dummy@hamazushi.com', NULL, '', NULL, NULL, 19, 18, 50);
INSERT INTO `users` VALUES (90, '001510', '栃木駅前ユーザー', 'HS1510dummy@hamazushi.com', NULL, '', NULL, NULL, 20, 18, 50);
INSERT INTO `users` VALUES (91, '001511', '石岡ユーザー', 'HS1511dummy@hamazushi.com', NULL, '', NULL, NULL, 21, 18, 50);
INSERT INTO `users` VALUES (92, '001512', 'ひたちなか田彦ユーザー', 'HS1512dummy@hamazushi.com', NULL, '', NULL, NULL, 22, 18, 50);
INSERT INTO `users` VALUES (93, '001516', 'イオンタウン富士南ユーザー', 'HS1516dummy@hamazushi.com', NULL, '', NULL, NULL, 23, 18, 50);
INSERT INTO `users` VALUES (94, '001513', '水戸内原ユーザー', 'HS1513dummy@hamazushi.com', NULL, '', NULL, NULL, 24, 18, 50);
INSERT INTO `users` VALUES (95, '001514', '市原五井ユーザー', 'HS1514dummy@hamazushi.com', NULL, '', NULL, NULL, 25, 18, 50);
INSERT INTO `users` VALUES (96, '001515', '宇都宮今泉ユーザー', 'HS1515dummy@hamazushi.com', NULL, '', NULL, NULL, 26, 18, 50);
INSERT INTO `users` VALUES (97, '001519', '町田小山ヶ丘ユーザー', 'HS1519dummy@hamazushi.com', NULL, '', NULL, NULL, 27, 18, 50);
INSERT INTO `users` VALUES (98, '001657', 'フレスポ八潮ユーザー', 'HS1657dummy@hamazushi.com', NULL, '', NULL, NULL, 28, 18, 50);
INSERT INTO `users` VALUES (99, '001647', '茂原高師台ユーザー', 'HS1647dummy@hamazushi.com', NULL, '', NULL, NULL, 29, 18, 50);
INSERT INTO `users` VALUES (100, '001650', 'イオンモール大曲ユーザー', 'HS1650dummy@hamazushi.com', NULL, '', NULL, NULL, 30, 18, 50);
INSERT INTO `users` VALUES (101, '001646', 'ララガーデン川口ユーザー', 'HS1646dummy@hamazushi.com', NULL, '', NULL, NULL, 31, 18, 50);
INSERT INTO `users` VALUES (102, '001661', '東松山ユーザー', 'HS1661dummy@hamazushi.com', NULL, '', NULL, NULL, 32, 18, 50);
INSERT INTO `users` VALUES (103, '001658', '館山八幡ユーザー', 'HS1658dummy@hamazushi.com', NULL, '', NULL, NULL, 33, 18, 50);
INSERT INTO `users` VALUES (104, '001518', '成田飯仲ユーザー', 'HS1518dummy@hamazushi.com', NULL, '', NULL, NULL, 34, 18, 50);
INSERT INTO `users` VALUES (105, '001663', '常陸大宮ユーザー', 'HS1663dummy@hamazushi.com', NULL, '', NULL, NULL, 35, 18, 50);
INSERT INTO `users` VALUES (106, '001648', '結城ユーザー', 'HS1648dummy@hamazushi.com', NULL, '', NULL, NULL, 36, 18, 50);
INSERT INTO `users` VALUES (107, '001645', '高浜稗田ユーザー', 'HS1645dummy@hamazushi.com', NULL, '', NULL, NULL, 37, 18, 50);
INSERT INTO `users` VALUES (108, '001662', '福島伊達ユーザー', 'HS1662dummy@hamazushi.com', NULL, '', NULL, NULL, 38, 18, 50);
INSERT INTO `users` VALUES (109, '001517', '水戸笠原ユーザー', 'HS1517dummy@hamazushi.com', NULL, '', NULL, NULL, 39, 18, 50);
INSERT INTO `users` VALUES (110, '001669', '下館ユーザー', 'HS1669dummy@hamazushi.com', NULL, '', NULL, NULL, 40, 18, 50);
INSERT INTO `users` VALUES (111, '001664', '柏十余二ユーザー', 'HS1664dummy@hamazushi.com', NULL, '', NULL, NULL, 41, 18, 50);
INSERT INTO `users` VALUES (112, '001656', '鶴ヶ島ユーザー', 'HS1656dummy@hamazushi.com', NULL, '', NULL, NULL, 42, 18, 50);
INSERT INTO `users` VALUES (113, '001671', '日野神明ユーザー', 'HS1671dummy@hamazushi.com', NULL, '', NULL, NULL, 43, 18, 50);
INSERT INTO `users` VALUES (114, '001659', '八街ユーザー', 'HS1659dummy@hamazushi.com', NULL, '', NULL, NULL, 44, 18, 50);
INSERT INTO `users` VALUES (115, '001674', '鹿嶋佐田ユーザー', 'HS1674dummy@hamazushi.com', NULL, '', NULL, NULL, 45, 18, 50);
INSERT INTO `users` VALUES (116, '001682', 'イオンモール佐野ユーザー', 'HS1682dummy@hamazushi.com', NULL, '', NULL, NULL, 46, 18, 50);
INSERT INTO `users` VALUES (117, '001698', '新潟女池ユーザー', 'HS1698dummy@hamazushi.com', NULL, '', NULL, NULL, 47, 18, 50);
INSERT INTO `users` VALUES (118, '001679', '館林松原ユーザー', 'HS1679dummy@hamazushi.com', NULL, '', NULL, NULL, 48, 18, 50);
INSERT INTO `users` VALUES (119, '001680', '高崎問屋町ユーザー', 'HS1680dummy@hamazushi.com', NULL, '', NULL, NULL, 49, 18, 50);
INSERT INTO `users` VALUES (120, '001724', '堺浜寺ユーザー', 'HS1724dummy@hamazushi.com', NULL, '', NULL, NULL, 50, 18, 50);
INSERT INTO `users` VALUES (121, '001681', '大仁ユーザー', 'HS1681dummy@hamazushi.com', NULL, '', NULL, NULL, 51, 18, 50);
INSERT INTO `users` VALUES (122, '001701', '秋田広面ユーザー', 'HS1701dummy@hamazushi.com', NULL, '', NULL, NULL, 52, 18, 50);
INSERT INTO `users` VALUES (123, '001702', '桐生相生町ユーザー', 'HS1702dummy@hamazushi.com', NULL, '', NULL, NULL, 53, 18, 50);
INSERT INTO `users` VALUES (124, '001725', '高松今里ユーザー', 'HS1725dummy@hamazushi.com', NULL, '', NULL, NULL, 54, 18, 50);
INSERT INTO `users` VALUES (125, '001703', 'フォレオせんだいユーザー', 'HS1703dummy@hamazushi.com', NULL, '', NULL, NULL, 55, 18, 50);
INSERT INTO `users` VALUES (126, '001713', 'ウィラ大井ユーザー', 'HS1713dummy@hamazushi.com', NULL, '', NULL, NULL, 56, 18, 50);
INSERT INTO `users` VALUES (127, '001712', 'アクロスモール守谷ユーザー', 'HS1712dummy@hamazushi.com', NULL, '', NULL, NULL, 57, 18, 50);
INSERT INTO `users` VALUES (128, '001704', '昭和町飯喰ユーザー', 'HS1704dummy@hamazushi.com', NULL, '', NULL, NULL, 58, 18, 50);
INSERT INTO `users` VALUES (129, '001717', '伊東湯川ユーザー', 'HS1717dummy@hamazushi.com', NULL, '', NULL, NULL, 59, 18, 50);
INSERT INTO `users` VALUES (130, '001718', '秦野平沢ユーザー', 'HS1718dummy@hamazushi.com', NULL, '', NULL, NULL, 60, 18, 50);
INSERT INTO `users` VALUES (131, '001684', '相模原城山ユーザー', 'HS1684dummy@hamazushi.com', NULL, '', NULL, NULL, 61, 18, 50);
INSERT INTO `users` VALUES (132, '001685', '瀬谷二ツ橋ユーザー', 'HS1685dummy@hamazushi.com', NULL, '', NULL, NULL, 62, 18, 50);
INSERT INTO `users` VALUES (133, '001705', '富山二口ユーザー', 'HS1705dummy@hamazushi.com', NULL, '', NULL, NULL, 63, 18, 50);
INSERT INTO `users` VALUES (134, '001726', '宇部恩田町ユーザー', 'HS1726dummy@hamazushi.com', NULL, '', NULL, NULL, 64, 18, 50);
INSERT INTO `users` VALUES (135, '001715', '小田原酒匂ユーザー', 'HS1715dummy@hamazushi.com', NULL, '', NULL, NULL, 65, 18, 50);
INSERT INTO `users` VALUES (136, '001714', '豊田朝日ユーザー', 'HS1714dummy@hamazushi.com', NULL, '', NULL, NULL, 66, 18, 50);
INSERT INTO `users` VALUES (137, '001722', '昭島昭和の森ユーザー', 'HS1722dummy@hamazushi.com', NULL, '', NULL, NULL, 67, 18, 50);
INSERT INTO `users` VALUES (138, '001720', '弥富イオンタウン前ユーザー', 'HS1720dummy@hamazushi.com', NULL, '', NULL, NULL, 68, 18, 50);
INSERT INTO `users` VALUES (139, '001706', 'アクロスプラザ長岡ユーザー', 'HS1706dummy@hamazushi.com', NULL, '', NULL, NULL, 69, 18, 50);
INSERT INTO `users` VALUES (140, '001727', '深谷荒川ユーザー', 'HS1727dummy@hamazushi.com', NULL, '', NULL, NULL, 70, 18, 50);
INSERT INTO `users` VALUES (141, '001707', '郡山芳賀ユーザー', 'HS1707dummy@hamazushi.com', NULL, '', NULL, NULL, 71, 18, 50);
INSERT INTO `users` VALUES (142, '001731', '岡山久米ユーザー', 'HS1731dummy@hamazushi.com', NULL, '', NULL, NULL, 72, 18, 50);
INSERT INTO `users` VALUES (143, '001686', 'フォレオ菖蒲ユーザー', 'HS1686dummy@hamazushi.com', NULL, '', NULL, NULL, 73, 18, 50);
INSERT INTO `users` VALUES (144, '001708', '太田浜町ユーザー', 'HS1708dummy@hamazushi.com', NULL, '', NULL, NULL, 74, 18, 50);
INSERT INTO `users` VALUES (145, '001730', '岡崎大西ユーザー', 'HS1730dummy@hamazushi.com', NULL, '', NULL, NULL, 75, 18, 50);
INSERT INTO `users` VALUES (146, '001736', '大分高城ユーザー', 'HS1736dummy@hamazushi.com', NULL, '', NULL, NULL, 76, 18, 50);
INSERT INTO `users` VALUES (147, '001729', '新座野火止ユーザー', 'HS1729dummy@hamazushi.com', NULL, '', NULL, NULL, 77, 18, 50);
INSERT INTO `users` VALUES (148, '001740', '佐賀本庄ユーザー', 'HS1740dummy@hamazushi.com', NULL, '', NULL, NULL, 78, 18, 50);
INSERT INTO `users` VALUES (149, '001709', '泉区上谷刈ユーザー', 'HS1709dummy@hamazushi.com', NULL, '', NULL, NULL, 79, 18, 50);
INSERT INTO `users` VALUES (150, '001739', '四日市羽津ユーザー', 'HS1739dummy@hamazushi.com', NULL, 'jT9lPAr8gldsURTQbpd8Xqo1h5XKyLtwtGIBdSyJcMreWiYhbmtMWnuF58jS', NULL, '2021-03-02 13:27:03', 80, 18, 50);
INSERT INTO `users` VALUES (151, '001749', '日立鹿島ユーザー', 'HS1749dummy@hamazushi.com', NULL, '', NULL, NULL, 81, 18, 50);
INSERT INTO `users` VALUES (152, '001741', '泉佐野樫井ユーザー', 'HS1741dummy@hamazushi.com', NULL, '', NULL, NULL, 82, 18, 50);
INSERT INTO `users` VALUES (153, '001751', '上田常入ユーザー', 'HS1751dummy@hamazushi.com', NULL, '', NULL, NULL, 83, 18, 50);
INSERT INTO `users` VALUES (154, '001732', '船橋海神ユーザー', 'HS1732dummy@hamazushi.com', NULL, '', NULL, NULL, 84, 18, 50);
INSERT INTO `users` VALUES (155, '001735', '新狭山ユーザー', 'HS1735dummy@hamazushi.com', NULL, '', NULL, NULL, 85, 18, 50);
INSERT INTO `users` VALUES (156, '001737', '下関幡生ユーザー', 'HS1737dummy@hamazushi.com', NULL, '', NULL, NULL, 86, 18, 50);
INSERT INTO `users` VALUES (157, '001738', '日進ユーザー', 'HS1738dummy@hamazushi.com', NULL, '', NULL, NULL, 87, 18, 50);
INSERT INTO `users` VALUES (158, '001752', '盛岡上田ユーザー', 'HS1752dummy@hamazushi.com', NULL, '', NULL, NULL, 88, 18, 50);
INSERT INTO `users` VALUES (159, '001733', '甲賀水口ユーザー', 'HS1733dummy@hamazushi.com', NULL, '', NULL, NULL, 89, 18, 50);
INSERT INTO `users` VALUES (160, '001763', '大崎古川諏訪ユーザー', 'HS1763dummy@hamazushi.com', NULL, '', NULL, NULL, 90, 18, 50);
INSERT INTO `users` VALUES (161, '001747', '鹿沼西茂呂ユーザー', 'HS1747dummy@hamazushi.com', NULL, '', NULL, NULL, 91, 18, 50);
INSERT INTO `users` VALUES (162, '001723', 'ライフガーデン新浦安ユーザー', 'HS1723dummy@hamazushi.com', NULL, '', NULL, NULL, 92, 18, 50);
INSERT INTO `users` VALUES (163, '001728', '越谷レイクタウンユーザー', 'HS1728dummy@hamazushi.com', NULL, '', NULL, NULL, 93, 18, 50);
INSERT INTO `users` VALUES (164, '001753', '松江本郷ユーザー', 'HS1753dummy@hamazushi.com', NULL, '', NULL, NULL, 94, 18, 50);
INSERT INTO `users` VALUES (165, '001746', '小山喜沢ユーザー', 'HS1746dummy@hamazushi.com', NULL, '', NULL, NULL, 95, 18, 50);
INSERT INTO `users` VALUES (166, '001734', '裾野平松ユーザー', 'HS1734dummy@hamazushi.com', NULL, '', NULL, NULL, 96, 18, 50);
INSERT INTO `users` VALUES (167, '001754', '福山三吉町ユーザー', 'HS1754dummy@hamazushi.com', NULL, '', NULL, NULL, 97, 18, 50);
INSERT INTO `users` VALUES (168, '001742', '野田堤台ユーザー', 'HS1742dummy@hamazushi.com', NULL, '', NULL, NULL, 98, 18, 50);
INSERT INTO `users` VALUES (169, '001744', '宮崎新別府ユーザー', 'HS1744dummy@hamazushi.com', NULL, '', NULL, NULL, 99, 18, 50);
INSERT INTO `users` VALUES (170, '001764', '鉾田ユーザー', 'HS1764dummy@hamazushi.com', NULL, '', NULL, NULL, 100, 18, 50);
INSERT INTO `users` VALUES (171, '001755', '鳥取千代水ユーザー', 'HS1755dummy@hamazushi.com', NULL, '', NULL, NULL, 101, 18, 50);
INSERT INTO `users` VALUES (172, '001748', '安城横山ユーザー', 'HS1748dummy@hamazushi.com', NULL, '', NULL, NULL, 102, 18, 50);
INSERT INTO `users` VALUES (173, '001743', '入間宮寺ユーザー', 'HS1743dummy@hamazushi.com', NULL, '', NULL, NULL, 103, 18, 50);
INSERT INTO `users` VALUES (174, '001745', '41号扶桑ユーザー', 'HS1745dummy@hamazushi.com', NULL, '', NULL, NULL, 104, 18, 50);
INSERT INTO `users` VALUES (175, '001756', '金沢中村ユーザー', 'HS1756dummy@hamazushi.com', NULL, '', NULL, NULL, 105, 18, 50);
INSERT INTO `users` VALUES (176, '001757', '鹿児島城南ユーザー', 'HS1757dummy@hamazushi.com', NULL, '', NULL, NULL, 106, 18, 50);
INSERT INTO `users` VALUES (177, '001766', '伊勢崎八寸町ユーザー', 'HS1766dummy@hamazushi.com', NULL, '', NULL, NULL, 107, 18, 50);
INSERT INTO `users` VALUES (178, '001765', '浜松入野ユーザー', 'HS1765dummy@hamazushi.com', NULL, '', NULL, NULL, 108, 18, 50);
INSERT INTO `users` VALUES (179, '001767', '浜松西ICユーザー', 'HS1767dummy@hamazushi.com', NULL, '', NULL, NULL, 109, 18, 50);
INSERT INTO `users` VALUES (180, '001758', '松山保免ユーザー', 'HS1758dummy@hamazushi.com', NULL, '', NULL, NULL, 110, 18, 50);
INSERT INTO `users` VALUES (181, '001768', '船橋咲が丘ユーザー', 'HS1768dummy@hamazushi.com', NULL, '', NULL, NULL, 111, 18, 50);
INSERT INTO `users` VALUES (182, '001759', '鹿児島卸本町ユーザー', 'HS1759dummy@hamazushi.com', NULL, '', NULL, NULL, 112, 18, 50);
INSERT INTO `users` VALUES (183, '001771', '山形馬見ヶ崎ユーザー', 'HS1771dummy@hamazushi.com', NULL, '', NULL, NULL, 113, 18, 50);
INSERT INTO `users` VALUES (184, '001770', 'ベイドリーム清水ユーザー', 'HS1770dummy@hamazushi.com', NULL, '', NULL, NULL, 114, 18, 50);
INSERT INTO `users` VALUES (185, '001773', '新三郷ユーザー', 'HS1773dummy@hamazushi.com', NULL, '', NULL, NULL, 115, 18, 50);
INSERT INTO `users` VALUES (186, '001772', 'イオンタウン須賀川ユーザー', 'HS1772dummy@hamazushi.com', NULL, '', NULL, NULL, 116, 18, 50);
INSERT INTO `users` VALUES (187, '001774', 'クロスガーデン富士中央ユーザー', 'HS1774dummy@hamazushi.com', NULL, '', NULL, NULL, 117, 18, 50);
INSERT INTO `users` VALUES (188, '001775', '大田原美原ユーザー', 'HS1775dummy@hamazushi.com', NULL, '', NULL, NULL, 118, 18, 50);
INSERT INTO `users` VALUES (189, '001776', '京王堀之内ユーザー', 'HS1776dummy@hamazushi.com', NULL, '', NULL, NULL, 119, 18, 50);
INSERT INTO `users` VALUES (190, '001777', '福岡志免ユーザー', 'HS1777dummy@hamazushi.com', NULL, '', NULL, NULL, 120, 18, 50);
INSERT INTO `users` VALUES (191, '001769', '御前崎浜岡ユーザー', 'HS1769dummy@hamazushi.com', NULL, '', NULL, NULL, 121, 18, 50);
INSERT INTO `users` VALUES (192, '001779', '千葉おゆみ野ユーザー', 'HS1779dummy@hamazushi.com', NULL, '', NULL, NULL, 122, 18, 50);
INSERT INTO `users` VALUES (193, '001780', '伊賀上野ユーザー', 'HS1780dummy@hamazushi.com', NULL, '', NULL, NULL, 123, 18, 50);
INSERT INTO `users` VALUES (194, '001760', 'チャチャタウン小倉ユーザー', 'HS1760dummy@hamazushi.com', NULL, '', NULL, NULL, 124, 18, 50);
INSERT INTO `users` VALUES (195, '001778', '福井羽水ユーザー', 'HS1778dummy@hamazushi.com', NULL, '', NULL, NULL, 125, 18, 50);
INSERT INTO `users` VALUES (196, '001782', '津乙部ユーザー', 'HS1782dummy@hamazushi.com', NULL, '', NULL, NULL, 126, 18, 50);
INSERT INTO `users` VALUES (197, '001784', '印西西の原ユーザー', 'HS1784dummy@hamazushi.com', NULL, '', NULL, NULL, 127, 18, 50);
INSERT INTO `users` VALUES (198, '001783', '本庄ユーザー', 'HS1783dummy@hamazushi.com', NULL, '', NULL, NULL, 128, 18, 50);
INSERT INTO `users` VALUES (199, '001786', '磐田ユーザー', 'HS1786dummy@hamazushi.com', NULL, '', NULL, NULL, 129, 18, 50);
INSERT INTO `users` VALUES (200, '001787', '八千代大和田ユーザー', 'HS1787dummy@hamazushi.com', NULL, '', NULL, NULL, 130, 18, 50);
INSERT INTO `users` VALUES (201, '001785', '土浦若松ユーザー', 'HS1785dummy@hamazushi.com', NULL, '', NULL, NULL, 131, 18, 50);
INSERT INTO `users` VALUES (202, '001788', '17号鴻巣新宿ユーザー', 'HS1788dummy@hamazushi.com', NULL, '', NULL, NULL, 132, 18, 50);
INSERT INTO `users` VALUES (203, '001789', '千葉小倉町ユーザー', 'HS1789dummy@hamazushi.com', NULL, '', NULL, NULL, 133, 18, 50);
INSERT INTO `users` VALUES (204, '001790', '天白荒池ユーザー', 'HS1790dummy@hamazushi.com', NULL, '', NULL, NULL, 134, 18, 50);
INSERT INTO `users` VALUES (205, '001793', '深谷上野台ユーザー', 'HS1793dummy@hamazushi.com', NULL, '', NULL, NULL, 135, 18, 50);
INSERT INTO `users` VALUES (206, '001795', '厚木ICユーザー', 'HS1795dummy@hamazushi.com', NULL, '', NULL, NULL, 136, 18, 50);
INSERT INTO `users` VALUES (207, '001791', '横須賀中央ユーザー', 'HS1791dummy@hamazushi.com', NULL, '', NULL, NULL, 137, 18, 50);
INSERT INTO `users` VALUES (208, '001794', '富士吉田ユーザー', 'HS1794dummy@hamazushi.com', NULL, '', NULL, NULL, 138, 18, 50);
INSERT INTO `users` VALUES (209, '001797', '知多武豊ユーザー', 'HS1797dummy@hamazushi.com', NULL, '', NULL, NULL, 139, 18, 50);
INSERT INTO `users` VALUES (210, '001792', '横浜岡野ユーザー', 'HS1792dummy@hamazushi.com', NULL, '', NULL, NULL, 140, 18, 50);
INSERT INTO `users` VALUES (211, '001796', '248号関ユーザー', 'HS1796dummy@hamazushi.com', NULL, '', NULL, NULL, 141, 18, 50);
INSERT INTO `users` VALUES (212, '001798', '鹿浜ユーザー', 'HS1798dummy@hamazushi.com', NULL, '', NULL, NULL, 142, 18, 50);
INSERT INTO `users` VALUES (213, '001721', '東金ユーザー', 'HS1721dummy@hamazushi.com', NULL, '', NULL, NULL, 143, 18, 50);
INSERT INTO `users` VALUES (214, '001815', '横須賀衣笠ユーザー', 'HS1815dummy@hamazushi.com', NULL, '', NULL, NULL, 144, 18, 50);
INSERT INTO `users` VALUES (215, '001817', '新潟宝町ユーザー', 'HS1817dummy@hamazushi.com', NULL, '', NULL, NULL, 145, 18, 50);
INSERT INTO `users` VALUES (216, '001800', '八日市場ユーザー', 'HS1800dummy@hamazushi.com', NULL, '', NULL, NULL, 146, 18, 50);
INSERT INTO `users` VALUES (217, '001799', '沼津双葉町ユーザー', 'HS1799dummy@hamazushi.com', NULL, '', NULL, NULL, 147, 18, 50);
INSERT INTO `users` VALUES (218, '001819', '122号羽生ユーザー', 'HS1819dummy@hamazushi.com', NULL, '', NULL, NULL, 148, 18, 50);
INSERT INTO `users` VALUES (219, '001814', '羽島竹鼻ユーザー', 'HS1814dummy@hamazushi.com', NULL, '', NULL, NULL, 149, 18, 50);
INSERT INTO `users` VALUES (220, '001818', '新居浜西の土居ユーザー', 'HS1818dummy@hamazushi.com', NULL, '', NULL, NULL, 150, 18, 50);
INSERT INTO `users` VALUES (221, '001820', '8号鯖江ユーザー', 'HS1820dummy@hamazushi.com', NULL, '', NULL, NULL, 151, 18, 50);
INSERT INTO `users` VALUES (222, '001816', '宇都宮中戸祭ユーザー', 'HS1816dummy@hamazushi.com', NULL, '', NULL, NULL, 152, 18, 50);
INSERT INTO `users` VALUES (223, '001821', '新潟寺尾台ユーザー', 'HS1821dummy@hamazushi.com', NULL, '', NULL, NULL, 153, 18, 50);
INSERT INTO `users` VALUES (224, '001824', '鈴鹿中央通ユーザー', 'HS1824dummy@hamazushi.com', NULL, '', NULL, NULL, 154, 18, 50);
INSERT INTO `users` VALUES (225, '001822', '札幌苗穂ユーザー', 'HS1822dummy@hamazushi.com', NULL, '', NULL, NULL, 155, 18, 50);
INSERT INTO `users` VALUES (226, '001825', '豊橋新栄ユーザー', 'HS1825dummy@hamazushi.com', NULL, '', NULL, NULL, 156, 18, 50);
INSERT INTO `users` VALUES (227, '001826', '経堂ユーザー', 'HS1826dummy@hamazushi.com', NULL, '', NULL, NULL, 157, 18, 50);
INSERT INTO `users` VALUES (228, '001827', '掛川ユーザー', 'HS1827dummy@hamazushi.com', NULL, '', NULL, NULL, 158, 18, 50);
INSERT INTO `users` VALUES (229, '001829', '海老名ビナウォークユーザー', 'HS1829dummy@hamazushi.com', NULL, '', NULL, NULL, 159, 18, 50);
INSERT INTO `users` VALUES (230, '001828', '彦根戸賀ユーザー', 'HS1828dummy@hamazushi.com', NULL, '', NULL, NULL, 160, 18, 50);
INSERT INTO `users` VALUES (231, '001830', '東浦ユーザー', 'HS1830dummy@hamazushi.com', NULL, '', NULL, NULL, 161, 18, 50);
INSERT INTO `users` VALUES (232, '001832', '岸和田八阪ユーザー', 'HS1832dummy@hamazushi.com', NULL, '', NULL, NULL, 162, 18, 50);
INSERT INTO `users` VALUES (233, '001833', '41号高山ユーザー', 'HS1833dummy@hamazushi.com', NULL, '', NULL, NULL, 163, 18, 50);
INSERT INTO `users` VALUES (234, '001834', '山口湯田ユーザー', 'HS1834dummy@hamazushi.com', NULL, '', NULL, NULL, 164, 18, 50);
INSERT INTO `users` VALUES (235, '001823', 'イオンモール福津ユーザー', 'HS1823dummy@hamazushi.com', NULL, '', NULL, NULL, 165, 18, 50);
INSERT INTO `users` VALUES (236, '001835', '札幌栄町ユーザー', 'HS1835dummy@hamazushi.com', NULL, '', NULL, NULL, 166, 18, 50);
INSERT INTO `users` VALUES (237, '001836', '松山中央ユーザー', 'HS1836dummy@hamazushi.com', NULL, '', NULL, NULL, 167, 18, 50);
INSERT INTO `users` VALUES (238, '001837', '敦賀ユーザー', 'HS1837dummy@hamazushi.com', NULL, '', NULL, NULL, 168, 18, 50);
INSERT INTO `users` VALUES (239, '001838', '観音寺坂本ユーザー', 'HS1838dummy@hamazushi.com', NULL, '', NULL, NULL, 169, 18, 50);
INSERT INTO `users` VALUES (240, '001839', '倉敷連島ユーザー', 'HS1839dummy@hamazushi.com', NULL, '', NULL, NULL, 170, 18, 50);
INSERT INTO `users` VALUES (241, '001840', '東海荒尾ユーザー', 'HS1840dummy@hamazushi.com', NULL, '', NULL, NULL, 171, 18, 50);
INSERT INTO `users` VALUES (242, '001841', '岐阜前一色ユーザー', 'HS1841dummy@hamazushi.com', NULL, '', NULL, NULL, 172, 18, 50);
INSERT INTO `users` VALUES (243, '001842', 'いわき小名浜ユーザー', 'HS1842dummy@hamazushi.com', NULL, '', NULL, NULL, 173, 18, 50);
INSERT INTO `users` VALUES (244, '001165', '加平ユーザー', 'HS1165dummy@hamazushi.com', NULL, '', NULL, NULL, 174, 18, 50);
INSERT INTO `users` VALUES (245, '001843', 'ベイタウン本牧ユーザー', 'HS1843dummy@hamazushi.com', NULL, '', NULL, NULL, 175, 18, 50);
INSERT INTO `users` VALUES (246, '001831', '平塚四之宮ユーザー', 'HS1831dummy@hamazushi.com', NULL, '', NULL, NULL, 176, 18, 50);
INSERT INTO `users` VALUES (247, '001168', '松戸高塚新田ユーザー', 'HS1168dummy@hamazushi.com', NULL, '', NULL, NULL, 177, 18, 50);
INSERT INTO `users` VALUES (248, '001169', '高岡赤祖父ユーザー', 'HS1169dummy@hamazushi.com', NULL, '', NULL, NULL, 178, 18, 50);
INSERT INTO `users` VALUES (249, '001170', '石狩樽川ユーザー', 'HS1170dummy@hamazushi.com', NULL, '', NULL, NULL, 179, 18, 50);
INSERT INTO `users` VALUES (250, '001171', '薩摩川内ユーザー', 'HS1171dummy@hamazushi.com', NULL, '', NULL, NULL, 180, 18, 50);
INSERT INTO `users` VALUES (251, '001172', '名張ユーザー', 'HS1172dummy@hamazushi.com', NULL, '', NULL, NULL, 181, 18, 50);
INSERT INTO `users` VALUES (252, '001173', '岡山平島ユーザー', 'HS1173dummy@hamazushi.com', NULL, '', NULL, NULL, 182, 18, 50);
INSERT INTO `users` VALUES (253, '001174', '札幌新道発寒ユーザー', 'HS1174dummy@hamazushi.com', NULL, '', NULL, NULL, 183, 18, 50);
INSERT INTO `users` VALUES (254, '001175', '綾瀬大上ユーザー', 'HS1175dummy@hamazushi.com', NULL, '', NULL, NULL, 184, 18, 50);
INSERT INTO `users` VALUES (255, '001176', '熊谷ユーザー', 'HS1176dummy@hamazushi.com', NULL, '', NULL, NULL, 185, 18, 50);
INSERT INTO `users` VALUES (256, '001177', '我孫子若松ユーザー', 'HS1177dummy@hamazushi.com', NULL, '', NULL, NULL, 186, 18, 50);
INSERT INTO `users` VALUES (257, '001178', '登別若草ユーザー', 'HS1178dummy@hamazushi.com', NULL, '', NULL, NULL, 187, 18, 50);
INSERT INTO `users` VALUES (258, '001179', '滋賀守山ユーザー', 'HS1179dummy@hamazushi.com', NULL, '', NULL, NULL, 188, 18, 50);
INSERT INTO `users` VALUES (259, '001180', '三島中央町ユーザー', 'HS1180dummy@hamazushi.com', NULL, '', NULL, NULL, 189, 18, 50);
INSERT INTO `users` VALUES (260, '001181', '旭川旭町ユーザー', 'HS1181dummy@hamazushi.com', NULL, '', NULL, NULL, 190, 18, 50);
INSERT INTO `users` VALUES (261, '001182', '岩槻本宿ユーザー', 'HS1182dummy@hamazushi.com', NULL, '', NULL, NULL, 191, 18, 50);
INSERT INTO `users` VALUES (262, '001183', '花巻桜台ユーザー', 'HS1183dummy@hamazushi.com', NULL, '', NULL, NULL, 192, 18, 50);
INSERT INTO `users` VALUES (263, '001184', '千葉畑町ユーザー', 'HS1184dummy@hamazushi.com', NULL, '', NULL, NULL, 193, 18, 50);
INSERT INTO `users` VALUES (264, '001185', '富士宮矢立町ユーザー', 'HS1185dummy@hamazushi.com', NULL, '', NULL, NULL, 194, 18, 50);
INSERT INTO `users` VALUES (265, '001186', '厚木及川ユーザー', 'HS1186dummy@hamazushi.com', NULL, '', NULL, NULL, 195, 18, 50);
INSERT INTO `users` VALUES (266, '001187', '小平中島町ユーザー', 'HS1187dummy@hamazushi.com', NULL, '', NULL, NULL, 196, 18, 50);
INSERT INTO `users` VALUES (267, '001188', '福井大宮ユーザー', 'HS1188dummy@hamazushi.com', NULL, '', NULL, NULL, 197, 18, 50);
INSERT INTO `users` VALUES (268, '001189', '宇部厚南ユーザー', 'HS1189dummy@hamazushi.com', NULL, '', NULL, NULL, 198, 18, 50);
INSERT INTO `users` VALUES (269, '001190', '浜松天王ユーザー', 'HS1190dummy@hamazushi.com', NULL, '', NULL, NULL, 199, 18, 50);
INSERT INTO `users` VALUES (270, '001191', '草加花栗ユーザー', 'HS1191dummy@hamazushi.com', NULL, '', NULL, NULL, 200, 18, 50);
INSERT INTO `users` VALUES (271, '001192', '今治別宮ユーザー', 'HS1192dummy@hamazushi.com', NULL, '', NULL, NULL, 201, 18, 50);
INSERT INTO `users` VALUES (272, '001193', 'Mr.Max湘南藤沢ユーザー', 'HS1193dummy@hamazushi.com', NULL, '', NULL, NULL, 202, 18, 50);
INSERT INTO `users` VALUES (273, '001194', '越谷平方ユーザー', 'HS1194dummy@hamazushi.com', NULL, '', NULL, NULL, 203, 18, 50);
INSERT INTO `users` VALUES (274, '001195', '蒲田駅東区役所前本通ユーザー', 'HS1195dummy@hamazushi.com', NULL, '', NULL, NULL, 204, 18, 50);
INSERT INTO `users` VALUES (275, '001196', '新守山ユーザー', 'HS1196dummy@hamazushi.com', NULL, '', NULL, NULL, 205, 18, 50);
INSERT INTO `users` VALUES (276, '001197', '川崎生田ユーザー', 'HS1197dummy@hamazushi.com', NULL, '', NULL, NULL, 206, 18, 50);
INSERT INTO `users` VALUES (277, '001198', '大野城南ヶ丘ユーザー', 'HS1198dummy@hamazushi.com', NULL, '', NULL, NULL, 207, 18, 50);
INSERT INTO `users` VALUES (278, '001199', '川口前川ユーザー', 'HS1199dummy@hamazushi.com', NULL, '', NULL, NULL, 208, 18, 50);
INSERT INTO `users` VALUES (279, '001200', '岐阜北方ユーザー', 'HS1200dummy@hamazushi.com', NULL, '', NULL, NULL, 209, 18, 50);
INSERT INTO `users` VALUES (280, '001201', '千葉山王町ユーザー', 'HS1201dummy@hamazushi.com', NULL, '', NULL, NULL, 210, 18, 50);
INSERT INTO `users` VALUES (281, '001202', '旭川永山ユーザー', 'HS1202dummy@hamazushi.com', NULL, '', NULL, NULL, 211, 18, 50);
INSERT INTO `users` VALUES (282, '001203', '稲沢陸田宮前ユーザー', 'HS1203dummy@hamazushi.com', NULL, '', NULL, NULL, 212, 18, 50);
INSERT INTO `users` VALUES (283, '001204', '戸塚平戸ユーザー', 'HS1204dummy@hamazushi.com', NULL, '', NULL, NULL, 213, 18, 50);
INSERT INTO `users` VALUES (284, '001205', '北見ユーザー', 'HS1205dummy@hamazushi.com', NULL, '', NULL, NULL, 214, 18, 50);
INSERT INTO `users` VALUES (285, '001206', '湘南台ユーザー', 'HS1206dummy@hamazushi.com', NULL, '', NULL, NULL, 215, 18, 50);
INSERT INTO `users` VALUES (286, '001207', '四日市東日野ユーザー', 'HS1207dummy@hamazushi.com', NULL, '', NULL, NULL, 216, 18, 50);
INSERT INTO `users` VALUES (287, '001208', '徳島松茂ユーザー', 'HS1208dummy@hamazushi.com', NULL, '', NULL, NULL, 217, 18, 50);
INSERT INTO `users` VALUES (288, '001209', '1国豊明ユーザー', 'HS1209dummy@hamazushi.com', NULL, '', NULL, NULL, 218, 18, 50);
INSERT INTO `users` VALUES (289, '001210', '江戸川松江ユーザー', 'HS1210dummy@hamazushi.com', NULL, '', NULL, NULL, 219, 18, 50);
INSERT INTO `users` VALUES (290, '001214', '日向原町ユーザー', 'HS1214dummy@hamazushi.com', NULL, '', NULL, NULL, 220, 18, 50);
INSERT INTO `users` VALUES (291, '001216', '21号可児ユーザー', 'HS1216dummy@hamazushi.com', NULL, '', NULL, NULL, 221, 18, 50);
INSERT INTO `users` VALUES (292, '001213', '蒲田東邦医大通りユーザー', 'HS1213dummy@hamazushi.com', NULL, '', NULL, NULL, 222, 18, 50);
INSERT INTO `users` VALUES (293, '001218', '岐阜南鶉ユーザー', 'HS1218dummy@hamazushi.com', NULL, '', NULL, NULL, 223, 18, 50);
INSERT INTO `users` VALUES (294, '001212', '出雲大塚ユーザー', 'HS1212dummy@hamazushi.com', NULL, '', NULL, NULL, 224, 18, 50);
INSERT INTO `users` VALUES (295, '001217', '札幌月寒ユーザー', 'HS1217dummy@hamazushi.com', NULL, '', NULL, NULL, 225, 18, 50);
INSERT INTO `users` VALUES (296, '001215', '長岡寺島ユーザー', 'HS1215dummy@hamazushi.com', NULL, '', NULL, NULL, 226, 18, 50);
INSERT INTO `users` VALUES (297, '001219', '行徳ユーザー', 'HS1219dummy@hamazushi.com', NULL, '', NULL, NULL, 227, 18, 50);
INSERT INTO `users` VALUES (298, '001220', '千葉末広ユーザー', 'HS1220dummy@hamazushi.com', NULL, '', NULL, NULL, 228, 18, 50);
INSERT INTO `users` VALUES (299, '001222', '田園調布ユーザー', 'HS1222dummy@hamazushi.com', NULL, '', NULL, NULL, 229, 18, 50);
INSERT INTO `users` VALUES (300, '001211', '南足柄ユーザー', 'HS1211dummy@hamazushi.com', NULL, '', NULL, NULL, 230, 18, 50);
INSERT INTO `users` VALUES (301, '001223', '日吉ユーザー', 'HS1223dummy@hamazushi.com', NULL, '', NULL, NULL, 231, 18, 50);
INSERT INTO `users` VALUES (302, '001224', '長崎小ヶ倉ユーザー', 'HS1224dummy@hamazushi.com', NULL, '', NULL, NULL, 232, 18, 50);
INSERT INTO `users` VALUES (303, '001221', '東広島西条ユーザー', 'HS1221dummy@hamazushi.com', NULL, '', NULL, NULL, 233, 18, 50);
INSERT INTO `users` VALUES (304, '001226', '新発田ユーザー', 'HS1226dummy@hamazushi.com', NULL, '', NULL, NULL, 234, 18, 50);
INSERT INTO `users` VALUES (305, '001225', '亀山ユーザー', 'HS1225dummy@hamazushi.com', NULL, '', NULL, NULL, 235, 18, 50);
INSERT INTO `users` VALUES (306, '001228', '湖西ユーザー', 'HS1228dummy@hamazushi.com', NULL, '', NULL, NULL, 236, 18, 50);
INSERT INTO `users` VALUES (307, '001229', '松戸六高台ユーザー', 'HS1229dummy@hamazushi.com', NULL, '', NULL, NULL, 237, 18, 50);
INSERT INTO `users` VALUES (308, '001230', '越谷七左ユーザー', 'HS1230dummy@hamazushi.com', NULL, '', NULL, NULL, 238, 18, 50);
INSERT INTO `users` VALUES (309, '001231', '松山鷹子ユーザー', 'HS1231dummy@hamazushi.com', NULL, '', NULL, NULL, 239, 18, 50);
INSERT INTO `users` VALUES (310, '001227', '柳井ユーザー', 'HS1227dummy@hamazushi.com', NULL, '', NULL, NULL, 240, 18, 50);
INSERT INTO `users` VALUES (311, '001234', '藤枝高洲ユーザー', 'HS1234dummy@hamazushi.com', NULL, '', NULL, NULL, 241, 18, 50);
INSERT INTO `users` VALUES (312, '001233', '旭ユーザー', 'HS1233dummy@hamazushi.com', NULL, 'QOeg5y1pfGgS8JYLhH7RRynGwqqaSQA6VJZMAilZTIg1irjsQYzgzNC3uJwt', NULL, '2021-04-02 16:54:25', 242, 18, 50);
INSERT INTO `users` VALUES (313, '001235', '浜北ユーザー', 'HS1235dummy@hamazushi.com', NULL, '', NULL, NULL, 243, 18, 50);
INSERT INTO `users` VALUES (314, '001236', '徳島石井ユーザー', 'HS1236dummy@hamazushi.com', NULL, '', NULL, NULL, 244, 18, 50);
INSERT INTO `users` VALUES (315, '001232', '徳島西新浜ユーザー', 'HS1232dummy@hamazushi.com', NULL, '', NULL, NULL, 245, 18, 50);
INSERT INTO `users` VALUES (316, '001237', '木更津請西ユーザー', 'HS1237dummy@hamazushi.com', NULL, '', NULL, NULL, 246, 18, 50);
INSERT INTO `users` VALUES (317, '001238', '東久留米前沢ユーザー', 'HS1238dummy@hamazushi.com', NULL, '', NULL, NULL, 247, 18, 50);
INSERT INTO `users` VALUES (318, '001239', '草津新浜ユーザー', 'HS1239dummy@hamazushi.com', NULL, '', NULL, NULL, 248, 18, 50);
INSERT INTO `users` VALUES (319, '001241', '坂井春江ユーザー', 'HS1241dummy@hamazushi.com', NULL, '', NULL, NULL, 249, 18, 50);
INSERT INTO `users` VALUES (320, '001242', '港区新川ユーザー', 'HS1242dummy@hamazushi.com', NULL, '', NULL, NULL, 250, 18, 50);
INSERT INTO `users` VALUES (321, '001243', '長野篠ノ井ユーザー', 'HS1243dummy@hamazushi.com', NULL, '', NULL, NULL, 251, 18, 50);
INSERT INTO `users` VALUES (322, '001244', '中津川ユーザー', 'HS1244dummy@hamazushi.com', NULL, '', NULL, NULL, 252, 18, 50);
INSERT INTO `users` VALUES (323, '001246', '南風原津嘉山ユーザー', 'HS1246dummy@hamazushi.com', NULL, '', NULL, NULL, 253, 18, 50);
INSERT INTO `users` VALUES (324, '001247', '喜多方ユーザー', 'HS1247dummy@hamazushi.com', NULL, '', NULL, NULL, 254, 18, 50);
INSERT INTO `users` VALUES (325, '001240', '綾川ユーザー', 'HS1240dummy@hamazushi.com', NULL, '', NULL, NULL, 255, 18, 50);
INSERT INTO `users` VALUES (326, '001245', '帯広大通ユーザー', 'HS1245dummy@hamazushi.com', NULL, '', NULL, NULL, 256, 18, 50);
INSERT INTO `users` VALUES (327, '001248', 'イオン大宮ユーザー', 'HS1248dummy@hamazushi.com', NULL, '', NULL, NULL, 257, 18, 50);
INSERT INTO `users` VALUES (328, '001249', '玉城ユーザー', 'HS1249dummy@hamazushi.com', NULL, '', NULL, NULL, 258, 18, 50);
INSERT INTO `users` VALUES (329, '001250', '函館桔梗ユーザー', 'HS1250dummy@hamazushi.com', NULL, '', NULL, NULL, 259, 18, 50);
INSERT INTO `users` VALUES (330, '001251', 'うるま前原ユーザー', 'HS1251dummy@hamazushi.com', NULL, '', NULL, NULL, 260, 18, 50);
INSERT INTO `users` VALUES (331, '001252', 'さくら氏家ユーザー', 'HS1252dummy@hamazushi.com', NULL, '', NULL, NULL, 261, 18, 50);
INSERT INTO `users` VALUES (332, '001255', '横手ユーザー', 'HS1255dummy@hamazushi.com', NULL, '', NULL, NULL, 262, 18, 50);
INSERT INTO `users` VALUES (333, '001253', '豊田高岡ユーザー', 'HS1253dummy@hamazushi.com', NULL, '', NULL, NULL, 263, 18, 50);
INSERT INTO `users` VALUES (334, '001254', '宇土ユーザー', 'HS1254dummy@hamazushi.com', NULL, '', NULL, NULL, 264, 18, 50);
INSERT INTO `users` VALUES (335, '001256', '東近江八日市ユーザー', 'HS1256dummy@hamazushi.com', NULL, '', NULL, NULL, 265, 18, 50);
INSERT INTO `users` VALUES (336, '001257', '盛岡三本柳ユーザー', 'HS1257dummy@hamazushi.com', NULL, '', NULL, NULL, 266, 18, 50);
INSERT INTO `users` VALUES (337, '001258', '上尾ユーザー', 'HS1258dummy@hamazushi.com', NULL, '', NULL, NULL, 267, 18, 50);
INSERT INTO `users` VALUES (338, '001260', '南与野ユーザー', 'HS1260dummy@hamazushi.com', NULL, '', NULL, NULL, 268, 18, 50);
INSERT INTO `users` VALUES (339, '001261', '練馬関町ユーザー', 'HS1261dummy@hamazushi.com', NULL, '', NULL, NULL, 269, 18, 50);
INSERT INTO `users` VALUES (340, '001262', '板橋徳丸ユーザー', 'HS1262dummy@hamazushi.com', NULL, '', NULL, NULL, 270, 18, 50);
INSERT INTO `users` VALUES (341, '001259', '4号白河ユーザー', 'HS1259dummy@hamazushi.com', NULL, '', NULL, NULL, 271, 18, 50);
INSERT INTO `users` VALUES (342, '001263', '諫早栗面ユーザー', 'HS1263dummy@hamazushi.com', NULL, '', NULL, NULL, 272, 18, 50);
INSERT INTO `users` VALUES (343, '001264', '広島海田ユーザー', 'HS1264dummy@hamazushi.com', NULL, '', NULL, NULL, 273, 18, 50);
INSERT INTO `users` VALUES (344, '001265', '大和郡山下三橋ユーザー', 'HS1265dummy@hamazushi.com', NULL, '', NULL, NULL, 274, 18, 50);
INSERT INTO `users` VALUES (345, '001266', '葛飾水元ユーザー', 'HS1266dummy@hamazushi.com', NULL, '', NULL, NULL, 275, 18, 50);
INSERT INTO `users` VALUES (346, '001267', '北谷伊平ユーザー', 'HS1267dummy@hamazushi.com', NULL, '', NULL, NULL, 276, 18, 50);
INSERT INTO `users` VALUES (347, '001268', '静岡ICユーザー', 'HS1268dummy@hamazushi.com', NULL, '', NULL, NULL, 277, 18, 50);
INSERT INTO `users` VALUES (348, '001269', '奈良上牧ユーザー', 'HS1269dummy@hamazushi.com', NULL, '', NULL, NULL, 278, 18, 50);
INSERT INTO `users` VALUES (349, '001270', '岐阜則武ユーザー', 'HS1270dummy@hamazushi.com', NULL, '', NULL, NULL, 279, 18, 50);
INSERT INTO `users` VALUES (350, '001271', '坂東岩井ユーザー', 'HS1271dummy@hamazushi.com', NULL, '', NULL, NULL, 280, 18, 50);
INSERT INTO `users` VALUES (351, '001272', '三鷹北野ユーザー', 'HS1272dummy@hamazushi.com', NULL, '', NULL, NULL, 281, 18, 50);
INSERT INTO `users` VALUES (352, '001273', 'イオン明石ユーザー', 'HS1273dummy@hamazushi.com', NULL, '', NULL, NULL, 282, 18, 50);
INSERT INTO `users` VALUES (353, '001275', '金沢松村ユーザー', 'HS1275dummy@hamazushi.com', NULL, '', NULL, NULL, 283, 18, 50);
INSERT INTO `users` VALUES (354, '001276', 'テラスウォーク一宮ユーザー', 'HS1276dummy@hamazushi.com', NULL, '', NULL, NULL, 284, 18, 50);
INSERT INTO `users` VALUES (355, '001277', '倉敷水江ユーザー', 'HS1277dummy@hamazushi.com', NULL, '', NULL, NULL, 285, 18, 50);
INSERT INTO `users` VALUES (356, '001278', '稲沢平和町ユーザー', 'HS1278dummy@hamazushi.com', NULL, '', NULL, NULL, 286, 18, 50);
INSERT INTO `users` VALUES (357, '001279', '松本出川ユーザー', 'HS1279dummy@hamazushi.com', NULL, '', NULL, NULL, 287, 18, 50);
INSERT INTO `users` VALUES (358, '001274', '苫小牧日吉ユーザー', 'HS1274dummy@hamazushi.com', NULL, '', NULL, NULL, 288, 18, 50);
INSERT INTO `users` VALUES (359, '001280', '杉並井草ユーザー', 'HS1280dummy@hamazushi.com', NULL, '', NULL, NULL, 289, 18, 50);
INSERT INTO `users` VALUES (360, '001281', '富田林中野町ユーザー', 'HS1281dummy@hamazushi.com', NULL, '', NULL, NULL, 290, 18, 50);
INSERT INTO `users` VALUES (361, '001282', '栗原築館ユーザー', 'HS1282dummy@hamazushi.com', NULL, '', NULL, NULL, 291, 18, 50);
INSERT INTO `users` VALUES (362, '001283', '蒲郡竹谷ユーザー', 'HS1283dummy@hamazushi.com', NULL, '', NULL, NULL, 292, 18, 50);
INSERT INTO `users` VALUES (363, '001284', '7号能代ユーザー', 'HS1284dummy@hamazushi.com', NULL, '', NULL, NULL, 293, 18, 50);
INSERT INTO `users` VALUES (364, '001285', '179号太子ユーザー', 'HS1285dummy@hamazushi.com', NULL, '', NULL, NULL, 294, 18, 50);
INSERT INTO `users` VALUES (365, '001286', '東根ユーザー', 'HS1286dummy@hamazushi.com', NULL, '', NULL, NULL, 295, 18, 50);
INSERT INTO `users` VALUES (366, '001287', '167号志摩ユーザー', 'HS1287dummy@hamazushi.com', NULL, '', NULL, NULL, 296, 18, 50);
INSERT INTO `users` VALUES (367, '001288', '堺草尾ユーザー', 'HS1288dummy@hamazushi.com', NULL, '', NULL, NULL, 297, 18, 50);
INSERT INTO `users` VALUES (368, '001289', '木更津金田ユーザー', 'HS1289dummy@hamazushi.com', NULL, '', NULL, NULL, 298, 18, 50);
INSERT INTO `users` VALUES (369, '001290', '高田馬場ユーザー', 'HS1290dummy@hamazushi.com', NULL, '', NULL, NULL, 299, 18, 50);
INSERT INTO `users` VALUES (370, '001291', 'イオンタウン長野三輪ユーザー', 'HS1291dummy@hamazushi.com', NULL, '', NULL, NULL, 300, 18, 50);
INSERT INTO `users` VALUES (371, '001292', '8号野々市ユーザー', 'HS1292dummy@hamazushi.com', NULL, '', NULL, NULL, 301, 18, 50);
INSERT INTO `users` VALUES (372, '001294', 'フォレストモール富士川ユーザー', 'HS1294dummy@hamazushi.com', NULL, '', NULL, NULL, 302, 18, 50);
INSERT INTO `users` VALUES (373, '001296', '古河旭町ユーザー', 'HS1296dummy@hamazushi.com', NULL, '', NULL, NULL, 303, 18, 50);
INSERT INTO `users` VALUES (374, '001299', '長崎時津ユーザー', 'HS1299dummy@hamazushi.com', NULL, '', NULL, NULL, 304, 18, 50);
INSERT INTO `users` VALUES (375, '001295', '周南新地ユーザー', 'HS1295dummy@hamazushi.com', NULL, '', NULL, NULL, 305, 18, 50);
INSERT INTO `users` VALUES (376, '001297', '垂井ユーザー', 'HS1297dummy@hamazushi.com', NULL, '', NULL, NULL, 306, 18, 50);
INSERT INTO `users` VALUES (377, '001298', '御殿場ユーザー', 'HS1298dummy@hamazushi.com', NULL, '', NULL, NULL, 307, 18, 50);
INSERT INTO `users` VALUES (378, '001302', '東村山久米川ユーザー', 'HS1302dummy@hamazushi.com', NULL, '', NULL, NULL, 308, 18, 50);
INSERT INTO `users` VALUES (379, '001293', '高松十川ユーザー', 'HS1293dummy@hamazushi.com', NULL, '', NULL, NULL, 309, 18, 50);
INSERT INTO `users` VALUES (380, '001301', '富山新庄ユーザー', 'HS1301dummy@hamazushi.com', NULL, '', NULL, NULL, 310, 18, 50);
INSERT INTO `users` VALUES (381, '001300', 'ポンテポルタ千住ユーザー', 'HS1300dummy@hamazushi.com', NULL, '', NULL, NULL, 311, 18, 50);
INSERT INTO `users` VALUES (382, '001303', '釧路鳥取大通ユーザー', 'HS1303dummy@hamazushi.com', NULL, '', NULL, NULL, 312, 18, 50);
INSERT INTO `users` VALUES (383, '001305', '横浜上白根ユーザー', 'HS1305dummy@hamazushi.com', NULL, '', NULL, NULL, 313, 18, 50);
INSERT INTO `users` VALUES (384, '001306', 'イオンモール北戸田ユーザー', 'HS1306dummy@hamazushi.com', NULL, '', NULL, NULL, 314, 18, 50);
INSERT INTO `users` VALUES (385, '001304', '常総石下ユーザー', 'HS1304dummy@hamazushi.com', NULL, '', NULL, NULL, 315, 18, 50);
INSERT INTO `users` VALUES (386, '001308', '山鹿鹿本ユーザー', 'HS1308dummy@hamazushi.com', NULL, '', NULL, NULL, 316, 18, 50);
INSERT INTO `users` VALUES (387, '001307', '福山駅家ユーザー', 'HS1307dummy@hamazushi.com', NULL, '', NULL, NULL, 317, 18, 50);
INSERT INTO `users` VALUES (388, '001311', '天童ユーザー', 'HS1311dummy@hamazushi.com', NULL, '', NULL, NULL, 318, 18, 50);
INSERT INTO `users` VALUES (389, '001309', '越前ユーザー', 'HS1309dummy@hamazushi.com', NULL, '', NULL, NULL, 319, 18, 50);
INSERT INTO `users` VALUES (390, '001310', '北本深井ユーザー', 'HS1310dummy@hamazushi.com', NULL, '', NULL, NULL, 320, 18, 50);
INSERT INTO `users` VALUES (391, '001312', '笛吹石和ユーザー', 'HS1312dummy@hamazushi.com', NULL, '', NULL, NULL, 321, 18, 50);
INSERT INTO `users` VALUES (392, '001313', '八代ユーザー', 'HS1313dummy@hamazushi.com', NULL, '', NULL, NULL, 322, 18, 50);
INSERT INTO `users` VALUES (393, '001314', '千葉土気ユーザー', 'HS1314dummy@hamazushi.com', NULL, '', NULL, NULL, 323, 18, 50);
INSERT INTO `users` VALUES (394, '001316', '富岡ユーザー', 'HS1316dummy@hamazushi.com', NULL, '', NULL, NULL, 324, 18, 50);
INSERT INTO `users` VALUES (395, '001317', '海老名上河内ユーザー', 'HS1317dummy@hamazushi.com', NULL, '', NULL, NULL, 325, 18, 50);
INSERT INTO `users` VALUES (396, '001318', '松阪三雲ユーザー', 'HS1318dummy@hamazushi.com', NULL, '', NULL, NULL, 326, 18, 50);
INSERT INTO `users` VALUES (397, '001319', '田川ユーザー', 'HS1319dummy@hamazushi.com', NULL, '', NULL, NULL, 327, 18, 50);
INSERT INTO `users` VALUES (398, '001315', '三次ユーザー', 'HS1315dummy@hamazushi.com', NULL, '', NULL, NULL, 328, 18, 50);
INSERT INTO `users` VALUES (399, '001322', '松原南新町ユーザー', 'HS1322dummy@hamazushi.com', NULL, '', NULL, NULL, 329, 18, 50);
INSERT INTO `users` VALUES (400, '001321', '土岐ユーザー', 'HS1321dummy@hamazushi.com', NULL, '', NULL, NULL, 330, 18, 50);
INSERT INTO `users` VALUES (401, '001323', '北茨城ユーザー', 'HS1323dummy@hamazushi.com', NULL, '', NULL, NULL, 331, 18, 50);
INSERT INTO `users` VALUES (402, '001324', '和歌山島崎ユーザー', 'HS1324dummy@hamazushi.com', NULL, '', NULL, NULL, 332, 18, 50);
INSERT INTO `users` VALUES (403, '001327', 'ららぽーと甲子園ユーザー', 'HS1327dummy@hamazushi.com', NULL, '', NULL, NULL, 333, 18, 50);
INSERT INTO `users` VALUES (404, '001325', '加賀ユーザー', 'HS1325dummy@hamazushi.com', NULL, '', NULL, NULL, 334, 18, 50);
INSERT INTO `users` VALUES (405, '001326', '56号大洲ユーザー', 'HS1326dummy@hamazushi.com', NULL, '', NULL, NULL, 335, 18, 50);
INSERT INTO `users` VALUES (406, '001328', '射水ユーザー', 'HS1328dummy@hamazushi.com', NULL, '', NULL, NULL, 336, 18, 50);
INSERT INTO `users` VALUES (407, '001329', '明石魚住ユーザー', 'HS1329dummy@hamazushi.com', NULL, '', NULL, NULL, 337, 18, 50);
INSERT INTO `users` VALUES (408, '001330', '熊本嘉島ユーザー', 'HS1330dummy@hamazushi.com', NULL, '', NULL, NULL, 338, 18, 50);
INSERT INTO `users` VALUES (409, '001320', '佐倉下志津ユーザー', 'HS1320dummy@hamazushi.com', NULL, '', NULL, NULL, 339, 18, 50);
INSERT INTO `users` VALUES (410, '001331', '門真岸和田ユーザー', 'HS1331dummy@hamazushi.com', NULL, '', NULL, NULL, 340, 18, 50);
INSERT INTO `users` VALUES (411, '001332', '相模原下九沢ユーザー', 'HS1332dummy@hamazushi.com', NULL, '', NULL, NULL, 341, 18, 50);
INSERT INTO `users` VALUES (412, '001333', 'ニューポートひたちなかユーザー', 'HS1333dummy@hamazushi.com', NULL, '', NULL, NULL, 342, 18, 50);
INSERT INTO `users` VALUES (413, '001334', '甲府荒川ユーザー', 'HS1334dummy@hamazushi.com', NULL, '', NULL, NULL, 343, 18, 50);
INSERT INTO `users` VALUES (414, '001335', '八女蒲原ユーザー', 'HS1335dummy@hamazushi.com', NULL, '', NULL, NULL, 344, 18, 50);
INSERT INTO `users` VALUES (415, '001336', '名取杜せきのしたユーザー', 'HS1336dummy@hamazushi.com', NULL, '', NULL, NULL, 345, 18, 50);
INSERT INTO `users` VALUES (416, '001337', '十和田ユーザー', 'HS1337dummy@hamazushi.com', NULL, '', NULL, NULL, 346, 18, 50);
INSERT INTO `users` VALUES (417, '001338', '鎌倉手広ユーザー', 'HS1338dummy@hamazushi.com', NULL, '', NULL, NULL, 347, 18, 50);
INSERT INTO `users` VALUES (418, '001339', '七尾ユーザー', 'HS1339dummy@hamazushi.com', NULL, '', NULL, NULL, 348, 18, 50);
INSERT INTO `users` VALUES (419, '001340', '草津東矢倉ユーザー', 'HS1340dummy@hamazushi.com', NULL, '', NULL, NULL, 349, 18, 50);
INSERT INTO `users` VALUES (420, '001341', '春日部中央ユーザー', 'HS1341dummy@hamazushi.com', NULL, '', NULL, NULL, 350, 18, 50);
INSERT INTO `users` VALUES (421, '001342', '奥州水沢ユーザー', 'HS1342dummy@hamazushi.com', NULL, '', NULL, NULL, 351, 18, 50);
INSERT INTO `users` VALUES (422, '001343', 'イオンタウン黒崎ユーザー', 'HS1343dummy@hamazushi.com', NULL, '', NULL, NULL, 352, 18, 50);
INSERT INTO `users` VALUES (423, '001344', '岩見沢ユーザー', 'HS1344dummy@hamazushi.com', NULL, '', NULL, NULL, 353, 18, 50);
INSERT INTO `users` VALUES (424, '001345', '幸手上高野ユーザー', 'HS1345dummy@hamazushi.com', NULL, '', NULL, NULL, 354, 18, 50);
INSERT INTO `users` VALUES (425, '001346', '仙台富谷ユーザー', 'HS1346dummy@hamazushi.com', NULL, '', NULL, NULL, 355, 18, 50);
INSERT INTO `users` VALUES (426, '001347', '海南ユーザー', 'HS1347dummy@hamazushi.com', NULL, '', NULL, NULL, 356, 18, 50);
INSERT INTO `users` VALUES (427, '001348', '福島吉倉ユーザー', 'HS1348dummy@hamazushi.com', NULL, '', NULL, NULL, 357, 18, 50);
INSERT INTO `users` VALUES (428, '001349', '函館本通ユーザー', 'HS1349dummy@hamazushi.com', NULL, '', NULL, NULL, 358, 18, 50);
INSERT INTO `users` VALUES (429, '001351', '足立花畑ユーザー', 'HS1351dummy@hamazushi.com', NULL, '', NULL, NULL, 359, 18, 50);
INSERT INTO `users` VALUES (430, '001350', '奈良押熊ユーザー', 'HS1350dummy@hamazushi.com', NULL, '', NULL, NULL, 360, 18, 50);
INSERT INTO `users` VALUES (431, '001352', '蟹江ユーザー', 'HS1352dummy@hamazushi.com', NULL, '', NULL, NULL, 361, 18, 50);
INSERT INTO `users` VALUES (432, '001353', '日光今市ユーザー', 'HS1353dummy@hamazushi.com', NULL, '', NULL, NULL, 362, 18, 50);
INSERT INTO `users` VALUES (433, '001354', '福山高西ユーザー', 'HS1354dummy@hamazushi.com', NULL, '', NULL, NULL, 363, 18, 50);
INSERT INTO `users` VALUES (434, '001355', '岩倉川井町ユーザー', 'HS1355dummy@hamazushi.com', NULL, '', NULL, NULL, 364, 18, 50);
INSERT INTO `users` VALUES (435, '001356', '日立金沢ユーザー', 'HS1356dummy@hamazushi.com', NULL, '', NULL, NULL, 365, 18, 50);
INSERT INTO `users` VALUES (436, '001358', '姶良加治木ユーザー', 'HS1358dummy@hamazushi.com', NULL, '', NULL, NULL, 366, 18, 50);
INSERT INTO `users` VALUES (437, '001357', '糸満潮平ユーザー', 'HS1357dummy@hamazushi.com', NULL, '', NULL, NULL, 367, 18, 50);
INSERT INTO `users` VALUES (438, '001359', '菰野ユーザー', 'HS1359dummy@hamazushi.com', NULL, '', NULL, NULL, 368, 18, 50);
INSERT INTO `users` VALUES (439, '001360', '前橋上泉ユーザー', 'HS1360dummy@hamazushi.com', NULL, '', NULL, NULL, 369, 18, 50);
INSERT INTO `users` VALUES (440, '001361', '那須塩原ユーザー', 'HS1361dummy@hamazushi.com', NULL, '', NULL, NULL, 370, 18, 50);
INSERT INTO `users` VALUES (441, '001362', '小松ユーザー', 'HS1362dummy@hamazushi.com', NULL, '', NULL, NULL, 371, 18, 50);
INSERT INTO `users` VALUES (442, '001363', '都城ユーザー', 'HS1363dummy@hamazushi.com', NULL, '', NULL, NULL, 372, 18, 50);
INSERT INTO `users` VALUES (443, '001364', '佐久中込ユーザー', 'HS1364dummy@hamazushi.com', NULL, '', NULL, NULL, 373, 18, 50);
INSERT INTO `users` VALUES (444, '001365', '伊丹昆陽ユーザー', 'HS1365dummy@hamazushi.com', NULL, '', NULL, NULL, 374, 18, 50);
INSERT INTO `users` VALUES (445, '001366', '青森石江ユーザー', 'HS1366dummy@hamazushi.com', NULL, '', NULL, NULL, 375, 18, 50);
INSERT INTO `users` VALUES (446, '001367', '小牧下末ユーザー', 'HS1367dummy@hamazushi.com', NULL, '', NULL, NULL, 376, 18, 50);
INSERT INTO `users` VALUES (447, '001368', 'つがる柏ユーザー', 'HS1368dummy@hamazushi.com', NULL, '', NULL, NULL, 377, 18, 50);
INSERT INTO `users` VALUES (448, '001369', '田原ユーザー', 'HS1369dummy@hamazushi.com', NULL, '', NULL, NULL, 378, 18, 50);
INSERT INTO `users` VALUES (449, '001371', '箕輪ユーザー', 'HS1371dummy@hamazushi.com', NULL, '', NULL, NULL, 379, 18, 50);
INSERT INTO `users` VALUES (450, '001372', '稲敷江戸崎ユーザー', 'HS1372dummy@hamazushi.com', NULL, '', NULL, NULL, 380, 18, 50);
INSERT INTO `users` VALUES (451, '001373', '郡山堤ユーザー', 'HS1373dummy@hamazushi.com', NULL, '', NULL, NULL, 381, 18, 50);
INSERT INTO `users` VALUES (452, '001374', '富士見羽沢ユーザー', 'HS1374dummy@hamazushi.com', NULL, '', NULL, NULL, 382, 18, 50);
INSERT INTO `users` VALUES (453, '001370', '君津東坂田ユーザー', 'HS1370dummy@hamazushi.com', NULL, '', NULL, NULL, 383, 18, 50);
INSERT INTO `users` VALUES (454, '001376', '加西ユーザー', 'HS1376dummy@hamazushi.com', NULL, '', NULL, NULL, 384, 18, 50);
INSERT INTO `users` VALUES (455, '001377', '那覇古島ユーザー', 'HS1377dummy@hamazushi.com', NULL, '', NULL, NULL, 385, 18, 50);
INSERT INTO `users` VALUES (456, '001378', 'つくば研究学園ユーザー', 'HS1378dummy@hamazushi.com', NULL, '', NULL, NULL, 386, 18, 50);
INSERT INTO `users` VALUES (457, '001379', '仙台六丁の目ユーザー', 'HS1379dummy@hamazushi.com', NULL, '', NULL, NULL, 387, 18, 50);
INSERT INTO `users` VALUES (458, '001380', '一関ユーザー', 'HS1380dummy@hamazushi.com', NULL, '', NULL, NULL, 388, 18, 50);
INSERT INTO `users` VALUES (459, '001381', '桜井東新堂ユーザー', 'HS1381dummy@hamazushi.com', NULL, '', NULL, NULL, 389, 18, 50);
INSERT INTO `users` VALUES (460, '001382', '所沢下安松ユーザー', 'HS1382dummy@hamazushi.com', NULL, '', NULL, NULL, 390, 18, 50);
INSERT INTO `users` VALUES (461, '001383', '駒ヶ根ユーザー', 'HS1383dummy@hamazushi.com', NULL, '', NULL, NULL, 391, 18, 50);
INSERT INTO `users` VALUES (462, '001384', '丸亀土器ユーザー', 'HS1384dummy@hamazushi.com', NULL, '', NULL, NULL, 392, 18, 50);
INSERT INTO `users` VALUES (463, '001385', '三沢ユーザー', 'HS1385dummy@hamazushi.com', NULL, '', NULL, NULL, 393, 18, 50);
INSERT INTO `users` VALUES (464, '001386', '姫路野里ユーザー', 'HS1386dummy@hamazushi.com', NULL, '', NULL, NULL, 394, 18, 50);
INSERT INTO `users` VALUES (465, '001375', '黒部ユーザー', 'HS1375dummy@hamazushi.com', NULL, '', NULL, NULL, 395, 18, 50);
INSERT INTO `users` VALUES (466, '001387', '南国ユーザー', 'HS1387dummy@hamazushi.com', NULL, '', NULL, NULL, 396, 18, 50);
INSERT INTO `users` VALUES (467, '001388', '二本松安達ユーザー', 'HS1388dummy@hamazushi.com', NULL, '', NULL, NULL, 397, 18, 50);
INSERT INTO `users` VALUES (468, '001389', '三条ユーザー', 'HS1389dummy@hamazushi.com', NULL, '', NULL, NULL, 398, 18, 50);
INSERT INTO `users` VALUES (469, '001390', '美濃加茂ユーザー', 'HS1390dummy@hamazushi.com', NULL, '', NULL, NULL, 399, 18, 50);
INSERT INTO `users` VALUES (470, '001391', '仙台中野ユーザー', 'HS1391dummy@hamazushi.com', NULL, '', NULL, NULL, 400, 18, 50);
INSERT INTO `users` VALUES (471, '001392', '小林ユーザー', 'HS1392dummy@hamazushi.com', NULL, '', NULL, NULL, 401, 18, 50);
INSERT INTO `users` VALUES (472, '001393', '滑川ユーザー', 'HS1393dummy@hamazushi.com', NULL, '', NULL, NULL, 402, 18, 50);
INSERT INTO `users` VALUES (473, '001394', '北上藤沢ユーザー', 'HS1394dummy@hamazushi.com', NULL, '', NULL, NULL, 403, 18, 50);
INSERT INTO `users` VALUES (474, '001395', '燕吉田ユーザー', 'HS1395dummy@hamazushi.com', NULL, '', NULL, NULL, 404, 18, 50);
INSERT INTO `users` VALUES (475, '001396', '一宮木曽川ユーザー', 'HS1396dummy@hamazushi.com', NULL, '', NULL, NULL, 405, 18, 50);
INSERT INTO `users` VALUES (476, '001397', '長浜ユーザー', 'HS1397dummy@hamazushi.com', NULL, '', NULL, NULL, 406, 18, 50);
INSERT INTO `users` VALUES (477, '001398', '札幌桑園ユーザー', 'HS1398dummy@hamazushi.com', NULL, '', NULL, NULL, 407, 18, 50);
INSERT INTO `users` VALUES (478, '001400', '福島矢野目ユーザー', 'HS1400dummy@hamazushi.com', NULL, '', NULL, NULL, 408, 18, 50);
INSERT INTO `users` VALUES (479, '001401', '中城ユーザー', 'HS1401dummy@hamazushi.com', NULL, '', NULL, NULL, 409, 18, 50);
INSERT INTO `users` VALUES (480, '001402', 'ふじみ野ユーザー', 'HS1402dummy@hamazushi.com', NULL, '', NULL, NULL, 410, 18, 50);
INSERT INTO `users` VALUES (481, '001403', '4号柴田ユーザー', 'HS1403dummy@hamazushi.com', NULL, '', NULL, NULL, 411, 18, 50);
INSERT INTO `users` VALUES (482, '001404', '加古川平岡ユーザー', 'HS1404dummy@hamazushi.com', NULL, '', NULL, NULL, 412, 18, 50);
INSERT INTO `users` VALUES (483, '001405', '尾張旭ユーザー', 'HS1405dummy@hamazushi.com', NULL, '', NULL, NULL, 413, 18, 50);
INSERT INTO `users` VALUES (484, '001406', '上越ユーザー', 'HS1406dummy@hamazushi.com', NULL, '', NULL, NULL, 414, 18, 50);
INSERT INTO `users` VALUES (485, '001399', '砺波ユーザー', 'HS1399dummy@hamazushi.com', NULL, '', NULL, NULL, 415, 18, 50);
INSERT INTO `users` VALUES (486, '001407', '泉大津松之浜ユーザー', 'HS1407dummy@hamazushi.com', NULL, '', NULL, NULL, 416, 18, 50);
INSERT INTO `users` VALUES (487, '001409', '横浜立場ユーザー', 'HS1409dummy@hamazushi.com', NULL, '', NULL, NULL, 417, 18, 50);
INSERT INTO `users` VALUES (488, '001410', 'あきる野秋川ユーザー', 'HS1410dummy@hamazushi.com', NULL, '', NULL, NULL, 418, 18, 50);
INSERT INTO `users` VALUES (489, '001411', '日南ユーザー', 'HS1411dummy@hamazushi.com', NULL, '', NULL, NULL, 419, 18, 50);
INSERT INTO `users` VALUES (490, '001412', '都島本通ユーザー', 'HS1412dummy@hamazushi.com', NULL, '', NULL, NULL, 420, 18, 50);
INSERT INTO `users` VALUES (491, '001413', '有田ユーザー', 'HS1413dummy@hamazushi.com', NULL, '', NULL, NULL, 421, 18, 50);
INSERT INTO `users` VALUES (492, '001414', '川崎野川ユーザー', 'HS1414dummy@hamazushi.com', NULL, '', NULL, NULL, 422, 18, 50);
INSERT INTO `users` VALUES (493, '001416', '西尾ユーザー', 'HS1416dummy@hamazushi.com', NULL, '', NULL, NULL, 423, 18, 50);
INSERT INTO `users` VALUES (494, '001420', '坂戸にっさいユーザー', 'HS1420dummy@hamazushi.com', NULL, '', NULL, NULL, 424, 18, 50);
INSERT INTO `users` VALUES (495, '001419', 'イオンモール常滑ユーザー', 'HS1419dummy@hamazushi.com', NULL, '', NULL, NULL, 425, 18, 50);
INSERT INTO `users` VALUES (496, '001417', '直方感田ユーザー', 'HS1417dummy@hamazushi.com', NULL, '', NULL, NULL, 426, 18, 50);
INSERT INTO `users` VALUES (497, '001418', '会津若松門田ユーザー', 'HS1418dummy@hamazushi.com', NULL, '', NULL, NULL, 427, 18, 50);
INSERT INTO `users` VALUES (498, '001421', '米子ユーザー', 'HS1421dummy@hamazushi.com', NULL, '', NULL, NULL, 428, 18, 50);
INSERT INTO `users` VALUES (499, '001423', '川越上寺山ユーザー', 'HS1423dummy@hamazushi.com', NULL, '', NULL, NULL, 429, 18, 50);
INSERT INTO `users` VALUES (500, '001424', '銚子ユーザー', 'HS1424dummy@hamazushi.com', NULL, '', NULL, NULL, 430, 18, 50);
INSERT INTO `users` VALUES (501, '001425', '呉焼山ユーザー', 'HS1425dummy@hamazushi.com', NULL, '', NULL, NULL, 431, 18, 50);
INSERT INTO `users` VALUES (502, '001426', '帯広西ユーザー', 'HS1426dummy@hamazushi.com', NULL, '', NULL, NULL, 432, 18, 50);
INSERT INTO `users` VALUES (503, '001427', '金沢神谷内ユーザー', 'HS1427dummy@hamazushi.com', NULL, '', NULL, NULL, 433, 18, 50);
INSERT INTO `users` VALUES (504, '001428', '茅ヶ崎松が丘ユーザー', 'HS1428dummy@hamazushi.com', NULL, '', NULL, NULL, 434, 18, 50);
INSERT INTO `users` VALUES (505, '001429', '高知河ノ瀬ユーザー', 'HS1429dummy@hamazushi.com', NULL, '', NULL, NULL, 435, 18, 50);
INSERT INTO `users` VALUES (506, '001430', '橋本隅田町ユーザー', 'HS1430dummy@hamazushi.com', NULL, '', NULL, NULL, 436, 18, 50);
INSERT INTO `users` VALUES (507, '001431', 'マーケットスクエア川崎イーストユーザー', 'HS1431dummy@hamazushi.com', NULL, '', NULL, NULL, 437, 18, 50);
INSERT INTO `users` VALUES (508, '001415', '名護ユーザー', 'HS1415dummy@hamazushi.com', NULL, '', NULL, NULL, 438, 18, 50);
INSERT INTO `users` VALUES (509, '001433', '博多千代ユーザー', 'HS1433dummy@hamazushi.com', NULL, '', NULL, NULL, 439, 18, 50);
INSERT INTO `users` VALUES (510, '001422', '港北インターユーザー', 'HS1422dummy@hamazushi.com', NULL, '', NULL, NULL, 440, 18, 50);
INSERT INTO `users` VALUES (511, '001434', '横浜上郷ユーザー', 'HS1434dummy@hamazushi.com', NULL, '', NULL, NULL, 441, 18, 50);
INSERT INTO `users` VALUES (512, '001435', '知多新知ユーザー', 'HS1435dummy@hamazushi.com', NULL, '', NULL, NULL, 442, 18, 50);
INSERT INTO `users` VALUES (513, '001432', '伊万里ユーザー', 'HS1432dummy@hamazushi.com', NULL, '', NULL, NULL, 443, 18, 50);
INSERT INTO `users` VALUES (514, '001436', '山科椥辻ユーザー', 'HS1436dummy@hamazushi.com', NULL, '', NULL, NULL, 444, 18, 50);
INSERT INTO `users` VALUES (515, '001437', '行橋ユーザー', 'HS1437dummy@hamazushi.com', NULL, '', NULL, NULL, 445, 18, 50);
INSERT INTO `users` VALUES (516, '001438', '名古屋東茶屋ユーザー', 'HS1438dummy@hamazushi.com', NULL, '', NULL, NULL, 446, 18, 50);
INSERT INTO `users` VALUES (517, '001439', '神栖ユーザー', 'HS1439dummy@hamazushi.com', NULL, '', NULL, NULL, 447, 18, 50);
INSERT INTO `users` VALUES (518, '001440', '練馬土支田ユーザー', 'HS1440dummy@hamazushi.com', NULL, '', NULL, NULL, 448, 18, 50);
INSERT INTO `users` VALUES (519, '001441', '福岡曰佐ユーザー', 'HS1441dummy@hamazushi.com', NULL, '', NULL, NULL, 449, 18, 50);
INSERT INTO `users` VALUES (520, '001442', '釧路愛国ユーザー', 'HS1442dummy@hamazushi.com', NULL, '', NULL, NULL, 450, 18, 50);
INSERT INTO `users` VALUES (521, '001443', '静岡平和ユーザー', 'HS1443dummy@hamazushi.com', NULL, '', NULL, NULL, 451, 18, 50);
INSERT INTO `users` VALUES (522, '001444', '佐野赤坂ユーザー', 'HS1444dummy@hamazushi.com', NULL, '', NULL, NULL, 452, 18, 50);
INSERT INTO `users` VALUES (523, '001445', '名古屋鳴子ユーザー', 'HS1445dummy@hamazushi.com', NULL, '', NULL, NULL, 453, 18, 50);
INSERT INTO `users` VALUES (524, '001446', '広島八木ユーザー', 'HS1446dummy@hamazushi.com', NULL, '', NULL, NULL, 454, 18, 50);
INSERT INTO `users` VALUES (525, '001447', '石巻蛇田ユーザー', 'HS1447dummy@hamazushi.com', NULL, '', NULL, NULL, 455, 18, 50);
INSERT INTO `users` VALUES (526, '001448', '千歳ユーザー', 'HS1448dummy@hamazushi.com', NULL, '', NULL, NULL, 456, 18, 50);
INSERT INTO `users` VALUES (527, '001449', '茨木新和町ユーザー', 'HS1449dummy@hamazushi.com', NULL, '', NULL, NULL, 457, 18, 50);
INSERT INTO `users` VALUES (528, '001450', '三原ユーザー', 'HS1450dummy@hamazushi.com', NULL, '', NULL, NULL, 458, 18, 50);
INSERT INTO `users` VALUES (529, '001451', '洲本ユーザー', 'HS1451dummy@hamazushi.com', NULL, '', NULL, NULL, 459, 18, 50);
INSERT INTO `users` VALUES (530, '001452', '米沢ユーザー', 'HS1452dummy@hamazushi.com', NULL, '', NULL, NULL, 460, 18, 50);
INSERT INTO `users` VALUES (531, '001453', '沖縄登川ユーザー', 'HS1453dummy@hamazushi.com', NULL, '', NULL, NULL, 461, 18, 50);
INSERT INTO `users` VALUES (532, '001454', '神戸上津台ユーザー', 'HS1454dummy@hamazushi.com', NULL, '', NULL, NULL, 462, 18, 50);
INSERT INTO `users` VALUES (533, '001455', '横浜菊名ユーザー', 'HS1455dummy@hamazushi.com', NULL, '', NULL, NULL, 463, 18, 50);
INSERT INTO `users` VALUES (534, '001456', '島田ユーザー', 'HS1456dummy@hamazushi.com', NULL, '', NULL, NULL, 464, 18, 50);
INSERT INTO `users` VALUES (535, '001457', '豊中小曽根ユーザー', 'HS1457dummy@hamazushi.com', NULL, '', NULL, NULL, 465, 18, 50);
INSERT INTO `users` VALUES (536, '001458', '久留米南町ユーザー', 'HS1458dummy@hamazushi.com', NULL, '', NULL, NULL, 466, 18, 50);
INSERT INTO `users` VALUES (537, '001459', 'ウニクス伊奈ユーザー', 'HS1459dummy@hamazushi.com', NULL, '', NULL, NULL, 467, 18, 50);
INSERT INTO `users` VALUES (538, '001460', '大和つきみ野ユーザー', 'HS1460dummy@hamazushi.com', NULL, '', NULL, NULL, 468, 18, 50);
INSERT INTO `users` VALUES (539, '001461', '八尾東久宝寺ユーザー', 'HS1461dummy@hamazushi.com', NULL, '', NULL, NULL, 469, 18, 50);
INSERT INTO `users` VALUES (540, '001462', '垂水多聞ユーザー', 'HS1462dummy@hamazushi.com', NULL, '', NULL, NULL, 470, 18, 50);
INSERT INTO `users` VALUES (541, '001463', '前橋元総社ユーザー', 'HS1463dummy@hamazushi.com', NULL, '', NULL, NULL, 471, 18, 50);
INSERT INTO `users` VALUES (542, '001464', '平塚南原ユーザー', 'HS1464dummy@hamazushi.com', NULL, '', NULL, NULL, 472, 18, 50);
INSERT INTO `users` VALUES (543, '001465', '金閣寺ユーザー', 'HS1465dummy@hamazushi.com', NULL, '', NULL, NULL, 473, 18, 50);
INSERT INTO `users` VALUES (544, '001466', '町田野津田ユーザー', 'HS1466dummy@hamazushi.com', NULL, '', NULL, NULL, 474, 18, 50);
INSERT INTO `users` VALUES (545, '001467', 'マチニワ豊川ユーザー', 'HS1467dummy@hamazushi.com', NULL, '', NULL, NULL, 475, 18, 50);
INSERT INTO `users` VALUES (546, '001468', '下松ユーザー', 'HS1468dummy@hamazushi.com', NULL, '', NULL, NULL, 476, 18, 50);
INSERT INTO `users` VALUES (547, '001469', '幕張ICユーザー', 'HS1469dummy@hamazushi.com', NULL, '', NULL, NULL, 477, 18, 50);
INSERT INTO `users` VALUES (548, '001470', '横浜笹下ユーザー', 'HS1470dummy@hamazushi.com', NULL, '', NULL, NULL, 478, 18, 50);
INSERT INTO `users` VALUES (549, '001471', '新潟新津ユーザー', 'HS1471dummy@hamazushi.com', NULL, '', NULL, NULL, 479, 18, 50);
INSERT INTO `users` VALUES (550, '001472', '小郡大保ユーザー', 'HS1472dummy@hamazushi.com', NULL, '', NULL, NULL, 480, 18, 50);
INSERT INTO `users` VALUES (551, '001473', '西東京北町ユーザー', 'HS1473dummy@hamazushi.com', NULL, '', NULL, NULL, 481, 18, 50);
INSERT INTO `users` VALUES (552, '001474', '広島宇品ユーザー', 'HS1474dummy@hamazushi.com', NULL, '', NULL, NULL, 482, 18, 50);
INSERT INTO `users` VALUES (553, '001475', '朝霞溝沼ユーザー', 'HS1475dummy@hamazushi.com', NULL, '', NULL, NULL, 483, 18, 50);
INSERT INTO `users` VALUES (554, '001476', '大宮ラクーンユーザー', 'HS1476dummy@hamazushi.com', NULL, '', NULL, NULL, 484, 18, 50);
INSERT INTO `users` VALUES (555, '001477', '豊田御立町ユーザー', 'HS1477dummy@hamazushi.com', NULL, '', NULL, NULL, 485, 18, 50);
INSERT INTO `users` VALUES (556, '001478', '旭川東光ユーザー', 'HS1478dummy@hamazushi.com', NULL, '', NULL, NULL, 486, 18, 50);
INSERT INTO `users` VALUES (557, '001479', '門真殿島ユーザー', 'HS1479dummy@hamazushi.com', NULL, '', NULL, NULL, 487, 18, 50);
INSERT INTO `users` VALUES (558, '001480', '益田ユーザー', 'HS1480dummy@hamazushi.com', NULL, '', NULL, NULL, 488, 18, 50);
INSERT INTO `users` VALUES (559, '001481', '421号東員ユーザー', 'HS1481dummy@hamazushi.com', NULL, '', NULL, NULL, 489, 18, 50);
INSERT INTO `users` VALUES (560, '001482', '恵庭ユーザー', 'HS1482dummy@hamazushi.com', NULL, '', NULL, NULL, 490, 18, 50);
INSERT INTO `users` VALUES (561, '001483', '佐世保中里ユーザー', 'HS1483dummy@hamazushi.com', NULL, '', NULL, NULL, 491, 18, 50);
INSERT INTO `users` VALUES (562, '001484', '広島楽々園ユーザー', 'HS1484dummy@hamazushi.com', NULL, '', NULL, NULL, 492, 18, 50);
INSERT INTO `users` VALUES (563, '001485', 'スーパービバホーム豊洲ユーザー', 'HS1485dummy@hamazushi.com', NULL, '', NULL, NULL, 493, 18, 50);
INSERT INTO `users` VALUES (564, '001486', '東新小岩ユーザー', 'HS1486dummy@hamazushi.com', NULL, '', NULL, NULL, 494, 18, 50);
INSERT INTO `users` VALUES (565, '001487', '三鷹野崎ユーザー', 'HS1487dummy@hamazushi.com', NULL, '', NULL, NULL, 495, 18, 50);
INSERT INTO `users` VALUES (566, '001488', '南大沢駅前ユーザー', 'HS1488dummy@hamazushi.com', NULL, '', NULL, NULL, 496, 18, 50);
INSERT INTO `users` VALUES (567, '001489', '松戸小金原ユーザー', 'HS1489dummy@hamazushi.com', NULL, '', NULL, NULL, 497, 18, 50);
INSERT INTO `users` VALUES (568, '001490', '下妻ユーザー', 'HS1490dummy@hamazushi.com', NULL, '', NULL, NULL, 498, 18, 50);
INSERT INTO `users` VALUES (569, '001491', '座間ひばりが丘ユーザー', 'HS1491dummy@hamazushi.com', NULL, '', NULL, NULL, 499, 18, 50);
INSERT INTO `users` VALUES (570, '001492', '南船橋ユーザー', 'HS1492dummy@hamazushi.com', NULL, '', NULL, NULL, 500, 18, 50);
INSERT INTO `users` VALUES (571, '001493', '葛城東室ユーザー', 'HS1493dummy@hamazushi.com', NULL, '', NULL, NULL, 501, 18, 50);
INSERT INTO `users` VALUES (572, '001494', '新城ユーザー', 'HS1494dummy@hamazushi.com', NULL, '', NULL, NULL, 502, 18, 50);
INSERT INTO `users` VALUES (573, '001495', '熊本佐土原ユーザー', 'HS1495dummy@hamazushi.com', NULL, '', NULL, NULL, 503, 18, 50);
INSERT INTO `users` VALUES (574, '001496', '新百合ヶ丘駅前ユーザー', 'HS1496dummy@hamazushi.com', NULL, '', NULL, NULL, 504, 18, 50);
INSERT INTO `users` VALUES (575, '001497', '東海大学前ユーザー', 'HS1497dummy@hamazushi.com', NULL, '', NULL, NULL, 505, 18, 50);
INSERT INTO `users` VALUES (576, '001498', '武蔵野八幡町ユーザー', 'HS1498dummy@hamazushi.com', NULL, '', NULL, NULL, 506, 18, 50);
INSERT INTO `users` VALUES (577, '001499', '武蔵村山ユーザー', 'HS1499dummy@hamazushi.com', NULL, '', NULL, NULL, 507, 18, 50);
INSERT INTO `users` VALUES (578, '002500', '岩国ユーザー', 'HS2500dummy@hamazushi.com', NULL, '', NULL, NULL, 508, 18, 50);
INSERT INTO `users` VALUES (579, '002501', '鶴見中央ユーザー', 'HS2501dummy@hamazushi.com', NULL, '', NULL, NULL, 509, 18, 50);
INSERT INTO `users` VALUES (580, '002502', '泉佐野鶴原ユーザー', 'HS2502dummy@hamazushi.com', NULL, 'MolxRi8wrnhHzDcNsU0frqD2Je7OM4Jp7kxG9N6OCqxxY7KFv3ck8iulLPs9', NULL, '2021-03-03 23:38:13', 510, 18, 50);
INSERT INTO `users` VALUES (581, '002503', '松戸新田駅北ユーザー', 'HS2503dummy@hamazushi.com', NULL, '', NULL, NULL, 511, 18, 50);
INSERT INTO `users` VALUES (582, '002504', '若松ひびきのユーザー', 'HS2504dummy@hamazushi.com', NULL, '', NULL, NULL, 512, 18, 50);
INSERT INTO `users` VALUES (583, '002505', '春日井大和通ユーザー', 'HS2505dummy@hamazushi.com', NULL, '', NULL, NULL, 513, 18, 50);
INSERT INTO `users` VALUES (584, '002506', '相模原光が丘ユーザー', 'HS2506dummy@hamazushi.com', NULL, '', NULL, NULL, 514, 18, 50);
INSERT INTO `users` VALUES (585, '002507', '天理ユーザー', 'HS2507dummy@hamazushi.com', NULL, '', NULL, NULL, 515, 18, 50);
INSERT INTO `users` VALUES (586, '002508', '西条周布ユーザー', 'HS2508dummy@hamazushi.com', NULL, '', NULL, NULL, 516, 18, 50);
INSERT INTO `users` VALUES (587, '002509', '江別ユーザー', 'HS2509dummy@hamazushi.com', NULL, '', NULL, NULL, 517, 18, 50);
INSERT INTO `users` VALUES (588, '002510', '横浜岡津ユーザー', 'HS2510dummy@hamazushi.com', NULL, '', NULL, NULL, 518, 18, 50);
INSERT INTO `users` VALUES (589, '002511', '小樽築港ユーザー', 'HS2511dummy@hamazushi.com', NULL, '', NULL, NULL, 519, 18, 50);
INSERT INTO `users` VALUES (590, '002512', 'フォレストモール木津川ユーザー', 'HS2512dummy@hamazushi.com', NULL, '', NULL, NULL, 520, 18, 50);
INSERT INTO `users` VALUES (591, '002513', '京都洛西ユーザー', 'HS2513dummy@hamazushi.com', NULL, '', NULL, NULL, 521, 18, 50);
INSERT INTO `users` VALUES (592, '002514', '足立東和ユーザー', 'HS2514dummy@hamazushi.com', NULL, '', NULL, NULL, 522, 18, 50);
INSERT INTO `users` VALUES (593, '002515', '練馬春日町ユーザー', 'HS2515dummy@hamazushi.com', NULL, '', NULL, NULL, 523, 18, 50);
INSERT INTO `users` VALUES (594, '002516', '市川菅野ユーザー', 'HS2516dummy@hamazushi.com', NULL, '', NULL, NULL, 524, 18, 50);
INSERT INTO `users` VALUES (595, '002517', '熊本東バイパスユーザー', 'HS2517dummy@hamazushi.com', NULL, '', NULL, NULL, 525, 18, 50);
INSERT INTO `users` VALUES (596, '002518', '船橋習志野台ユーザー', 'HS2518dummy@hamazushi.com', NULL, '', NULL, NULL, 526, 18, 50);
INSERT INTO `users` VALUES (597, '002520', '川崎下麻生ユーザー', 'HS2520dummy@hamazushi.com', NULL, '', NULL, NULL, 527, 18, 50);
INSERT INTO `users` VALUES (598, '002519', '羽村小作台ユーザー', 'HS2519dummy@hamazushi.com', NULL, '', NULL, NULL, 528, 18, 50);
INSERT INTO `users` VALUES (599, '002522', '南相馬原町ユーザー', 'HS2522dummy@hamazushi.com', NULL, '', NULL, NULL, 529, 18, 50);
INSERT INTO `users` VALUES (600, '002521', '飯能ユーザー', 'HS2521dummy@hamazushi.com', NULL, '', NULL, NULL, 530, 18, 50);
INSERT INTO `users` VALUES (601, '002523', '蕨ユーザー', 'HS2523dummy@hamazushi.com', NULL, '', NULL, NULL, 531, 18, 50);
INSERT INTO `users` VALUES (602, '002524', '酒田ユーザー', 'HS2524dummy@hamazushi.com', NULL, '', NULL, NULL, 532, 18, 50);
INSERT INTO `users` VALUES (603, '002525', '港北高田ユーザー', 'HS2525dummy@hamazushi.com', NULL, '', NULL, NULL, 533, 18, 50);
INSERT INTO `users` VALUES (604, '002526', '那覇小禄ユーザー', 'HS2526dummy@hamazushi.com', NULL, '', NULL, NULL, 534, 18, 50);
INSERT INTO `users` VALUES (605, '002527', '東大宮ユーザー', 'HS2527dummy@hamazushi.com', NULL, '', NULL, NULL, 535, 18, 50);
INSERT INTO `users` VALUES (606, '002528', '42号御坊ユーザー', 'HS2528dummy@hamazushi.com', NULL, '', NULL, NULL, 536, 18, 50);
INSERT INTO `users` VALUES (607, '002530', '所沢トコトコスクエアユーザー', 'HS2530dummy@hamazushi.com', NULL, '', NULL, NULL, 537, 18, 50);
INSERT INTO `users` VALUES (608, '002529', '小松島ユーザー', 'HS2529dummy@hamazushi.com', NULL, '', NULL, NULL, 538, 18, 50);
INSERT INTO `users` VALUES (609, '002531', 'オーケーみなとみらいユーザー', 'HS2531dummy@hamazushi.com', NULL, '', NULL, NULL, 539, 18, 50);
INSERT INTO `users` VALUES (610, '002532', '蒲田駅西口ユーザー', 'HS2532dummy@hamazushi.com', NULL, '', NULL, NULL, 540, 18, 50);
INSERT INTO `users` VALUES (611, '999999', 'テストユーザー', 'test@idsweb.cc', NULL, '86uKvCoeelIPpC1HsIqEKxxXVDjE87O512rNCQn5vAOSx1j9OAO5JgRFXyBN', '2021-03-23 11:10:41', '2021-09-16 12:28:05', 541, 18, 50);
INSERT INTO `users` VALUES (612, '999998', '西岡テストBM', 'nishioka@interface-design.jp', NULL, '9IITJI6w0LfwIGyyMrEM7TsxYc7vXO1hgrRE7uu9o57bFKpWCj56ShTevLQO', NULL, '2021-07-22 19:02:50', NULL, 18, 30);
INSERT INTO `users` VALUES (615, '999997', '福原テストBM', 'yasu.fukuhara@interface-design.jp', NULL, 'dueyvP5BtLt7AtEnwkO4PXUrH1IZtVTCX4IlXFkKlQkxl1pJbHW2G3jLcBYQ', NULL, '2021-07-02 10:44:56', NULL, 18, 30);
INSERT INTO `users` VALUES (616, '999996', '真栄喜テストBM', 'satoru.maeki@zensho.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (617, '999995', '川手テストBM', 'eiji.kawate@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (618, '999909', 'テストDM', 'nads1012+testdm1@gmail.com', NULL, NULL, NULL, NULL, NULL, 18, 20);
INSERT INTO `users` VALUES (619, '004631', '星　敏昭', 'toshiaki.hoshi@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (620, '004661', '黒澤　大地', 'taichi.kurosawa@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (621, '004670', '豊田　良樹', 'yoshiki.toyoda@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (622, '004679', '矢内　拓郎', 'takurou.yanai@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (623, '004712', '美川　友秀', 'tomohide.mikawa@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (624, '004658', '桂　昂平', 'kouhei.katsura@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (625, '004890', '杉原　和明', 'kazuaki.sugihara@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (626, '014021', '鈴木　拓郎', 'takurou.suzuki@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (627, '027246', '蛇谷　健', 'takeshi.jatani@hamazushi.com', NULL, NULL, NULL, NULL, NULL, 18, 30);
INSERT INTO `users` VALUES (628, '002536', '喜連瓜破ユーザー', 'HS2536dummy@hamazushi.com', NULL, NULL, NULL, NULL, 542, 18, 50);
INSERT INTO `users` VALUES (629, '002537', '中間ユーザー', 'HS2537dummy@hamazushi.com', NULL, NULL, NULL, NULL, 543, 18, 50);
INSERT INTO `users` VALUES (630, '002538', '松井山手ユーザー', 'HS2538dummy@hamazushi.com', NULL, NULL, NULL, NULL, 544, 18, 50);
INSERT INTO `users` VALUES (631, '999999', 'テストユーザー', 'test@idsweb.cc', NULL, 'bWfVUQZWjZCtBMyYMgS0IaUdwZUlXM99o9b6mVb1k024NrEcUjBvmOv37vAy', '2021-03-23 11:10:41', '2021-07-16 17:42:57', 545, 2, 50);
INSERT INTO `users` VALUES (632, '999997', '福原テストBM', 'yasu.fukuhara@interface-design.jp', NULL, 'Aczeq9ZCBWpZVmlVE5bQsybypXGAk0EjVcKQaM4A7G7giBdq5gRrIZanh2uN', NULL, '2021-07-16 16:31:12', NULL, 2, 30);
INSERT INTO `users` VALUES (633, '999909', 'テストDM', 'nads1012+testdm1@gmail.com', NULL, NULL, NULL, NULL, NULL, 2, 20);
INSERT INTO `users` VALUES (634, '999998', '西岡テストBM', 'nishioka@interface-design.jp', NULL, 'Fl3XjuJ1DUpXz8NLJnT1pI4EMcLUI2ownqG4WA1w7e1J2unNPhZNnFe7ZpcF', NULL, '2021-07-20 10:33:46', NULL, 2, 30);

SET FOREIGN_KEY_CHECKS = 1;
