-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 27-03-2024 a las 23:07:39
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
(1, 1, 'Diagnostico1_17115603491.jpg', 'Diagnostico1_17115603492.jpg', 'CANCER DE MAMA BENIGNO', 'DESCRIPCION DIAGNOSTICO #1', '2024-03-27', '2024-03-27', '2024-03-27 17:20:08', '2024-03-27 17:25:49');

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
(1, 'NO TIENE CANCER', '2024-03-27', '2024-03-27 20:52:39', '2024-03-27 20:52:39');

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
(29, 1, 'imagen11711572979_28.jpg', '2024-03-27 20:56:19', '2024-03-27 20:56:19');

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
(74, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN PACIENTE', 'id: 1<br/>nombre: MARIA<br/>paterno: MAMANI<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>fecha_nac: 2000-01-01<br/>sexo: MUJER<br/>estado_civil: CASADO<br/>ocupacion: OCUPACION #1<br/>correo: <br/>cel: 7777777<br/>cel_familiar: 66666666<br/>dir_trabajo: <br/>dir_domicilio: <br/>foto: 1711125343_.png<br/>fecha_registro: 2024-03-22<br/>created_at: 2024-03-22 12:35:43<br/>updated_at: 2024-03-22 12:35:43<br/>', 'id: 1<br/>nombre: MARIA<br/>paterno: MAMANI<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>fecha_nac: 2000-01-01<br/>sexo: MUJER<br/>estado_civil: CASADO<br/>ocupacion: OCUPACION #1<br/>correo: MARIA@GMAIL.COM<br/>cel: 7777777<br/>cel_familiar: 66666666<br/>dir_trabajo: DIR TRABAJO<br/>dir_domicilio: DIR DOMICILIO<br/>foto: 1711125343_.png<br/>fecha_registro: 2024-03-22<br/>created_at: 2024-03-22 12:35:43<br/>updated_at: 2024-03-27 18:18:39<br/>', 'PACIENTES', '2024-03-27', '18:18:39', '2024-03-27 22:18:39', '2024-03-27 22:18:39');

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `entrenamiento_imagens`
--
ALTER TABLE `entrenamiento_imagens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

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
