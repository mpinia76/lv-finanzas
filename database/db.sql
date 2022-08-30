-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.38-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table lv_finanzas.account
CREATE TABLE IF NOT EXISTS `account` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` text,
    `number` varchar(100) DEFAULT NULL,
    `type` enum('corriente','ahorro') DEFAULT 'ahorro',
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

-- Dumping data for table lv_finanzas.account: ~5 rows (approximately)
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`id`, `name`, `number`, `type`) VALUES
                                                           (33, 'Marcos Nación', '21700301128159', 'ahorro'),
                                                           (34, 'Majo Nación', '21700301576620', 'ahorro'),
                                                           (35, 'Marcos BAPRO Caja de Ahorro', '5209-517085/0', 'ahorro'),
                                                           (36, 'Mercado Pago Marcos', '-', 'ahorro'),
                                                           (37, 'Marcos BAPRO Cta. Cte.', '5209-51867/3', 'corriente');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

-- Dumping structure for table lv_finanzas.attached
CREATE TABLE IF NOT EXISTS `attached` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `path` text,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'fecha de edicion',
    `summary_id` int(11) NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

-- Dumping data for table lv_finanzas.attached: ~20 rows (approximately)
/*!40000 ALTER TABLE `attached` DISABLE KEYS */;
INSERT INTO `attached` (`id`, `path`, `created_at`, `updated_at`, `summary_id`) VALUES
                                                                                    (20, 'attached/xFsrvJgt7CcSk8q41UUfNndJfvuHgcocKiuCkywy.pdf', '2017-07-07 04:07:00', '2017-07-07 04:07:00', 102),
                                                                                    (21, 'attached/XeXdGzPwAJ2EDtg7RwWqkx7C0vSCPeuckdEKxSAr.jpeg', '2017-07-29 17:04:55', '2017-07-29 17:04:55', 245),
                                                                                    (22, 'attached/m2u2hIyiuZxEVbtDl2G8dWHakhKfFgzFgMBAKorQ.jpeg', '2017-07-29 17:05:21', '2017-07-29 17:05:21', 246),
                                                                                    (23, 'attached/02JpLomkLKXp0uO0sqrhlSSPo2DkMCkroFVAaZeq.jpeg', '2017-07-31 19:54:14', '2017-07-31 19:54:14', 247),
                                                                                    (24, 'attached/zHE7jMc35jRvCYMjjbTwXCdKVuO17l8yTjWAlrAB.jpeg', '2017-07-31 19:54:49', '2017-07-31 19:54:49', 248),
                                                                                    (25, 'attached/0TC8HRYZZoX7FFb2qr0s8jmObUAhapnNkYmPydZn.jpeg', '2017-07-31 19:59:34', '2017-07-31 19:59:34', 249),
                                                                                    (26, 'attached/w99LU3BoVfmY6gptYX2T27HugpJmxvownIY5RT3z.jpeg', '2017-08-07 15:41:50', '2017-08-07 15:41:50', 279),
                                                                                    (27, 'attached/Daf0zS3wEwJKIx0QHbyCzIsFWN0oCr78q1KGEt03.jpeg', '2017-08-08 17:52:23', '2017-08-08 17:52:23', 293),
                                                                                    (28, 'attached/1lfqn9y2s3hCtAlpfPMi7a5zTuFZPFlVWnY1qvz6.jpeg', '2017-08-08 17:52:44', '2017-08-08 17:52:44', 294),
                                                                                    (29, 'attached/eyiSchoIJkpol2J8tsg1L4bMb8la8CdxZBW95a4Z.pdf', '2017-11-15 04:11:00', '2017-11-15 04:11:00', 907),
                                                                                    (30, 'attached/YRyfYQFI8JCT2RSpE0OASusLKvUORL7vZ6NBXFGE.png', '2018-02-13 21:02:00', '2018-02-13 21:02:00', 1257),
                                                                                    (31, 'attached/XQa13UmYsCoOEkqOiS8muPb7dBJSk4fZA8D7lXXz.png', '2018-02-13 21:02:00', '2018-02-13 21:02:00', 1258),
                                                                                    (32, 'attached/oZXp6CxrDym04YytJDuR4Zjlkk9LVy1LJblj4tly.jpeg', '2018-10-24 21:10:00', '2018-10-24 21:10:00', 2713),
                                                                                    (33, 'attached/CG9te5EUGC4C5iBl4cy7V3dL8hXNtj4lLSwoUkAG.pdf', '2018-11-12 21:11:00', '2018-11-12 21:11:00', 2845),
                                                                                    (34, 'attached/Yde0lrAsPFNIZpXRQGEMVaZ9mkzbtIzcfg1z9mbg.pdf', '2018-11-12 21:11:00', '2018-11-12 21:11:00', 2846),
                                                                                    (35, 'attached/GZJMmCOajoyacx7RAk4VoLu40Jnng56jj1v7WTZ8.pdf', '2018-11-13 13:38:06', '2018-11-13 13:38:06', 2825),
                                                                                    (36, 'attached/MwZ1fC69OcwqnDrNsRlEnZzmaJbHefF8CP8G7nZc.pdf', '2018-11-13 21:11:00', '2018-11-13 21:11:00', 2850),
                                                                                    (37, 'attached/uGx4U76oqfYsJqtu6K8nIluXDRiDzEsUbAumIJP0.pdf', '2018-11-15 21:11:00', '2018-11-15 21:11:00', 2867),
                                                                                    (38, 'attached/VNk36nkPszT3b0Og6lnWG45RXVeTge8pikcvjw8o.png', '2018-12-10 10:30:15', '2018-12-10 10:30:15', 2932),
                                                                                    (39, 'attached/g3y7zUCSH4SjV1dnlqZc9IDgxZRLFlPZ5oYIdMA7.png', '2019-12-07 20:12:00', '2019-12-07 20:12:00', 1);
/*!40000 ALTER TABLE `attached` ENABLE KEYS */;

-- Dumping structure for table lv_finanzas.attr_values
CREATE TABLE IF NOT EXISTS `attr_values` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` text NOT NULL,
    `value` text NOT NULL,
    `id_categorie` int(11) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=latin1;

