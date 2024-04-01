-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-04-2024 a las 20:25:33
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `siscancer_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnosticos`
--

CREATE TABLE `diagnosticos` (
  `id` bigint UNSIGNED NOT NULL,
  `paciente_id` bigint UNSIGNED NOT NULL,
  `imagen1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diagnostico` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_diagnostico` date NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `diagnosticos`
--

INSERT INTO `diagnosticos` (`id`, `paciente_id`, `imagen1`, `imagen2`, `diagnostico`, `descripcion`, `fecha_diagnostico`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 1, 'Diagnostico1_17115603491.jpg', 'Diagnostico1_17115603492.jpg', 'CANCER DE MAMA BENIGNO', 'DESCRIPCION DIAGNOSTICO #1', '2024-04-01', '2024-03-27', '2024-03-27 17:20:08', '2024-04-01 19:52:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `fecha_nac` date NOT NULL,
  `estado_civil` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexo` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `especialidad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `doctors`
--

INSERT INTO `doctors` (`id`, `user_id`, `fecha_nac`, `estado_civil`, `sexo`, `especialidad`, `fono2`, `created_at`, `updated_at`) VALUES
(1, 3, '1995-01-01', 'SOLTERO', 'HOMBRE', '', '', '2024-03-27 20:59:28', '2024-03-27 20:59:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenamientos`
--

CREATE TABLE `entrenamientos` (
  `id` bigint UNSIGNED NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `entrenamientos`
--

INSERT INTO `entrenamientos` (`id`, `tipo`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'NO TIENE CANCER', '2024-03-27', '2024-03-27 20:52:39', '2024-03-27 20:52:39'),
(2, 'CANCER DE MAMA BENIGNO', '2024-04-01', '2024-04-01 18:10:45', '2024-04-01 18:10:45'),
(3, 'CANCER DE MAMA MALIGNO', '2024-04-01', '2024-04-01 19:59:39', '2024-04-01 19:59:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenamiento_imagens`
--

CREATE TABLE `entrenamiento_imagens` (
  `id` bigint UNSIGNED NOT NULL,
  `entrenamiento_id` bigint UNSIGNED NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `entrenamiento_imagens`
--

INSERT INTO `entrenamiento_imagens` (`id`, `entrenamiento_id`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 1, 'imagen11711572759_0.jpg', '2024-03-27 20:52:39', '2024-03-27 20:52:39'),
(2, 1, 'imagen11711572761_1.jpg', '2024-03-27 20:52:41', '2024-03-27 20:52:41'),
(3, 1, 'imagen11711572763_2.jpg', '2024-03-27 20:52:43', '2024-03-27 20:52:43'),
(4, 1, 'imagen11711572765_3.jpg', '2024-03-27 20:52:45', '2024-03-27 20:52:45'),
(5, 1, 'imagen11711572767_4.jpg', '2024-03-27 20:52:47', '2024-03-27 20:52:47'),
(6, 1, 'imagen11711572769_5.jpg', '2024-03-27 20:52:49', '2024-03-27 20:52:49'),
(7, 1, 'imagen11711572771_6.jpg', '2024-03-27 20:52:51', '2024-03-27 20:52:51'),
(8, 1, 'imagen11711572774_7.jpg', '2024-03-27 20:52:54', '2024-03-27 20:52:54'),
(9, 1, 'imagen11711572776_8.jpg', '2024-03-27 20:52:56', '2024-03-27 20:52:56'),
(10, 1, 'imagen11711572778_9.jpg', '2024-03-27 20:52:58', '2024-03-27 20:52:58'),
(11, 1, 'imagen11711572780_10.jpg', '2024-03-27 20:53:00', '2024-03-27 20:53:00'),
(12, 1, 'imagen11711572782_11.jpg', '2024-03-27 20:53:02', '2024-03-27 20:53:02'),
(13, 1, 'imagen11711572784_12.jpg', '2024-03-27 20:53:04', '2024-03-27 20:53:04'),
(14, 1, 'imagen11711572786_13.jpg', '2024-03-27 20:53:06', '2024-03-27 20:53:06'),
(15, 1, 'imagen11711572788_14.jpg', '2024-03-27 20:53:08', '2024-03-27 20:53:08'),
(16, 1, 'imagen11711572790_15.jpg', '2024-03-27 20:53:10', '2024-03-27 20:53:10'),
(17, 1, 'imagen11711572792_16.jpg', '2024-03-27 20:53:12', '2024-03-27 20:53:12'),
(18, 1, 'imagen11711572794_17.jpg', '2024-03-27 20:53:14', '2024-03-27 20:53:14'),
(19, 1, 'imagen11711572796_18.jpg', '2024-03-27 20:53:16', '2024-03-27 20:53:16'),
(20, 1, 'imagen11711572798_19.jpg', '2024-03-27 20:53:18', '2024-03-27 20:53:18'),
(21, 1, 'imagen11711572904_20.jpg', '2024-03-27 20:55:04', '2024-03-27 20:55:04'),
(22, 1, 'imagen11711572905_21.jpg', '2024-03-27 20:55:05', '2024-03-27 20:55:05'),
(23, 1, 'imagen11711572906_22.jpg', '2024-03-27 20:55:06', '2024-03-27 20:55:06'),
(24, 1, 'imagen11711572974_23.jpg', '2024-03-27 20:56:14', '2024-03-27 20:56:14'),
(25, 1, 'imagen11711572975_24.jpg', '2024-03-27 20:56:15', '2024-03-27 20:56:15'),
(26, 1, 'imagen11711572976_25.jpg', '2024-03-27 20:56:16', '2024-03-27 20:56:16'),
(27, 1, 'imagen11711572977_26.jpg', '2024-03-27 20:56:17', '2024-03-27 20:56:17'),
(28, 1, 'imagen11711572978_27.jpg', '2024-03-27 20:56:18', '2024-03-27 20:56:18'),
(29, 1, 'imagen11711572979_28.jpg', '2024-03-27 20:56:19', '2024-03-27 20:56:19'),
(31, 2, 'imagen21711995045_0.jpg', '2024-04-01 18:10:45', '2024-04-01 18:10:45'),
(32, 2, 'imagen21711995045_1.jpg', '2024-04-01 18:10:45', '2024-04-01 18:10:45'),
(33, 2, 'imagen21711995045_2.jpg', '2024-04-01 18:10:45', '2024-04-01 18:10:45'),
(34, 2, 'imagen21711995045_3.jpg', '2024-04-01 18:10:45', '2024-04-01 18:10:45'),
(35, 2, 'imagen21711995045_4.jpg', '2024-04-01 18:10:45', '2024-04-01 18:10:45'),
(36, 2, 'imagen21711995045_5.jpg', '2024-04-01 18:10:45', '2024-04-01 18:10:45'),
(37, 2, 'imagen21711995045_6.jpg', '2024-04-01 18:10:45', '2024-04-01 18:10:45'),
(38, 2, 'imagen21711995045_7.jpg', '2024-04-01 18:10:45', '2024-04-01 18:10:45'),
(39, 2, 'imagen21711995045_8.jpg', '2024-04-01 18:10:45', '2024-04-01 18:10:45'),
(40, 2, 'imagen21711995045_9.jpg', '2024-04-01 18:10:45', '2024-04-01 18:10:45'),
(41, 2, 'imagen21711995045_10.jpg', '2024-04-01 18:10:45', '2024-04-01 18:10:45'),
(42, 2, 'imagen21711995045_11.jpg', '2024-04-01 18:10:45', '2024-04-01 18:10:45'),
(43, 2, 'imagen21711995045_12.jpg', '2024-04-01 18:10:45', '2024-04-01 18:10:45'),
(44, 2, 'imagen21711995045_13.jpg', '2024-04-01 18:10:45', '2024-04-01 18:10:45'),
(45, 2, 'imagen21711995045_14.jpg', '2024-04-01 18:10:45', '2024-04-01 18:10:45'),
(46, 2, 'imagen21711995045_15.jpg', '2024-04-01 18:10:45', '2024-04-01 18:10:45'),
(47, 2, 'imagen21711995045_16.jpg', '2024-04-01 18:10:45', '2024-04-01 18:10:45'),
(48, 2, 'imagen21711995045_17.jpg', '2024-04-01 18:10:45', '2024-04-01 18:10:45'),
(49, 2, 'imagen21711995045_18.jpg', '2024-04-01 18:10:45', '2024-04-01 18:10:45'),
(50, 2, 'imagen21711995045_19.jpg', '2024-04-01 18:10:45', '2024-04-01 18:10:45'),
(52, 3, 'imagen31712001579_1.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(53, 3, 'imagen31712001579_2.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(54, 3, 'imagen31712001579_3.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(55, 3, 'imagen31712001579_4.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(56, 3, 'imagen31712001579_5.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(57, 3, 'imagen31712001579_6.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(58, 3, 'imagen31712001579_7.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(59, 3, 'imagen31712001579_8.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(60, 3, 'imagen31712001579_9.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(61, 3, 'imagen31712001579_10.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(62, 3, 'imagen31712001579_11.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(63, 3, 'imagen31712001579_12.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(64, 3, 'imagen31712001579_13.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(65, 3, 'imagen31712001579_14.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(66, 3, 'imagen31712001579_15.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(67, 3, 'imagen31712001579_16.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(68, 3, 'imagen31712001579_17.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(69, 3, 'imagen31712001579_18.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(70, 3, 'imagen31712001579_19.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(71, 3, 'imagen31712001579_20.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(72, 3, 'imagen31712001579_21.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(73, 3, 'imagen31712001579_22.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(74, 3, 'imagen31712001579_23.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(75, 3, 'imagen31712001579_24.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(76, 3, 'imagen31712001579_25.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(77, 3, 'imagen31712001579_26.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(78, 3, 'imagen31712001579_27.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(79, 3, 'imagen31712001579_28.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(80, 3, 'imagen31712001579_29.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(81, 3, 'imagen31712001579_30.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(82, 3, 'imagen31712001579_31.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(83, 3, 'imagen31712001579_32.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(84, 3, 'imagen31712001579_33.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(85, 3, 'imagen31712001579_34.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(86, 3, 'imagen31712001579_35.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(87, 3, 'imagen31712001579_36.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(88, 3, 'imagen31712001579_37.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(89, 3, 'imagen31712001579_38.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(90, 3, 'imagen31712001579_39.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(91, 3, 'imagen31712001579_40.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(92, 3, 'imagen31712001579_41.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(93, 3, 'imagen31712001579_42.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(94, 3, 'imagen31712001579_43.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(95, 3, 'imagen31712001579_44.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(96, 3, 'imagen31712001579_45.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(97, 3, 'imagen31712001579_46.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(98, 3, 'imagen31712001579_47.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(99, 3, 'imagen31712001579_48.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(100, 3, 'imagen31712001579_49.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(101, 3, 'imagen31712001579_50.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(102, 3, 'imagen31712001579_51.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(103, 3, 'imagen31712001579_52.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(104, 3, 'imagen31712001579_53.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(105, 3, 'imagen31712001579_54.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(106, 3, 'imagen31712001579_55.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(107, 3, 'imagen31712001579_56.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(108, 3, 'imagen31712001579_57.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(109, 3, 'imagen31712001579_58.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(110, 3, 'imagen31712001579_59.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(111, 3, 'imagen31712001579_60.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(112, 3, 'imagen31712001579_61.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(113, 3, 'imagen31712001579_62.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(114, 3, 'imagen31712001579_63.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(115, 3, 'imagen31712001579_64.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(116, 3, 'imagen31712001579_65.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(117, 3, 'imagen31712001579_66.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(118, 3, 'imagen31712001579_67.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(119, 3, 'imagen31712001579_68.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(120, 3, 'imagen31712001579_69.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(121, 3, 'imagen31712001579_70.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(122, 3, 'imagen31712001579_71.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(123, 3, 'imagen31712001579_72.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(124, 3, 'imagen31712001579_73.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(125, 3, 'imagen31712001579_74.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(126, 3, 'imagen31712001579_75.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(127, 3, 'imagen31712001579_76.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(128, 3, 'imagen31712001579_77.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(129, 3, 'imagen31712001579_78.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(130, 3, 'imagen31712001579_79.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(131, 3, 'imagen31712001579_80.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(132, 3, 'imagen31712001579_81.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(133, 3, 'imagen31712001579_82.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(134, 3, 'imagen31712001579_83.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(135, 3, 'imagen31712001579_84.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(136, 3, 'imagen31712001579_85.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(137, 3, 'imagen31712001579_86.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(138, 3, 'imagen31712001579_87.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(139, 3, 'imagen31712001579_88.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(140, 3, 'imagen31712001579_89.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(141, 3, 'imagen31712001579_90.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(142, 3, 'imagen31712001579_91.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(143, 3, 'imagen31712001579_92.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(144, 3, 'imagen31712001579_93.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(145, 3, 'imagen31712001579_94.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(146, 3, 'imagen31712001579_95.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(147, 3, 'imagen31712001579_96.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(148, 3, 'imagen31712001579_97.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(149, 3, 'imagen31712001579_98.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(150, 3, 'imagen31712001579_99.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(151, 3, 'imagen31712001579_100.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(152, 3, 'imagen31712001579_101.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(153, 3, 'imagen31712001579_102.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(154, 3, 'imagen31712001579_103.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(155, 3, 'imagen31712001579_104.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(156, 3, 'imagen31712001579_105.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(157, 3, 'imagen31712001579_106.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(158, 3, 'imagen31712001579_107.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(159, 3, 'imagen31712001579_108.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(160, 3, 'imagen31712001579_109.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(161, 3, 'imagen31712001579_110.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(162, 3, 'imagen31712001579_111.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(163, 3, 'imagen31712001579_112.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(164, 3, 'imagen31712001579_113.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(165, 3, 'imagen31712001579_114.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(166, 3, 'imagen31712001579_115.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(167, 3, 'imagen31712001579_116.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(168, 3, 'imagen31712001579_117.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(169, 3, 'imagen31712001579_118.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(170, 3, 'imagen31712001579_119.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(171, 3, 'imagen31712001579_120.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(172, 3, 'imagen31712001579_121.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(173, 3, 'imagen31712001579_122.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(174, 3, 'imagen31712001579_123.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(175, 3, 'imagen31712001579_124.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(176, 3, 'imagen31712001579_125.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(177, 3, 'imagen31712001579_126.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(178, 3, 'imagen31712001579_127.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(179, 3, 'imagen31712001579_128.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(180, 3, 'imagen31712001579_129.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(181, 3, 'imagen31712001579_130.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(182, 3, 'imagen31712001579_131.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(183, 3, 'imagen31712001579_132.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(184, 3, 'imagen31712001579_133.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(185, 3, 'imagen31712001579_134.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(186, 3, 'imagen31712001579_135.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(187, 3, 'imagen31712001579_136.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(188, 3, 'imagen31712001579_137.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(189, 3, 'imagen31712001579_138.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(190, 3, 'imagen31712001579_139.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(191, 3, 'imagen31712001579_140.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(192, 3, 'imagen31712001579_141.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(193, 3, 'imagen31712001579_142.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(194, 3, 'imagen31712001579_143.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(195, 3, 'imagen31712001579_144.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(196, 3, 'imagen31712001579_145.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(197, 3, 'imagen31712001579_146.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(198, 3, 'imagen31712001579_147.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(199, 3, 'imagen31712001579_148.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(200, 3, 'imagen31712001579_149.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(201, 3, 'imagen31712001579_150.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(202, 3, 'imagen31712001579_151.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(203, 3, 'imagen31712001579_152.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(204, 3, 'imagen31712001579_153.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(205, 3, 'imagen31712001579_154.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(206, 3, 'imagen31712001579_155.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(207, 3, 'imagen31712001579_156.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(208, 3, 'imagen31712001579_157.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(209, 3, 'imagen31712001579_158.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(210, 3, 'imagen31712001579_159.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(211, 3, 'imagen31712001579_160.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(212, 3, 'imagen31712001579_161.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(213, 3, 'imagen31712001579_162.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(214, 3, 'imagen31712001579_163.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(215, 3, 'imagen31712001579_164.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(216, 3, 'imagen31712001579_165.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(217, 3, 'imagen31712001579_166.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(218, 3, 'imagen31712001579_167.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(219, 3, 'imagen31712001579_168.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(220, 3, 'imagen31712001579_169.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(221, 3, 'imagen31712001579_170.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(222, 3, 'imagen31712001579_171.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(223, 3, 'imagen31712001579_172.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(224, 3, 'imagen31712001579_173.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(225, 3, 'imagen31712001579_174.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(226, 3, 'imagen31712001579_175.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(227, 3, 'imagen31712001579_176.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(228, 3, 'imagen31712001579_177.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(229, 3, 'imagen31712001579_178.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(230, 3, 'imagen31712001579_179.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(231, 3, 'imagen31712001579_180.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(232, 3, 'imagen31712001579_181.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(233, 3, 'imagen31712001579_182.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(234, 3, 'imagen31712001579_183.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(235, 3, 'imagen31712001579_184.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(236, 3, 'imagen31712001579_185.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(237, 3, 'imagen31712001579_186.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(238, 3, 'imagen31712001579_187.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(239, 3, 'imagen31712001579_188.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(240, 3, 'imagen31712001579_189.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(241, 3, 'imagen31712001579_190.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(242, 3, 'imagen31712001579_191.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(243, 3, 'imagen31712001579_192.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(244, 3, 'imagen31712001579_193.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(245, 3, 'imagen31712001579_194.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(246, 3, 'imagen31712001579_195.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(247, 3, 'imagen31712001579_196.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(248, 3, 'imagen31712001579_197.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(249, 3, 'imagen31712001579_198.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(250, 3, 'imagen31712001579_199.jpg', '2024-04-01 19:59:39', '2024-04-01 19:59:39'),
(251, 3, 'imagen31712003054_99.jpg', '2024-04-01 20:24:14', '2024-04-01 20:24:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_accions`
--

CREATE TABLE `historial_accions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `accion` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `datos_original` text COLLATE utf8mb4_unicode_ci,
  `datos_nuevo` text COLLATE utf8mb4_unicode_ci,
  `modulo` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_accions`
--

INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(1, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$cbFtXQPeSYJJ9HOwTye3guQa4V1qmuD6bC4qoBJ6K3/DwTF1mv4TW<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 77777777<br/>tipo: SUPER USUARIO<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-03-16 00:00:00<br/>created_at: 2024-03-16 11:02:24<br/>updated_at: 2024-03-16 11:02:24<br/>', NULL, 'USUARIOS', '2024-03-16', '11:02:24', '2024-03-16 15:02:24', '2024-03-16 15:02:24'),
(2, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$cbFtXQPeSYJJ9HOwTye3guQa4V1qmuD6bC4qoBJ6K3/DwTF1mv4TW<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 77777777<br/>tipo: SUPER USUARIO<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-03-16 00:00:00<br/>created_at: 2024-03-16 11:02:24<br/>updated_at: 2024-03-16 11:02:24<br/>', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$cbFtXQPeSYJJ9HOwTye3guQa4V1qmuD6bC4qoBJ6K3/DwTF1mv4TW<br/>nombre: JUANS<br/>paterno: PERESS<br/>materno: MAMANIS<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 77777777<br/>tipo: SUPER USUARIO<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-03-16 00:00:00<br/>created_at: 2024-03-16 11:02:24<br/>updated_at: 2024-03-16 11:02:34<br/>', 'USUARIOS', '2024-03-16', '11:02:34', '2024-03-16 15:02:34', '2024-03-16 15:02:34'),
(3, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$cbFtXQPeSYJJ9HOwTye3guQa4V1qmuD6bC4qoBJ6K3/DwTF1mv4TW<br/>nombre: JUANS<br/>paterno: PERESS<br/>materno: MAMANIS<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 77777777<br/>tipo: SUPER USUARIO<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-03-16 00:00:00<br/>created_at: 2024-03-16 11:02:24<br/>updated_at: 2024-03-16 11:02:34<br/>', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$cbFtXQPeSYJJ9HOwTye3guQa4V1qmuD6bC4qoBJ6K3/DwTF1mv4TW<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 77777777<br/>tipo: SUPER USUARIO<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-03-16 00:00:00<br/>created_at: 2024-03-16 11:02:24<br/>updated_at: 2024-03-16 11:02:40<br/>', 'USUARIOS', '2024-03-16', '11:02:40', '2024-03-16 15:02:40', '2024-03-16 15:02:40'),
(4, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN LA CONTRASEÑA DE UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$cbFtXQPeSYJJ9HOwTye3guQa4V1qmuD6bC4qoBJ6K3/DwTF1mv4TW<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 77777777<br/>tipo: SUPER USUARIO<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-03-16 00:00:00<br/>created_at: 2024-03-16 11:02:24<br/>updated_at: 2024-03-16 11:02:40<br/>', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$JHUjQNYWEx4Z3vdO.IXQruZoZdrbQnZwW3P0Ewy76C2KjQRWv4qYK<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 77777777<br/>tipo: SUPER USUARIO<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-03-16 00:00:00<br/>created_at: 2024-03-16 11:02:24<br/>updated_at: 2024-03-16 11:03:06<br/>', 'USUARIOS', '2024-03-16', '11:03:06', '2024-03-16 15:03:06', '2024-03-16 15:03:06'),
(5, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN LA CONTRASEÑA DE UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$JHUjQNYWEx4Z3vdO.IXQruZoZdrbQnZwW3P0Ewy76C2KjQRWv4qYK<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 77777777<br/>tipo: SUPER USUARIO<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-03-16 00:00:00<br/>created_at: 2024-03-16 11:02:24<br/>updated_at: 2024-03-16 11:03:06<br/>', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$ymKPkYJyo6Trh513eKXW7uReuTy3ufzH6tUNE3n3IyUf3GvAcLoDm<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 77777777<br/>tipo: SUPER USUARIO<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-03-16 00:00:00<br/>created_at: 2024-03-16 11:02:24<br/>updated_at: 2024-03-16 11:03:21<br/>', 'USUARIOS', '2024-03-16', '11:03:21', '2024-03-16 15:03:21', '2024-03-16 15:03:21'),
(6, 1, 'CREACIÓN', 'EL DOCTOR admin REGISTRO UN DOCTOR', 'id: 1<br/>user_id: 3<br/>fecha_nac: 1999-01-01<br/>estado_civil: CASADO<br/>sexo: HOMBRE<br/>especialidad: <br/>fono2: 222222<br/>created_at: 2024-03-22 11:45:50<br/>updated_at: 2024-03-22 11:45:50<br/>', NULL, 'DOCTORES', '2024-03-22', '11:45:50', '2024-03-22 15:45:50', '2024-03-22 15:45:50'),
(7, 1, 'MODIFICACIÓN', 'EL DOCTOR admin MODIFICÓ UN DOCTOR', 'id: 1<br/>user_id: 3<br/>fecha_nac: 1999-01-01<br/>estado_civil: CASADO<br/>sexo: HOMBRE<br/>especialidad: <br/>fono2: 222222<br/>created_at: 2024-03-22 11:45:50<br/>updated_at: 2024-03-22 11:45:50<br/>', 'id: 1<br/>user_id: 3<br/>fecha_nac: 1999-01-01<br/>estado_civil: CASADO<br/>sexo: HOMBRE<br/>especialidad: ESPECIALIDAD #1<br/>fono2: 222222<br/>created_at: 2024-03-22 11:45:50<br/>updated_at: 2024-03-22 11:52:55<br/>', 'DOCTORES', '2024-03-22', '11:52:55', '2024-03-22 15:52:55', '2024-03-22 15:52:55'),
(8, 1, 'MODIFICACIÓN', 'EL DOCTOR admin MODIFICÓ UN DOCTOR', 'id: 1<br/>user_id: 3<br/>fecha_nac: 1999-01-01<br/>estado_civil: CASADO<br/>sexo: HOMBRE<br/>especialidad: ESPECIALIDAD #1<br/>fono2: 222222<br/>created_at: 2024-03-22 11:45:50<br/>updated_at: 2024-03-22 11:52:55<br/>', 'id: 1<br/>user_id: 3<br/>fecha_nac: 1999-01-01<br/>estado_civil: CASADO<br/>sexo: HOMBRE<br/>especialidad: ESPECIALIDAD #1<br/>fono2: 222222<br/>created_at: 2024-03-22 11:45:50<br/>updated_at: 2024-03-22 11:52:55<br/>', 'DOCTORES', '2024-03-22', '11:53:02', '2024-03-22 15:53:02', '2024-03-22 15:53:02'),
(9, 1, 'MODIFICACIÓN', 'EL DOCTOR admin MODIFICÓ UN DOCTOR', 'id: 1<br/>user_id: 3<br/>fecha_nac: 1999-01-01<br/>estado_civil: CASADO<br/>sexo: HOMBRE<br/>especialidad: ESPECIALIDAD #1<br/>fono2: 222222<br/>created_at: 2024-03-22 11:45:50<br/>updated_at: 2024-03-22 11:52:55<br/>', 'id: 1<br/>user_id: 3<br/>fecha_nac: 1999-01-01<br/>estado_civil: CASADO<br/>sexo: HOMBRE<br/>especialidad: ESPECIALIDAD #1<br/>fono2: 222222<br/>created_at: 2024-03-22 11:45:50<br/>updated_at: 2024-03-22 11:52:55<br/>', 'DOCTORES', '2024-03-22', '11:53:07', '2024-03-22 15:53:07', '2024-03-22 15:53:07'),
(10, 1, 'MODIFICACIÓN', 'EL DOCTOR admin MODIFICÓ UN DOCTOR', 'id: 1<br/>user_id: 3<br/>fecha_nac: 1999-01-01<br/>estado_civil: CASADO<br/>sexo: HOMBRE<br/>especialidad: ESPECIALIDAD #1<br/>fono2: 222222<br/>created_at: 2024-03-22 11:45:50<br/>updated_at: 2024-03-22 11:52:55<br/>', 'id: 1<br/>user_id: 3<br/>fecha_nac: 1999-01-01<br/>estado_civil: CASADO<br/>sexo: HOMBRE<br/>especialidad: ESPECIALIDAD #1<br/>fono2: 222222<br/>created_at: 2024-03-22 11:45:50<br/>updated_at: 2024-03-22 11:52:55<br/>', 'DOCTORES', '2024-03-22', '12:00:11', '2024-03-22 16:00:11', '2024-03-22 16:00:11'),
(11, 1, 'MODIFICACIÓN', 'EL DOCTOR admin MODIFICÓ UN DOCTOR', 'id: 1<br/>user_id: 3<br/>fecha_nac: 1999-01-01<br/>estado_civil: CASADO<br/>sexo: HOMBRE<br/>especialidad: ESPECIALIDAD #1<br/>fono2: 222222<br/>created_at: 2024-03-22 11:45:50<br/>updated_at: 2024-03-22 11:52:55<br/>', 'id: 1<br/>user_id: 3<br/>fecha_nac: 1999-01-01<br/>estado_civil: CASADO<br/>sexo: HOMBRE<br/>especialidad: ESPECIALIDAD #1<br/>fono2: 222222<br/>created_at: 2024-03-22 11:45:50<br/>updated_at: 2024-03-22 11:52:55<br/>', 'DOCTORES', '2024-03-22', '12:00:18', '2024-03-22 16:00:18', '2024-03-22 16:00:18'),
(12, 1, 'MODIFICACIÓN', 'EL DOCTOR admin MODIFICÓ UN DOCTOR', 'id: 1<br/>user_id: 3<br/>fecha_nac: 1999-01-01<br/>estado_civil: CASADO<br/>sexo: HOMBRE<br/>especialidad: ESPECIALIDAD #1<br/>fono2: 222222<br/>created_at: 2024-03-22 11:45:50<br/>updated_at: 2024-03-22 11:52:55<br/>', 'id: 1<br/>user_id: 3<br/>fecha_nac: 1999-01-01<br/>estado_civil: CASADO<br/>sexo: HOMBRE<br/>especialidad: ESPECIALIDAD #1<br/>fono2: 222222<br/>created_at: 2024-03-22 11:45:50<br/>updated_at: 2024-03-22 11:52:55<br/>', 'DOCTORES', '2024-03-22', '12:00:22', '2024-03-22 16:00:22', '2024-03-22 16:00:22'),
(13, 1, 'MODIFICACIÓN', 'EL DOCTOR admin MODIFICÓ UN DOCTOR', 'id: 1<br/>user_id: 3<br/>fecha_nac: 1999-01-01<br/>estado_civil: CASADO<br/>sexo: HOMBRE<br/>especialidad: ESPECIALIDAD #1<br/>fono2: 222222<br/>created_at: 2024-03-22 11:45:50<br/>updated_at: 2024-03-22 11:52:55<br/>', 'id: 1<br/>user_id: 3<br/>fecha_nac: 1999-01-01<br/>estado_civil: CASADO<br/>sexo: HOMBRE<br/>especialidad: ESPECIALIDAD #1<br/>fono2: 222222<br/>created_at: 2024-03-22 11:45:50<br/>updated_at: 2024-03-22 11:52:55<br/>', 'DOCTORES', '2024-03-22', '12:00:36', '2024-03-22 16:00:36', '2024-03-22 16:00:36'),
(14, 1, 'ELIMINACIÓN', 'EL DOCTOR admin ELIMINÓ UN DOCTOR', 'id: 1<br/>user_id: 3<br/>fecha_nac: 1999-01-01<br/>estado_civil: CASADO<br/>sexo: HOMBRE<br/>especialidad: ESPECIALIDAD #1<br/>fono2: 222222<br/>created_at: 2024-03-22 11:45:50<br/>updated_at: 2024-03-22 11:52:55<br/>', NULL, 'DOCTORES', '2024-03-22', '12:01:01', '2024-03-22 16:01:01', '2024-03-22 16:01:01'),
(15, 1, 'CREACIÓN', 'EL DOCTOR admin REGISTRO UN DOCTOR', 'id: 2<br/>user_id: 4<br/>fecha_nac: 1999-01-01<br/>estado_civil: SOLTERO<br/>sexo: HOMBRE<br/>especialidad: <br/>fono2: <br/>created_at: 2024-03-22 12:01:31<br/>updated_at: 2024-03-22 12:01:31<br/>', NULL, 'DOCTORES', '2024-03-22', '12:01:32', '2024-03-22 16:01:32', '2024-03-22 16:01:32'),
(16, 1, 'ELIMINACIÓN', 'EL DOCTOR admin ELIMINÓ UN DOCTOR', 'id: 2<br/>user_id: 4<br/>fecha_nac: 1999-01-01<br/>estado_civil: SOLTERO<br/>sexo: HOMBRE<br/>especialidad: <br/>fono2: <br/>created_at: 2024-03-22 12:01:31<br/>updated_at: 2024-03-22 12:01:31<br/>', NULL, 'DOCTORES', '2024-03-22', '12:01:35', '2024-03-22 16:01:35', '2024-03-22 16:01:35'),
(17, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PACIENTE', 'id: 1<br/>nombre: MARIA<br/>paterno: MAMANI<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>fecha_nac: 2000-03-03<br/>sexo: MUJER<br/>estado_civil: CASADO<br/>ocupacion: OCUPACION #1<br/>correo: MARIA@GMAIL.COM<br/>cel: 77777777<br/>cel_familiar: 666666666<br/>dir_trabajo: DIR. TRABAJO<br/>dir_domicilio: DIR. DOMICILIO<br/>foto: 1711124681_.png<br/>fecha_registro: 2024-03-22<br/>created_at: 2024-03-22 12:24:41<br/>updated_at: 2024-03-22 12:24:41<br/>', NULL, 'PACIENTES', '2024-03-22', '12:24:41', '2024-03-22 16:24:41', '2024-03-22 16:24:41'),
(18, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN PACIENTE', 'id: 1<br/>nombre: MARIA<br/>paterno: MAMANI<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>fecha_nac: 2000-03-03<br/>sexo: MUJER<br/>estado_civil: CASADO<br/>ocupacion: OCUPACION #1<br/>correo: MARIA@GMAIL.COM<br/>cel: 77777777<br/>cel_familiar: 666666666<br/>dir_trabajo: DIR. TRABAJO<br/>dir_domicilio: DIR. DOMICILIO<br/>foto: 1711124681_.png<br/>fecha_registro: 2024-03-22<br/>created_at: 2024-03-22 12:24:41<br/>updated_at: 2024-03-22 12:24:41<br/>', 'id: 1<br/>nombre: MARIAS<br/>paterno: MAMANIS<br/>materno: MAMANIS<br/>ci: 1234<br/>ci_exp: LP<br/>fecha_nac: 2000-03-03<br/>sexo: MUJER<br/>estado_civil: CASADO<br/>ocupacion: OCUPACION #1<br/>correo: MARIA@GMAIL.COM<br/>cel: 77777777<br/>cel_familiar: 666666666<br/>dir_trabajo: DIR. TRABAJO<br/>dir_domicilio: DIR. DOMICILIO<br/>foto: 1711124681_.png<br/>fecha_registro: 2024-03-22<br/>created_at: 2024-03-22 12:24:41<br/>updated_at: 2024-03-22 12:34:54<br/>', 'PACIENTES', '2024-03-22', '12:34:54', '2024-03-22 16:34:54', '2024-03-22 16:34:54'),
(19, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN PACIENTE', 'id: 1<br/>nombre: MARIAS<br/>paterno: MAMANIS<br/>materno: MAMANIS<br/>ci: 1234<br/>ci_exp: LP<br/>fecha_nac: 2000-03-03<br/>sexo: MUJER<br/>estado_civil: CASADO<br/>ocupacion: OCUPACION #1<br/>correo: MARIA@GMAIL.COM<br/>cel: 77777777<br/>cel_familiar: 666666666<br/>dir_trabajo: DIR. TRABAJO<br/>dir_domicilio: DIR. DOMICILIO<br/>foto: 1711124681_.png<br/>fecha_registro: 2024-03-22<br/>created_at: 2024-03-22 12:24:41<br/>updated_at: 2024-03-22 12:34:54<br/>', 'id: 1<br/>nombre: MARIA<br/>paterno: MAMANI<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>fecha_nac: 2000-03-03<br/>sexo: MUJER<br/>estado_civil: CASADO<br/>ocupacion: OCUPACION #1<br/>correo: MARIA@GMAIL.COM<br/>cel: 77777777<br/>cel_familiar: 666666666<br/>dir_trabajo: DIR. TRABAJO<br/>dir_domicilio: DIR. DOMICILIO<br/>foto: 1711124681_.png<br/>fecha_registro: 2024-03-22<br/>created_at: 2024-03-22 12:24:41<br/>updated_at: 2024-03-22 12:35:01<br/>', 'PACIENTES', '2024-03-22', '12:35:01', '2024-03-22 16:35:01', '2024-03-22 16:35:01'),
(20, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN PACIENTE', 'id: 1<br/>nombre: MARIA<br/>paterno: MAMANI<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>fecha_nac: 2000-03-03<br/>sexo: MUJER<br/>estado_civil: CASADO<br/>ocupacion: OCUPACION #1<br/>correo: MARIA@GMAIL.COM<br/>cel: 77777777<br/>cel_familiar: 666666666<br/>dir_trabajo: DIR. TRABAJO<br/>dir_domicilio: DIR. DOMICILIO<br/>foto: 1711124681_.png<br/>fecha_registro: 2024-03-22<br/>created_at: 2024-03-22 12:24:41<br/>updated_at: 2024-03-22 12:35:01<br/>', 'id: 1<br/>nombre: MARIA<br/>paterno: MAMANI<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>fecha_nac: 2000-03-03<br/>sexo: MUJER<br/>estado_civil: CASADO<br/>ocupacion: OCUPACION #1<br/>correo: MARIA@GMAIL.COM<br/>cel: 77777777<br/>cel_familiar: 666666666<br/>dir_trabajo: DIR. TRABAJO<br/>dir_domicilio: DIR. DOMICILIO<br/>foto: 1711125307_.png<br/>fecha_registro: 2024-03-22<br/>created_at: 2024-03-22 12:24:41<br/>updated_at: 2024-03-22 12:35:07<br/>', 'PACIENTES', '2024-03-22', '12:35:07', '2024-03-22 16:35:07', '2024-03-22 16:35:07'),
(21, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN PACIENTE', 'id: 1<br/>nombre: MARIA<br/>paterno: MAMANI<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>fecha_nac: 2000-03-03<br/>sexo: MUJER<br/>estado_civil: CASADO<br/>ocupacion: OCUPACION #1<br/>correo: MARIA@GMAIL.COM<br/>cel: 77777777<br/>cel_familiar: 666666666<br/>dir_trabajo: DIR. TRABAJO<br/>dir_domicilio: DIR. DOMICILIO<br/>foto: 1711125307_.png<br/>fecha_registro: 2024-03-22<br/>created_at: 2024-03-22 12:24:41<br/>updated_at: 2024-03-22 12:35:07<br/>', NULL, 'PACIENTES', '2024-03-22', '12:35:14', '2024-03-22 16:35:14', '2024-03-22 16:35:14'),
(22, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PACIENTE', 'id: 1<br/>nombre: MARIA<br/>paterno: MAMANI<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>fecha_nac: 2000-01-01<br/>sexo: MUJER<br/>estado_civil: CASADO<br/>ocupacion: OCUPACION #1<br/>correo: <br/>cel: 7777777<br/>cel_familiar: 66666666<br/>dir_trabajo: <br/>dir_domicilio: <br/>foto: 1711125343_.png<br/>fecha_registro: 2024-03-22<br/>created_at: 2024-03-22 12:35:43<br/>updated_at: 2024-03-22 12:35:43<br/>', NULL, 'PACIENTES', '2024-03-22', '12:35:43', '2024-03-22 16:35:43', '2024-03-22 16:35:43'),
(23, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN HISTORIAL DE PACIENTE', 'id: 1<br/>paciente_id: 1<br/>fecha_pc: 2022-01-01<br/>meses_dpc: 6<br/>mamografia_aa: SI<br/>biopsias_mp: NINGUNA<br/>hiperplasia_a: SI<br/>cancer_mp: NO<br/>lado_ta: NO CORRESPONDE<br/>cancer_olc: NO<br/>parientes_pgcm: NINGUNO<br/>otros_pccm: NINGUNO<br/>parientes_cco: SI<br/>parientes_ccc: SI<br/>parientes_cce: SI<br/>parientes_cotc: SI<br/>fecha_registro: 2024-03-26<br/>created_at: 2024-03-26 15:31:20<br/>updated_at: 2024-03-26 15:31:20<br/>', NULL, 'HISTORIAL DE PACIENTES', '2024-03-26', '15:31:20', '2024-03-26 19:31:20', '2024-03-26 19:31:20'),
(24, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN HISTORIAL DE PACIENTE', 'id: 1<br/>paciente_id: 1<br/>fecha_pc: 2022-01-01<br/>meses_dpc: 6<br/>mamografia_aa: SI<br/>biopsias_mp: NINGUNA<br/>hiperplasia_a: SI<br/>cancer_mp: NO<br/>lado_ta: NO CORRESPONDE<br/>cancer_olc: NO<br/>parientes_pgcm: NINGUNO<br/>otros_pccm: NINGUNO<br/>parientes_cco: SI<br/>parientes_ccc: SI<br/>parientes_cce: SI<br/>parientes_cotc: SI<br/>fecha_registro: 2024-03-26<br/>created_at: 2024-03-26 15:48:21<br/>updated_at: 2024-03-26 15:48:21<br/>', NULL, 'HISTORIAL DE PACIENTES', '2024-03-26', '15:48:21', '2024-03-26 19:48:21', '2024-03-26 19:48:21'),
(25, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN HISTORIAL DE PACIENTE', 'id: 1<br/>paciente_id: 1<br/>fecha_pc: 2022-01-01<br/>meses_dpc: 6<br/>mamografia_aa: SI<br/>biopsias_mp: NINGUNA<br/>hiperplasia_a: SI<br/>cancer_mp: NO<br/>lado_ta: NO CORRESPONDE<br/>cancer_olc: NO<br/>parientes_pgcm: NINGUNO<br/>otros_pccm: NINGUNO<br/>parientes_cco: SI<br/>parientes_ccc: SI<br/>parientes_cce: SI<br/>parientes_cotc: SI<br/>fecha_registro: 2024-03-26<br/>created_at: 2024-03-26 15:48:21<br/>updated_at: 2024-03-26 15:48:21<br/>', 'id: 1<br/>paciente_id: 1<br/>fecha_pc: 2022-01-01<br/>meses_dpc: 6<br/>mamografia_aa: SI<br/>biopsias_mp: NINGUNA<br/>hiperplasia_a: SI<br/>cancer_mp: NO<br/>lado_ta: NO CORRESPONDE<br/>cancer_olc: NO<br/>parientes_pgcm: NINGUNO<br/>otros_pccm: NINGUNO<br/>parientes_cco: SI<br/>parientes_ccc: SI<br/>parientes_cce: SI<br/>parientes_cotc: SI<br/>fecha_registro: 2024-03-26<br/>created_at: 2024-03-26 15:48:21<br/>updated_at: 2024-03-26 15:48:21<br/>', 'HISTORIAL DE PACIENTES', '2024-03-26', '16:07:41', '2024-03-26 20:07:41', '2024-03-26 20:07:41'),
(26, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN HISTORIAL DE PACIENTE', 'id: 1<br/>paciente_id: 1<br/>fecha_pc: 2022-01-01<br/>meses_dpc: 6<br/>mamografia_aa: SI<br/>biopsias_mp: NINGUNA<br/>hiperplasia_a: SI<br/>cancer_mp: NO<br/>lado_ta: NO CORRESPONDE<br/>cancer_olc: NO<br/>parientes_pgcm: NINGUNO<br/>otros_pccm: NINGUNO<br/>parientes_cco: SI<br/>parientes_ccc: SI<br/>parientes_cce: SI<br/>parientes_cotc: SI<br/>fecha_registro: 2024-03-26<br/>created_at: 2024-03-26 15:48:21<br/>updated_at: 2024-03-26 15:48:21<br/>', NULL, 'HISTORIAL DE PACIENTES', '2024-03-26', '16:09:56', '2024-03-26 20:09:56', '2024-03-26 20:09:56'),
(27, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN HISTORIAL DE PACIENTE', 'id: 1<br/>paciente_id: 1<br/>fecha_pc: 2022-01-01<br/>meses_dpc: 5<br/>mamografia_aa: SI<br/>biopsias_mp: NINGUNA<br/>hiperplasia_a: SI<br/>cancer_mp: NO<br/>lado_ta: NO CORRESPONDE<br/>cancer_olc: NO<br/>parientes_pgcm: NINGUNO<br/>otros_pccm: NINGUNO<br/>parientes_cco: SI<br/>parientes_ccc: SI<br/>parientes_cce: SI<br/>parientes_cotc: SI<br/>fecha_registro: 2024-03-26<br/>created_at: 2024-03-26 16:10:53<br/>updated_at: 2024-03-26 16:10:53<br/>', NULL, 'HISTORIAL DE PACIENTES', '2024-03-26', '16:10:53', '2024-03-26 20:10:53', '2024-03-26 20:10:53'),
(28, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN HISTORIAL DE PACIENTE', 'id: 1<br/>paciente_id: 1<br/>fecha_pc: 2022-01-01<br/>meses_dpc: 5<br/>mamografia_aa: SI<br/>biopsias_mp: NINGUNA<br/>hiperplasia_a: SI<br/>cancer_mp: NO<br/>lado_ta: NO CORRESPONDE<br/>cancer_olc: NO<br/>parientes_pgcm: NINGUNO<br/>otros_pccm: NINGUNO<br/>parientes_cco: SI<br/>parientes_ccc: SI<br/>parientes_cce: SI<br/>parientes_cotc: SI<br/>fecha_registro: 2024-03-26<br/>created_at: 2024-03-26 16:10:53<br/>updated_at: 2024-03-26 16:10:53<br/>', 'id: 1<br/>paciente_id: 1<br/>fecha_pc: 2022-01-01<br/>meses_dpc: 5<br/>mamografia_aa: SI<br/>biopsias_mp: NINGUNA<br/>hiperplasia_a: SI<br/>cancer_mp: NO<br/>lado_ta: NO CORRESPONDE<br/>cancer_olc: NO<br/>parientes_pgcm: NINGUNO<br/>otros_pccm: NINGUNO<br/>parientes_cco: SI<br/>parientes_ccc: SI<br/>parientes_cce: SI<br/>parientes_cotc: SI<br/>fecha_registro: 2024-03-26<br/>created_at: 2024-03-26 16:10:53<br/>updated_at: 2024-03-26 16:10:53<br/>', 'HISTORIAL DE PACIENTES', '2024-03-26', '16:41:17', '2024-03-26 20:41:17', '2024-03-26 20:41:17'),
(29, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN HISTORIAL DE PACIENTE', 'id: 1<br/>paciente_id: 1<br/>fecha_pc: 2022-01-01<br/>meses_dpc: 5<br/>mamografia_aa: SI<br/>biopsias_mp: NINGUNA<br/>hiperplasia_a: SI<br/>cancer_mp: NO<br/>lado_ta: NO CORRESPONDE<br/>cancer_olc: NO<br/>parientes_pgcm: NINGUNO<br/>otros_pccm: NINGUNO<br/>parientes_cco: SI<br/>parientes_ccc: SI<br/>parientes_cce: SI<br/>parientes_cotc: SI<br/>fecha_registro: 2024-03-26<br/>created_at: 2024-03-26 16:10:53<br/>updated_at: 2024-03-26 16:10:53<br/>', 'id: 1<br/>paciente_id: 1<br/>fecha_pc: 2022-01-01<br/>meses_dpc: 5<br/>mamografia_aa: SI<br/>biopsias_mp: NINGUNA<br/>hiperplasia_a: SI<br/>cancer_mp: NO<br/>lado_ta: NO CORRESPONDE<br/>cancer_olc: NO<br/>parientes_pgcm: NINGUNO<br/>otros_pccm: NINGUNO<br/>parientes_cco: SI<br/>parientes_ccc: SI<br/>parientes_cce: SI<br/>parientes_cotc: SI<br/>fecha_registro: 2024-03-26<br/>created_at: 2024-03-26 16:10:53<br/>updated_at: 2024-03-26 16:10:53<br/>', 'HISTORIAL DE PACIENTES', '2024-03-26', '16:43:00', '2024-03-26 20:43:00', '2024-03-26 20:43:00'),
(30, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN HISTORIAL DE PACIENTE', 'id: 1<br/>paciente_id: 1<br/>fecha_pc: 2022-01-01<br/>meses_dpc: 5<br/>mamografia_aa: SI<br/>biopsias_mp: NINGUNA<br/>hiperplasia_a: SI<br/>cancer_mp: NO<br/>lado_ta: NO CORRESPONDE<br/>cancer_olc: NO<br/>parientes_pgcm: NINGUNO<br/>otros_pccm: NINGUNO<br/>parientes_cco: SI<br/>parientes_ccc: SI<br/>parientes_cce: SI<br/>parientes_cotc: SI<br/>fecha_registro: 2024-03-26<br/>created_at: 2024-03-26 16:10:53<br/>updated_at: 2024-03-26 16:10:53<br/>', 'id: 1<br/>paciente_id: 1<br/>fecha_pc: 2022-01-01<br/>meses_dpc: 5<br/>mamografia_aa: SI<br/>biopsias_mp: NINGUNA<br/>hiperplasia_a: SI<br/>cancer_mp: NO<br/>lado_ta: NO CORRESPONDE<br/>cancer_olc: NO<br/>parientes_pgcm: NINGUNO<br/>otros_pccm: NINGUNO<br/>parientes_cco: SI<br/>parientes_ccc: SI<br/>parientes_cce: SI<br/>parientes_cotc: SI<br/>fecha_registro: 2024-03-26<br/>created_at: 2024-03-26 16:10:53<br/>updated_at: 2024-03-26 16:10:53<br/>', 'HISTORIAL DE PACIENTES', '2024-03-26', '16:47:44', '2024-03-26 20:47:44', '2024-03-26 20:47:44'),
(31, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN HISTORIAL DE PACIENTE', 'id: 1<br/>paciente_id: 1<br/>fecha_pc: 2022-01-01<br/>meses_dpc: 5<br/>mamografia_aa: SI<br/>biopsias_mp: NINGUNA<br/>hiperplasia_a: SI<br/>cancer_mp: NO<br/>lado_ta: NO CORRESPONDE<br/>cancer_olc: NO<br/>parientes_pgcm: NINGUNO<br/>otros_pccm: NINGUNO<br/>parientes_cco: SI<br/>parientes_ccc: SI<br/>parientes_cce: SI<br/>parientes_cotc: SI<br/>fecha_registro: 2024-03-26<br/>created_at: 2024-03-26 16:10:53<br/>updated_at: 2024-03-26 16:10:53<br/>', 'id: 1<br/>paciente_id: 1<br/>fecha_pc: 2022-01-01<br/>meses_dpc: 5<br/>mamografia_aa: SI<br/>biopsias_mp: NINGUNA<br/>hiperplasia_a: SI<br/>cancer_mp: NO<br/>lado_ta: NO CORRESPONDE<br/>cancer_olc: NO<br/>parientes_pgcm: NINGUNO<br/>otros_pccm: NINGUNO<br/>parientes_cco: SI<br/>parientes_ccc: SI<br/>parientes_cce: SI<br/>parientes_cotc: SI<br/>fecha_registro: 2024-03-26<br/>created_at: 2024-03-26 16:10:53<br/>updated_at: 2024-03-26 16:10:53<br/>', 'HISTORIAL DE PACIENTES', '2024-03-26', '16:54:13', '2024-03-26 20:54:13', '2024-03-26 20:54:13'),
(32, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN HISTORIAL DE PACIENTE', 'id: 1<br/>paciente_id: 1<br/>fecha_pc: 2022-01-01<br/>meses_dpc: 5<br/>mamografia_aa: SI<br/>biopsias_mp: NINGUNA<br/>hiperplasia_a: SI<br/>cancer_mp: NO<br/>lado_ta: NO CORRESPONDE<br/>cancer_olc: NO<br/>parientes_pgcm: NINGUNO<br/>otros_pccm: NINGUNO<br/>parientes_cco: SI<br/>parientes_ccc: SI<br/>parientes_cce: SI<br/>parientes_cotc: SI<br/>fecha_registro: 2024-03-26<br/>created_at: 2024-03-26 16:10:53<br/>updated_at: 2024-03-26 16:10:53<br/>', 'id: 1<br/>paciente_id: 1<br/>fecha_pc: 2022-01-01<br/>meses_dpc: 5<br/>mamografia_aa: NO<br/>biopsias_mp: NINGUNA<br/>hiperplasia_a: SI<br/>cancer_mp: NO<br/>lado_ta: NO CORRESPONDE<br/>cancer_olc: NO<br/>parientes_pgcm: NINGUNO<br/>otros_pccm: NINGUNO<br/>parientes_cco: SI<br/>parientes_ccc: SI<br/>parientes_cce: SI<br/>parientes_cotc: SI<br/>fecha_registro: 2024-03-26<br/>created_at: 2024-03-26 16:10:53<br/>updated_at: 2024-03-26 16:54:19<br/>', 'HISTORIAL DE PACIENTES', '2024-03-26', '16:54:19', '2024-03-26 20:54:19', '2024-03-26 20:54:19'),
(33, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PACIENTE', 'id: 2<br/>nombre: INGRID<br/>paterno: CARVAJAL<br/>materno: GONZALES<br/>ci: 23232<br/>ci_exp: LP<br/>fecha_nac: 2000-01-01<br/>sexo: MUJER<br/>estado_civil: SOLTERO<br/>ocupacion: OCUPACION #2<br/>correo: <br/>cel: 777777<br/>cel_familiar: 6666666<br/>dir_trabajo: <br/>dir_domicilio: <br/>foto: <br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 10:25:04<br/>updated_at: 2024-03-27 10:25:04<br/>', NULL, 'PACIENTES', '2024-03-27', '10:25:04', '2024-03-27 14:25:04', '2024-03-27 14:25:04'),
(34, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN DIAGNOSTICO POR IMAGEN', 'id: 1<br/>paciente_id: 1<br/>imagen1: <br/>imagen2: <br/>diagnostico: CANCER DE MAMA MALIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1<br/>fecha_diagnostico: 2024-03-27<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:14:14<br/>updated_at: 2024-03-27 13:14:14<br/>', NULL, 'DIAGNOSTICO POR IMAGENES', '2024-03-27', '13:14:14', '2024-03-27 17:14:14', '2024-03-27 17:14:14'),
(35, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DIAGNOSTICO POR IMAGEN', 'id: 1<br/>paciente_id: 1<br/>imagen1: <br/>imagen2: <br/>diagnostico: CANCER DE MAMA MALIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1<br/>fecha_diagnostico: 2024-03-27<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:14:14<br/>updated_at: 2024-03-27 13:14:14<br/>', 'id: 1<br/>paciente_id: 1<br/>imagen1: Diagnostico1_17115597481.jpg<br/>imagen2: Diagnostico1_17115597482.jpg<br/>diagnostico: CANCER DE MAMA MALIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1<br/>fecha_diagnostico: 2024-03-27<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:14:14<br/>updated_at: 2024-03-27 13:15:48<br/>', 'DIAGNOSTICO POR IMAGENES', '2024-03-27', '13:15:48', '2024-03-27 17:15:48', '2024-03-27 17:15:48'),
(36, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN DIAGNOSTICO POR IMAGEN', 'id: 1<br/>paciente_id: 1<br/>imagen1: Diagnostico1_17115597481.jpg<br/>imagen2: Diagnostico1_17115597482.jpg<br/>diagnostico: CANCER DE MAMA MALIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1<br/>fecha_diagnostico: 2024-03-27<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:14:14<br/>updated_at: 2024-03-27 13:15:48<br/>', NULL, 'DIAGNOSTICO POR IMAGENES', '2024-03-27', '13:16:30', '2024-03-27 17:16:30', '2024-03-27 17:16:30'),
(37, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN DIAGNOSTICO POR IMAGEN', 'id: 2<br/>paciente_id: 1<br/>imagen1: Diagnostico2_17115598111.jpg<br/>imagen2: Diagnostico2_17115598112.jpg<br/>diagnostico: CANCER DE MAMA MALIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1<br/>fecha_diagnostico: 2024-03-27<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:16:51<br/>updated_at: 2024-03-27 13:16:51<br/>', NULL, 'DIAGNOSTICO POR IMAGENES', '2024-03-27', '13:16:51', '2024-03-27 17:16:51', '2024-03-27 17:16:51'),
(38, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DIAGNOSTICO POR IMAGEN', 'id: 2<br/>paciente_id: 1<br/>imagen1: Diagnostico2_17115598111.jpg<br/>imagen2: Diagnostico2_17115598112.jpg<br/>diagnostico: CANCER DE MAMA MALIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1<br/>fecha_diagnostico: 2024-03-27<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:16:51<br/>updated_at: 2024-03-27 13:16:51<br/>', 'id: 2<br/>paciente_id: 1<br/>imagen1: Diagnostico2_17115598781.jpg<br/>imagen2: Diagnostico2_17115598782.jpg<br/>diagnostico: CANCER DE MAMA MALIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1<br/>fecha_diagnostico: 2024-03-27<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:16:51<br/>updated_at: 2024-03-27 13:17:58<br/>', 'DIAGNOSTICO POR IMAGENES', '2024-03-27', '13:17:58', '2024-03-27 17:17:58', '2024-03-27 17:17:58'),
(39, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN DIAGNOSTICO POR IMAGEN', 'id: 2<br/>paciente_id: 1<br/>imagen1: Diagnostico2_17115598781.jpg<br/>imagen2: Diagnostico2_17115598782.jpg<br/>diagnostico: CANCER DE MAMA MALIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1<br/>fecha_diagnostico: 2024-03-27<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:16:51<br/>updated_at: 2024-03-27 13:17:58<br/>', NULL, 'DIAGNOSTICO POR IMAGENES', '2024-03-27', '13:18:02', '2024-03-27 17:18:02', '2024-03-27 17:18:02'),
(40, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN DIAGNOSTICO POR IMAGEN', 'id: 3<br/>paciente_id: 1<br/>imagen1: Diagnostico3_17115599381.jpg<br/>imagen2: Diagnostico3_17115599382.jpg<br/>diagnostico: CANCER DE MAMA BENIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1<br/>fecha_diagnostico: 2024-03-27<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:18:58<br/>updated_at: 2024-03-27 13:18:58<br/>', NULL, 'DIAGNOSTICO POR IMAGENES', '2024-03-27', '13:18:58', '2024-03-27 17:18:58', '2024-03-27 17:18:58'),
(41, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN DIAGNOSTICO POR IMAGEN', 'id: 3<br/>paciente_id: 1<br/>imagen1: Diagnostico3_17115599381.jpg<br/>imagen2: Diagnostico3_17115599382.jpg<br/>diagnostico: CANCER DE MAMA BENIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1<br/>fecha_diagnostico: 2024-03-27<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:18:58<br/>updated_at: 2024-03-27 13:18:58<br/>', NULL, 'DIAGNOSTICO POR IMAGENES', '2024-03-27', '13:19:04', '2024-03-27 17:19:04', '2024-03-27 17:19:04'),
(42, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN DIAGNOSTICO POR IMAGEN', 'id: 4<br/>paciente_id: 1<br/>imagen1: Diagnostico4_17115599741.jpg<br/>imagen2: Diagnostico4_17115599742.jpg<br/>diagnostico: CANCER DE MAMA MALIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1<br/>fecha_diagnostico: 2024-03-27<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:19:34<br/>updated_at: 2024-03-27 13:19:34<br/>', NULL, 'DIAGNOSTICO POR IMAGENES', '2024-03-27', '13:19:34', '2024-03-27 17:19:34', '2024-03-27 17:19:34'),
(43, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN DIAGNOSTICO POR IMAGEN', 'id: 4<br/>paciente_id: 1<br/>imagen1: Diagnostico4_17115599741.jpg<br/>imagen2: Diagnostico4_17115599742.jpg<br/>diagnostico: CANCER DE MAMA MALIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1<br/>fecha_diagnostico: 2024-03-27<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:19:34<br/>updated_at: 2024-03-27 13:19:34<br/>', NULL, 'DIAGNOSTICO POR IMAGENES', '2024-03-27', '13:19:39', '2024-03-27 17:19:39', '2024-03-27 17:19:39'),
(44, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN DIAGNOSTICO POR IMAGEN', 'id: 1<br/>paciente_id: 1<br/>imagen1: Diagnostico1_17115600081.jpg<br/>imagen2: Diagnostico1_17115600082.jpg<br/>diagnostico: CANCER DE MAMA BENIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1<br/>fecha_diagnostico: 2024-03-27<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:20:08<br/>updated_at: 2024-03-27 13:20:08<br/>', NULL, 'DIAGNOSTICO POR IMAGENES', '2024-03-27', '13:20:08', '2024-03-27 17:20:08', '2024-03-27 17:20:08'),
(45, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DIAGNOSTICO POR IMAGEN', 'id: 1<br/>paciente_id: 1<br/>imagen1: Diagnostico1_17115600081.jpg<br/>imagen2: Diagnostico1_17115600082.jpg<br/>diagnostico: CANCER DE MAMA BENIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1<br/>fecha_diagnostico: 2024-03-27<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:20:08<br/>updated_at: 2024-03-27 13:20:08<br/>', 'id: 1<br/>paciente_id: 1<br/>imagen1: Diagnostico1_17115603491.jpg<br/>imagen2: Diagnostico1_17115603492.jpg<br/>diagnostico: CANCER DE MAMA BENIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1<br/>fecha_diagnostico: 2024-03-27<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:20:08<br/>updated_at: 2024-03-27 13:25:49<br/>', 'DIAGNOSTICO POR IMAGENES', '2024-03-27', '13:25:49', '2024-03-27 17:25:49', '2024-03-27 17:25:49'),
(46, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ENTRENAMIENTO DE IMAGEN', 'id: 2<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:28:55<br/>updated_at: 2024-03-27 16:28:55<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:28:55', '2024-03-27 20:28:55', '2024-03-27 20:28:55'),
(47, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 2<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:28:55<br/>updated_at: 2024-03-27 16:28:55<br/>', 'id: 2<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:28:55<br/>updated_at: 2024-03-27 16:28:55<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:40:09', '2024-03-27 20:40:09', '2024-03-27 20:40:09'),
(48, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 2<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:28:55<br/>updated_at: 2024-03-27 16:28:55<br/>', 'id: 2<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:28:55<br/>updated_at: 2024-03-27 16:28:55<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:41:04', '2024-03-27 20:41:04', '2024-03-27 20:41:04'),
(49, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 2<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:28:55<br/>updated_at: 2024-03-27 16:28:55<br/>', 'id: 2<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:28:55<br/>updated_at: 2024-03-27 16:28:55<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:43:13', '2024-03-27 20:43:13', '2024-03-27 20:43:13'),
(50, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 2<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:28:55<br/>updated_at: 2024-03-27 16:28:55<br/>', 'id: 2<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:28:55<br/>updated_at: 2024-03-27 16:28:55<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:43:32', '2024-03-27 20:43:32', '2024-03-27 20:43:32'),
(51, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 2<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:28:55<br/>updated_at: 2024-03-27 16:28:55<br/>', 'id: 2<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:28:55<br/>updated_at: 2024-03-27 16:28:55<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:44:25', '2024-03-27 20:44:25', '2024-03-27 20:44:25'),
(52, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 2<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:28:55<br/>updated_at: 2024-03-27 16:28:55<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:45:13', '2024-03-27 20:45:13', '2024-03-27 20:45:13'),
(53, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ENTRENAMIENTO DE IMAGEN', 'id: 3<br/>tipo: CANCER DE MAMA BENIGNO<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:45:31<br/>updated_at: 2024-03-27 16:45:31<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:46:11', '2024-03-27 20:46:11', '2024-03-27 20:46:11'),
(54, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 3<br/>tipo: CANCER DE MAMA BENIGNO<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:45:31<br/>updated_at: 2024-03-27 16:45:31<br/>', 'id: 3<br/>tipo: CANCER DE MAMA BENIGNO<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:45:31<br/>updated_at: 2024-03-27 16:45:31<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:47:20', '2024-03-27 20:47:20', '2024-03-27 20:47:20'),
(55, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 3<br/>tipo: CANCER DE MAMA BENIGNO<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:45:31<br/>updated_at: 2024-03-27 16:45:31<br/>', 'id: 3<br/>tipo: CANCER DE MAMA BENIGNO<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:45:31<br/>updated_at: 2024-03-27 16:45:31<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:47:57', '2024-03-27 20:47:57', '2024-03-27 20:47:57'),
(56, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 3<br/>tipo: CANCER DE MAMA BENIGNO<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:45:31<br/>updated_at: 2024-03-27 16:45:31<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:48:25', '2024-03-27 20:48:25', '2024-03-27 20:48:25'),
(57, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ENTRENAMIENTO DE IMAGEN', 'id: 4<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:48:45<br/>updated_at: 2024-03-27 16:48:45<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:48:59', '2024-03-27 20:48:59', '2024-03-27 20:48:59'),
(58, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 4<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:48:45<br/>updated_at: 2024-03-27 16:48:45<br/>', 'id: 4<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:48:45<br/>updated_at: 2024-03-27 16:48:45<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:49:21', '2024-03-27 20:49:21', '2024-03-27 20:49:21'),
(59, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 4<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:48:45<br/>updated_at: 2024-03-27 16:48:45<br/>', 'id: 4<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:48:45<br/>updated_at: 2024-03-27 16:48:45<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:51:00', '2024-03-27 20:51:00', '2024-03-27 20:51:00'),
(60, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 4<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:48:45<br/>updated_at: 2024-03-27 16:48:45<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:51:25', '2024-03-27 20:51:25', '2024-03-27 20:51:25'),
(61, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ENTRENAMIENTO DE IMAGEN', 'id: 5<br/>tipo: CANCER DE MAMA BENIGNO<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:51:35<br/>updated_at: 2024-03-27 16:51:35<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:51:43', '2024-03-27 20:51:43', '2024-03-27 20:51:43'),
(62, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 5<br/>tipo: CANCER DE MAMA BENIGNO<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:51:35<br/>updated_at: 2024-03-27 16:51:35<br/>', 'id: 5<br/>tipo: CANCER DE MAMA BENIGNO<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:51:35<br/>updated_at: 2024-03-27 16:51:35<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:51:55', '2024-03-27 20:51:55', '2024-03-27 20:51:55'),
(63, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 5<br/>tipo: CANCER DE MAMA BENIGNO<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:51:35<br/>updated_at: 2024-03-27 16:51:35<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:52:00', '2024-03-27 20:52:00', '2024-03-27 20:52:00'),
(64, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ENTRENAMIENTO DE IMAGEN', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:53:20', '2024-03-27 20:53:20', '2024-03-27 20:53:20'),
(65, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:55:30', '2024-03-27 20:55:30', '2024-03-27 20:55:30'),
(66, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:56:52', '2024-03-27 20:56:52', '2024-03-27 20:56:52'),
(67, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-03-27', '16:57:53', '2024-03-27 20:57:53', '2024-03-27 20:57:53'),
(68, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN HISTORIAL DE PACIENTE', 'id: 1<br/>paciente_id: 1<br/>fecha_pc: 2022-01-01<br/>meses_dpc: 5<br/>mamografia_aa: NO<br/>biopsias_mp: NINGUNA<br/>hiperplasia_a: SI<br/>cancer_mp: NO<br/>lado_ta: NO CORRESPONDE<br/>cancer_olc: NO<br/>parientes_pgcm: NINGUNO<br/>otros_pccm: NINGUNO<br/>parientes_cco: SI<br/>parientes_ccc: SI<br/>parientes_cce: SI<br/>parientes_cotc: SI<br/>fecha_registro: 2024-03-26<br/>created_at: 2024-03-26 16:10:53<br/>updated_at: 2024-03-26 16:54:19<br/>', 'id: 1<br/>paciente_id: 1<br/>fecha_pc: 2022-01-01<br/>meses_dpc: 5<br/>mamografia_aa: NO<br/>biopsias_mp: NINGUNA<br/>hiperplasia_a: SI<br/>cancer_mp: NO<br/>lado_ta: NO CORRESPONDE<br/>cancer_olc: NO<br/>parientes_pgcm: NINGUNO<br/>otros_pccm: NINGUNO<br/>parientes_cco: SI<br/>parientes_ccc: SI<br/>parientes_cce: SI<br/>parientes_cotc: SI<br/>fecha_registro: 2024-03-26<br/>created_at: 2024-03-26 16:10:53<br/>updated_at: 2024-03-26 16:54:19<br/>', 'HISTORIAL DE PACIENTES', '2024-03-27', '16:58:50', '2024-03-27 20:58:50', '2024-03-27 20:58:50'),
(69, 1, 'CREACIÓN', 'EL DOCTOR admin REGISTRO UN DOCTOR', 'id: 1<br/>user_id: 3<br/>fecha_nac: 1995-01-01<br/>estado_civil: SOLTERO<br/>sexo: HOMBRE<br/>especialidad: <br/>fono2: <br/>created_at: 2024-03-27 16:59:28<br/>updated_at: 2024-03-27 16:59:28<br/>', NULL, 'DOCTORES', '2024-03-27', '16:59:28', '2024-03-27 20:59:28', '2024-03-27 20:59:28'),
(70, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN LA CONTRASEÑA DE UN USUARIO', 'id: 3<br/>usuario: CMARTINEZ<br/>password: $2y$12$n8lsWC.3qH/Qd5W.vkPgReH5qEHjYbn093RY5p0pLATAuK7HkMSwu<br/>nombre: CARLOS<br/>paterno: MARTINEZ<br/>materno: MAMANI<br/>ci: 2222<br/>ci_exp: LP<br/>dir: <br/>email: <br/>fono: 777777<br/>tipo: DOCTOR<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-03-27 00:00:00<br/>created_at: 2024-03-27 16:59:28<br/>updated_at: 2024-03-27 16:59:28<br/>', 'id: 3<br/>usuario: CMARTINEZ<br/>password: $2y$12$.pyrJ8pQnQm9MqQa56Gyk.XBe8ud/5y1RhXm.J3ioUvAXw8S8z4pG<br/>nombre: CARLOS<br/>paterno: MARTINEZ<br/>materno: MAMANI<br/>ci: 2222<br/>ci_exp: LP<br/>dir: <br/>email: <br/>fono: 777777<br/>tipo: DOCTOR<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-03-27 00:00:00<br/>created_at: 2024-03-27 16:59:28<br/>updated_at: 2024-03-27 17:06:59<br/>', 'USUARIOS', '2024-03-27', '17:06:59', '2024-03-27 21:06:59', '2024-03-27 21:06:59'),
(71, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN LA CONTRASEÑA DE UN USUARIO', 'id: 3<br/>usuario: CMARTINEZ<br/>password: $2y$12$.pyrJ8pQnQm9MqQa56Gyk.XBe8ud/5y1RhXm.J3ioUvAXw8S8z4pG<br/>nombre: CARLOS<br/>paterno: MARTINEZ<br/>materno: MAMANI<br/>ci: 2222<br/>ci_exp: LP<br/>dir: <br/>email: <br/>fono: 777777<br/>tipo: DOCTOR<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-03-27 00:00:00<br/>created_at: 2024-03-27 16:59:28<br/>updated_at: 2024-03-27 17:06:59<br/>', 'id: 3<br/>usuario: CMARTINEZ<br/>password: $2y$12$C43xtaG39rlEPVUis9r20.N4zw6ruDp.9CXF4CLowRpTn5gAZCBvW<br/>nombre: CARLOS<br/>paterno: MARTINEZ<br/>materno: MAMANI<br/>ci: 2222<br/>ci_exp: LP<br/>dir: <br/>email: <br/>fono: 777777<br/>tipo: DOCTOR<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-03-27 00:00:00<br/>created_at: 2024-03-27 16:59:28<br/>updated_at: 2024-03-27 17:07:47<br/>', 'USUARIOS', '2024-03-27', '17:07:47', '2024-03-27 21:07:47', '2024-03-27 21:07:47'),
(72, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN LA CONTRASEÑA DE UN USUARIO', 'id: 3<br/>usuario: CMARTINEZ<br/>password: $2y$12$C43xtaG39rlEPVUis9r20.N4zw6ruDp.9CXF4CLowRpTn5gAZCBvW<br/>nombre: CARLOS<br/>paterno: MARTINEZ<br/>materno: MAMANI<br/>ci: 2222<br/>ci_exp: LP<br/>dir: <br/>email: <br/>fono: 777777<br/>tipo: DOCTOR<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-03-27 00:00:00<br/>created_at: 2024-03-27 16:59:28<br/>updated_at: 2024-03-27 17:07:47<br/>', 'id: 3<br/>usuario: CMARTINEZ<br/>password: $2y$12$R/XCXTeKaRLFBWP0c15EQ.c0tu7y7wVTOkN9ZGJh.9r.xu3XnSNgi<br/>nombre: CARLOS<br/>paterno: MARTINEZ<br/>materno: MAMANI<br/>ci: 2222<br/>ci_exp: LP<br/>dir: <br/>email: <br/>fono: 777777<br/>tipo: DOCTOR<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-03-27 00:00:00<br/>created_at: 2024-03-27 16:59:28<br/>updated_at: 2024-03-27 17:09:24<br/>', 'USUARIOS', '2024-03-27', '17:09:24', '2024-03-27 21:09:24', '2024-03-27 21:09:24'),
(73, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN LA CONTRASEÑA DE UN USUARIO', 'id: 3<br/>usuario: CMARTINEZ<br/>password: $2y$12$R/XCXTeKaRLFBWP0c15EQ.c0tu7y7wVTOkN9ZGJh.9r.xu3XnSNgi<br/>nombre: CARLOS<br/>paterno: MARTINEZ<br/>materno: MAMANI<br/>ci: 2222<br/>ci_exp: LP<br/>dir: <br/>email: <br/>fono: 777777<br/>tipo: DOCTOR<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-03-27 00:00:00<br/>created_at: 2024-03-27 16:59:28<br/>updated_at: 2024-03-27 17:09:24<br/>', 'id: 3<br/>usuario: CMARTINEZ<br/>password: $2y$12$L5dA8WpwrPZOxkkxdL33k.m9gDO5aZQr1tzuRmqXA7/9HIqi84PTC<br/>nombre: CARLOS<br/>paterno: MARTINEZ<br/>materno: MAMANI<br/>ci: 2222<br/>ci_exp: LP<br/>dir: <br/>email: <br/>fono: 777777<br/>tipo: DOCTOR<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-03-27 00:00:00<br/>created_at: 2024-03-27 16:59:28<br/>updated_at: 2024-03-27 17:09:28<br/>', 'USUARIOS', '2024-03-27', '17:09:28', '2024-03-27 21:09:28', '2024-03-27 21:09:28'),
(74, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN PACIENTE', 'id: 1<br/>nombre: MARIA<br/>paterno: MAMANI<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>fecha_nac: 2000-01-01<br/>sexo: MUJER<br/>estado_civil: CASADO<br/>ocupacion: OCUPACION #1<br/>correo: <br/>cel: 7777777<br/>cel_familiar: 66666666<br/>dir_trabajo: <br/>dir_domicilio: <br/>foto: 1711125343_.png<br/>fecha_registro: 2024-03-22<br/>created_at: 2024-03-22 12:35:43<br/>updated_at: 2024-03-22 12:35:43<br/>', 'id: 1<br/>nombre: MARIA<br/>paterno: MAMANI<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>fecha_nac: 2000-01-01<br/>sexo: MUJER<br/>estado_civil: CASADO<br/>ocupacion: OCUPACION #1<br/>correo: MARIA@GMAIL.COM<br/>cel: 7777777<br/>cel_familiar: 66666666<br/>dir_trabajo: DIR TRABAJO<br/>dir_domicilio: DIR DOMICILIO<br/>foto: 1711125343_.png<br/>fecha_registro: 2024-03-22<br/>created_at: 2024-03-22 12:35:43<br/>updated_at: 2024-03-27 18:18:39<br/>', 'PACIENTES', '2024-03-27', '18:18:39', '2024-03-27 22:18:39', '2024-03-27 22:18:39'),
(75, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '14:08:09', '2024-04-01 18:08:09', '2024-04-01 18:08:09'),
(76, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '14:08:59', '2024-04-01 18:08:59', '2024-04-01 18:08:59'),
(77, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '14:10:14', '2024-04-01 18:10:14', '2024-04-01 18:10:14'),
(78, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ENTRENAMIENTO DE IMAGEN', 'id: 2<br/>tipo: CANCER DE MAMA BENIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 14:10:45<br/>updated_at: 2024-04-01 14:10:45<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '14:11:07', '2024-04-01 18:11:07', '2024-04-01 18:11:07'),
(79, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ENTRENAMIENTO DE IMAGEN', 'id: 3<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 14:12:35<br/>updated_at: 2024-04-01 14:12:35<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '14:12:55', '2024-04-01 18:12:55', '2024-04-01 18:12:55'),
(80, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 3<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 14:12:35<br/>updated_at: 2024-04-01 14:12:35<br/>', 'id: 3<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 14:12:35<br/>updated_at: 2024-04-01 14:12:35<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '14:17:43', '2024-04-01 18:17:43', '2024-04-01 18:17:43');
INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(81, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 3<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 14:12:35<br/>updated_at: 2024-04-01 14:12:35<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '14:18:10', '2024-04-01 18:18:10', '2024-04-01 18:18:10'),
(82, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ENTRENAMIENTO DE IMAGEN', 'id: 4<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 14:18:31<br/>updated_at: 2024-04-01 14:18:31<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '14:18:50', '2024-04-01 18:18:50', '2024-04-01 18:18:50'),
(83, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 4<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 14:18:31<br/>updated_at: 2024-04-01 14:18:31<br/>', 'id: 4<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 14:18:31<br/>updated_at: 2024-04-01 14:18:31<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '14:22:22', '2024-04-01 18:22:22', '2024-04-01 18:22:22'),
(84, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 4<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 14:18:31<br/>updated_at: 2024-04-01 14:18:31<br/>', 'id: 4<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 14:18:31<br/>updated_at: 2024-04-01 14:18:31<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '14:25:52', '2024-04-01 18:25:52', '2024-04-01 18:25:52'),
(85, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 4<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 14:18:31<br/>updated_at: 2024-04-01 14:18:31<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '14:41:25', '2024-04-01 18:41:25', '2024-04-01 18:41:25'),
(86, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ENTRENAMIENTO DE IMAGEN', 'id: 5<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 14:41:45<br/>updated_at: 2024-04-01 14:41:45<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '14:42:05', '2024-04-01 18:42:05', '2024-04-01 18:42:05'),
(87, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 5<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 14:41:45<br/>updated_at: 2024-04-01 14:41:45<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '14:43:39', '2024-04-01 18:43:39', '2024-04-01 18:43:39'),
(88, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ENTRENAMIENTO DE IMAGEN', 'id: 6<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 14:43:54<br/>updated_at: 2024-04-01 14:43:54<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '14:44:14', '2024-04-01 18:44:14', '2024-04-01 18:44:14'),
(89, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 6<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 14:43:54<br/>updated_at: 2024-04-01 14:43:54<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '14:46:36', '2024-04-01 18:46:36', '2024-04-01 18:46:36'),
(90, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ENTRENAMIENTO DE IMAGEN', 'id: 7<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 14:47:16<br/>updated_at: 2024-04-01 14:47:16<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '14:47:39', '2024-04-01 18:47:39', '2024-04-01 18:47:39'),
(91, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 7<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 14:47:16<br/>updated_at: 2024-04-01 14:47:16<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '14:48:22', '2024-04-01 18:48:22', '2024-04-01 18:48:22'),
(92, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ENTRENAMIENTO DE IMAGEN', 'id: 8<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 14:48:44<br/>updated_at: 2024-04-01 14:48:44<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '14:49:05', '2024-04-01 18:49:05', '2024-04-01 18:49:05'),
(93, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 8<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 14:48:44<br/>updated_at: 2024-04-01 14:48:44<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '14:49:17', '2024-04-01 18:49:17', '2024-04-01 18:49:17'),
(94, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ENTRENAMIENTO DE IMAGEN', 'id: 9<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 15:45:39<br/>updated_at: 2024-04-01 15:45:39<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '15:45:57', '2024-04-01 19:45:57', '2024-04-01 19:45:57'),
(95, 1, 'MODIFICACIÓN', 'EL DOCTOR admin MODIFICÓ UN DOCTOR', 'id: 1<br/>user_id: 3<br/>fecha_nac: 1995-01-01<br/>estado_civil: SOLTERO<br/>sexo: HOMBRE<br/>especialidad: <br/>fono2: <br/>created_at: 2024-03-27 16:59:28<br/>updated_at: 2024-03-27 16:59:28<br/>', 'id: 1<br/>user_id: 3<br/>fecha_nac: 1995-01-01<br/>estado_civil: SOLTERO<br/>sexo: HOMBRE<br/>especialidad: <br/>fono2: <br/>created_at: 2024-03-27 16:59:28<br/>updated_at: 2024-03-27 16:59:28<br/>', 'DOCTORES', '2024-04-01', '15:49:41', '2024-04-01 19:49:41', '2024-04-01 19:49:41'),
(96, 1, 'MODIFICACIÓN', 'EL DOCTOR admin MODIFICÓ UN DOCTOR', 'id: 1<br/>user_id: 3<br/>fecha_nac: 1995-01-01<br/>estado_civil: SOLTERO<br/>sexo: HOMBRE<br/>especialidad: <br/>fono2: <br/>created_at: 2024-03-27 16:59:28<br/>updated_at: 2024-03-27 16:59:28<br/>', 'id: 1<br/>user_id: 3<br/>fecha_nac: 1995-01-01<br/>estado_civil: SOLTERO<br/>sexo: HOMBRE<br/>especialidad: <br/>fono2: <br/>created_at: 2024-03-27 16:59:28<br/>updated_at: 2024-03-27 16:59:28<br/>', 'DOCTORES', '2024-04-01', '15:49:46', '2024-04-01 19:49:46', '2024-04-01 19:49:46'),
(97, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN HISTORIAL DE PACIENTE', 'id: 1<br/>paciente_id: 1<br/>fecha_pc: 2022-01-01<br/>meses_dpc: 5<br/>mamografia_aa: NO<br/>biopsias_mp: NINGUNA<br/>hiperplasia_a: SI<br/>cancer_mp: NO<br/>lado_ta: NO CORRESPONDE<br/>cancer_olc: NO<br/>parientes_pgcm: NINGUNO<br/>otros_pccm: NINGUNO<br/>parientes_cco: SI<br/>parientes_ccc: SI<br/>parientes_cce: SI<br/>parientes_cotc: SI<br/>fecha_registro: 2024-03-26<br/>created_at: 2024-03-26 16:10:53<br/>updated_at: 2024-03-26 16:54:19<br/>', 'id: 1<br/>paciente_id: 1<br/>fecha_pc: 2022-01-01<br/>meses_dpc: 5<br/>mamografia_aa: NO<br/>biopsias_mp: NINGUNA<br/>hiperplasia_a: SI<br/>cancer_mp: NO<br/>lado_ta: NO CORRESPONDE<br/>cancer_olc: NO<br/>parientes_pgcm: NINGUNO<br/>otros_pccm: NINGUNO<br/>parientes_cco: SI<br/>parientes_ccc: SI<br/>parientes_cce: SI<br/>parientes_cotc: SI<br/>fecha_registro: 2024-03-26<br/>created_at: 2024-03-26 16:10:53<br/>updated_at: 2024-03-26 16:54:19<br/>', 'HISTORIAL DE PACIENTES', '2024-04-01', '15:51:06', '2024-04-01 19:51:06', '2024-04-01 19:51:06'),
(98, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DIAGNOSTICO POR IMAGEN', 'id: 1<br/>paciente_id: 1<br/>imagen1: Diagnostico1_17115603491.jpg<br/>imagen2: Diagnostico1_17115603492.jpg<br/>diagnostico: CANCER DE MAMA BENIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1<br/>fecha_diagnostico: 2024-03-27<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:20:08<br/>updated_at: 2024-03-27 13:25:49<br/>', 'id: 1<br/>paciente_id: 1<br/>imagen1: Diagnostico1_17115603491.jpg<br/>imagen2: Diagnostico1_17115603492.jpg<br/>diagnostico: CANCER DE MAMA BENIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1<br/>fecha_diagnostico: 2024-04-01<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:20:08<br/>updated_at: 2024-04-01 15:52:10<br/>', 'DIAGNOSTICO POR IMAGENES', '2024-04-01', '15:52:10', '2024-04-01 19:52:10', '2024-04-01 19:52:10'),
(99, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DIAGNOSTICO POR IMAGEN', 'id: 1<br/>paciente_id: 1<br/>imagen1: Diagnostico1_17115603491.jpg<br/>imagen2: Diagnostico1_17115603492.jpg<br/>diagnostico: CANCER DE MAMA BENIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1<br/>fecha_diagnostico: 2024-04-01<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:20:08<br/>updated_at: 2024-04-01 15:52:10<br/>', 'id: 1<br/>paciente_id: 1<br/>imagen1: Diagnostico1_17115603491.jpg<br/>imagen2: Diagnostico1_17115603492.jpg<br/>diagnostico: CANCER DE MAMA BENIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1S<br/>fecha_diagnostico: 2024-04-01<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:20:08<br/>updated_at: 2024-04-01 15:52:50<br/>', 'DIAGNOSTICO POR IMAGENES', '2024-04-01', '15:52:50', '2024-04-01 19:52:50', '2024-04-01 19:52:50'),
(100, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DIAGNOSTICO POR IMAGEN', 'id: 1<br/>paciente_id: 1<br/>imagen1: Diagnostico1_17115603491.jpg<br/>imagen2: Diagnostico1_17115603492.jpg<br/>diagnostico: CANCER DE MAMA BENIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1S<br/>fecha_diagnostico: 2024-04-01<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:20:08<br/>updated_at: 2024-04-01 15:52:50<br/>', 'id: 1<br/>paciente_id: 1<br/>imagen1: Diagnostico1_17115603491.jpg<br/>imagen2: Diagnostico1_17115603492.jpg<br/>diagnostico: CANCER DE MAMA BENIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1<br/>fecha_diagnostico: 2024-04-01<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:20:08<br/>updated_at: 2024-04-01 15:52:56<br/>', 'DIAGNOSTICO POR IMAGENES', '2024-04-01', '15:52:56', '2024-04-01 19:52:56', '2024-04-01 19:52:56'),
(101, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DIAGNOSTICO POR IMAGEN', 'id: 1<br/>paciente_id: 1<br/>imagen1: Diagnostico1_17115603491.jpg<br/>imagen2: Diagnostico1_17115603492.jpg<br/>diagnostico: CANCER DE MAMA BENIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1<br/>fecha_diagnostico: 2024-04-01<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:20:08<br/>updated_at: 2024-04-01 15:52:56<br/>', 'id: 1<br/>paciente_id: 1<br/>imagen1: Diagnostico1_17115603491.jpg<br/>imagen2: Diagnostico1_17115603492.jpg<br/>diagnostico: CANCER DE MAMA BENIGNO<br/>descripcion: DESCRIPCION DIAGNOSTICO #1<br/>fecha_diagnostico: 2024-04-01<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 13:20:08<br/>updated_at: 2024-04-01 15:52:56<br/>', 'DIAGNOSTICO POR IMAGENES', '2024-04-01', '15:53:02', '2024-04-01 19:53:02', '2024-04-01 19:53:02'),
(102, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 2<br/>tipo: CANCER DE MAMA BENIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 14:10:45<br/>updated_at: 2024-04-01 14:10:45<br/>', 'id: 2<br/>tipo: CANCER DE MAMA BENIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 14:10:45<br/>updated_at: 2024-04-01 14:10:45<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '15:53:26', '2024-04-01 19:53:26', '2024-04-01 19:53:26'),
(103, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '15:53:58', '2024-04-01 19:53:58', '2024-04-01 19:53:58'),
(104, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '15:54:30', '2024-04-01 19:54:30', '2024-04-01 19:54:30'),
(105, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '15:55:03', '2024-04-01 19:55:03', '2024-04-01 19:55:03'),
(106, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '15:56:03', '2024-04-01 19:56:03', '2024-04-01 19:56:03'),
(107, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '15:56:58', '2024-04-01 19:56:58', '2024-04-01 19:56:58'),
(108, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '15:58:09', '2024-04-01 19:58:09', '2024-04-01 19:58:09'),
(109, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 9<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 15:45:39<br/>updated_at: 2024-04-01 15:45:39<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '15:58:43', '2024-04-01 19:58:43', '2024-04-01 19:58:43'),
(110, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN ENTRENAMIENTO DE IMAGEN', 'id: 3<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 15:59:39<br/>updated_at: 2024-04-01 15:59:39<br/>', NULL, 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '15:59:58', '2024-04-01 19:59:58', '2024-04-01 19:59:58'),
(111, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '16:01:02', '2024-04-01 20:01:02', '2024-04-01 20:01:02'),
(112, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'id: 1<br/>tipo: NO TIENE CANCER<br/>fecha_registro: 2024-03-27<br/>created_at: 2024-03-27 16:52:39<br/>updated_at: 2024-03-27 16:52:39<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '16:07:00', '2024-04-01 20:07:00', '2024-04-01 20:07:00'),
(113, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 3<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 15:59:39<br/>updated_at: 2024-04-01 15:59:39<br/>', 'id: 3<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 15:59:39<br/>updated_at: 2024-04-01 15:59:39<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '16:08:51', '2024-04-01 20:08:51', '2024-04-01 20:08:51'),
(114, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 3<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 15:59:39<br/>updated_at: 2024-04-01 15:59:39<br/>', 'id: 3<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 15:59:39<br/>updated_at: 2024-04-01 15:59:39<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '16:22:24', '2024-04-01 20:22:24', '2024-04-01 20:22:24'),
(115, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 3<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 15:59:39<br/>updated_at: 2024-04-01 15:59:39<br/>', 'id: 3<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 15:59:39<br/>updated_at: 2024-04-01 15:59:39<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '16:23:49', '2024-04-01 20:23:49', '2024-04-01 20:23:49'),
(116, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN ENTRENAMIENTO DE IMAGEN', 'id: 3<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 15:59:39<br/>updated_at: 2024-04-01 15:59:39<br/>', 'id: 3<br/>tipo: CANCER DE MAMA MALIGNO<br/>fecha_registro: 2024-04-01<br/>created_at: 2024-04-01 15:59:39<br/>updated_at: 2024-04-01 15:59:39<br/>', 'ENTRENAMIENTO DE IMAGENES', '2024-04-01', '16:24:34', '2024-04-01 20:24:34', '2024-04-01 20:24:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_archivos`
--

CREATE TABLE `historial_archivos` (
  `id` bigint UNSIGNED NOT NULL,
  `historial_paciente_id` bigint UNSIGNED NOT NULL,
  `archivo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_archivos`
--

INSERT INTO `historial_archivos` (`id`, `historial_paciente_id`, `archivo`, `created_at`, `updated_at`) VALUES
(1, 1, 'Estudio1_17115731300.pdf', '2024-03-27 20:58:50', '2024-03-27 20:58:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_pacientes`
--

CREATE TABLE `historial_pacientes` (
  `id` bigint UNSIGNED NOT NULL,
  `paciente_id` bigint UNSIGNED NOT NULL,
  `fecha_pc` date NOT NULL,
  `meses_dpc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mamografia_aa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `biopsias_mp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hiperplasia_a` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cancer_mp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lado_ta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cancer_olc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parientes_pgcm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otros_pccm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parientes_cco` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parientes_ccc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parientes_cce` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parientes_cotc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_pacientes`
--

INSERT INTO `historial_pacientes` (`id`, `paciente_id`, `fecha_pc`, `meses_dpc`, `mamografia_aa`, `biopsias_mp`, `hiperplasia_a`, `cancer_mp`, `lado_ta`, `cancer_olc`, `parientes_pgcm`, `otros_pccm`, `parientes_cco`, `parientes_ccc`, `parientes_cce`, `parientes_cotc`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-01-01', '5', 'NO', 'NINGUNA', 'SI', 'NO', 'NO CORRESPONDE', 'NO', 'NINGUNO', 'NINGUNO', 'SI', 'SI', 'SI', 'SI', '2024-03-26', '2024-03-26 20:10:53', '2024-03-26 20:54:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucions`
--

CREATE TABLE `institucions` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre_sistema` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razon_social` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actividad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `institucions`
--

INSERT INTO `institucions` (`id`, `nombre_sistema`, `alias`, `razon_social`, `nit`, `ciudad`, `dir`, `fono`, `correo`, `web`, `actividad`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'SISCANCER', 'SC', 'SISCANCER S.A.', '11111111', 'LA PAZ', 'LOS OLIVOS', '7777777', 'SISCANCER@GMAIL.COM', 'SISCANCER.COM', 'ACTIVIDAD', 'logo.webp', NULL, '2024-03-09 16:40:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2024_01_31_165641_create_institucions_table', 1),
(4, '2024_02_02_205431_create_historial_accions_table', 1),
(5, '2024_03_16_110650_create_doctors_table', 2),
(6, '2024_03_16_110730_create_pacientes_table', 2),
(7, '2024_03_16_110756_create_historial_pacientes_table', 2),
(8, '2024_03_16_111815_create_diagnosticos_table', 2),
(9, '2024_03_16_111844_create_entrenamientos_table', 2),
(10, '2024_03_16_111846_create_entrenamiento_imagens_table', 2),
(11, '2024_03_16_113224_create_historial_archivos_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `materno` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci_exp` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nac` date NOT NULL,
  `sexo` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_civil` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ocupacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cel_familiar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir_trabajo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir_domicilio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `nombre`, `paterno`, `materno`, `ci`, `ci_exp`, `fecha_nac`, `sexo`, `estado_civil`, `ocupacion`, `correo`, `cel`, `cel_familiar`, `dir_trabajo`, `dir_domicilio`, `foto`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'MARIA', 'MAMANI', 'MAMANI', '1234', 'LP', '2000-01-01', 'MUJER', 'CASADO', 'OCUPACION #1', 'MARIA@GMAIL.COM', '7777777', '66666666', 'DIR TRABAJO', 'DIR DOMICILIO', '1711125343_.png', '2024-03-22', '2024-03-22 16:35:43', '2024-03-27 22:18:39'),
(2, 'INGRID', 'CARVAJAL', 'GONZALES', '23232', 'LP', '2000-01-01', 'MUJER', 'SOLTERO', 'OCUPACION #2', '', '777777', '6666666', '', '', NULL, '2024-03-27', '2024-03-27 14:25:04', '2024-03-27 14:25:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `materno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci_exp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acceso` int NOT NULL DEFAULT '1',
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `password`, `nombre`, `paterno`, `materno`, `ci`, `ci_exp`, `dir`, `email`, `fono`, `tipo`, `foto`, `acceso`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$12$65d4fgZsvBV5Lc/AxNKh4eoUdbGyaczQ4sSco20feSQANshNLuxSC', 'admin', NULL, NULL, '0', '', '', 'admin@gmail.com', '', 'SUPER USUARIO', NULL, 1, '2024-01-31', NULL, '2024-02-02 18:13:58'),
(2, 'JPERES', '$2y$12$ymKPkYJyo6Trh513eKXW7uReuTy3ufzH6tUNE3n3IyUf3GvAcLoDm', 'JUAN', 'PERES', 'MAMANI', '1111', 'LP', 'LOS OLIVOS', '', '77777777', 'SUPER USUARIO', NULL, 1, '2024-03-16', '2024-03-16 15:02:24', '2024-03-16 15:03:21'),
(3, 'CMARTINEZ', '$2y$12$L5dA8WpwrPZOxkkxdL33k.m9gDO5aZQr1tzuRmqXA7/9HIqi84PTC', 'CARLOS', 'MARTINEZ', 'MAMANI', '2222', 'LP', '', '', '777777', 'DOCTOR', NULL, 1, '2024-03-27', '2024-03-27 20:59:28', '2024-03-27 21:09:28');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctors_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `entrenamientos`
--
ALTER TABLE `entrenamientos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `entrenamiento_imagens`
--
ALTER TABLE `entrenamiento_imagens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrenamiento_imagens_entrenamiento_id_foreign` (`entrenamiento_id`);

--
-- Indices de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historial_archivos`
--
ALTER TABLE `historial_archivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historial_archivos_historial_paciente_id_foreign` (`historial_paciente_id`);

--
-- Indices de la tabla `historial_pacientes`
--
ALTER TABLE `historial_pacientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historial_pacientes_paciente_id_foreign` (`paciente_id`);

--
-- Indices de la tabla `institucions`
--
ALTER TABLE `institucions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_usuario_unique` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `entrenamientos`
--
ALTER TABLE `entrenamientos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `entrenamiento_imagens`
--
ALTER TABLE `entrenamiento_imagens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT de la tabla `historial_archivos`
--
ALTER TABLE `historial_archivos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `historial_pacientes`
--
ALTER TABLE `historial_pacientes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `institucions`
--
ALTER TABLE `institucions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `entrenamiento_imagens`
--
ALTER TABLE `entrenamiento_imagens`
  ADD CONSTRAINT `entrenamiento_imagens_entrenamiento_id_foreign` FOREIGN KEY (`entrenamiento_id`) REFERENCES `entrenamientos` (`id`);

--
-- Filtros para la tabla `historial_archivos`
--
ALTER TABLE `historial_archivos`
  ADD CONSTRAINT `historial_archivos_historial_paciente_id_foreign` FOREIGN KEY (`historial_paciente_id`) REFERENCES `historial_pacientes` (`id`);

--
-- Filtros para la tabla `historial_pacientes`
--
ALTER TABLE `historial_pacientes`
  ADD CONSTRAINT `historial_pacientes_paciente_id_foreign` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
