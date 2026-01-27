-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-01-2026 a las 05:06:04
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nomina_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bonificaciones_nomina`
--

CREATE TABLE `bonificaciones_nomina` (
  `id` int(11) NOT NULL,
  `nomina_id` int(11) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `bonificaciones_nomina`
--

INSERT INTO `bonificaciones_nomina` (`id`, `nomina_id`, `tipo`, `monto`, `descripcion`, `fecha_creacion`, `activo`) VALUES
(1, 1, 'Bono productividad', 1000.00, 'Bono por productividad alta', '2025-11-11 19:17:42', 1),
(2, 2, 'Bono puntualidad', 1200.00, 'Bono por puntualidad', '2025-11-11 19:17:42', 1),
(3, 3, 'Bono desempeño', 2000.00, 'Bono por desempeño excepcional', '2025-11-11 19:17:42', 1),
(4, 4, 'Bono asistencia', 800.00, 'Bono por asistencia perfecta', '2025-11-11 19:17:42', 1),
(5, 5, 'Bono liderazgo', 500.00, 'Bono por liderazgo', '2025-11-11 19:17:42', 1),
(6, 6, 'Bono productividad', 600.00, 'Bono por productividad alta', '2025-11-11 19:17:42', 1),
(7, 7, 'Bono desempeño', 1500.00, 'Bono por desempeño', '2025-11-11 19:17:42', 1),
(8, 8, 'Bono asistencia', 400.00, 'Bono asistencia', '2025-11-11 19:17:42', 1),
(9, 9, 'Bono puntualidad', 700.00, 'Bono puntualidad', '2025-11-11 19:17:42', 1),
(10, 10, 'Bono productividad', 900.00, 'Bono productividad', '2025-11-11 19:17:42', 1),
(11, 11, 'Bono desempeño', 1000.00, 'Bono desempeño', '2025-11-11 19:17:42', 1),
(12, 12, 'Bono asistencia', 500.00, 'Bono asistencia', '2025-11-11 19:17:42', 1),
(13, 13, 'Bono puntualidad', 800.00, 'Bono puntualidad', '2025-11-11 19:17:42', 1),
(14, 14, 'Bono productividad', 700.00, 'Bono productividad', '2025-11-11 19:17:42', 1),
(15, 15, 'Bono desempeño', 600.00, 'Bono desempeño', '2025-11-11 19:17:42', 1),
(16, 16, 'Bono asistencia', 1000.00, 'Bono asistencia', '2025-11-11 19:17:42', 1),
(17, 17, 'Bono liderazgo', 1200.00, 'Bono liderazgo', '2025-11-11 19:17:42', 1),
(18, 18, 'Bono productividad', 700.00, 'Bono productividad', '2025-11-11 19:17:42', 1),
(19, 19, 'Bono desempeño', 1500.00, 'Bono desempeño', '2025-11-11 19:17:42', 1),
(20, 20, 'Bono puntualidad', 900.00, 'Bono puntualidad', '2025-11-11 19:17:42', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `checadas`
--

CREATE TABLE `checadas` (
  `id` int(11) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `tipo` enum('entrada','salida','entrada_comida','salida_definitiva') NOT NULL,
  `sucursal_id` int(11) DEFAULT NULL,
  `comentarios` text DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `checadas`
--

INSERT INTO `checadas` (`id`, `empleado_id`, `fecha`, `hora`, `tipo`, `sucursal_id`, `comentarios`, `fecha_creacion`) VALUES
(26, 3, '2025-11-03', '13:00:00', 'salida', NULL, NULL, '2025-11-11 19:26:05'),
(27, 3, '2025-11-03', '14:00:00', 'entrada_comida', NULL, NULL, '2025-11-11 19:26:05'),
(28, 3, '2025-11-03', '18:00:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:26:05'),
(29, 4, '2025-11-03', '08:15:00', 'entrada', NULL, NULL, '2025-11-11 19:26:05'),
(30, 4, '2025-11-03', '13:00:00', 'salida', NULL, NULL, '2025-11-11 19:26:05'),
(31, 4, '2025-11-03', '14:00:00', 'entrada_comida', NULL, NULL, '2025-11-11 19:26:05'),
(32, 4, '2025-11-03', '18:10:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:26:05'),
(33, 5, '2025-11-03', '08:00:00', 'entrada', NULL, NULL, '2025-11-11 19:26:05'),
(34, 5, '2025-11-03', '13:00:00', 'salida', NULL, NULL, '2025-11-11 19:26:05'),
(35, 5, '2025-11-03', '14:00:00', 'entrada_comida', NULL, NULL, '2025-11-11 19:26:05'),
(36, 5, '2025-11-03', '18:00:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:26:05'),
(37, 6, '2025-11-03', '08:05:00', 'entrada', NULL, NULL, '2025-11-11 19:26:05'),
(38, 6, '2025-11-03', '13:00:00', 'salida', NULL, NULL, '2025-11-11 19:26:05'),
(39, 6, '2025-11-03', '14:00:00', 'entrada_comida', NULL, NULL, '2025-11-11 19:26:05'),
(40, 6, '2025-11-03', '18:05:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:26:05'),
(41, 7, '2025-11-03', '08:00:00', 'entrada', NULL, NULL, '2025-11-11 19:26:05'),
(42, 7, '2025-11-03', '13:00:00', 'salida', NULL, NULL, '2025-11-11 19:26:05'),
(43, 7, '2025-11-03', '14:00:00', 'entrada_comida', NULL, NULL, '2025-11-11 19:26:05'),
(44, 7, '2025-11-03', '18:00:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:26:05'),
(45, 8, '2025-11-03', '08:00:00', 'entrada', NULL, NULL, '2025-11-11 19:26:05'),
(46, 8, '2025-11-03', '13:00:00', 'salida', NULL, NULL, '2025-11-11 19:26:05'),
(47, 8, '2025-11-03', '14:00:00', 'entrada_comida', NULL, NULL, '2025-11-11 19:26:05'),
(48, 8, '2025-11-03', '18:00:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:26:05'),
(49, 9, '2025-11-03', '08:00:00', 'entrada', NULL, NULL, '2025-11-11 19:26:05'),
(50, 9, '2025-11-03', '13:00:00', 'salida', NULL, NULL, '2025-11-11 19:26:05'),
(51, 9, '2025-11-03', '14:00:00', '', NULL, NULL, '2025-11-11 19:26:05'),
(52, 9, '2025-11-03', '18:00:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:26:05'),
(53, 10, '2025-11-03', '08:00:00', 'entrada', NULL, NULL, '2025-11-11 19:26:05'),
(54, 10, '2025-11-03', '13:00:00', 'salida', NULL, NULL, '2025-11-11 19:26:05'),
(55, 10, '2025-11-03', '14:00:00', '', NULL, NULL, '2025-11-11 19:26:05'),
(56, 10, '2025-11-03', '18:00:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:26:05'),
(57, 1, '2025-11-03', '08:00:00', 'entrada', NULL, NULL, '2025-11-11 19:55:49'),
(58, 1, '2025-11-03', '13:00:00', 'salida', NULL, NULL, '2025-11-11 19:55:49'),
(59, 1, '2025-11-03', '14:00:00', 'entrada_comida', NULL, NULL, '2025-11-11 19:55:49'),
(60, 1, '2025-11-03', '18:00:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:55:49'),
(61, 1, '2025-11-04', '08:05:00', 'entrada', NULL, NULL, '2025-11-11 19:55:49'),
(62, 1, '2025-11-04', '13:05:00', 'salida', NULL, NULL, '2025-11-11 19:55:49'),
(63, 1, '2025-11-04', '14:00:00', 'entrada_comida', NULL, NULL, '2025-11-11 19:55:49'),
(64, 1, '2025-11-04', '18:10:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:55:49'),
(65, 1, '2025-11-05', '08:00:00', 'entrada', NULL, NULL, '2025-11-11 19:55:49'),
(66, 1, '2025-11-05', '13:00:00', 'salida', NULL, NULL, '2025-11-11 19:55:49'),
(67, 1, '2025-11-05', '14:00:00', 'entrada_comida', NULL, NULL, '2025-11-11 19:55:49'),
(68, 1, '2025-11-05', '18:00:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:55:49'),
(69, 1, '2025-11-06', '08:00:00', 'entrada', NULL, NULL, '2025-11-11 19:55:49'),
(70, 1, '2025-11-06', '13:00:00', 'salida', NULL, NULL, '2025-11-11 19:55:49'),
(71, 1, '2025-11-06', '14:00:00', 'entrada_comida', NULL, NULL, '2025-11-11 19:55:49'),
(72, 1, '2025-11-06', '18:00:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:55:49'),
(73, 1, '2025-11-07', '08:00:00', 'entrada', NULL, NULL, '2025-11-11 19:55:49'),
(74, 1, '2025-11-07', '13:00:00', 'salida', NULL, NULL, '2025-11-11 19:55:49'),
(75, 1, '2025-11-07', '14:00:00', 'entrada_comida', NULL, NULL, '2025-11-11 19:55:49'),
(76, 1, '2025-11-07', '18:00:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:55:49'),
(77, 2, '2025-11-03', '08:10:00', 'entrada', NULL, NULL, '2025-11-11 19:55:49'),
(78, 2, '2025-11-03', '13:05:00', 'salida', NULL, NULL, '2025-11-11 19:55:49'),
(79, 2, '2025-11-03', '14:05:00', 'entrada_comida', NULL, NULL, '2025-11-11 19:55:49'),
(80, 2, '2025-11-03', '18:05:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:55:49'),
(81, 3, '2025-11-03', '08:00:00', 'entrada', NULL, NULL, '2025-11-11 19:55:49'),
(82, 3, '2025-11-03', '13:00:00', 'salida', NULL, NULL, '2025-11-11 19:55:49'),
(83, 3, '2025-11-03', '14:00:00', 'entrada_comida', NULL, NULL, '2025-11-11 19:55:49'),
(84, 3, '2025-11-03', '18:00:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:55:49'),
(85, 4, '2025-11-03', '08:15:00', 'entrada', NULL, NULL, '2025-11-11 19:55:49'),
(86, 4, '2025-11-03', '13:00:00', 'salida', NULL, NULL, '2025-11-11 19:55:49'),
(87, 4, '2025-11-03', '14:00:00', 'entrada_comida', NULL, NULL, '2025-11-11 19:55:49'),
(88, 4, '2025-11-03', '18:10:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:55:49'),
(89, 5, '2025-11-03', '08:00:00', 'entrada', NULL, NULL, '2025-11-11 19:55:49'),
(90, 5, '2025-11-03', '13:00:00', 'salida', NULL, NULL, '2025-11-11 19:55:49'),
(91, 5, '2025-11-03', '14:00:00', 'entrada_comida', NULL, NULL, '2025-11-11 19:55:49'),
(92, 5, '2025-11-03', '18:00:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:55:49'),
(93, 6, '2025-11-03', '08:05:00', 'entrada', NULL, NULL, '2025-11-11 19:55:49'),
(94, 6, '2025-11-03', '13:00:00', 'salida', NULL, NULL, '2025-11-11 19:55:49'),
(95, 6, '2025-11-03', '14:00:00', 'entrada_comida', NULL, NULL, '2025-11-11 19:55:49'),
(96, 6, '2025-11-03', '18:05:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:55:49'),
(97, 7, '2025-11-03', '08:00:00', 'entrada', NULL, NULL, '2025-11-11 19:55:49'),
(98, 7, '2025-11-03', '13:00:00', 'salida', NULL, NULL, '2025-11-11 19:55:49'),
(99, 7, '2025-11-03', '14:00:00', 'entrada_comida', NULL, NULL, '2025-11-11 19:55:49'),
(100, 7, '2025-11-03', '18:00:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:55:49'),
(101, 8, '2025-11-03', '08:00:00', 'entrada', NULL, NULL, '2025-11-11 19:55:49'),
(102, 8, '2025-11-03', '13:00:00', 'salida', NULL, NULL, '2025-11-11 19:55:49'),
(103, 8, '2025-11-03', '14:00:00', 'entrada_comida', NULL, NULL, '2025-11-11 19:55:49'),
(104, 8, '2025-11-03', '18:00:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:55:49'),
(105, 9, '2025-11-03', '08:00:00', 'entrada', NULL, NULL, '2025-11-11 19:55:49'),
(106, 9, '2025-11-03', '13:00:00', 'salida', NULL, NULL, '2025-11-11 19:55:49'),
(107, 9, '2025-11-03', '14:00:00', 'entrada_comida', NULL, NULL, '2025-11-11 19:55:49'),
(108, 9, '2025-11-03', '18:00:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:55:49'),
(109, 10, '2025-11-03', '08:00:00', 'entrada', NULL, NULL, '2025-11-11 19:55:49'),
(110, 10, '2025-11-03', '13:00:00', 'salida', NULL, NULL, '2025-11-11 19:55:49'),
(111, 10, '2025-11-03', '14:00:00', 'entrada_comida', NULL, NULL, '2025-11-11 19:55:49'),
(112, 10, '2025-11-03', '18:00:00', 'salida_definitiva', NULL, NULL, '2025-11-11 19:55:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deducciones_nomina`
--