-- Dumping data for table lv_finanzas.attr_values: ~0 rows (approximately)
/*!40000 ALTER TABLE `attr_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `attr_values` ENABLE KEYS */;

-- Dumping structure for table lv_finanzas.bitacora
CREATE TABLE IF NOT EXISTS `bitacora` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `created_date` datetime NOT NULL,
    `type` enum('add','update','delete','out','transfer') NOT NULL,
    `id_user` int(11) NOT NULL,
    `activity` varchar(150) NOT NULL,
    `id_activity` int(11) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=latin1;

-- Dumping data for table lv_finanzas.bitacora: ~194 rows (approximately)
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` (`id`, `created_date`, `type`, `id_user`, `activity`, `id_activity`) VALUES
                                                                                                (20, '2022-08-25 00:08:00', 'add', 1, 'categorias', 74),
                                                                                                (21, '2022-08-26 00:08:00', 'delete', 1, 'cuentas', 32),
                                                                                                (22, '2022-08-26 00:08:00', 'delete', 1, 'cuentas', 31),
                                                                                                (23, '2022-08-26 00:08:00', 'delete', 1, 'cuentas', 30),
                                                                                                (24, '2022-08-26 00:08:00', 'delete', 1, 'cuentas', 24),
                                                                                                (25, '2022-08-26 00:08:00', 'update', 1, 'movimiento', 23),
                                                                                                (26, '2022-08-26 00:08:00', 'update', 1, 'movimiento', 23),
                                                                                                (27, '2022-08-26 00:08:00', 'delete', 1, 'movimiento', 1),
                                                                                                (28, '2022-08-26 00:08:00', 'delete', 1, 'cuentas', 23),
                                                                                                (29, '2022-08-26 00:08:00', 'add', 1, 'cuentas', 33),
                                                                                                (30, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 74),
                                                                                                (31, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 73),
                                                                                                (32, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 72),
                                                                                                (33, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 71),
                                                                                                (34, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 70),
                                                                                                (35, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 69),
                                                                                                (36, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 68),
                                                                                                (37, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 67),
                                                                                                (38, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 66),
                                                                                                (39, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 65),
                                                                                                (40, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 64),
                                                                                                (41, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 63),
                                                                                                (42, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 62),
                                                                                                (43, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 61),
                                                                                                (44, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 60),
                                                                                                (45, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 59),
                                                                                                (46, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 58),
                                                                                                (47, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 57),
                                                                                                (48, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 56),
                                                                                                (49, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 55),
                                                                                                (50, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 54),
                                                                                                (51, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 53),
                                                                                                (52, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 52),
                                                                                                (53, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 51),
                                                                                                (54, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 50),
                                                                                                (55, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 49),
                                                                                                (56, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 48),
                                                                                                (57, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 47),
                                                                                                (58, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 46),
                                                                                                (59, '2022-08-26 00:08:00', 'delete', 1, 'categorias', 45),
                                                                                                (60, '2022-08-26 00:08:00', 'add', 1, 'categorias', 75),
                                                                                                (61, '2022-08-26 00:08:00', 'add', 1, 'categorias', 76),
                                                                                                (62, '2022-08-26 00:08:00', 'out', 1, 'movimiento', 2),
                                                                                                (63, '2022-08-26 00:08:00', 'add', 1, 'categorias', 77),
                                                                                                (64, '2022-08-26 00:08:00', 'add', 1, 'movimiento', 3),
                                                                                                (65, '2022-08-26 00:08:00', 'delete', 1, 'tours', 12),
                                                                                                (66, '2022-08-26 00:08:00', 'delete', 1, 'tours', 14),
                                                                                                (67, '2022-08-26 00:08:00', 'delete', 1, 'tours', 17),
                                                                                                (68, '2022-08-26 00:08:00', 'delete', 1, 'tours', 18),
                                                                                                (69, '2022-08-29 00:08:00', 'add', 1, 'cuentas', 34),
                                                                                                (70, '2022-08-29 00:08:00', 'add', 1, 'cuentas', 35),
                                                                                                (71, '2022-08-29 00:08:00', 'add', 1, 'cuentas', 36),
                                                                                                (72, '2022-08-29 00:08:00', 'add', 1, 'cuentas', 37),
                                                                                                (73, '2022-08-29 00:08:00', 'transfer', 1, 'transferencia', 4),
                                                                                                (74, '2022-08-29 00:08:00', 'transfer', 1, 'transferencia', 5),
                                                                                                (75, '2022-08-29 00:08:00', 'delete', 1, 'movimiento', 1),
                                                                                                (76, '2022-08-29 00:08:00', 'delete', 1, 'movimiento', 3),
                                                                                                (77, '2022-08-29 00:08:00', 'delete', 1, 'movimiento', 2),
                                                                                                (78, '2022-08-29 00:08:00', 'add', 1, 'categorias', 78),
                                                                                                (79, '2022-08-29 00:08:00', 'add', 1, 'movimiento', 6),
                                                                                                (80, '2022-08-29 00:08:00', 'add', 1, 'categorias', 79),
                                                                                                (81, '2022-08-29 00:08:00', 'add', 1, 'movimiento', 7),
                                                                                                (82, '2022-08-29 00:08:00', 'add', 1, 'categorias', 80),
                                                                                                (83, '2022-08-29 00:08:00', 'out', 1, 'movimiento', 8),
                                                                                                (84, '2022-08-29 00:08:00', 'out', 1, 'movimiento', 9),
                                                                                                (85, '2022-08-29 00:08:00', 'out', 1, 'movimiento', 10),
                                                                                                (86, '2022-08-29 00:08:00', 'add', 1, 'movimiento', 11),
                                                                                                (87, '2022-08-29 00:08:00', 'add', 1, 'categorias', 81),
                                                                                                (88, '2022-08-29 00:08:00', 'out', 1, 'movimiento', 12),
                                                                                                (89, '2022-08-29 00:08:00', 'add', 1, 'categorias', 82),
                                                                                                (90, '2022-08-29 00:08:00', 'out', 1, 'movimiento', 13),
                                                                                                (91, '2022-08-29 00:08:00', 'add', 1, 'categorias', 83),
                                                                                                (92, '2022-08-29 00:08:00', 'out', 1, 'movimiento', 14),
                                                                                                (93, '2022-08-29 00:08:00', 'add', 1, 'categorias', 84),
                                                                                                (94, '2022-08-29 00:08:00', 'out', 1, 'movimiento', 15),
                                                                                                (95, '2022-08-29 00:08:00', 'add', 1, 'categorias', 85),
                                                                                                (96, '2022-08-29 00:08:00', 'out', 1, 'movimiento', 16),
                                                                                                (97, '2022-08-29 00:08:00', 'add', 1, 'categorias', 86),
                                                                                                (98, '2022-08-29 00:08:00', 'out', 1, 'movimiento', 17),
                                                                                                (99, '2022-08-29 00:08:00', 'out', 1, 'movimiento', 18),
                                                                                                (100, '2022-08-29 00:08:00', 'add', 1, 'categorias', 87),
                                                                                                (101, '2022-08-29 00:08:00', 'out', 1, 'movimiento', 19),
                                                                                                (102, '2022-08-29 00:08:00', 'add', 1, 'categorias', 88),
                                                                                                (103, '2022-08-29 00:08:00', 'add', 1, 'movimiento', 20),
                                                                                                (104, '2022-08-29 00:08:00', 'add', 1, 'categorias', 89),
                                                                                                (105, '2022-08-29 00:08:00', 'out', 1, 'movimiento', 21),
                                                                                                (106, '2022-08-29 00:08:00', 'add', 1, 'categorias', 90),
                                                                                                (107, '2022-08-29 00:08:00', 'out', 1, 'movimiento', 22),
                                                                                                (108, '2022-08-29 00:08:00', 'out', 1, 'movimiento', 23),
                                                                                                (109, '2022-08-29 00:08:00', 'add', 1, 'categorias', 91),
                                                                                                (110, '2022-08-29 00:08:00', 'add', 1, 'categorias', 92),
                                                                                                (111, '2022-08-29 00:08:00', 'out', 1, 'movimiento', 24),
                                                                                                (112, '2022-08-29 00:08:00', 'out', 1, 'movimiento', 25),
                                                                                                (113, '2022-08-29 00:08:00', 'add', 1, 'categorias', 93),
                                                                                                (114, '2022-08-29 00:08:00', 'out', 1, 'movimiento', 26),
                                                                                                (115, '2022-08-29 00:08:00', 'add', 1, 'categorias', 94),
                                                                                                (116, '2022-08-29 00:08:00', 'out', 1, 'movimiento', 27),
                                                                                                (117, '2022-08-30 00:08:00', 'add', 1, 'movimiento', 28),
                                                                                                (118, '2022-08-30 00:08:00', 'delete', 1, 'movimiento', 28),
                                                                                                (119, '2022-08-30 00:08:00', 'add', 1, 'movimiento', 29),
                                                                                                (120, '2022-08-30 00:08:00', 'delete', 1, 'movimiento', 29),
                                                                                                (121, '2022-08-30 00:08:00', 'add', 1, 'movimiento', 30),
                                                                                                (122, '2022-08-30 00:08:00', 'add', 1, 'categorias', 95),
                                                                                                (123, '2022-08-30 00:08:00', 'add', 1, 'movimiento', 31),
                                                                                                (124, '2022-08-30 00:08:00', 'update', 1, 'categorias', 95),
                                                                                                (125, '2022-08-30 00:08:00', 'add', 1, 'movimiento', 32),
                                                                                                (126, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 33),
                                                                                                (127, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 34),
                                                                                                (128, '2022-08-30 00:08:00', 'transfer', 1, 'transferencia', 35),
                                                                                                (129, '2022-08-30 00:08:00', 'transfer', 1, 'transferencia', 36),
                                                                                                (130, '2022-08-30 00:08:00', 'delete', 1, 'movimiento', 2),
                                                                                                (131, '2022-08-30 00:08:00', 'transfer', 1, 'transferencia', 37),
                                                                                                (132, '2022-08-30 00:08:00', 'transfer', 1, 'transferencia', 38),
                                                                                                (133, '2022-08-30 00:08:00', 'delete', 1, 'movimiento', 30),
                                                                                                (134, '2022-08-30 00:08:00', 'add', 1, 'movimiento', 39),
                                                                                                (135, '2022-08-30 00:08:00', 'transfer', 1, 'transferencia', 40),
                                                                                                (136, '2022-08-30 00:08:00', 'transfer', 1, 'transferencia', 41),
                                                                                                (137, '2022-08-30 00:08:00', 'add', 1, 'categorias', 96),
                                                                                                (138, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 42),
                                                                                                (139, '2022-08-30 00:08:00', 'add', 1, 'categorias', 97),
                                                                                                (140, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 43),
                                                                                                (141, '2022-08-30 00:08:00', 'add', 1, 'categorias', 98),
                                                                                                (142, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 44),
                                                                                                (143, '2022-08-30 00:08:00', 'add', 1, 'categorias', 99),
                                                                                                (144, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 45),
                                                                                                (145, '2022-08-30 00:08:00', 'add', 1, 'categorias', 100),
                                                                                                (146, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 46),
                                                                                                (147, '2022-08-30 00:08:00', 'add', 1, 'movimiento', 47),
                                                                                                (148, '2022-08-30 00:08:00', 'add', 1, 'categorias', 101),
                                                                                                (149, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 48),
                                                                                                (150, '2022-08-30 00:08:00', 'add', 1, 'categorias', 102),
                                                                                                (151, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 49),
                                                                                                (152, '2022-08-30 00:08:00', 'add', 1, 'categorias', 103),
                                                                                                (153, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 50),
                                                                                                (154, '2022-08-30 00:08:00', 'add', 1, 'categorias', 104),
                                                                                                (155, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 51),
                                                                                                (156, '2022-08-30 00:08:00', 'add', 1, 'categorias', 105),
                                                                                                (157, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 52),
                                                                                                (158, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 53),
                                                                                                (159, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 54),
                                                                                                (160, '2022-08-30 00:08:00', 'add', 1, 'categorias', 106),
                                                                                                (161, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 55),
                                                                                                (162, '2022-08-30 00:08:00', 'add', 1, 'categorias', 107),
                                                                                                (163, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 56),
                                                                                                (164, '2022-08-30 00:08:00', 'transfer', 1, 'transferencia', 57),
                                                                                                (165, '2022-08-30 00:08:00', 'transfer', 1, 'transferencia', 58),
                                                                                                (166, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 59),
                                                                                                (167, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 60),
                                                                                                (168, '2022-08-30 00:08:00', 'add', 1, 'movimiento', 61),
                                                                                                (169, '2022-08-30 00:08:00', 'add', 1, 'categorias', 108),
                                                                                                (170, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 62),
                                                                                                (171, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 63),
                                                                                                (172, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 64),
                                                                                                (173, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 65),
                                                                                                (174, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 66),
                                                                                                (175, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 67),
                                                                                                (176, '2022-08-30 00:08:00', 'add', 1, 'categorias', 109),
                                                                                                (177, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 68),
                                                                                                (178, '2022-08-30 00:08:00', 'add', 1, 'categorias', 110),
                                                                                                (179, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 69),
                                                                                                (180, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 70),
                                                                                                (181, '2022-08-30 00:08:00', 'add', 1, 'categorias', 111),
                                                                                                (182, '2022-08-30 00:08:00', 'add', 1, 'movimiento', 71),
                                                                                                (183, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 72),
                                                                                                (184, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 73),
                                                                                                (185, '2022-08-30 00:08:00', 'transfer', 1, 'transferencia', 74),
                                                                                                (186, '2022-08-30 00:08:00', 'transfer', 1, 'transferencia', 75),
                                                                                                (187, '2022-08-30 00:08:00', 'transfer', 1, 'transferencia', 76),
                                                                                                (188, '2022-08-30 00:08:00', 'transfer', 1, 'transferencia', 77),
                                                                                                (189, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 78),
                                                                                                (190, '2022-08-30 00:08:00', 'add', 1, 'movimiento', 79),
                                                                                                (191, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 80),
                                                                                                (192, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 81),
                                                                                                (193, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 82),
                                                                                                (194, '2022-08-30 00:08:00', 'add', 1, 'categorias', 112),
                                                                                                (195, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 83),
                                                                                                (196, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 84),
                                                                                                (197, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 85),
                                                                                                (198, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 86),
                                                                                                (199, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 87),
                                                                                                (200, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 88),
                                                                                                (201, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 89),
                                                                                                (202, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 90),
                                                                                                (203, '2022-08-30 00:08:00', 'update', 1, 'movimiento', 90),
                                                                                                (204, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 91),
                                                                                                (205, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 92),
                                                                                                (206, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 93),
                                                                                                (207, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 94),
                                                                                                (208, '2022-08-30 00:08:00', 'transfer', 1, 'transferencia', 95),
                                                                                                (209, '2022-08-30 00:08:00', 'transfer', 1, 'transferencia', 96),
                                                                                                (210, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 97),
                                                                                                (211, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 98),
                                                                                                (212, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 99),
                                                                                                (213, '2022-08-30 00:08:00', 'out', 1, 'movimiento', 100);
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;

-- Dumping structure for table lv_finanzas.categories
CREATE TABLE IF NOT EXISTS `categories` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` text,
    `description` text,
    `type` enum('add','out') NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;

