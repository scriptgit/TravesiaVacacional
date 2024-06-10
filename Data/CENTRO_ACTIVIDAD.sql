﻿/*CREATE TABLE CENTRO_ACTIVIDAD 
(
    centro_actividad_id	INT,
    actividad_id	INT,
    temporada_id	INT,
    centro_id	INT
);*/

INSERT INTO CENTRO_ACTIVIDAD (centro_actividad_id, actividad_id, temporada_id, centro_id) VALUES
(1, 4, 1, 16),
(2, 8, 4, 20),
(3, 19, 1, 18),
(4, 6, 2, 1),
(5, 5, 3, 3),
(6, 13, 2, 2),
(7, 19, 2, 11),
(8, 2, 1, 4),
(9, 13, 1, 5),
(10, 4, 1, 5),
(11, 1, 2, 10),
(12, 11, 3, 11),
(13, 7, 4, 6),
(14, 11, 1, 3),
(15, 3, 4, 8),
(16, 10, 3, 6),
(17, 5, 2, 9),
(18, 6, 1, 4),
(19, 1, 1, 6),
(20, 13, 3, 6),
(21, 6, 1, 19),
(22, 1, 3, 1),
(23, 9, 2, 9),
(24, 10, 3, 13),
(25, 10, 3, 16),
(26, 4, 2, 4),
(27, 11, 3, 17),
(28, 9, 1, 18),
(29, 6, 3, 9),
(30, 18, 4, 14),
(31, 13, 4, 13),
(32, 5, 4, 12),
(33, 1, 4, 6),
(34, 12, 3, 11),
(35, 7, 4, 15),
(36, 19, 1, 3),
(37, 1, 1, 7),
(38, 11, 1, 3),
(39, 13, 1, 7),
(40, 17, 1, 17),
(41, 11, 3, 4),
(42, 2, 1, 7),
(43, 8, 1, 3),
(44, 7, 2, 6),
(45, 4, 2, 4),
(46, 2, 2, 11),
(47, 3, 2, 11),
(48, 16, 3, 15),
(49, 5, 1, 11),
(50, 17, 2, 2),
(51, 4, 4, 12),
(52, 12, 3, 9),
(53, 10, 2, 7),
(54, 5, 3, 19),
(55, 15, 4, 15),
(56, 18, 2, 17),
(57, 19, 4, 15),
(58, 11, 2, 13),
(59, 18, 2, 11),
(60, 18, 1, 7),
(61, 9, 3, 17),
(62, 6, 3, 10),
(63, 12, 4, 6),
(64, 15, 3, 2),
(65, 2, 3, 12),
(66, 11, 2, 2),
(67, 17, 3, 14),
(68, 12, 1, 20),
(69, 19, 1, 18),
(70, 18, 4, 18),
(71, 3, 1, 17),
(72, 14, 1, 4),
(73, 8, 3, 3),
(74, 2, 3, 4),
(75, 1, 3, 20),
(76, 12, 4, 16),
(77, 7, 3, 13),
(78, 12, 2, 16),
(79, 6, 1, 11),
(80, 19, 3, 13),
(81, 14, 4, 12),
(82, 12, 3, 13),
(83, 15, 4, 10),
(84, 19, 2, 15),
(85, 12, 3, 7),
(86, 8, 1, 14),
(87, 10, 4, 14),
(88, 10, 1, 6),
(89, 10, 2, 6),
(90, 16, 3, 11),
(91, 11, 2, 8),
(92, 19, 3, 17),
(93, 6, 3, 6),
(94, 13, 1, 7),
(95, 1, 1, 10),
(96, 15, 4, 6),
(97, 15, 2, 20),
(98, 20, 4, 20),
(99, 10, 1, 14),
(100, 20, 1, 11),
(101, 7, 2, 10),
(102, 1, 4, 2),
(103, 19, 1, 8),
(104, 20, 3, 20),
(105, 12, 3, 20),
(106, 14, 4, 3),
(107, 16, 3, 20),
(108, 18, 3, 18),
(109, 4, 1, 7),
(110, 7, 4, 14),
(111, 16, 4, 15),
(112, 5, 3, 13),
(113, 19, 4, 5),
(114, 14, 4, 5),
(115, 10, 1, 7),
(116, 17, 4, 3),
(117, 11, 4, 13),
(118, 8, 1, 8),
(119, 3, 1, 18),
(120, 16, 4, 4),
(121, 14, 1, 16),
(122, 5, 3, 13),
(123, 17, 4, 4),
(124, 16, 3, 6),
(125, 11, 2, 14),
(126, 16, 1, 3),
(127, 11, 3, 10),
(128, 10, 4, 4),
(129, 14, 2, 18),
(130, 7, 4, 9),
(131, 15, 4, 11),
(132, 15, 1, 13),
(133, 19, 1, 10),
(134, 15, 1, 20),
(135, 18, 3, 9),
(136, 5, 4, 5),
(137, 20, 4, 19),
(138, 19, 1, 3),
(139, 7, 2, 9),
(140, 20, 2, 1),
(141, 20, 4, 9),
(142, 12, 1, 16),
(143, 9, 2, 9),
(144, 2, 3, 7),
(145, 9, 4, 14),
(146, 18, 3, 6),
(147, 14, 1, 10),
(148, 20, 4, 15),
(149, 18, 3, 4),
(150, 2, 2, 1),
(151, 14, 2, 16),
(152, 16, 1, 6),
(153, 4, 3, 2),
(154, 2, 3, 16),
(155, 11, 3, 14),
(156, 13, 3, 8),
(157, 7, 4, 1),
(158, 15, 2, 4),
(159, 20, 4, 20),
(160, 6, 4, 2),
(161, 9, 2, 9),
(162, 6, 4, 3),
(163, 14, 4, 1),
(164, 5, 3, 3),
(165, 20, 4, 5),
(166, 3, 3, 14),
(167, 12, 3, 6),
(168, 3, 3, 5),
(169, 16, 2, 14),
(170, 15, 4, 14),
(171, 19, 4, 10),
(172, 15, 3, 7),
(173, 5, 3, 1),
(174, 14, 2, 2),
(175, 12, 4, 20),
(176, 11, 3, 9),
(177, 8, 3, 13),
(178, 4, 4, 2),
(179, 13, 3, 3),
(180, 18, 3, 5),
(181, 9, 2, 3),
(182, 5, 4, 14),
(183, 6, 2, 6),
(184, 3, 1, 15),
(185, 10, 1, 18),
(186, 5, 2, 15),
(187, 9, 4, 5),
(188, 19, 4, 18),
(189, 2, 2, 7),
(190, 5, 1, 6),
(191, 13, 2, 20),
(192, 13, 1, 7),
(193, 7, 2, 2),
(194, 8, 2, 2),
(195, 18, 1, 7),
(196, 12, 2, 19),
(197, 20, 4, 3),
(198, 15, 1, 14),
(199, 10, 4, 5),
(200, 5, 4, 1);