CREATE TABLE `deducciones_nomina` (
  `id` int(11) NOT NULL,
  `nomina_id` int(11) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `deducciones_nomina`
--

INSERT INTO `deducciones_nomina` (`id`, `nomina_id`, `tipo`, `monto`, `descripcion`, `fecha_creacion`, `activo`) VALUES
(1, 1, 'ISR', 1200.00, 'Impuesto sobre la renta', '2025-11-11 19:20:41', 1),
(2, 2, 'IMSS', 500.00, 'Seguridad social', '2025-11-11 19:20:41', 1),
(3, 3, 'INFONAVIT', 800.00, 'Crédito INFONAVIT', '2025-11-11 19:20:41', 1),
(4, 4, 'ISR', 1000.00, 'Impuesto sobre la renta', '2025-11-11 19:20:41', 1),
(5, 5, 'IMSS', 600.00, 'Seguridad social', '2025-11-11 19:20:41', 1),
(6, 6, 'INFONAVIT', 700.00, 'Crédito INFONAVIT', '2025-11-11 19:20:41', 1),
(7, 7, 'ISR', 1100.00, 'Impuesto sobre la renta', '2025-11-11 19:20:41', 1),
(8, 8, 'IMSS', 400.00, 'Seguridad social', '2025-11-11 19:20:41', 1),
(9, 9, 'INFONAVIT', 900.00, 'Crédito INFONAVIT', '2025-11-11 19:20:41', 1),
(10, 10, 'ISR', 1300.00, 'Impuesto sobre la renta', '2025-11-11 19:20:41', 1),
(11, 11, 'IMSS', 550.00, 'Seguridad social', '2025-11-11 19:20:41', 1),
(12, 12, 'INFONAVIT', 650.00, 'Crédito INFONAVIT', '2025-11-11 19:20:41', 1),
(13, 13, 'ISR', 1200.00, 'Impuesto sobre la renta', '2025-11-11 19:20:41', 1),
(14, 14, 'IMSS', 700.00, 'Seguridad social', '2025-11-11 19:20:41', 1),
(15, 15, 'INFONAVIT', 800.00, 'Crédito INFONAVIT', '2025-11-11 19:20:41', 1),
(16, 16, 'ISR', 1000.00, 'Impuesto sobre la renta', '2025-11-11 19:20:41', 1),
(17, 17, 'IMSS', 600.00, 'Seguridad social', '2025-11-11 19:20:41', 1),
(18, 18, 'INFONAVIT', 750.00, 'Crédito INFONAVIT', '2025-11-11 19:20:41', 1),
(19, 19, 'ISR', 1150.00, 'Impuesto sobre la renta', '2025-11-11 19:20:41', 1),
(20, 20, 'IMSS', 500.00, 'Seguridad social', '2025-11-11 19:20:41', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `codigo_empleado` varchar(20) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_ingreso` date NOT NULL,
  `sucursal_id` int(11) DEFAULT NULL,
  `puesto_id` int(11) DEFAULT NULL,
  `puesto` varchar(100) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT 0.00,
  `estado_empleado` enum('activo','inactivo','suspendido') DEFAULT 'activo',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario_creacion` varchar(50) DEFAULT NULL,
  `usuario_modificacion` varchar(50) DEFAULT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `codigo_empleado`, `nombre`, `apellido`, `documento`, `correo`, `telefono`, `direccion`, `fecha_nacimiento`, `fecha_ingreso`, `sucursal_id`, `puesto_id`, `puesto`, `salario`, `estado_empleado`, `fecha_creacion`, `usuario_creacion`, `usuario_modificacion`, `fecha_modificacion`, `activo`) VALUES
(1, 'EMP001', 'Juan', 'Hernández', '12345678', 'juan.hernandez@empresa.com', '555-111-2222', 'Av. Siempre Viva #45', '1990-05-12', '2022-03-01', 1, 3, 'Analista de Nómina', 15000.00, 'activo', '2025-11-11 17:25:28', NULL, NULL, NULL, 1),
(2, 'EMP002', 'María', 'López', '98765432', 'maria.lopez@empresa.com', '555-333-4444', 'Calle del Sol #22', '1988-09-08', '2023-01-15', 2, NULL, 'Recursos Humanos', 18000.00, 'activo', '2025-11-11 17:25:28', NULL, NULL, NULL, 1),
(3, 'EMP003', 'Carlos', 'Pérez', '11223344', 'carlos.perez@empresa.com', '555-777-8888', 'Blvd. Independencia #90', '1995-07-22', '2024-06-10', 3, 2, 'Contador General', 20000.00, 'activo', '2025-11-11 17:25:28', NULL, NULL, NULL, 1),
(4, 'EMP004', 'Lucía', 'Martínez', '99887766', 'lucia.martinez@empresa.com', '555-100-0001', 'Calle Luna #45', '1992-02-15', '2023-05-10', 1, 3, NULL, 15000.00, 'activo', '2025-11-11 19:06:32', NULL, NULL, NULL, 1),
(5, 'EMP005', 'Pedro', 'Gómez', '88776655', 'pedro.gomez@empresa.com', '555-100-0002', 'Av. Reforma #89', '1989-10-30', '2021-07-01', 2, 5, NULL, 18000.00, 'activo', '2025-11-11 19:06:32', NULL, NULL, NULL, 1),
(6, 'EMP006', 'Ana', 'Torres', '77889911', 'ana.torres@empresa.com', '555-100-0003', 'Calle del Mar #12', '1995-03-20', '2022-02-18', 3, 4, NULL, 12000.00, 'activo', '2025-11-11 19:06:32', NULL, NULL, NULL, 1),
(7, 'EMP007', 'Jorge', 'Ramírez', '55443322', 'jorge.ramirez@empresa.com', '555-100-0004', 'Col. Industrial #55', '1990-12-25', '2020-09-10', 1, 2, NULL, 20000.00, 'activo', '2025-11-11 19:06:32', NULL, NULL, NULL, 1),
(8, 'EMP008', 'Patricia', 'Cruz', '66554433', 'patricia.cruz@empresa.com', '555-100-0005', 'Av. Hidalgo #78', '1988-11-05', '2019-03-01', 2, 3, NULL, 15000.00, 'activo', '2025-11-11 19:06:32', NULL, NULL, NULL, 1),
(9, 'EMP009', 'Fernando', 'Santos', '22334455', 'fernando.santos@empresa.com', '555-100-0006', 'Calle Verde #21', '1996-07-14', '2021-04-23', 3, 4, NULL, 12000.00, 'activo', '2025-11-11 19:06:32', NULL, NULL, NULL, 1),
(10, 'EMP010', 'Claudia', 'Ríos', '99112233', 'claudia.rios@empresa.com', '555-100-0007', 'Av. Los Pinos #66', '1993-09-10', '2022-06-11', 1, 3, NULL, 15000.00, 'activo', '2025-11-11 19:06:32', NULL, NULL, NULL, 1),
(11, 'EMP011', 'Luis', 'Morales', '33445566', 'luis.morales@empresa.com', '555-100-0008', 'Calle Roble #19', '1987-08-02', '2018-11-12', 2, 2, NULL, 20000.00, 'activo', '2025-11-11 19:06:32', NULL, NULL, NULL, 1),
(12, 'EMP012', 'Carmen', 'Flores', '44332211', 'carmen.flores@empresa.com', '555-100-0009', 'Blvd. Central #33', '1991-03-05', '2023-04-01', 3, 5, NULL, 18000.00, 'activo', '2025-11-11 19:06:32', NULL, NULL, NULL, 1),
(13, 'EMP013', 'Andrés', 'Pérez', '55667788', 'andres.perez@empresa.com', '555-100-0010', 'Av. México #11', '1997-10-08', '2022-08-15', 1, 3, NULL, 15000.00, 'activo', '2025-11-11 19:06:32', NULL, NULL, NULL, 1),
(14, 'EMP014', 'Rocío', 'Navarro', '66778899', 'rocio.navarro@empresa.com', '555-100-0011', 'Calle Azul #9', '1994-12-21', '2021-09-19', 2, 4, NULL, 12000.00, 'activo', '2025-11-11 19:06:32', NULL, NULL, NULL, 1),
(15, 'EMP015', 'Sergio', 'Vega', '77889900', 'sergio.vega@empresa.com', '555-100-0012', 'Calle Norte #22', '1990-06-06', '2020-10-25', 3, 2, NULL, 20000.00, 'activo', '2025-11-11 19:06:32', NULL, NULL, NULL, 1),
(16, 'EMP016', 'Adriana', 'Reyes', '88990011', 'adriana.reyes@empresa.com', '555-100-0013', 'Av. Juárez #10', '1992-05-09', '2023-02-20', 1, 3, NULL, 15000.00, 'activo', '2025-11-11 19:06:32', NULL, NULL, NULL, 1),
(17, 'EMP017', 'David', 'Mendoza', '99001122', 'david.mendoza@empresa.com', '555-100-0014', 'Calle Libertad #17', '1995-11-18', '2022-01-25', 2, 5, NULL, 18000.00, 'activo', '2025-11-11 19:06:32', NULL, NULL, NULL, 1),
(18, 'EMP018', 'Gabriela', 'Suárez', '10111213', 'gabriela.suarez@empresa.com', '555-100-0015', 'Col. Jardines #44', '1989-04-10', '2021-05-05', 3, 3, NULL, 15000.00, 'activo', '2025-11-11 19:06:32', NULL, NULL, NULL, 1),
(19, 'EMP019', 'Ricardo', 'Lara', '12131415', 'ricardo.lara@empresa.com', '555-100-0016', 'Av. Universidad #13', '1991-09-23', '2020-11-09', 1, 2, NULL, 20000.00, 'activo', '2025-11-11 19:06:32', NULL, NULL, NULL, 1),
(20, 'EMP020', 'Estefanía', 'Campos', '13141516', 'estefania.campos@empresa.com', '555-100-0017', 'Calle Sur #10', '1996-02-17', '2023-07-11', 2, 3, NULL, 15000.00, 'activo', '2025-11-11 19:06:32', NULL, NULL, NULL, 1),
(21, 'EMP021', 'Tomás', 'Herrera', '14151617', 'tomas.herrera@empresa.com', '555-100-0018', 'Calle Sol #21', '1992-08-28', '2022-09-09', 3, 4, NULL, 12000.00, 'activo', '2025-11-11 19:06:32', NULL, NULL, NULL, 1),
(22, 'EMP022', 'Leticia', 'Ramos', '15161718', 'leticia.ramos@empresa.com', '555-100-0019', 'Av. Roma #22', '1987-01-14', '2019-04-13', 1, 5, NULL, 18000.00, 'activo', '2025-11-11 19:06:32', NULL, NULL, NULL, 1),
(23, 'EMP023', 'Héctor', 'Silva', '16171819', 'hector.silva@empresa.com', '555-100-0020', 'Col. Centro #50', '1990-09-09', '2020-03-30', 2, 2, NULL, 20000.00, 'activo', '2025-11-11 19:06:32', NULL, NULL, NULL, 1),
(24, NULL, 'Elizabeth', 'Orozco Torres', NULL, 'a@veracruz.gob.mx', '22 81 22 85 98 ', 'Tapachula No. 15, Col. Los Laureles', '2004-06-22', '2025-11-17', 2, 3, NULL, 0.00, 'activo', '2025-11-19 17:45:37', NULL, NULL, NULL, 1),
(30, 'EMP024', 'margarita', 'Perez Saucedo', '99887767', 'msaucedo@hotmail.com', '22 99 55 66 89', 'Aralias no. 24, Fracc. Las Fuentes', '0000-00-00', '2025-11-17', 2, 2, NULL, 20000.00, 'activo', '2025-11-19 20:34:56', '1', '1', '0000-00-00 00:00:00', 1),
(31, 'EMP025', 'Arely', 'Morales Huesca', '99887768', 'nvfidjvn@hotmail.com', 'gbfgb', 'gbrgbrgbrg', '2025-11-12', '0000-00-00', 1, 3, NULL, 15000.00, 'activo', '2025-11-19 06:00:00', '1', '1', '2025-11-19 06:00:00', 1),
(32, 'EMP026', 'Miguel', 'Salas Perez', '99887769', 'msalas@hotmail.com', '2281229845', 'Tuxpan No. 32, Col. Las Fuentes', '1972-06-13', '0000-00-00', 1, 1, NULL, 30000.00, 'activo', '2025-11-19 06:00:00', '1', '1', '2025-11-19 06:00:00', 1),
(33, 'EMP027', 'Jose Eduardo', 'Garcia Martinez', '99887770', 'joseduardo723@gmail.com', '22 81 22 85 97', 'Av. Xalapa No. 1036, Col. Progreso', '1980-06-18', '0000-00-00', 2, 1, NULL, 30000.00, 'activo', '2025-11-20 06:00:00', '1', '1', '2025-11-20 06:00:00', 1),
(34, 'EMP028', 'Enrique', 'HernÃ¡ndez PÃ©rez', '99887771', 'ehernandez@hotmail.com', '22 81 22 69 35', 'Olivo No. 24, Col. Las fuentes', '1980-01-06', '0000-00-00', 1, 2, NULL, 20000.00, 'activo', '2025-11-20 06:00:00', '1', '1', '2025-11-20 06:00:00', 1),
(35, 'EMP029', 'Federico', 'Cantu', '99887772', 'fcantu@hotmail.com', '22 81 22 86 95', 'Privada Olivos No. 15 Col. Margaritas', '1996-01-08', '0000-00-00', 2, 4, NULL, 12000.00, 'activo', '2025-11-22 06:00:00', '1', '1', '2025-11-22 06:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expedientes`
--

CREATE TABLE `expedientes` (
  `id` int(11) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `curriculum` varchar(255) DEFAULT NULL,
  `solicitud_empleo` varchar(255) DEFAULT NULL,
  `fotografia` varchar(255) DEFAULT NULL,
  `constancia_estudios` varchar(255) DEFAULT NULL,
  `curp` varchar(255) DEFAULT NULL,
  `comprobante_domicilio` varchar(255) DEFAULT NULL,
  `rfc` varchar(255) DEFAULT NULL,
  `numero_seguridad_social` varchar(255) DEFAULT NULL,
  `constancia_medica` varchar(255) DEFAULT NULL,
  `otros_documentos` text DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `justificaciones`
--

CREATE TABLE `justificaciones` (
  `id` int(11) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `fecha_falta` date NOT NULL,
  `tipo` enum('falta','retardo') NOT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `comentarios` text DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('pendiente','aprobado','rechazado') DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nominas`
--

CREATE TABLE `nominas` (
  `id` int(11) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `periodo_inicio` date NOT NULL,
  `periodo_fin` date NOT NULL,
  `fecha_pago` date NOT NULL,
  `salario_base` decimal(10,2) NOT NULL,
  `bonificaciones` decimal(10,2) DEFAULT 0.00,
  `deducciones` decimal(10,2) DEFAULT 0.00,
  `salario_neto` decimal(10,2) NOT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `comentarios` text DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario_creacion` varchar(50) DEFAULT NULL,
  `usuario_modificacion` varchar(50) DEFAULT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `nominas`
--

INSERT INTO `nominas` (`id`, `empleado_id`, `periodo_inicio`, `periodo_fin`, `fecha_pago`, `salario_base`, `bonificaciones`, `deducciones`, `salario_neto`, `metodo_pago`, `comentarios`, `fecha_creacion`, `usuario_creacion`, `usuario_modificacion`, `fecha_modificacion`, `activo`) VALUES
(1, 1, '2025-10-01', '2025-10-15', '2025-10-16', 15000.00, 1000.00, 500.00, 15500.00, 'transferencia', 'Pago quincenal', '2025-11-11 19:08:49', NULL, NULL, NULL, 1),
(2, 2, '2025-10-01', '2025-10-15', '2025-10-16', 18000.00, 1200.00, 600.00, 18600.00, 'transferencia', 'Pago quincenal', '2025-11-11 19:08:49', NULL, NULL, NULL, 1),
(3, 3, '2025-10-01', '2025-10-15', '2025-10-16', 20000.00, 2000.00, 800.00, 21200.00, 'transferencia', 'Pago quincenal', '2025-11-11 19:08:49', NULL, NULL, NULL, 1),
(4, 4, '2025-10-01', '2025-10-15', '2025-10-16', 15000.00, 800.00, 300.00, 15500.00, 'efectivo', 'Pago quincenal', '2025-11-11 19:08:49', NULL, NULL, NULL, 1),
(5, 5, '2025-10-01', '2025-10-15', '2025-10-16', 18000.00, 500.00, 700.00, 17800.00, 'transferencia', 'Pago quincenal', '2025-11-11 19:08:49', NULL, NULL, NULL, 1),
(6, 6, '2025-10-01', '2025-10-15', '2025-10-16', 12000.00, 600.00, 200.00, 12400.00, 'efectivo', 'Pago quincenal', '2025-11-11 19:08:49', NULL, NULL, NULL, 1),
(7, 7, '2025-10-01', '2025-10-15', '2025-10-16', 20000.00, 1500.00, 900.00, 20600.00, 'transferencia', 'Pago quincenal', '2025-11-11 19:08:49', NULL, NULL, NULL, 1),
(8, 8, '2025-10-01', '2025-10-15', '2025-10-16', 15000.00, 400.00, 500.00, 14900.00, 'efectivo', 'Pago quincenal', '2025-11-11 19:08:49', NULL, NULL, NULL, 1),
(9, 9, '2025-10-01', '2025-10-15', '2025-10-16', 12000.00, 700.00, 300.00, 12400.00, 'transferencia', 'Pago quincenal', '2025-11-11 19:08:49', NULL, NULL, NULL, 1),
(10, 10, '2025-10-01', '2025-10-15', '2025-10-16', 20000.00, 900.00, 400.00, 20500.00, 'transferencia', 'Pago quincenal', '2025-11-11 19:08:49', NULL, NULL, NULL, 1),
(11, 11, '2025-10-01', '2025-10-15', '2025-10-16', 18000.00, 1000.00, 600.00, 18400.00, 'efectivo', 'Pago quincenal', '2025-11-11 19:08:49', NULL, NULL, NULL, 1),
(12, 12, '2025-10-01', '2025-10-15', '2025-10-16', 15000.00, 500.00, 500.00, 15000.00, 'transferencia', 'Pago quincenal', '2025-11-11 19:08:49', NULL, NULL, NULL, 1),
(13, 13, '2025-10-01', '2025-10-15', '2025-10-16', 12000.00, 800.00, 300.00, 12500.00, 'transferencia', 'Pago quincenal', '2025-11-11 19:08:49', NULL, NULL, NULL, 1),
(14, 14, '2025-10-01', '2025-10-15', '2025-10-16', 18000.00, 700.00, 200.00, 18500.00, 'transferencia', 'Pago quincenal', '2025-11-11 19:08:49', NULL, NULL, NULL, 1),
(15, 15, '2025-10-01', '2025-10-15', '2025-10-16', 15000.00, 600.00, 400.00, 15200.00, 'transferencia', 'Pago quincenal', '2025-11-11 19:08:49', NULL, NULL, NULL, 1),
(16, 16, '2025-10-01', '2025-10-15', '2025-10-16', 20000.00, 1000.00, 500.00, 20500.00, 'efectivo', 'Pago quincenal', '2025-11-11 19:08:49', NULL, NULL, NULL, 1),
(17, 17, '2025-10-01', '2025-10-15', '2025-10-16', 18000.00, 1200.00, 700.00, 18500.00, 'transferencia', 'Pago quincenal', '2025-11-11 19:08:49', NULL, NULL, NULL, 1),
(18, 18, '2025-10-01', '2025-10-15', '2025-10-16', 15000.00, 700.00, 400.00, 15300.00, 'transferencia', 'Pago quincenal', '2025-11-11 19:08:49', NULL, NULL, NULL, 1),
(19, 19, '2025-10-01', '2025-10-15', '2025-10-16', 20000.00, 1500.00, 800.00, 20700.00, 'transferencia', 'Pago quincenal', '2025-11-11 19:08:49', NULL, NULL, NULL, 1),
(20, 20, '2025-10-01', '2025-10-15', '2025-10-16', 18000.00, 900.00, 300.00, 18600.00, 'transferencia', 'Pago quincenal', '2025-11-11 19:08:49', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina_historial`
--

CREATE TABLE `nomina_historial` (
  `id` int(11) NOT NULL,
  `nomina_id` int(11) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `fecha_cambio` timestamp NOT NULL DEFAULT current_timestamp(),
  `salario_base` decimal(10,2) DEFAULT NULL,
  `bonificaciones` decimal(10,2) DEFAULT NULL,
  `deducciones` decimal(10,2) DEFAULT NULL,
  `salario_neto` decimal(10,2) DEFAULT NULL,
  `motivo_cambio` varchar(255) DEFAULT NULL,
  `usuario_responsable` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `tipo` enum('2h','cita_medica','otros') NOT NULL,
  `comentarios` text DEFAULT NULL,
  `estado` enum('pendiente','aprobado','rechazado') DEFAULT 'pendiente',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos`
--

CREATE TABLE `puestos` (
  `puesto_id` int(11) NOT NULL,
  `nombre_puesto` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `salario_base` decimal(10,2) DEFAULT 0.00,
  `nivel` varchar(50) DEFAULT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `puestos`
--

INSERT INTO `puestos` (`puesto_id`, `nombre_puesto`, `descripcion`, `salario_base`, `nivel`, `departamento`, `fecha_creacion`, `activo`) VALUES
(1, 'Gerente General', 'Responsable de la dirección general de la empresa', 30000.00, 'Dirección', 'Administración', '2025-11-11 17:25:42', 1),
(2, 'Contador General', 'Encargado de la contabilidad y reportes financieros', 20000.00, 'Profesional', 'Contabilidad', '2025-11-11 17:25:42', 1),
(3, 'Analista de Nómina', 'Gestiona el cálculo y pago de nómina', 15000.00, 'Operativo', 'Recursos Humanos', '2025-11-11 17:25:42', 1),
(4, 'Auxiliar Administrativo', 'Apoya las tareas administrativas y de oficina', 12000.00, 'Operativo', 'Administración', '2025-11-11 17:25:42', 1),
(5, 'Encargado de Sucursal', 'Coordina operaciones en una sucursal específica', 18000.00, 'Supervisión', 'Operaciones', '2025-11-11 17:25:42', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre_rol`, `descripcion`, `fecha_creacion`, `activo`) VALUES
(1, 'admin', 'Acceso total al sistema', '2025-11-11 17:24:48', 1),
(2, 'rrhh', 'Gestiona empleados y nómina', '2025-11-11 17:24:48', 1),
(3, 'contabilidad', 'Revisa pagos y reportes financieros', '2025-11-11 17:24:48', 1),
(4, 'invitado', 'Acceso limitado solo de lectura', '2025-11-11 17:24:48', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `encargado` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`id`, `nombre`, `direccion`, `telefono`, `correo`, `encargado`, `estado`, `ciudad`, `codigo_postal`, `fecha_creacion`, `activo`) VALUES
(1, 'Sucursal Central', 'Av. Principal #123, Col. Centro', '555-123-4567', 'central@empresa.com', 'Laura Méndez', 'Estado Capital', 'Ciudad Central', '10000', '2025-11-11 17:25:10', 1),
(2, 'Sucursal Norte', 'Calle 45 #89, Col. Industrial', '555-987-6543', 'norte@empresa.com', 'Carlos Pérez', 'Estado Norte', 'Ciudad Norte', '20000', '2025-11-11 17:25:10', 1),
(3, 'Sucursal Sur', 'Av. Libertad #250', '555-321-7890', 'sur@empresa.com', 'Ana Torres', 'Estado Sur', 'Ciudad Sur', '30000', '2025-11-11 17:25:10', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `rol` enum('admin','rrhh','contabilidad','invitado') DEFAULT 'invitado',
  `correo` varchar(100) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario_creacion` varchar(50) DEFAULT NULL,
  `usuario_modificacion` varchar(50) DEFAULT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_usuario`, `password`, `nombre_completo`, `rol`, `correo`, `fecha_creacion`, `usuario_creacion`, `usuario_modificacion`, `fecha_modificacion`, `activo`) VALUES
(1, 'admin', '1234', 'Administrador del Sistema', 'admin', 'admin@nomina.com', '2025-11-11 17:20:07', NULL, NULL, NULL, 1),
(7, 'usuario1', '$2y$10$Qpw1', 'Lucía Martínez', 'rrhh', 'lucia.martinez@empresa.com', '2025-11-11 19:08:11', NULL, NULL, NULL, 1),
(8, 'usuario2', '$2y$10$Qpw2', 'Pedro Gómez', 'contabilidad', 'pedro.gomez@empresa.com', '2025-11-11 19:08:11', NULL, NULL, NULL, 1),
(9, 'usuario3', '$2y$10$Qpw3', 'Ana Torres', 'rrhh', 'ana.torres@empresa.com', '2025-11-11 19:08:11', NULL, NULL, NULL, 1),
(10, 'usuario4', '$2y$10$Qpw4', 'Jorge Ramírez', 'invitado', 'jorge.ramirez@empresa.com', '2025-11-11 19:08:11', NULL, NULL, NULL, 1),
(11, 'usuario5', '$2y$10$Qpw5', 'Patricia Cruz', 'rrhh', 'patricia.cruz@empresa.com', '2025-11-11 19:08:11', NULL, NULL, NULL, 1),
(12, 'usuario6', '$2y$10$Qpw6', 'Fernando Santos', 'contabilidad', 'fernando.santos@empresa.com', '2025-11-11 19:08:11', NULL, NULL, NULL, 1),
(13, 'usuario7', '$2y$10$Qpw7', 'Claudia Ríos', 'rrhh', 'claudia.rios@empresa.com', '2025-11-11 19:08:11', NULL, NULL, NULL, 1),
(14, 'usuario8', '$2y$10$Qpw8', 'Luis Morales', 'contabilidad', 'luis.morales@empresa.com', '2025-11-11 19:08:11', NULL, NULL, NULL, 1),
(15, 'usuario9', '$2y$10$Qpw9', 'Carmen Flores', 'rrhh', 'carmen.flores@empresa.com', '2025-11-11 19:08:11', NULL, NULL, NULL, 1),
(16, 'usuario10', '$2y$10$Qpw10', 'Andrés Pérez', 'invitado', 'andres.perez@empresa.com', '2025-11-11 19:08:11', NULL, NULL, NULL, 1),
(17, 'usuario11', '$2y$10$Qpw11', 'Rocío Navarro', 'rrhh', 'rocio.navarro@empresa.com', '2025-11-11 19:08:11', NULL, NULL, NULL, 1),
(18, 'usuario12', '$2y$10$Qpw12', 'Sergio Vega', 'contabilidad', 'sergio.vega@empresa.com', '2025-11-11 19:08:11', NULL, NULL, NULL, 1),
(19, 'usuario13', '$2y$10$Qpw13', 'Adriana Reyes', 'rrhh', 'adriana.reyes@empresa.com', '2025-11-11 19:08:11', NULL, NULL, NULL, 1),
(20, 'usuario14', '$2y$10$Qpw14', 'David Mendoza', 'invitado', 'david.mendoza@empresa.com', '2025-11-11 19:08:11', NULL, NULL, NULL, 1),
(21, 'usuario15', '$2y$10$Qpw15', 'Gabriela Suárez', 'rrhh', 'gabriela.suarez@empresa.com', '2025-11-11 19:08:11', NULL, NULL, NULL, 1),
(22, 'usuario16', '$2y$10$Qpw16', 'Ricardo Lara', 'contabilidad', 'ricardo.lara@empresa.com', '2025-11-11 19:08:11', NULL, NULL, NULL, 1),
(23, 'usuario17', '$2y$10$Qpw17', 'Estefanía Campos', 'rrhh', 'estefania.campos@empresa.com', '2025-11-11 19:08:11', NULL, NULL, NULL, 1),
(24, 'usuario18', '$2y$10$Qpw18', 'Tomás Herrera', 'rrhh', 'tomas.herrera@empresa.com', '2025-11-11 19:08:11', NULL, NULL, NULL, 1),
(25, 'usuario19', '$2y$10$Qpw19', 'Leticia Ramos', 'contabilidad', 'leticia.ramos@empresa.com', '2025-11-11 19:08:11', NULL, NULL, NULL, 1),
(26, 'usuario20', '$2y$10$Qpw20', 'Héctor Silva', 'rrhh', 'hector.silva@empresa.com', '2025-11-11 19:08:11', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacaciones`
--

CREATE TABLE `vacaciones` (
  `id` int(11) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `dias_disfrutados` int(11) NOT NULL,
  `estado` enum('pendiente','aprobado','rechazado') DEFAULT 'pendiente',
  `comentarios` text DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bonificaciones_nomina`
--
ALTER TABLE `bonificaciones_nomina`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bonificacion_nomina` (`nomina_id`);

--
-- Indices de la tabla `checadas`
--
ALTER TABLE `checadas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_checadas_sucursal` (`sucursal_id`),
  ADD KEY `idx_checadas_empleado_fecha` (`empleado_id`,`fecha`);

--
-- Indices de la tabla `deducciones_nomina`
--
ALTER TABLE `deducciones_nomina`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_deduccion_nomina` (`nomina_id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_empleado` (`codigo_empleado`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD KEY `fk_empleado_puesto` (`puesto_id`),
  ADD KEY `idx_empleados_sucursal` (`sucursal_id`);

--
-- Indices de la tabla `expedientes`
--
ALTER TABLE `expedientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_expediente_empleado` (`empleado_id`);

--
-- Indices de la tabla `justificaciones`
--
ALTER TABLE `justificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_justificaciones_empleado` (`empleado_id`);

--
-- Indices de la tabla `nominas`
--
ALTER TABLE `nominas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nominas_empleado_periodo` (`empleado_id`,`periodo_inicio`,`periodo_fin`);

--
-- Indices de la tabla `nomina_historial`
--
ALTER TABLE `nomina_historial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nomina_id` (`nomina_id`),
  ADD KEY `empleado_id` (`empleado_id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_permisos_empleado` (`empleado_id`);

--
-- Indices de la tabla `puestos`
--
ALTER TABLE `puestos`
  ADD PRIMARY KEY (`puesto_id`),
  ADD UNIQUE KEY `nombre_puesto` (`nombre_puesto`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_rol` (`nombre_rol`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_usuario` (`nombre_usuario`);

--
-- Indices de la tabla `vacaciones`
--
ALTER TABLE `vacaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vacaciones_empleado_estado` (`empleado_id`,`estado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bonificaciones_nomina`
--
ALTER TABLE `bonificaciones_nomina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `checadas`
--
ALTER TABLE `checadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT de la tabla `deducciones_nomina`
--
ALTER TABLE `deducciones_nomina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `expedientes`
--
ALTER TABLE `expedientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `justificaciones`
--
ALTER TABLE `justificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nominas`
--
ALTER TABLE `nominas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `nomina_historial`
--
ALTER TABLE `nomina_historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `puestos`
--
ALTER TABLE `puestos`
  MODIFY `puesto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `vacaciones`
--
ALTER TABLE `vacaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bonificaciones_nomina`
--
ALTER TABLE `bonificaciones_nomina`
  ADD CONSTRAINT `fk_bonificacion_nomina` FOREIGN KEY (`nomina_id`) REFERENCES `nominas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `checadas`
--
ALTER TABLE `checadas`
  ADD CONSTRAINT `fk_checadas_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_checadas_sucursal` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `deducciones_nomina`
--
ALTER TABLE `deducciones_nomina`
  ADD CONSTRAINT `fk_deduccion_nomina` FOREIGN KEY (`nomina_id`) REFERENCES `nominas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `fk_empleado_puesto` FOREIGN KEY (`puesto_id`) REFERENCES `puestos` (`puesto_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_empleado_sucursal` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `expedientes`
--
ALTER TABLE `expedientes`
  ADD CONSTRAINT `fk_expediente_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `justificaciones`
--
ALTER TABLE `justificaciones`
  ADD CONSTRAINT `fk_justificaciones_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `nominas`
--
ALTER TABLE `nominas`
  ADD CONSTRAINT `fk_nomina_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `nomina_historial`
--
ALTER TABLE `nomina_historial`
  ADD CONSTRAINT `nomina_historial_ibfk_1` FOREIGN KEY (`nomina_id`) REFERENCES `nominas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nomina_historial_ibfk_2` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `fk_permisos_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vacaciones`
--
ALTER TABLE `vacaciones`
  ADD CONSTRAINT `fk_vacaciones_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