-- Dumping data for table lv_finanzas.categories: ~39 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `description`, `type`) VALUES
                                                                   (1, 'transferencia', 'transferencia', 'add'),
                                                                   (75, 'Varios', 'gastos varios', 'out'),
                                                                   (76, 'Extracción', 'Extracción cajero', 'out'),
                                                                   (77, 'Sueldo UNLP Marcos', 'Sueldo UNLP Marcos', 'add'),
                                                                   (78, 'Saldo inicial', 'Deposito del saldo inicial', 'add'),
                                                                   (79, 'Transferencia recibida', 'Transferencia recibida por terceros', 'add'),
                                                                   (80, 'NACION SEGUROS SA BNA', 'Seguros del Banco Nación', 'out'),
                                                                   (81, 'Vial 1', 'Impuesto vial de La Clemencia', 'out'),
                                                                   (82, 'Vial 2', 'Impuesto vial de La Clemencia', 'out'),
                                                                   (83, 'VISA Vieja', 'Tarjeta VISA de mi vieja', 'out'),
                                                                   (84, 'Agua 501', 'Agua de calle 501', 'out'),
                                                                   (85, 'Naranja Majo', 'Trajeta Naranja de Majo', 'out'),
                                                                   (86, 'Compra de dólares', 'Compra de dólares', 'out'),
                                                                   (87, 'Transferencia enviada', 'Transferencia enviada', 'out'),
                                                                   (88, 'Contrasiento', 'Contrasiento', 'add'),
                                                                   (89, 'IMPUESTO PAIS', 'IMPUESTO PAIS', 'out'),
                                                                   (90, 'RG4815 PERCE.OP.MON.EXT.', 'RG4815 PERCE.OP.MON.EXT.', 'out'),
                                                                   (91, 'COMISION PAQUETES', 'COMISION PAQUETES', 'out'),
                                                                   (92, 'I.V.A. BASE', 'I.V.A. BASE', 'out'),
                                                                   (93, 'GRAVAMEN IB PERCEP. BA', 'GRAVAMEN IB PERCEP. BA', 'out'),
                                                                   (94, 'Cuota Crédito (Energía Solar Campo)', 'Cuota de Crédito para la compra de equipo de energía solar para la clemencia', 'out'),
                                                                   (95, 'Sueldo UNLP MAJO', 'Sueldo UNLP MAJO', 'add'),
                                                                   (96, 'OSDE vieja', 'Obra Social OSDE de mi vieja', 'out'),
                                                                   (97, 'VISA Nativa', 'Tarjeta VISA Nativa - Banco Nación', 'out'),
                                                                   (98, 'Cuota Préstamo (Compra SURAN)', 'Cuota Préstamo del Banco Nación para comprar la SURAN', 'out'),
                                                                   (99, 'Honorarios Viru', 'Honorario del contador de Marcos (Victoriano Cano)', 'out'),
                                                                   (100, 'Cable e Internet (501)', 'Cable e Internet de casa', 'out'),
                                                                   (101, 'MASTERCARD Nativa', 'Tarjeta MASTERCARD Nativa - Banco Nación', 'out'),
                                                                   (102, 'Tarjeta Mariano', 'Tarjeta de crédito de Mariano Novillo', 'out'),
                                                                   (103, 'Patente SURAN', 'Patente SURAN', 'out'),
                                                                   (104, 'Luz 501', 'EDELAP de casa', 'out'),
                                                                   (105, 'Expensas 7', 'Expensas del depto. de 7', 'out'),
                                                                   (106, 'Sueldo Mirian', 'Sueldo de Mirian (empleada doméstica)', 'out'),
                                                                   (107, 'Expensas Montiel', 'Expensas del depto. de Montiel - Tandil', 'out'),
                                                                   (108, 'Soloreseller Hosting', 'Soloreseller Hosting (alojamiento de mis sitios)', 'out'),
                                                                   (109, 'Gas 501', 'Camuzzi 501', 'out'),
                                                                   (110, 'Teléfono 501', 'Movistar fijo de casa', 'out'),
                                                                   (111, 'INTERESES CAPITALIZADOS', 'INTERESES CAPITALIZADOS', 'add'),
                                                                   (112, 'Municipal 501', 'Impuesto municipal de casa', 'out');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table lv_finanzas.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `batch` int(11) NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table lv_finanzas.migrations: ~0 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table lv_finanzas.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `id_user` int(11) NOT NULL,
    `saldo` int(11) DEFAULT NULL,
    `movimientos` int(11) DEFAULT NULL,
    `categoria` int(11) DEFAULT NULL,
    `cuentas` int(11) DEFAULT NULL,
    `usuario` int(11) DEFAULT NULL,
    `transferencia` int(11) DEFAULT NULL,
    `tours` int(11) DEFAULT NULL,
    `m_futuros` int(11) DEFAULT NULL,
    `bitacora` int(11) DEFAULT NULL,
    `adjuntos` int(11) DEFAULT NULL,
    `pdf` int(11) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table lv_finanzas.permissions: ~8 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `id_user`, `saldo`, `movimientos`, `categoria`, `cuentas`, `usuario`, `transferencia`, `tours`, `m_futuros`, `bitacora`, `adjuntos`, `pdf`) VALUES
                                                                                                                                                                                 (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
                                                                                                                                                                                 (9, 11, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 8),
                                                                                                                                                                                 (10, 12, 8, 8, 8, 8, 0, 8, 0, 0, 0, 3, 8),
                                                                                                                                                                                 (11, 13, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8),
                                                                                                                                                                                 (12, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
                                                                                                                                                                                 (13, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
                                                                                                                                                                                 (14, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
                                                                                                                                                                                 (15, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table lv_finanzas.settings
CREATE TABLE IF NOT EXISTS `settings` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(200) NOT NULL,
    `value` varchar(200) NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table lv_finanzas.settings: ~1 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `name`, `value`) VALUES
    (1, 'divisa', '$');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table lv_finanzas.summary
CREATE TABLE IF NOT EXISTS `summary` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `created_at` timestamp NULL DEFAULT NULL,
    `concept` text,
    `type` enum('add','out','transfer') DEFAULT NULL,
    `amount` double DEFAULT NULL,
    `tax` double DEFAULT NULL,
    `account_id` int(11) NOT NULL,
    `categories_id` int(11) NOT NULL,
    `factura` varchar(100) DEFAULT NULL COMMENT 'numero de factura',
    `id_attr` int(11) DEFAULT NULL,
    `id_transfer` int(11) DEFAULT NULL COMMENT 'id de transferencia',
    `tours_id` int(11) DEFAULT NULL COMMENT 'id de tour',
    `id_attr_tours` int(11) DEFAULT NULL,
    `id_autor` int(11) NOT NULL,
    `future` enum('1','2') NOT NULL DEFAULT '1',
    PRIMARY KEY (`id`,`account_id`,`categories_id`),
    KEY `fk_summary_account_idx` (`account_id`),
    KEY `fk_summary_categories1_idx` (`categories_id`),
    CONSTRAINT `fk_summary_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_summary_categories1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

-- Dumping data for table lv_finanzas.summary: ~90 rows (approximately)
/*!40000 ALTER TABLE `summary` DISABLE KEYS */;
INSERT INTO `summary` (`id`, `created_at`, `concept`, `type`, `amount`, `tax`, `account_id`, `categories_id`, `factura`, `id_attr`, `id_transfer`, `tours_id`, `id_attr_tours`, `id_autor`, `future`) VALUES
                                                                                                                                                                                                          (6, '2020-08-08 00:00:00', 'Saldo inicial', 'add', 47325.35, 0, 33, 78, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (7, '2020-08-08 00:00:00', 'Elba Burone compra de productos Mientras tanto', 'add', 1520, 0, 33, 79, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (8, '2021-01-04 00:00:00', 'Pago de Seguros Nación', 'out', 19.7, 0, 33, 80, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (9, '2021-01-04 00:00:00', 'Pago de Seguros Nación', 'out', 65, 0, 33, 80, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (10, '2021-01-04 00:00:00', 'Pago de Seguros Nación', 'out', 95.01, 0, 33, 80, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (11, '2021-01-04 00:00:00', 'Transferencia de Arístegui para pagar VISA, OSDE, Viales, etc.', 'add', 110000, 0, 33, 79, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (12, '2021-01-04 00:00:00', 'Pago de impuesto vial 1 de La Clemencia', 'out', 11627.83, 0, 33, 81, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (13, '2021-01-04 00:00:00', 'Pago de impuesto vial 2 de La Clemencia', 'out', 23775.8, 0, 33, 82, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (14, '2021-01-04 00:00:00', 'Pago de Tarjeta VISA de mi vieja', 'out', 24563.05, 0, 33, 83, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (15, '2021-01-04 00:00:00', 'Pago de agua de 501', 'out', 1262.63, 0, 33, 84, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (16, '2021-01-04 00:00:00', 'Pago de trajeta Naranja de Majo', 'out', 846.03, 0, 33, 85, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (17, '2021-01-04 00:00:00', 'Compra de dólares', 'out', 29436, 0, 33, 86, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (18, '2021-01-04 00:00:00', 'Extracción de ATM', 'out', 15000, 0, 33, 76, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (19, '2021-01-04 00:00:00', 'Transferencia a Paola (mamá de Felipe)', 'out', 500, 0, 33, 87, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (20, '2021-01-04 00:00:00', 'Contrasiento por error en compra de dólares', 'add', 29436, 0, 33, 88, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (21, '2021-01-04 00:00:00', 'Impuesto país por compra de dólares', 'out', 5352, 0, 33, 89, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (22, '2021-01-04 00:00:00', 'RG4815 PERCE.OP.MON.EXT. (Compra de dólares)', 'out', 6244, 0, 33, 90, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (23, '2021-01-04 00:00:00', 'Compra de dólares', 'out', 17840, 0, 33, 86, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (24, '2021-01-04 00:00:00', 'Comisión en paquetes del Banco Nación', 'out', 974.08, 0, 33, 91, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (25, '2021-01-04 00:00:00', 'I.V.A. BASE en Banco Nación', 'out', 204.56, 0, 33, 92, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (26, '2021-01-04 00:00:00', 'GRAVAMEN IB PERCEP. BA', 'out', 0.97, 0, 33, 93, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (27, '2021-01-04 00:00:00', 'Débito cuota del préstamo para la compra de equipo de energía solar', 'out', 8733.73, 0, 33, 94, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (31, '2021-01-04 00:00:00', 'ACREDITACION HABERES MAJO UNLP', 'add', 76722.32, 0, 34, 95, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (32, '2021-01-04 00:00:00', 'ACREDITACION HABERES MAJO UNLP', 'add', 1210, 0, 34, 95, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (33, '2021-01-04 00:00:00', 'Débito COMISION PAQUETES Banco Nación', 'out', 1153.57, 0, 34, 91, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (34, '2021-01-04 00:00:00', 'Débito I.V.A. BASE Banco Nación', 'out', 242.25, 0, 34, 92, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (37, '2021-01-05 00:00:00', 'Transferencia Recibida', 'add', 45000, NULL, 33, 1, NULL, NULL, 3, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (38, '2021-01-05 00:00:00', 'Transferencia Enviada ', 'out', 45000, NULL, 34, 1, NULL, NULL, 3, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (39, '2021-01-04 00:00:00', 'Saldo inicial de Marcos BAPRO Caja de Ahorro', 'add', 7669.98, 0, 35, 78, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (40, '2021-01-05 00:00:00', 'Transferencia Recibida', 'add', 40000, NULL, 33, 1, NULL, NULL, 4, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (41, '2021-01-05 00:00:00', 'Transferencia Enviada ', 'out', 40000, NULL, 35, 1, NULL, NULL, 4, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (42, '2021-01-05 00:00:00', 'Pago de OSDE de mi vieja', 'out', 18080, 0, 33, 96, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (43, '2021-01-05 00:00:00', 'Pago de Tarjeta VISA Nativa de Banco Nación', 'out', 55277, 0, 33, 97, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (44, '2021-01-05 00:00:00', 'Débito de la cuota del préstamo para la compra de la SURAN', 'out', 4082.03, 0, 33, 98, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (45, '2021-01-05 00:00:00', 'Transferencia a Victor Cano (Honorarios)', 'out', 2185, 0, 33, 99, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (46, '2021-01-05 00:00:00', 'Débito del cable e internet de casa', 'out', 5605.76, 0, 33, 100, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (47, '2021-01-06 00:00:00', 'Transferencia de Rubén Piñero', 'add', 100000, 0, 33, 79, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (48, '2021-01-06 00:00:00', 'Pago de Tarjeta MASTERCARD Nativa de Banco Nación', 'out', 607.15, 0, 33, 101, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (49, '2021-01-08 00:00:00', 'Transferencia a Mariano Novillo por pago de tarjeta de crédito', 'out', 890, 0, 33, 102, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (50, '2021-01-08 00:00:00', 'Pago de la patente de la SURAN', 'out', 5866.1, 0, 33, 103, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (51, '2021-01-08 00:00:00', 'Pago de la luz de casa', 'out', 2198.3, 0, 33, 104, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (52, '2021-01-08 00:00:00', 'Transferencia para el pago de las expensas del depto. de 7', 'out', 2171, 0, 33, 105, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (53, '2021-01-08 00:00:00', 'Débito por el seguro (Banco Nación)', 'out', 622.18, 0, 33, 80, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (54, '2021-01-08 00:00:00', 'Débito por el seguro (Banco Nación)', 'out', 1853.44, 0, 33, 80, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (55, '2021-01-11 00:00:00', 'Transferencia a Mariel por el pago del sueldo de Mirian', 'out', 4500, 0, 33, 106, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (56, '2021-01-11 00:00:00', 'Transferencia para el pago de las expensas del depto. de Montiel - Tandil', 'out', 1178.54, 0, 33, 105, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (57, '2021-01-14 00:00:00', 'Transferencia Recibida', 'add', 70000, NULL, 33, 1, NULL, NULL, 5, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (58, '2021-01-14 00:00:00', 'Transferencia Enviada ', 'out', 70000, NULL, 34, 1, NULL, NULL, 5, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (59, '2021-01-14 00:00:00', 'Débito por el seguro (Banco Nación)', 'out', 37.5, 0, 33, 80, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (60, '2021-01-14 00:00:00', 'Transferencia a Hebe (Refacción casa)', 'out', 150000, 0, 33, 87, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (61, '2021-01-15 00:00:00', 'Transferencia de Minervini (hs. desarrollo WEB)', 'add', 15000, 0, 33, 79, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (62, '2021-01-18 00:00:00', 'Transferencia por el pago del hosting', 'out', 449, 0, 33, 108, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (63, '2021-01-18 00:00:00', 'Transferencia a MASSI MARIA ROSA', 'out', 500, 0, 33, 87, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (64, '2021-01-18 00:00:00', 'Transferencia a ERNANDEZ ECHELINI SOLEDAD ANDREA', 'out', 500, 0, 33, 87, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (65, '2021-01-18 00:00:00', 'Transferencia a GUILLERMINA LAURA,DINOFRIO', 'out', 500, 0, 33, 87, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (66, '2021-01-18 00:00:00', 'Débito por el seguro (Banco Nación)', 'out', 50, 0, 33, 80, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (67, '2021-01-19 00:00:00', 'Débito por el seguro (Banco Nación)', 'out', 70, 0, 33, 80, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (68, '2021-01-25 00:00:00', 'Pago del gas de casa', 'out', 1055.12, 0, 33, 109, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (69, '2021-01-25 00:00:00', 'Pago del teléfono fijo de casa', 'out', 842.27, 0, 33, 110, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (70, '2021-01-29 00:00:00', 'Extracción de ATM', 'out', 10000, 0, 33, 76, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (71, '2021-02-01 00:00:00', 'Depósito por INTERESES CAPITALIZADOS', 'add', 6.04, 0, 33, 111, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (72, '2021-02-01 00:00:00', 'Débito por el seguro (Banco Nación)', 'out', 95.01, 0, 33, 80, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (73, '2021-02-01 00:00:00', 'Débito por el seguro (Banco Nación)', 'out', 1853.44, 0, 33, 80, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (74, '2021-02-02 00:00:00', 'Transferencia Recibida', 'add', 50000, NULL, 33, 1, NULL, NULL, 6, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (75, '2021-02-02 00:00:00', 'Transferencia Enviada ', 'out', 50000, NULL, 34, 1, NULL, NULL, 6, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (76, '2021-02-02 00:00:00', 'Transferencia Recibida', 'add', 10000, NULL, 33, 1, NULL, NULL, 7, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (77, '2021-02-02 00:00:00', 'Transferencia Enviada ', 'out', 10000, NULL, 35, 1, NULL, NULL, 7, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (78, '2021-02-02 00:00:00', 'Débito por el seguro (Banco Nación)', 'out', 65, 0, 33, 80, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (79, '2021-02-02 00:00:00', 'Transferencia de Arístegui (Pago de OSDE y VISA)', 'add', 60000, 0, 33, 79, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (80, '2021-02-02 00:00:00', 'Transferencia a Hebe (Refacción casa)', 'out', 50000, 0, 33, 87, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (81, '2021-02-02 00:00:00', 'Pago de Tarjeta VISA BAPRO de mi vieja', 'out', 20302.22, 0, 33, 83, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (82, '2021-02-02 00:00:00', 'Pago de OSDE de mi vieja', 'out', 18080, 0, 33, 96, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (83, '2021-02-02 00:00:00', 'Pago del impuesto municipal de casa', 'out', 2829.4, 0, 33, 112, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (84, '2021-02-02 00:00:00', 'Pago de la luz de casa', 'out', 2198.3, 0, 33, 104, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (85, '2021-02-02 00:00:00', 'Pago de tarjeta Naranja de Majo', 'out', 832.2, 0, 33, 85, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (86, '2021-02-02 00:00:00', 'Pago de Tarjeta VISA Nativa de Banco Nación', 'out', 16150, 0, 33, 97, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (87, '2021-02-02 00:00:00', 'Transferencia a MORZILLI MELINA', 'out', 500, 0, 33, 87, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (88, '2021-02-02 00:00:00', 'Transferencia para el pago de las expensas del depto. de 7', 'out', 2088, 0, 33, 105, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (89, '2021-02-02 00:00:00', 'Transferencia a Victor Cano (Honorarios)', 'out', 1420, 0, 33, 99, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (90, '2021-02-02 00:00:00', 'Transferencia a Victor Cano (Honorarios)', 'out', 985, 0, 33, 99, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (91, '2021-02-02 00:00:00', 'Débito COMISION PAQUETES Banco Nación', 'out', 974.08, 0, 33, 91, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (92, '2021-02-02 00:00:00', 'Débito I.V.A. BASE Banco Nación', 'out', 204.56, 0, 33, 92, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (93, '2021-02-02 00:00:00', 'GRAVAMEN IB PERCEP. BA', 'out', 0.97, 0, 33, 93, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (94, '2021-02-03 00:00:00', 'Pago de Tarjeta MASTERCARD Nativa de Banco Nación', 'out', 607.15, 0, 33, 101, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (95, '2021-02-04 00:00:00', 'Transferencia Recibida', 'add', 10000, NULL, 33, 1, NULL, NULL, 8, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (96, '2021-02-04 00:00:00', 'Transferencia Enviada ', 'out', 10000, NULL, 34, 1, NULL, NULL, 8, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (97, '2021-02-04 00:00:00', 'Transferencia a Mariano Novillo por pago de tarjeta de crédito', 'out', 8.9, 0, 33, 102, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (98, '2021-02-05 00:00:00', 'Débito por el seguro (Banco Nación)', 'out', 19.7, 0, 33, 80, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (99, '2021-02-08 00:00:00', 'Transferencia a MARIA DE LAS MERCEDES,UTRERA', 'out', 5000, 0, 33, 87, NULL, NULL, NULL, NULL, NULL, 1, '1'),
                                                                                                                                                                                                          (100, '2021-02-09 00:00:00', 'Débito por el seguro (Banco Nación)', 'out', 622.18, 0, 33, 80, NULL, NULL, NULL, NULL, NULL, 1, '1');
/*!40000 ALTER TABLE `summary` ENABLE KEYS */;

-- Dumping structure for table lv_finanzas.tours
CREATE TABLE IF NOT EXISTS `tours` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(300) NOT NULL,
    `description` varchar(200) NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dumping data for table lv_finanzas.tours: ~0 rows (approximately)
/*!40000 ALTER TABLE `tours` DISABLE KEYS */;
/*!40000 ALTER TABLE `tours` ENABLE KEYS */;

-- Dumping structure for table lv_finanzas.tours_attr
CREATE TABLE IF NOT EXISTS `tours_attr` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `date` datetime NOT NULL,
    `price` double NOT NULL,
    `id_tours` int(11) NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;

-- Dumping data for table lv_finanzas.tours_attr: ~0 rows (approximately)
/*!40000 ALTER TABLE `tours_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `tours_attr` ENABLE KEYS */;

-- Dumping structure for table lv_finanzas.transfer
CREATE TABLE IF NOT EXISTS `transfer` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `id_add` int(11) NOT NULL COMMENT 'id de entrada',
    `id_out` int(11) NOT NULL COMMENT 'id de salida',
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table lv_finanzas.transfer: ~6 rows (approximately)
/*!40000 ALTER TABLE `transfer` DISABLE KEYS */;
INSERT INTO `transfer` (`id`, `id_add`, `id_out`) VALUES
                                                      (3, 37, 38),
                                                      (4, 40, 41),
                                                      (5, 57, 58),
                                                      (6, 74, 75),
                                                      (7, 76, 77),
                                                      (8, 95, 96);
/*!40000 ALTER TABLE `transfer` ENABLE KEYS */;

-- Dumping structure for table lv_finanzas.users
CREATE TABLE IF NOT EXISTS `users` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `level` int(1) NOT NULL DEFAULT '0',
    `status` int(1) NOT NULL DEFAULT '0',
    `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dumping data for table lv_finanzas.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `level`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
    (1, 'admin', 'admin@admin.com', '$2y$10$ylEQm2Mx4dfq/tgQRJUo7eikP3cls0bxvpevRUzUQTapy5pDxcw.i', 1, 1, 'mFnRyYPcs2ev9jFIcFviC6ecEhAbn1BjdiabhqdSTgRiYZnwFAOaFtlYPrll', '2018-01-23 05:16:47', '2018-01-23 05:16:47');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
