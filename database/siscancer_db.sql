-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 16-03-2024 a las 15:56:47
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
  `imagen1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diagnostico` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_diagnostico` date NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(5, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN LA CONTRASEÑA DE UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$JHUjQNYWEx4Z3vdO.IXQruZoZdrbQnZwW3P0Ewy76C2KjQRWv4qYK<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 77777777<br/>tipo: SUPER USUARIO<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-03-16 00:00:00<br/>created_at: 2024-03-16 11:02:24<br/>updated_at: 2024-03-16 11:03:06<br/>', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$ymKPkYJyo6Trh513eKXW7uReuTy3ufzH6tUNE3n3IyUf3GvAcLoDm<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 77777777<br/>tipo: SUPER USUARIO<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-03-16 00:00:00<br/>created_at: 2024-03-16 11:02:24<br/>updated_at: 2024-03-16 11:03:21<br/>', 'USUARIOS', '2024-03-16', '11:03:21', '2024-03-16 15:03:21', '2024-03-16 15:03:21');

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
(1, 'SISCANCER', 'SC', 'SISCANCER S.A.', '11111111', 'LA PAZ', 'LOS OLIVOS', '7777777', 'SISCANCER@GMAIL.COM', 'SISCANCER.COM', 'ACTIVIDAD', 'logo.jpg', NULL, '2024-03-09 16:40:13');

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
(2, 'JPERES', '$2y$12$ymKPkYJyo6Trh513eKXW7uReuTy3ufzH6tUNE3n3IyUf3GvAcLoDm', 'JUAN', 'PERES', 'MAMANI', '1111', 'LP', 'LOS OLIVOS', '', '77777777', 'SUPER USUARIO', NULL, 1, '2024-03-16', '2024-03-16 15:02:24', '2024-03-16 15:03:21');

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entrenamientos`
--
ALTER TABLE `entrenamientos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entrenamiento_imagens`
--
ALTER TABLE `entrenamiento_imagens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `historial_archivos`
--
ALTER TABLE `historial_archivos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_pacientes`
--
ALTER TABLE `historial_pacientes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
