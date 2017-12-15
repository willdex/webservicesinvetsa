-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 10-05-2017 a las 15:01:36
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `invetsa`
--
CREATE DATABASE IF NOT EXISTS `invetsa` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `invetsa`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accion`
--

CREATE TABLE `accion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `id_hoja_verificacion` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `accion`
--

INSERT INTO `accion` (`id`, `nombre`, `id_hoja_verificacion`, `imei`) VALUES
(1, 'Laboratorio de preparaciÃ³n de vacuna', 38, '000000000000000'),
(1, 'Laboratorio de preparaciÃ³n de vacuna', 39, '000000000000000'),
(2, 'Equipo Invetsa-Temp y otros', 38, '000000000000000'),
(2, 'Equipo Invetsa-Temp y otros', 39, '000000000000000'),
(3, 'Sala de vacunaciÃ³n', 38, '000000000000000'),
(3, 'Sala de vacunaciÃ³n', 39, '000000000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centros`
--

CREATE TABLE `centros` (
  `id` int(11) NOT NULL,
  `nombre` text,
  `direccion` text,
  `tipo` text,
  `latitud` decimal(13,7) DEFAULT NULL,
  `longitud` decimal(13,7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `centros`
--

INSERT INTO `centros` (`id`, `nombre`, `direccion`, `tipo`, `latitud`, `longitud`) VALUES
(1, 'casa', 'farma', 'Farmacia', '-17.3255000', '-63.2485000'),
(2, 'target', 'farma', 'Farmacia', '-17.3255000', '-63.2485000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compania`
--

CREATE TABLE `compania` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `compania`
--

INSERT INTO `compania` (`id`, `nombre`, `direccion`) VALUES
(1, 'Jose Alfredo', ''),
(2, 'Nolberto Zabala', ''),
(3, 'Edgar Elio', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_indice`
--

CREATE TABLE `control_indice` (
  `id` int(11) NOT NULL,
  `nro_pollos_vacunado` int(11) DEFAULT '0',
  `puntaje` int(11) DEFAULT '0',
  `nro_pollos_controlados` int(11) DEFAULT '0',
  `nro_pollos_no_vacunados` int(11) DEFAULT '0',
  `nro_heridos` int(11) DEFAULT '0',
  `nro_mojados` int(11) DEFAULT '0',
  `nro_mala_posicion` int(11) DEFAULT '0',
  `nro_pollos_vacunados_correctamente` int(11) DEFAULT '0',
  `id_hoja_verificacion` int(11) NOT NULL,
  `id_vacunador` int(11) DEFAULT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `control_indice`
--

INSERT INTO `control_indice` (`id`, `nro_pollos_vacunado`, `puntaje`, `nro_pollos_controlados`, `nro_pollos_no_vacunados`, `nro_heridos`, `nro_mojados`, `nro_mala_posicion`, `nro_pollos_vacunados_correctamente`, `id_hoja_verificacion`, `id_vacunador`, `imei`) VALUES
(1, 0, 0, 0, 0, 0, 0, 0, 0, 38, 1, '000000000000000'),
(1, 0, 0, 0, 40, 0, 0, 0, 0, 39, 1, '000000000000000'),
(5, 0, 0, 0, 3, 0, 2, 0, 0, 38, 5, '000000000000000'),
(5, 0, 0, 0, 0, 0, 0, 0, 0, 39, 5, '000000000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_accion`
--

CREATE TABLE `detalle_accion` (
  `id` int(11) NOT NULL,
  `esperado` varchar(50) DEFAULT NULL,
  `encontrado` varchar(50) DEFAULT NULL,
  `id_accion` int(11) NOT NULL,
  `id_hoja_verificacion` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_accion`
--

INSERT INTO `detalle_accion` (`id`, `esperado`, `encontrado`, `id_accion`, `id_hoja_verificacion`, `imei`) VALUES
(1, 'Temperatura 24 a 27 ÂºC', '', 1, 38, '000000000000000'),
(1, 'Temperatura 24 a 27 ÂºC', 'asdf', 1, 39, '000000000000000'),
(1, 'Guantes y Lentes', 'SI', 2, 38, '000000000000000'),
(1, 'Guantes y Lentes', 'SI', 2, 39, '000000000000000'),
(1, 'Mesa circular-lineal-individual', 'Circular', 3, 38, '000000000000000'),
(1, 'Mesa circular-lineal-individual', 'Circular', 3, 39, '000000000000000'),
(2, 'VentilaciÃ³n forzada', 'SI', 1, 38, '000000000000000'),
(2, 'VentilaciÃ³n forzada', 'SI', 1, 39, '000000000000000'),
(2, 'Recipiente de agua', 'SI', 2, 38, '000000000000000'),
(2, 'Recipiente de agua', 'SI', 2, 39, '000000000000000'),
(2, 'Cambio agujas c/2,000 pollos', 'SI', 3, 38, '000000000000000'),
(2, 'Cambio agujas c/2,000 pollos', 'SI', 3, 39, '000000000000000'),
(3, 'Limpieza despuÃ©s c/vacunaciÃ³n', 'SI', 1, 38, '000000000000000'),
(3, 'Limpieza despuÃ©s c/vacunaciÃ³n', 'SI', 1, 39, '000000000000000'),
(3, 'TÂº 27 a 37 ÂºC (promedio 32 ÂºC)', '', 2, 38, '000000000000000'),
(3, 'TÂº 27 a 37 ÂºC (promedio 32 ÂºC)', '', 2, 39, '000000000000000'),
(3, 'T Âº 24 a 27 Âº C', '', 3, 38, '000000000000000'),
(3, 'T Âº 24 a 27 Âº C', '', 3, 39, '000000000000000'),
(4, 'Humedad 65 % HR', 'N/C', 1, 38, '000000000000000'),
(4, 'Humedad 65 % HR', 'N/C', 1, 39, '000000000000000'),
(4, 'Rompe ampollas', 'SI', 2, 38, '000000000000000'),
(4, 'Rompe ampollas', 'SI', 2, 39, '000000000000000'),
(4, 'VentilaciÃ³n forzada', 'SI', 3, 38, '000000000000000'),
(4, 'VentilaciÃ³n forzada', 'SI', 3, 39, '000000000000000'),
(5, 'PresiÃ³n positiva', 'N/C', 1, 38, '000000000000000'),
(5, 'PresiÃ³n positiva', 'N/C', 1, 39, '000000000000000'),
(5, 'Aguja 18 G x 18 1 Â½â€ (rosada)', 'SI', 2, 38, '000000000000000'),
(5, 'Aguja 18 G x 18 1 Â½â€ (rosada)', 'SI', 2, 39, '000000000000000'),
(5, 'Limpieza despuÃ©s c/vacunaciÃ³n', 'SI', 3, 38, '000000000000000'),
(5, 'Limpieza despuÃ©s c/vacunaciÃ³n', 'SI', 3, 39, '000000000000000'),
(6, 'DesinfecciÃ³n post limpieza', 'SI', 1, 38, '000000000000000'),
(6, 'DesinfecciÃ³n post limpieza', 'SI', 1, 39, '000000000000000'),
(6, 'AlgodÃ³n', 'SI', 2, 38, '000000000000000'),
(6, 'AlgodÃ³n', 'SI', 2, 39, '000000000000000'),
(6, 'NÂº de maquinas', '', 3, 38, '000000000000000'),
(6, 'NÂº de maquinas', '', 3, 39, '000000000000000'),
(7, 'Colorante Marek dosis', 'N/C', 2, 38, '000000000000000'),
(7, 'Colorante Marek dosis', 'N/C', 2, 39, '000000000000000'),
(7, 'Cajas plÃ¡sticas / cartÃ³n', 'Plasticas', 3, 38, '000000000000000'),
(7, 'Cajas plÃ¡sticas / cartÃ³n', 'Plasticas', 3, 39, '000000000000000'),
(8, 'Conectores â€œYâ€', 'SI', 2, 38, '000000000000000'),
(8, 'Conectores â€œYâ€', 'SI', 2, 39, '000000000000000'),
(8, 'Humedad 60 a 70 % HR', '', 3, 38, '000000000000000'),
(8, 'Humedad 60 a 70 % HR', '', 3, 39, '000000000000000'),
(9, 'Calentador de agua', 'SI', 2, 38, '000000000000000'),
(9, 'Calentador de agua', 'SI', 2, 39, '000000000000000'),
(9, 'PresiÃ³n negativa', 'SI', 3, 38, '000000000000000'),
(9, 'PresiÃ³n negativa', 'SI', 3, 39, '000000000000000'),
(10, 'TermÃ³metro', 'SI', 2, 38, '000000000000000'),
(10, 'TermÃ³metro', 'SI', 2, 39, '000000000000000'),
(10, 'DesinfecciÃ³n post limpieza', 'SI', 3, 38, '000000000000000'),
(10, 'DesinfecciÃ³n post limpieza', 'SI', 3, 39, '000000000000000'),
(11, 'Soporte de ampollas', 'SI', 2, 38, '000000000000000'),
(11, 'Soporte de ampollas', 'SI', 2, 39, '000000000000000'),
(12, 'Jeringas  5 y/o 10 ml', '', 2, 38, '000000000000000'),
(12, 'Jeringas  5 y/o 10 ml', '', 2, 39, '000000000000000'),
(13, 'Alcohol', 'SI', 2, 38, '000000000000000'),
(13, 'Alcohol', 'SI', 2, 39, '000000000000000'),
(14, 'Papel Toalla', 'SI', 2, 38, '000000000000000'),
(14, 'Papel Toalla', 'SI', 2, 39, '000000000000000'),
(15, 'TuberÃ­a nueva para vacuna', '', 2, 38, '000000000000000'),
(15, 'TuberÃ­a nueva para vacuna', '', 2, 39, '000000000000000'),
(16, 'Esterilizador/Autoclave', '', 2, 38, '000000000000000'),
(16, 'Esterilizador/Autoclave', '', 2, 39, '000000000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_inspeccion_funcionamiento`
--

CREATE TABLE `detalle_inspeccion_funcionamiento` (
  `id` int(11) NOT NULL,
  `id_inspeccion` int(11) NOT NULL,
  `criterio_evaluacion` text,
  `estado` tinyint(4) DEFAULT NULL,
  `imei` varchar(18) DEFAULT NULL,
  `id_servicio` int(11) NOT NULL,
  `bueno` int(11) DEFAULT NULL,
  `malo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_inspeccion_funcionamiento`
--

INSERT INTO `detalle_inspeccion_funcionamiento` (`id`, `id_inspeccion`, `criterio_evaluacion`, `estado`, `imei`, `id_servicio`, `bueno`, `malo`) VALUES
(1, 1, 'UBICACION DE MAQUINA', NULL, '000000000000000', 344, 1, 0),
(1, 1, 'UBICACION DE MAQUINA', NULL, '000000000000000', 345, 1, 0),
(2, 1, 'PRESION DE COMPRESORA', NULL, '000000000000000', 344, 1, 0),
(2, 1, 'PRESION DE COMPRESORA', NULL, '000000000000000', 345, 1, 0),
(3, 1, 'PRESION DE MAQUINA', NULL, '000000000000000', 344, 0, 1),
(3, 1, 'PRESION DE MAQUINA', NULL, '000000000000000', 345, 0, 1),
(4, 1, 'ACTIVACION', NULL, '000000000000000', 344, 1, 0),
(4, 1, 'ACTIVACION', NULL, '000000000000000', 345, 1, 0),
(5, 1, 'FUNCIONAMIENTO DE CONTADORES', NULL, '000000000000000', 344, 0, 1),
(5, 1, 'FUNCIONAMIENTO DE CONTADORES', NULL, '000000000000000', 345, 1, 0),
(6, 1, 'FUNCIONAMIENTO DE SILBATO', NULL, '000000000000000', 344, 1, 0),
(6, 1, 'FUNCIONAMIENTO DE SILBATO', NULL, '000000000000000', 345, 1, 0),
(7, 1, 'SALIDA DE AGUJA', NULL, '000000000000000', 344, 1, 0),
(7, 1, 'SALIDA DE AGUJA', NULL, '000000000000000', 345, 1, 0),
(8, 1, 'CALIBRACION', NULL, '000000000000000', 344, 1, 0),
(8, 1, 'CALIBRACION', NULL, '000000000000000', 345, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_inspeccion_visual`
--

CREATE TABLE `detalle_inspeccion_visual` (
  `id` int(11) NOT NULL,
  `id_inspeccion` int(11) NOT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `descripcion` text,
  `estado` tinyint(4) DEFAULT NULL,
  `imei` varchar(18) DEFAULT NULL,
  `id_servicio` int(11) NOT NULL,
  `bueno` text,
  `regular` text,
  `malo` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_inspeccion_visual`
--

INSERT INTO `detalle_inspeccion_visual` (`id`, `id_inspeccion`, `codigo`, `descripcion`, `estado`, `imei`, `id_servicio`, `bueno`, `regular`, `malo`) VALUES
(1, 1, 'AV-131', 'BASE DE ALUMINIO', NULL, '000000000000000', 344, '0', '1', '0'),
(1, 1, 'AV-131', 'BASE DE ALUMINIO', NULL, '000000000000000', 345, '1', '0', '0'),
(2, 1, 'AV-1331', 'BLOQUE POSTERIOR', NULL, '000000000000000', 344, '0', '1', '0'),
(2, 1, 'AV-1331', 'BLOQUE POSTERIOR', NULL, '000000000000000', 345, '1', '0', '0'),
(3, 1, 'AV-13413', 'BLOQUE DE CILINDRO DE FUERZA', NULL, '000000000000000', 344, '1', '0', '0'),
(3, 1, 'AV-13413', 'BLOQUE DE CILINDRO DE FUERZA', NULL, '000000000000000', 345, '1', '0', '0'),
(4, 1, 'AV-13421', 'BLOQUE DE JERINGA', NULL, '000000000000000', 344, '1', '0', '0'),
(4, 1, 'AV-13421', 'BLOQUE DE JERINGA', NULL, '000000000000000', 345, '1', '0', '0'),
(5, 1, 'AV-13511', 'BLOQUE DELANTERO GUIA', NULL, '000000000000000', 344, '0', '1', '0'),
(5, 1, 'AV-13511', 'BLOQUE DELANTERO GUIA', NULL, '000000000000000', 345, '1', '0', '0'),
(6, 1, 'AV-137', 'VALVULA DE CONTROL', NULL, '000000000000000', 344, '1', '0', '0'),
(6, 1, 'AV-137', 'VALVULA DE CONTROL', NULL, '000000000000000', 345, '1', '0', '0'),
(7, 1, 'AV-1378', 'REPTS. DE VALVULA DE CONTROL', NULL, '000000000000000', 344, '1', '0', '0'),
(7, 1, 'AV-1378', 'REPTS. DE VALVULA DE CONTROL', NULL, '000000000000000', 345, '1', '0', '0'),
(8, 1, 'AV-111', 'PLACA TWIN TOUCH', NULL, '000000000000000', 344, '1', '0', '0'),
(8, 1, 'AV-111', 'PLACA TWIN TOUCH', NULL, '000000000000000', 345, '1', '0', '0'),
(9, 1, 'AV-114', 'BOLITAS DE TEFLON', NULL, '000000000000000', 344, '0', '0', '0'),
(9, 1, 'AV-114', 'BOLITAS DE TEFLON', NULL, '000000000000000', 345, '0', '0', '0'),
(10, 1, 'AV-117', 'CONECTOR DE AIRE DE TWIN SHOT', NULL, '000000000000000', 344, '1', '0', '0'),
(10, 1, 'AV-117', 'CONECTOR DE AIRE DE TWIN SHOT', NULL, '000000000000000', 345, '1', '0', '0'),
(11, 1, 'AV-121', 'SEGURO DE TAPA', NULL, '000000000000000', 344, '1', '0', '0'),
(11, 1, 'AV-121', 'SEGURO DE TAPA', NULL, '000000000000000', 345, '1', '0', '0'),
(12, 1, 'AV-118', 'TUERCAS DE BASE DE ALUMINIO', NULL, '000000000000000', 344, '0', '0', '0'),
(12, 1, 'AV-118', 'TUERCAS DE BASE DE ALUMINIO', NULL, '000000000000000', 345, '0', '0', '0'),
(13, 1, 'AV-1357', 'SEGURO DE VALVULA', NULL, '000000000000000', 344, '1', '0', '0'),
(13, 1, 'AV-1357', 'SEGURO DE VALVULA', NULL, '000000000000000', 345, '1', '0', '0'),
(14, 1, '5647', 'CLAMP DE TUBERIA DE 1/2', NULL, '000000000000000', 344, '1', '0', '0'),
(14, 1, '5647', 'CLAMP DE TUBERIA DE 1/2', NULL, '000000000000000', 345, '1', '0', '0'),
(15, 1, '5548', 'CLAMP DE TUBERIA DE 5/16', NULL, '000000000000000', 344, '0', '0', '1'),
(15, 1, '5548', 'CLAMP DE TUBERIA DE 5/16', NULL, '000000000000000', 345, '1', '0', '0'),
(16, 1, '5732', 'DETECTOR DE POSICION', NULL, '000000000000000', 344, '1', '0', '0'),
(16, 1, '5732', 'DETECTOR DE POSICION', NULL, '000000000000000', 345, '1', '0', '0'),
(17, 1, '3543', 'CONECTOR DE 5/32', NULL, '000000000000000', 344, '0', '1', '0'),
(17, 1, '3543', 'CONECTOR DE 5/32', NULL, '000000000000000', 345, '1', '0', '0'),
(18, 1, 'AV-1346', 'ACOPLADURA COLDER MACHO', NULL, '000000000000000', 344, '0', '1', '0'),
(18, 1, 'AV-1346', 'ACOPLADURA COLDER MACHO', NULL, '000000000000000', 345, '1', '0', '0'),
(19, 1, 'AV-1344', 'CILINDRO DE FUERZA', NULL, '000000000000000', 344, '1', '0', '0'),
(19, 1, 'AV-1344', 'CILINDRO DE FUERZA', NULL, '000000000000000', 345, '1', '0', '0'),
(20, 1, 'AV-1345', 'CILINDRO DE AJUSTE', NULL, '000000000000000', 344, '0', '0', '1'),
(20, 1, 'AV-1345', 'CILINDRO DE AJUSTE', NULL, '000000000000000', 345, '1', '0', '0'),
(21, 1, '5720', 'CONECTOR RAPIDO 5/32', NULL, '000000000000000', 344, '0', '1', '0'),
(21, 1, '5720', 'CONECTOR RAPIDO 5/32', NULL, '000000000000000', 345, '1', '0', '0'),
(22, 1, '5641', 'CONECTOR DE AIRE DE BRONCE', NULL, '000000000000000', 344, '0', '1', '0'),
(22, 1, '5641', 'CONECTOR DE AIRE DE BRONCE', NULL, '000000000000000', 345, '1', '0', '0'),
(23, 1, 'AV-13411', 'SELLO DE CILINDRO DE FUERZA', NULL, '000000000000000', 344, '0', '0', '1'),
(23, 1, 'AV-13411', 'SELLO DE CILINDRO DE FUERZA', NULL, '000000000000000', 345, '1', '0', '0'),
(24, 1, 'AV-13422', 'RETENEDOR DE JERINGA', NULL, '000000000000000', 344, '1', '0', '0'),
(24, 1, 'AV-13422', 'RETENEDOR DE JERINGA', NULL, '000000000000000', 345, '1', '0', '0'),
(25, 1, 'AV-13521', 'SOSTENEDOR DE LA AGUJA', NULL, '000000000000000', 344, '1', '0', '0'),
(25, 1, 'AV-13521', 'SOSTENEDOR DE LA AGUJA', NULL, '000000000000000', 345, '1', '0', '0'),
(26, 1, 'AV-13522', 'TUERCA COLLARIN DE LA AGUJA (bueno)', NULL, '000000000000000', 344, '0', '0', '0'),
(26, 1, 'AV-13522', 'TUERCA COLLARIN DE LA AGUJA (bueno)', NULL, '000000000000000', 345, '0', '0', '0'),
(27, 1, 'AV-1374', 'EMPAQUE O ASIENTO ', NULL, '000000000000000', 344, '0', '0', '0'),
(27, 1, 'AV-1374', 'EMPAQUE O ASIENTO ', NULL, '000000000000000', 345, '0', '0', '0'),
(28, 1, 'AV-1375', 'EMPAQUE O CAPTURA', NULL, '000000000000000', 344, '0', '0', '0'),
(28, 1, 'AV-1375', 'EMPAQUE O CAPTURA', NULL, '000000000000000', 345, '0', '0', '0'),
(29, 1, 'AV-1377', 'BOLITAS DE ACERO ', NULL, '000000000000000', 344, '0', '0', '0'),
(29, 1, 'AV-1377', 'BOLITAS DE ACERO ', NULL, '000000000000000', 345, '0', '0', '0'),
(30, 1, 'AV-1376', 'RESORTES ', NULL, '000000000000000', 344, '0', '0', '0'),
(30, 1, 'AV-1376', 'RESORTES ', NULL, '000000000000000', 345, '0', '0', '0'),
(31, 1, 'AV-13523', 'REGULADORES SALIDA DE AGUJA', NULL, '000000000000000', 344, '1', '0', '0'),
(31, 1, 'AV-13523', 'REGULADORES SALIDA DE AGUJA', NULL, '000000000000000', 345, '1', '0', '0'),
(32, 1, 'AV-1347', 'ACOPLADURA COLDER HEMBRA', NULL, '000000000000000', 344, '1', '0', '0'),
(32, 1, 'AV-1347', 'ACOPLADURA COLDER HEMBRA', NULL, '000000000000000', 345, '1', '0', '0'),
(33, 1, 'AV-230', 'DISTRIBUIDOR DE AIRE', NULL, '000000000000000', 344, '1', '0', '0'),
(33, 1, 'AV-230', 'DISTRIBUIDOR DE AIRE', NULL, '000000000000000', 345, '1', '0', '0'),
(34, 1, 'AV-1032', 'CONECTOR RAPIDO ENTRADA', NULL, '000000000000000', 344, '1', '0', '0'),
(34, 1, 'AV-1032', 'CONECTOR RAPIDO ENTRADA', NULL, '000000000000000', 345, '1', '0', '0'),
(35, 1, '5430', 'SILBATO', NULL, '000000000000000', 344, '1', '0', '0'),
(35, 1, '5430', 'SILBATO', NULL, '000000000000000', 345, '1', '0', '0'),
(36, 1, '5443', 'CONECTOR RAPIDO HEMBRA', NULL, '000000000000000', 344, '1', '0', '0'),
(36, 1, '5443', 'CONECTOR RAPIDO HEMBRA', NULL, '000000000000000', 345, '0', '1', '1'),
(37, 1, '5445', 'CONECTOR RAPIDO MACHO', NULL, '000000000000000', 344, '1', '0', '0'),
(37, 1, '5445', 'CONECTOR RAPIDO MACHO', NULL, '000000000000000', 345, '1', '0', '0'),
(38, 1, '5728', 'VALVULA DE CUATRO SALIDAS', NULL, '000000000000000', 344, '1', '0', '0'),
(38, 1, '5728', 'VALVULA DE CUATRO SALIDAS', NULL, '000000000000000', 345, '1', '0', '0'),
(39, 1, '5700', 'VALVULA DE UNA SALIDA', NULL, '000000000000000', 344, '1', '0', '0'),
(39, 1, '5700', 'VALVULA DE UNA SALIDA', NULL, '000000000000000', 345, '0', '1', '0'),
(40, 1, '5709', ' SUBPLACA SENCILLA', NULL, '000000000000000', 344, '1', '0', '0'),
(40, 1, '5709', ' SUBPLACA SENCILLA', NULL, '000000000000000', 345, '1', '0', '0'),
(41, 1, '5730', 'RELAY SENSOR', NULL, '000000000000000', 344, '1', '0', '0'),
(41, 1, '5730', 'RELAY SENSOR', NULL, '000000000000000', 345, '1', '0', '0'),
(42, 1, '5701', '', NULL, '000000000000000', 344, '1', '0', '0'),
(42, 1, '5701', '', NULL, '000000000000000', 345, '1', '0', '0'),
(43, 1, '5738', 'VALVULA DE LA AGUJA', NULL, '000000000000000', 344, '1', '0', '0'),
(43, 1, '5738', 'VALVULA DE LA AGUJA', NULL, '000000000000000', 345, '1', '0', '0'),
(44, 1, '5703', 'VALVULA DE IMPULSO', NULL, '000000000000000', 344, '1', '0', '0'),
(44, 1, '5703', 'VALVULA DE IMPULSO', NULL, '000000000000000', 345, '1', '0', '0'),
(45, 1, '5600', 'PATAS DE CAUCHO', NULL, '000000000000000', 344, '1', '0', '0'),
(45, 1, '5600', 'PATAS DE CAUCHO', NULL, '000000000000000', 345, '1', '0', '0'),
(46, 1, '5710', 'SWITCH DE TRES POSICIONES', NULL, '000000000000000', 344, '0', '1', '0'),
(46, 1, '5710', 'SWITCH DE TRES POSICIONES', NULL, '000000000000000', 345, '1', '0', '0'),
(47, 1, '5726', 'REGULADOR DE AIRE', NULL, '000000000000000', 344, '1', '0', '0'),
(47, 1, '5726', 'REGULADOR DE AIRE', NULL, '000000000000000', 345, '1', '0', '0'),
(48, 1, '5724', 'MANOMETRO', NULL, '000000000000000', 344, '1', '0', '0'),
(48, 1, '5724', 'MANOMETRO', NULL, '000000000000000', 345, '1', '0', '0'),
(49, 1, '5423', 'CONTADOR TOTAL', NULL, '000000000000000', 344, '1', '0', '0'),
(49, 1, '5423', 'CONTADOR TOTAL', NULL, '000000000000000', 345, '1', '0', '0'),
(50, 1, '5426', 'PROTECTOR DE CONT. TOTAL', NULL, '000000000000000', 344, '0', '1', '0'),
(50, 1, '5426', 'PROTECTOR DE CONT. TOTAL', NULL, '000000000000000', 345, '1', '0', '0'),
(51, 1, '5422', 'CONTADOR PREFIJADO', NULL, '000000000000000', 344, '1', '0', '0'),
(51, 1, '5422', 'CONTADOR PREFIJADO', NULL, '000000000000000', 345, '1', '0', '0'),
(52, 1, '5418', 'RE-ESTABLECEDOR DE CONTADOR', NULL, '000000000000000', 344, '1', '0', '0'),
(52, 1, '5418', 'RE-ESTABLECEDOR DE CONTADOR', NULL, '000000000000000', 345, '1', '0', '0'),
(53, 1, '5425', 'PROTECTOR DE CONT.PREFIJADO', NULL, '000000000000000', 344, '1', '0', '0'),
(53, 1, '5425', 'PROTECTOR DE CONT.PREFIJADO', NULL, '000000000000000', 345, '1', '0', '0'),
(54, 1, 'AV-138', 'JERINGA DESCARTABLE', NULL, '000000000000000', 344, '1', '0', '0'),
(54, 1, 'AV-138', 'JERINGA DESCARTABLE', NULL, '000000000000000', 345, '0', '1', '0'),
(55, 1, '3520', 'TUBERIA PEQUENA ', NULL, '000000000000000', 344, '0', '0', '0'),
(55, 1, '3520', 'TUBERIA PEQUENA ', NULL, '000000000000000', 345, '0', '0', '0'),
(56, 1, 'SV-11155', 'TUBERIA LATEX', NULL, '000000000000000', 344, '0', '0', '0'),
(56, 1, 'SV-11155', 'TUBERIA LATEX', NULL, '000000000000000', 345, '0', '0', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_limpieza`
--

CREATE TABLE `detalle_limpieza` (
  `id` int(11) NOT NULL,
  `id_inspeccion` int(11) NOT NULL,
  `criterio_evaluacion` text,
  `bueno` int(11) DEFAULT NULL,
  `malo` int(11) DEFAULT NULL,
  `imei` varchar(18) DEFAULT NULL,
  `id_servicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_limpieza`
--

INSERT INTO `detalle_limpieza` (`id`, `id_inspeccion`, `criterio_evaluacion`, `bueno`, `malo`, `imei`, `id_servicio`) VALUES
(1, 1, 'MATERIALES UTILIZADOS', 1, 0, '000000000000000', 345),
(1, 2, 'MATERIALES UTILIZADOS', 1, 0, '000000000000000', 344),
(2, 1, 'CAMBIO DE PIEZAS DESCARTABLES', 1, 0, '000000000000000', 345),
(2, 2, 'CAMBIO DE PIEZAS DESCARTABLES', 1, 0, '000000000000000', 344),
(3, 1, 'LIMPIEZA DE PLACA TWIN TOUCH', 1, 0, '000000000000000', 345),
(3, 2, 'LIMPIEZA DE PLACA TWIN TOUCH', 0, 1, '000000000000000', 344),
(4, 1, 'ESTERILIZADO DE VALVULA', 1, 0, '000000000000000', 345),
(4, 2, 'ESTERILIZADO DE VALVULA', 1, 0, '000000000000000', 344),
(5, 1, 'LIMPIEZA DE MODULO INYECTOR', 1, 0, '000000000000000', 345),
(5, 2, 'LIMPIEZA DE MODULO INYECTOR', 1, 0, '000000000000000', 344),
(6, 1, 'LIMPIEZA DE CEREBRO', 1, 0, '000000000000000', 345),
(6, 2, 'LIMPIEZA DE CEREBRO', 0, 1, '000000000000000', 344),
(7, 1, 'SECADO', 1, 0, '000000000000000', 345),
(7, 2, 'SECADO', 1, 0, '000000000000000', 344),
(8, 1, 'PROTECCION', 1, 0, '000000000000000', 345),
(8, 2, 'PROTECCION', 1, 0, '000000000000000', 344);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_puntuacion`
--

CREATE TABLE `detalle_puntuacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `id_puntuacion` int(11) NOT NULL,
  `id_sistema` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_puntuacion`
--

INSERT INTO `detalle_puntuacion` (`id`, `nombre`, `estado`, `id_puntuacion`, `id_sistema`, `imei`) VALUES
(1, 'Comisura', 1, 1, 18, '000000000000000'),
(1, 'Pechuga', 2, 2, 18, '000000000000000'),
(1, 'Fragil', 3, 3, 18, '000000000000000'),
(1, 'A favor de la Bursa', 4, 4, 18, '000000000000000'),
(1, 'Normal', 5, 5, 18, '000000000000000'),
(1, 'Normal', 4, 6, 18, '000000000000000'),
(1, 'Normales', 0, 7, 18, '000000000000000'),
(1, 'Normal', 0, 8, 18, '000000000000000'),
(1, 'Normal', 7, 9, 18, '000000000000000'),
(1, 'Normal', 1, 10, 18, '000000000000000'),
(1, 'LLena', 7, 11, 18, '000000000000000'),
(1, 'Normal', 8, 12, 18, '000000000000000'),
(1, '0', 8, 13, 18, '000000000000000'),
(1, 'Normal', 0, 14, 18, '000000000000000'),
(1, 'Acervulina', 0, 15, 18, '000000000000000'),
(1, 'Normal', 17, 16, 18, '000000000000000'),
(1, 'Reactiva', 10, 17, 18, '000000000000000'),
(1, 'Reactiva', 4, 18, 18, '000000000000000'),
(1, 'Presencia', 127, 19, 18, '000000000000000'),
(2, 'Paladar Duro', 0, 1, 18, '000000000000000'),
(2, 'Pierna', 0, 2, 18, '000000000000000'),
(2, 'Flexible', 0, 3, 18, '000000000000000'),
(2, 'A favor de la Bursa', 0, 4, 18, '000000000000000'),
(2, 'Anormal', 0, 5, 18, '000000000000000'),
(2, 'Normal', 0, 6, 18, '000000000000000'),
(2, 'Aerosaculitis Abdominal', 0, 7, 18, '000000000000000'),
(2, 'Congestionada', 0, 8, 18, '000000000000000'),
(2, 'Congestionado', 0, 9, 18, '000000000000000'),
(2, 'Inflamado', 0, 10, 18, '000000000000000'),
(2, 'Vacia', 0, 11, 18, '000000000000000'),
(2, 'Proventriculitis', 0, 12, 18, '000000000000000'),
(2, '1', 0, 13, 18, '000000000000000'),
(2, 'Enteritis (yeyuno)', 8, 14, 18, '000000000000000'),
(2, 'Maxima', 0, 15, 18, '000000000000000'),
(2, 'Tiflitis Erosiva', 0, 16, 18, '000000000000000'),
(2, 'No reactiva', 0, 17, 18, '000000000000000'),
(2, '', 0, 18, 18, '000000000000000'),
(2, 'Ausencia', 0, 19, 18, '000000000000000'),
(3, 'Paladar Blando', 0, 1, 18, '000000000000000'),
(3, 'Esternon', 0, 2, 18, '000000000000000'),
(3, 'Duro', 0, 3, 18, '000000000000000'),
(3, 'Relacion 1/1', 0, 4, 18, '000000000000000'),
(3, 'Aerosaculitis Toracica', 0, 7, 18, '000000000000000'),
(3, 'Hemorragica', 0, 8, 18, '000000000000000'),
(3, 'Palido Friable', 0, 10, 18, '000000000000000'),
(3, '2', 0, 13, 18, '000000000000000'),
(3, 'Equimosis', 0, 14, 18, '000000000000000'),
(3, 'Tenella', 71, 15, 18, '000000000000000'),
(3, 'Placas diftericas', 0, 16, 18, '000000000000000'),
(4, 'Necrosis de la Punta de la Lengua', 0, 1, 18, '000000000000000'),
(4, 'Con Mucosidad', 0, 8, 18, '000000000000000'),
(4, 'Moteado', 0, 10, 18, '000000000000000'),
(4, '3', 0, 13, 18, '000000000000000'),
(4, 'Desp. Mucosa', 0, 14, 18, '000000000000000'),
(4, 'Necrafix', 0, 15, 18, '000000000000000'),
(4, 'Gaseosos(cont)', 0, 16, 18, '000000000000000'),
(5, 'Punto de exudado', 0, 10, 18, '000000000000000'),
(5, 'Enteritis mucoide', 0, 14, 18, '000000000000000'),
(5, 'Liquido(cont)', 127, 16, 18, '000000000000000'),
(6, 'Transito Rapido', 0, 14, 18, '000000000000000'),
(6, 'Sangre(cont)', 0, 16, 18, '000000000000000'),
(7, 'Gas/espuma', 0, 14, 18, '000000000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `nombre`) VALUES
(1, 'grayhatcorp'),
(2, 'pollos Kiky'),
(3, 'Nano'),
(4, 'Norte Santines'),
(5, 'isolmedia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galpon`
--

CREATE TABLE `galpon` (
  `id` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_granja` int(11) NOT NULL,
  `cantidad_pollo` int(11) DEFAULT NULL,
  `codigo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `galpon`
--

INSERT INTO `galpon` (`id`, `id_empresa`, `id_granja`, `cantidad_pollo`, `codigo`) VALUES
(1, 1, 1, 100, 'A1'),
(8, 2, 2, 150, 'A1'),
(9, 2, 2, 156, 'A2'),
(10, 1, 1, 100, 'A2'),
(11, 1, 1, 100, 'A3'),
(12, 1, 1, 100, 'A4'),
(13, 1, 1, 100, 'A5'),
(14, 1, 1, 100, 'A6'),
(15, 1, 1, 100, 'A7'),
(16, 1, 1, 100, 'A8'),
(17, 1, 1, 100, 'A9'),
(18, 1, 1, 100, 'B1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `granja`
--

CREATE TABLE `granja` (
  `id` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `zona` text,
  `nombre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `granja`
--

INSERT INTO `granja` (`id`, `id_empresa`, `zona`, `nombre`) VALUES
(1, 1, 'Los MOntes.', 'TOk'),
(2, 2, 'Los mangales', 'Fane'),
(3, 1, 'Los Prado.', 'Tonki'),
(4, 1, 'El Tajibo.', 'Frame'),
(5, 1, 'El Brillante.', 'Brilan'),
(6, 2, 'Ciudad de Montero', 'SinBa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hoja_verificacion`
--

CREATE TABLE `hoja_verificacion` (
  `id` int(11) NOT NULL,
  `hora_ingreso` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `revision` varchar(20) DEFAULT NULL,
  `firma_invetsa` text,
  `firma_empresa` text,
  `productividad` decimal(4,2) DEFAULT NULL,
  `sumatoria_manipulacion_vacuna` decimal(10,2) DEFAULT NULL,
  `promedio_mantenimiento` decimal(10,2) DEFAULT NULL,
  `puntaje_control_indice` decimal(10,2) DEFAULT NULL,
  `id_unidad` int(11) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_sqlite` int(11) DEFAULT NULL,
  `imei` varchar(18) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_tecnico` int(11) DEFAULT NULL,
  `imagen_jefe` text,
  `responsable_invetsa` text,
  `responsable_incubadora` text,
  `total_vc` decimal(10,2) DEFAULT NULL,
  `puntaje_total` decimal(10,2) DEFAULT NULL,
  `irregularidad_15` text,
  `recomendaciones` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hoja_verificacion`
--

INSERT INTO `hoja_verificacion` (`id`, `hora_ingreso`, `hora_salida`, `codigo`, `revision`, `firma_invetsa`, `firma_empresa`, `productividad`, `sumatoria_manipulacion_vacuna`, `promedio_mantenimiento`, `puntaje_control_indice`, `id_unidad`, `id_empresa`, `id_sqlite`, `imei`, `fecha`, `id_tecnico`, `imagen_jefe`, `responsable_invetsa`, `responsable_incubadora`, `total_vc`, `puntaje_total`, `irregularidad_15`, `recomendaciones`) VALUES
(38, '09:40:00', '21:40:00', 'R.51', '00', 'hoja_verificacion/firma/38_firma_invetsa_2017-4-21.txt', 'hoja_verificacion/firma/38_firma_empresa_2017-4-21.txt', '0.00', '0.20', '0.00', '0.00', 2, 1, 1, '000000000000000', '2017-04-21', 3, 'hoja_verificacion/imagen/38_foto_jefe_2017-4-21.txt', 'faesf', 'asd', '0.00', '0.00', 'asdfasdf', NULL),
(39, '00:00:00', '00:00:00', 'R.51', '00', 'hoja_verificacion/firma/39_firma_invetsa_2017-4-22.txt', 'hoja_verificacion/firma/39_firma_empresa_2017-4-22.txt', '0.00', '0.10', '0.00', '0.00', 2, 1, 38, '000000000000000', '2017-04-22', 3, 'hoja_verificacion/imagen/39_foto_jefe_2017-4-22.txt', 'asdfasd', 'asdf', '0.00', '0.00', 'asdf', 'cvbnvbn');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspeccion_funcionamiento`
--

CREATE TABLE `inspeccion_funcionamiento` (
  `id` int(11) NOT NULL,
  `observaciones` text,
  `frecuencia_de_uso` text,
  `id_servicio` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inspeccion_funcionamiento`
--

INSERT INTO `inspeccion_funcionamiento` (`id`, `observaciones`, `frecuencia_de_uso`, `id_servicio`, `imei`) VALUES
(1, 'ninguna', 'binfun', 344, '000000000000000'),
(1, 'ASDF', 'SF', 345, '000000000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspeccion_visual`
--

CREATE TABLE `inspeccion_visual` (
  `id` int(11) NOT NULL,
  `observaciones` text,
  `piezas_cambiadas` text,
  `id_servicio` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inspeccion_visual`
--

INSERT INTO `inspeccion_visual` (`id`, `observaciones`, `piezas_cambiadas`, `id_servicio`, `imei`) VALUES
(1, 'ninguna', 'un motor', 344, '000000000000000'),
(1, 'ASDF', 'ASDF', 345, '000000000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `limpieza`
--

CREATE TABLE `limpieza` (
  `id` int(11) NOT NULL,
  `observaciones` text,
  `cantidad_aves_vacunadas` text,
  `id_servicio` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `limpieza`
--

INSERT INTO `limpieza` (`id`, `observaciones`, `cantidad_aves_vacunadas`, `id_servicio`, `imei`) VALUES
(1, 'SADF', 'ASDF', 345, '000000000000000'),
(2, 'limpieza conpkleta', '15 aves', 344, '000000000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea_genetica`
--

CREATE TABLE `linea_genetica` (
  `id` int(11) NOT NULL,
  `descripcion` text,
  `cobb` text,
  `ross` text,
  `hybro` text,
  `id_hoja_verificacion` int(11) NOT NULL,
  `imei` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `linea_genetica`
--

INSERT INTO `linea_genetica` (`id`, `descripcion`, `cobb`, `ross`, `hybro`, `id_hoja_verificacion`, `imei`) VALUES
(0, 'Nro de nacimientos / semana', '2 (M y S)', 'Ross - Cobb', '', 38, '000000000000000'),
(0, 'Nro de nacimientos / semana', '2 (M y S)', 'Ross - Cobb', '', 39, '000000000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manipulacion_dilucion`
--

CREATE TABLE `manipulacion_dilucion` (
  `id` int(11) NOT NULL,
  `descripcion` text,
  `puntaje` decimal(2,2) DEFAULT NULL,
  `id_hoja_verificacion` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `manipulacion_dilucion`
--

INSERT INTO `manipulacion_dilucion` (`id`, `descripcion`, `puntaje`, `id_hoja_verificacion`, `imei`) VALUES
(1, 'VerificaciÃ³n del nivel de nitrÃ³geno en formato (mÃ­nimo 6 pulgadas), obligatorio los dÃ­as de vacunaciÃ³n       15  pulg.', '0.00', 38, '000000000000000'),
(1, 'VerificaciÃ³n del nivel de nitrÃ³geno en formato (mÃ­nimo 6 pulgadas), obligatorio los dÃ­as de vacunaciÃ³n       15  pulg.', '0.00', 39, '000000000000000'),
(2, 'Diluyente usado en buenas condiciones rojo y. transparente              Gentamicina 10%  9 ml  x  800ml ', '0.00', 38, '000000000000000'),
(2, 'Diluyente usado en buenas condiciones rojo y. transparente              Gentamicina 10%  9 ml  x  800ml ', '0.00', 39, '000000000000000'),
(3, 'Jeringas descartables individuales para cada tipo de vacuna, colorante y antibiÃ³tico    (no usan) (Lab. Invesa)', '0.00', 38, '000000000000000'),
(3, 'Jeringas descartables individuales para cada tipo de vacuna, colorante y antibiÃ³tico    (no usan) (Lab. Invesa)', '0.00', 39, '000000000000000'),
(4, 'Tiempo mÃ­nimo para aÃ±adir antibiÃ³tico y colorante antes de preparar la vacuna  15 minutos', '0.10', 38, '000000000000000'),
(4, 'Tiempo mÃ­nimo para aÃ±adir antibiÃ³tico y colorante antes de preparar la vacuna  15 minutos', '0.00', 39, '000000000000000'),
(5, 'Uso de colorante y dosis de 0.5 ml para bolsas 200 y 400 ml , 1 ml para 800 ml y 1.5 ml para 1200 y 1600 ml', '0.00', 38, '000000000000000'),
(5, 'Uso de colorante y dosis de 0.5 ml para bolsas 200 y 400 ml , 1 ml para 800 ml y 1.5 ml para 1200 y 1600 ml', '0.00', 39, '000000000000000'),
(6, 'Jeringa cargada con 2 ml de diluyente para extraer la vacuna ya descongelada ', '0.00', 38, '000000000000000'),
(6, 'Jeringa cargada con 2 ml de diluyente para extraer la vacuna ya descongelada ', '0.00', 39, '000000000000000'),
(7, 'Uso de guantes y protector ocular para manipulaciÃ³n de vacunas congeladas al retirar la vacuna del tanque ', '0.00', 38, '000000000000000'),
(7, 'Uso de guantes y protector ocular para manipulaciÃ³n de vacunas congeladas al retirar la vacuna del tanque ', '0.00', 39, '000000000000000'),
(8, 'Buenas condiciones de funcionamiento del Invetsa-temp de 27 a 37 Âº C (promedio 32Âº C)', '0.00', 38, '000000000000000'),
(8, 'Buenas condiciones de funcionamiento del Invetsa-temp de 27 a 37 Âº C (promedio 32Âº C)', '0.00', 39, '000000000000000'),
(9, 'Numero de ampollas retiradas por vez para descongelaciÃ³n, mÃ¡ximo 2 ampollas     2 ampollas', '0.00', 38, '000000000000000'),
(9, 'Numero de ampollas retiradas por vez para descongelaciÃ³n, mÃ¡ximo 2 ampollas     2 ampollas', '0.10', 39, '000000000000000'),
(10, 'Tiempo mÃ¡ximo para descongelamiento de la ampolla de 1 minuto y reconstituciÃ³n en diluyente 30 segundos', '0.00', 38, '000000000000000'),
(10, 'Tiempo mÃ¡ximo para descongelamiento de la ampolla de 1 minuto y reconstituciÃ³n en diluyente 30 segundos', '0.00', 39, '000000000000000'),
(11, 'Uso de pajilla de aluminio para descongelamiento de las ampollas en el agua, evita introducir la mano en el agua', '0.00', 38, '000000000000000'),
(11, 'Uso de pajilla de aluminio para descongelamiento de las ampollas en el agua, evita introducir la mano en el agua', '0.00', 39, '000000000000000'),
(12, 'Favorecer el descongelamiento de la ampolla en forma suave (movimiento circulares y verticales)', '0.00', 38, '000000000000000'),
(12, 'Favorecer el descongelamiento de la ampolla en forma suave (movimiento circulares y verticales)', '0.00', 39, '000000000000000'),
(13, 'Secar las ampollas con papel toalla y usar el rompe ampollas', '0.00', 38, '000000000000000'),
(13, 'Secar las ampollas con papel toalla y usar el rompe ampollas', '0.00', 39, '000000000000000'),
(14, 'Uso del soporte de ampollas, absorciÃ³n y reconstituciÃ³n de la vacuna en el diluyente suave y sin presiÃ³n en Jeringa', '0.00', 38, '000000000000000'),
(14, 'Uso del soporte de ampollas, absorciÃ³n y reconstituciÃ³n de la vacuna en el diluyente suave y sin presiÃ³n en Jeringa', '0.00', 39, '000000000000000'),
(15, 'Uso de aguja adecuada para la extracciÃ³n de la vacuna, 18 G x 1 Â½â€ (color rosado)', '0.00', 38, '000000000000000'),
(15, 'Uso de aguja adecuada para la extracciÃ³n de la vacuna, 18 G x 1 Â½â€ (color rosado)', '0.00', 39, '000000000000000'),
(16, 'RealizaciÃ³n de enjuague de ampollas (incluye cuerpo y tapa de la ampolla)', '0.00', 38, '000000000000000'),
(16, 'RealizaciÃ³n de enjuague de ampollas (incluye cuerpo y tapa de la ampolla)', '0.00', 39, '000000000000000'),
(17, 'Secuencia correcta de preparaciÃ³n de la vacuna (antibiÃ³tico, colorante y 15 minutos despuÃ©s  vacunas congeladas)', '0.10', 38, '000000000000000'),
(17, 'Secuencia correcta de preparaciÃ³n de la vacuna (antibiÃ³tico, colorante y 15 minutos despuÃ©s  vacunas congeladas)', '0.00', 39, '000000000000000'),
(18, 'Tiempo de consumo de la soluciÃ³n vacunal preparada mÃ¡ximo 45 minutos y homogenizar la vacuna cada 10 minut.', '0.00', 38, '000000000000000'),
(18, 'Tiempo de consumo de la soluciÃ³n vacunal preparada mÃ¡ximo 45 minutos y homogenizar la vacuna cada 10 minut.', '0.00', 39, '000000000000000'),
(19, 'Perfecta distribuciÃ³n de las mangueras que conducen la vacuna (levemente estiradas, evitando el efecto hamaca)', '0.00', 38, '000000000000000'),
(19, 'Perfecta distribuciÃ³n de las mangueras que conducen la vacuna (levemente estiradas, evitando el efecto hamaca)', '0.00', 39, '000000000000000'),
(20, 'Conteo celular - % de Viabilidad mayor a 86 %  Vaxxitek  x  4000 ds  Serie RM 470   Vence 13-07-18 ', '0.00', 38, '000000000000000'),
(20, 'Conteo celular - % de Viabilidad mayor a 86 %  Vaxxitek  x  4000 ds  Serie RM 470   Vence 13-07-18 ', '0.00', 39, '000000000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento_limpieza`
--

CREATE TABLE `mantenimiento_limpieza` (
  `id` int(11) NOT NULL,
  `nro_maquina` int(11) DEFAULT NULL,
  `id_hoja_verificacion` int(11) NOT NULL,
  `id_vacunador` int(11) NOT NULL,
  `imei` text,
  `irregularidad1` int(11) NOT NULL DEFAULT '0',
  `irregularidad2` int(11) NOT NULL DEFAULT '0',
  `irregularidad3` int(11) NOT NULL DEFAULT '0',
  `irregularidad4` int(11) NOT NULL DEFAULT '0',
  `irregularidad5` int(11) NOT NULL DEFAULT '0',
  `irregularidad6` int(11) DEFAULT '0',
  `irregularidad7` int(11) NOT NULL DEFAULT '0',
  `irregularidad8` int(11) NOT NULL DEFAULT '0',
  `irregularidad9` int(11) NOT NULL DEFAULT '0',
  `irregularidad10` int(11) NOT NULL DEFAULT '0',
  `irregularidad11` int(11) NOT NULL DEFAULT '0',
  `irregularidad12` int(11) NOT NULL DEFAULT '0',
  `irregularidad13` int(11) NOT NULL DEFAULT '0',
  `irregularidad14` int(11) NOT NULL DEFAULT '0',
  `irregularidad15` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mantenimiento_limpieza`
--

INSERT INTO `mantenimiento_limpieza` (`id`, `nro_maquina`, `id_hoja_verificacion`, `id_vacunador`, `imei`, `irregularidad1`, `irregularidad2`, `irregularidad3`, `irregularidad4`, `irregularidad5`, `irregularidad6`, `irregularidad7`, `irregularidad8`, `irregularidad9`, `irregularidad10`, `irregularidad11`, `irregularidad12`, `irregularidad13`, `irregularidad14`, `irregularidad15`) VALUES
(0, 2, 38, 1, '000000000000000', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(0, 2, 39, 1, '000000000000000', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(0, 1, 38, 5, '000000000000000', 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(0, 1, 39, 5, '000000000000000', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquina`
--

CREATE TABLE `maquina` (
  `id` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `maquina`
--

INSERT INTO `maquina` (`id`, `codigo`, `nombre`) VALUES
(1, 'A001', 'xyz'),
(2, 'A002', 'stll'),
(3, 'A003', 'franz'),
(4, 'A004', 'AXC'),
(5, 'A005', 'AXCD-1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peso`
--

CREATE TABLE `peso` (
  `id` int(11) NOT NULL,
  `peso_corporal` decimal(2,2) DEFAULT NULL,
  `peso_bursa` decimal(2,2) DEFAULT NULL,
  `peso_brazo` decimal(2,2) DEFAULT NULL,
  `peso_timo` decimal(2,2) DEFAULT NULL,
  `peso_higado` decimal(2,2) DEFAULT NULL,
  `indice_bursal` decimal(4,2) DEFAULT NULL,
  `indice_timico` decimal(4,2) DEFAULT NULL,
  `indice_hepatico` decimal(4,2) DEFAULT NULL,
  `bursometro` decimal(4,2) DEFAULT NULL,
  `id_sistema` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `peso`
--

INSERT INTO `peso` (`id`, `peso_corporal`, `peso_bursa`, `peso_brazo`, `peso_timo`, `peso_higado`, `indice_bursal`, `indice_timico`, `indice_hepatico`, `bursometro`, `id_sistema`, `imei`) VALUES
(1, '0.00', '0.00', '0.10', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 18, '000000000000000'),
(2, '0.00', '0.00', '0.80', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 18, '000000000000000'),
(3, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 18, '000000000000000'),
(4, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 18, '000000000000000'),
(5, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 18, '000000000000000'),
(6, '0.00', '0.00', '0.90', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 18, '000000000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntuacion`
--

CREATE TABLE `puntuacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `id_sistema` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `puntuacion`
--

INSERT INTO `puntuacion` (`id`, `nombre`, `id_sistema`, `imei`) VALUES
(1, 'Pico(aftas)', 18, '000000000000000'),
(2, 'Petequias', 18, '000000000000000'),
(3, 'Tarsos', 18, '000000000000000'),
(4, 'Relacion Morfomotrica Bursa/Bazo', 18, '000000000000000'),
(5, 'Apariencia de los Pliegues Internos de la Bursa', 18, '000000000000000'),
(6, 'Tamano y Apariencia del Timo', 18, '000000000000000'),
(7, 'Sacos Aereos', 18, '000000000000000'),
(8, 'Traquea', 18, '000000000000000'),
(9, 'Cornetes Nasales', 18, '000000000000000'),
(10, 'Higados', 18, '000000000000000'),
(11, 'Vesicula Biliar', 18, '000000000000000'),
(12, 'Proventriculo', 18, '000000000000000'),
(13, 'Ulceracion de Mollejas', 18, '000000000000000'),
(14, 'Intestinos', 18, '000000000000000'),
(15, 'Coccidia', 18, '000000000000000'),
(16, 'Ciegos', 18, '000000000000000'),
(17, 'Tonsillas lleocecales', 18, '000000000000000'),
(18, 'Placa de Peyer', 18, '000000000000000'),
(19, 'Necrosis cabeza de Femur', 18, '000000000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_mantenimiento`
--

CREATE TABLE `servicio_mantenimiento` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora_ingreso` time DEFAULT NULL,
  `hora_salidas` time DEFAULT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `revision` varchar(20) DEFAULT NULL,
  `firma_jefe_planta` text,
  `firma_invetsa` text,
  `id_maquina` int(11) DEFAULT NULL,
  `id_tecnico` int(11) DEFAULT NULL,
  `id_compania` int(11) DEFAULT NULL,
  `id_sqlite` int(11) NOT NULL,
  `imei` varchar(18) NOT NULL,
  `formulario` text,
  `imagen_jefe` text,
  `jefe_planta` text,
  `encargado_maquina` text,
  `ultima_visita` text,
  `planta_de_incubacion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `servicio_mantenimiento`
--

INSERT INTO `servicio_mantenimiento` (`id`, `fecha`, `hora_ingreso`, `hora_salidas`, `codigo`, `revision`, `firma_jefe_planta`, `firma_invetsa`, `id_maquina`, `id_tecnico`, `id_compania`, `id_sqlite`, `imei`, `formulario`, `imagen_jefe`, `jefe_planta`, `encargado_maquina`, `ultima_visita`, `planta_de_incubacion`) VALUES
(344, '2017-04-21', '00:00:00', '00:00:00', 'R.53', '00', 'servicio_mantenimiento/firma/344_firma_empresa_2017-4-21.txt', 'servicio_mantenimiento/firma/344_firma_invetsa_2017-4-21.txt', 3, 1, 3, 258, '000000000000000', 'TWIN SHOT', 'servicio_mantenimiento/imagen/344_foto_jefe_2017-4-21.txt', 'asdf', 'asdf', 'dfs', 'dfs'),
(345, '2017-04-22', '00:00:00', '00:00:00', 'R.53', '00', 'servicio_mantenimiento/firma/345_firma_empresa_2017-4-22.txt', 'servicio_mantenimiento/firma/345_firma_invetsa_2017-4-22.txt', 4, 3, 3, 1, '000000000000000', 'TWIN SHOT', 'servicio_mantenimiento/imagen/345_foto_jefe_2017-4-22.txt', 'sadASDF', 'ASDFAS', 'SDF', 'SDF');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_integral`
--

CREATE TABLE `sistema_integral` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `revision` varchar(20) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `observaciones` text,
  `fecha` date DEFAULT NULL,
  `nro_pollos` int(11) DEFAULT NULL,
  `imagen1` text,
  `imagen2` text,
  `imagen3` text,
  `imagen4` text,
  `imagen5` text,
  `id_galpon` int(11) DEFAULT NULL,
  `id_granja` int(11) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_sqlite` varchar(18) DEFAULT NULL,
  `imei` varchar(18) DEFAULT NULL,
  `firma_invetsa` text,
  `firma_empresa` text,
  `id_tecnico` int(11) DEFAULT NULL,
  `imagen_jefe` text,
  `referencia` text NOT NULL,
  `comentarios` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sistema_integral`
--

INSERT INTO `sistema_integral` (`id`, `codigo`, `revision`, `edad`, `sexo`, `observaciones`, `fecha`, `nro_pollos`, `imagen1`, `imagen2`, `imagen3`, `imagen4`, `imagen5`, `id_galpon`, `id_granja`, `id_empresa`, `id_sqlite`, `imei`, `firma_invetsa`, `firma_empresa`, `id_tecnico`, `imagen_jefe`, `referencia`, `comentarios`) VALUES
(18, 'R.50', '00', 10, 'f', 'ninguna', '2017-04-21', 0, 'sistema_integral_de_monitoreo/imagen/18_imagen_1_2017-4-21.txt', 'sistema_integral_de_monitoreo/imagen/18_imagen_2_2017-4-21.txt', 'sistema_integral_de_monitoreo/imagen/18_imagen_3_2017-4-21.txt', 'sistema_integral_de_monitoreo/imagen/18_imagen_4_2017-4-21.txt', 'sistema_integral_de_monitoreo/imagen/18_imagen_5_2017-4-21.txt', 1, 1, 1, '9', '000000000000000', 'sistema_integral_de_monitoreo/firma/18_firma_invetsa_2017-4-21.txt', 'sistema_integral_de_monitoreo/firma/18_firma_empresa_2017-4-21.txt', 1, 'sistema_integral_de_monitoreo/imagen/18_foto_jefe_2017-4-21.txt', 'ninguna', 'comebtaieioa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico`
--

CREATE TABLE `tecnico` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tecnico`
--

INSERT INTO `tecnico` (`id`, `nombre`, `codigo`) VALUES
(1, 'edgar Elio', 1234),
(2, 'Fernando', 12345),
(3, 'Fernando', 1000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad`
--

CREATE TABLE `unidad` (
  `id` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `nombre` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`id`, `id_empresa`, `nombre`) VALUES
(2, 1, 'vallibian 1\r\n'),
(3, 1, 'vallibian 2\r\n'),
(4, 1, 'vallibian 3\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacunador`
--

CREATE TABLE `vacunador` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vacunador`
--

INSERT INTO `vacunador` (`id`, `nombre`) VALUES
(1, 'Caleft'),
(2, 'Maria'),
(3, 'Efrain'),
(4, 'Carla'),
(5, 'Bertha'),
(6, 'Noemi'),
(7, 'Peni'),
(8, 'Elizabeth'),
(9, 'Roly'),
(10, 'Heber'),
(11, 'Jaime'),
(12, 'Sara'),
(13, 'Emanuel'),
(14, 'Pedro'),
(15, 'Elio'),
(16, 'Edgar'),
(17, 'Serii'),
(18, 'Carlos'),
(19, 'Perlita'),
(20, 'Gari'),
(21, 'Carlos Rosmery');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viabilidad_celular`
--

CREATE TABLE `viabilidad_celular` (
  `id` int(11) NOT NULL,
  `antibiotico` text,
  `dosis` text,
  `tiempo` text,
  `vc` decimal(10,2) DEFAULT NULL,
  `id_hoja_verificacion` int(11) NOT NULL,
  `imei` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `viabilidad_celular`
--

INSERT INTO `viabilidad_celular` (`id`, `antibiotico`, `dosis`, `tiempo`, `vc`, `id_hoja_verificacion`, `imei`) VALUES
(1, '', '', '', '0.00', 38, '000000000000000'),
(2, '', '', '', '0.00', 38, '000000000000000'),
(3, '', '', '', '0.00', 38, '000000000000000'),
(4, '', '', '', '0.00', 38, '000000000000000'),
(1, '', '', '', '4.00', 39, '000000000000000'),
(2, '', '', '', '4.00', 39, '000000000000000'),
(3, '', '', '', '4.00', 39, '000000000000000'),
(4, '', '', '', '8.00', 39, '000000000000000');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accion`
--
ALTER TABLE `accion`
  ADD PRIMARY KEY (`id`,`id_hoja_verificacion`),
  ADD KEY `id_hoja_verificacion` (`id_hoja_verificacion`);

--
-- Indices de la tabla `centros`
--
ALTER TABLE `centros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compania`
--
ALTER TABLE `compania`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `control_indice`
--
ALTER TABLE `control_indice`
  ADD PRIMARY KEY (`id`,`id_hoja_verificacion`),
  ADD KEY `id_hoja_verificacion` (`id_hoja_verificacion`),
  ADD KEY `id_vacunador` (`id_vacunador`);

--
-- Indices de la tabla `detalle_accion`
--
ALTER TABLE `detalle_accion`
  ADD PRIMARY KEY (`id`,`id_accion`,`id_hoja_verificacion`),
  ADD KEY `id_accion` (`id_accion`,`id_hoja_verificacion`);

--
-- Indices de la tabla `detalle_inspeccion_funcionamiento`
--
ALTER TABLE `detalle_inspeccion_funcionamiento`
  ADD PRIMARY KEY (`id`,`id_inspeccion`,`id_servicio`),
  ADD KEY `id_inspeccion` (`id_inspeccion`,`id_servicio`);

--
-- Indices de la tabla `detalle_inspeccion_visual`
--
ALTER TABLE `detalle_inspeccion_visual`
  ADD PRIMARY KEY (`id`,`id_inspeccion`,`id_servicio`),
  ADD KEY `id_inspeccion` (`id_inspeccion`,`id_servicio`);

--
-- Indices de la tabla `detalle_limpieza`
--
ALTER TABLE `detalle_limpieza`
  ADD PRIMARY KEY (`id`,`id_inspeccion`,`id_servicio`),
  ADD KEY `id_inspeccion` (`id_inspeccion`,`id_servicio`);

--
-- Indices de la tabla `detalle_puntuacion`
--
ALTER TABLE `detalle_puntuacion`
  ADD PRIMARY KEY (`id`,`id_puntuacion`,`id_sistema`),
  ADD KEY `id_puntuacion` (`id_puntuacion`,`id_sistema`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `galpon`
--
ALTER TABLE `galpon`
  ADD PRIMARY KEY (`id`,`id_granja`,`id_empresa`),
  ADD KEY `id_granja` (`id_granja`,`id_empresa`);

--
-- Indices de la tabla `granja`
--
ALTER TABLE `granja`
  ADD PRIMARY KEY (`id`,`id_empresa`),
  ADD KEY `id_empresa` (`id_empresa`);

--
-- Indices de la tabla `hoja_verificacion`
--
ALTER TABLE `hoja_verificacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tecnico` (`id_tecnico`),
  ADD KEY `id_unidad` (`id_unidad`,`id_empresa`);

--
-- Indices de la tabla `inspeccion_funcionamiento`
--
ALTER TABLE `inspeccion_funcionamiento`
  ADD PRIMARY KEY (`id`,`id_servicio`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `inspeccion_visual`
--
ALTER TABLE `inspeccion_visual`
  ADD PRIMARY KEY (`id`,`id_servicio`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `limpieza`
--
ALTER TABLE `limpieza`
  ADD PRIMARY KEY (`id`,`id_servicio`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `linea_genetica`
--
ALTER TABLE `linea_genetica`
  ADD PRIMARY KEY (`id`,`id_hoja_verificacion`),
  ADD KEY `id_hoja_verificacion` (`id_hoja_verificacion`);

--
-- Indices de la tabla `manipulacion_dilucion`
--
ALTER TABLE `manipulacion_dilucion`
  ADD PRIMARY KEY (`id`,`id_hoja_verificacion`),
  ADD KEY `id_hoja_verificacion` (`id_hoja_verificacion`);

--
-- Indices de la tabla `mantenimiento_limpieza`
--
ALTER TABLE `mantenimiento_limpieza`
  ADD PRIMARY KEY (`id`,`id_vacunador`,`id_hoja_verificacion`),
  ADD KEY `id_hoja_verificacion` (`id_hoja_verificacion`),
  ADD KEY `id_vacunador` (`id_vacunador`);

--
-- Indices de la tabla `maquina`
--
ALTER TABLE `maquina`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `peso`
--
ALTER TABLE `peso`
  ADD PRIMARY KEY (`id`,`id_sistema`),
  ADD KEY `id_sistema` (`id_sistema`);

--
-- Indices de la tabla `puntuacion`
--
ALTER TABLE `puntuacion`
  ADD PRIMARY KEY (`id`,`id_sistema`),
  ADD KEY `id_sistema` (`id_sistema`);

--
-- Indices de la tabla `servicio_mantenimiento`
--
ALTER TABLE `servicio_mantenimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_maquina` (`id_maquina`),
  ADD KEY `id_tecnico` (`id_tecnico`),
  ADD KEY `id_compania` (`id_compania`);

--
-- Indices de la tabla `sistema_integral`
--
ALTER TABLE `sistema_integral`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tecnico` (`id_tecnico`),
  ADD KEY `id_galpon` (`id_galpon`,`id_granja`,`id_empresa`);

--
-- Indices de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unidad`
--
ALTER TABLE `unidad`
  ADD PRIMARY KEY (`id`,`id_empresa`),
  ADD KEY `id_empresa` (`id_empresa`);

--
-- Indices de la tabla `vacunador`
--
ALTER TABLE `vacunador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `viabilidad_celular`
--
ALTER TABLE `viabilidad_celular`
  ADD KEY `viabilidad_celular_ibfk_1` (`id_hoja_verificacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compania`
--
ALTER TABLE `compania`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `detalle_inspeccion_funcionamiento`
--
ALTER TABLE `detalle_inspeccion_funcionamiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `detalle_inspeccion_visual`
--
ALTER TABLE `detalle_inspeccion_visual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `galpon`
--
ALTER TABLE `galpon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `granja`
--
ALTER TABLE `granja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `hoja_verificacion`
--
ALTER TABLE `hoja_verificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT de la tabla `maquina`
--
ALTER TABLE `maquina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `servicio_mantenimiento`
--
ALTER TABLE `servicio_mantenimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=346;
--
-- AUTO_INCREMENT de la tabla `sistema_integral`
--
ALTER TABLE `sistema_integral`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `unidad`
--
ALTER TABLE `unidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `vacunador`
--
ALTER TABLE `vacunador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accion`
--
ALTER TABLE `accion`
  ADD CONSTRAINT `accion_ibfk_1` FOREIGN KEY (`id_hoja_verificacion`) REFERENCES `hoja_verificacion` (`id`);

--
-- Filtros para la tabla `control_indice`
--
ALTER TABLE `control_indice`
  ADD CONSTRAINT `control_indice_ibfk_1` FOREIGN KEY (`id_hoja_verificacion`) REFERENCES `hoja_verificacion` (`id`),
  ADD CONSTRAINT `control_indice_ibfk_2` FOREIGN KEY (`id_vacunador`) REFERENCES `vacunador` (`id`);

--
-- Filtros para la tabla `detalle_accion`
--
ALTER TABLE `detalle_accion`
  ADD CONSTRAINT `detalle_accion_ibfk_1` FOREIGN KEY (`id_accion`,`id_hoja_verificacion`) REFERENCES `accion` (`id`, `id_hoja_verificacion`);

--
-- Filtros para la tabla `detalle_inspeccion_funcionamiento`
--
ALTER TABLE `detalle_inspeccion_funcionamiento`
  ADD CONSTRAINT `detalle_inspeccion_funcionamiento_ibfk_1` FOREIGN KEY (`id_inspeccion`,`id_servicio`) REFERENCES `inspeccion_funcionamiento` (`id`, `id_servicio`);

--
-- Filtros para la tabla `detalle_inspeccion_visual`
--
ALTER TABLE `detalle_inspeccion_visual`
  ADD CONSTRAINT `detalle_inspeccion_visual_ibfk_1` FOREIGN KEY (`id_inspeccion`,`id_servicio`) REFERENCES `inspeccion_visual` (`id`, `id_servicio`);

--
-- Filtros para la tabla `detalle_limpieza`
--
ALTER TABLE `detalle_limpieza`
  ADD CONSTRAINT `detalle_limpieza_ibfk_1` FOREIGN KEY (`id_inspeccion`,`id_servicio`) REFERENCES `limpieza` (`id`, `id_servicio`);

--
-- Filtros para la tabla `detalle_puntuacion`
--
ALTER TABLE `detalle_puntuacion`
  ADD CONSTRAINT `detalle_puntuacion_ibfk_1` FOREIGN KEY (`id_puntuacion`,`id_sistema`) REFERENCES `puntuacion` (`id`, `id_sistema`);

--
-- Filtros para la tabla `galpon`
--
ALTER TABLE `galpon`
  ADD CONSTRAINT `galpon_ibfk_1` FOREIGN KEY (`id_granja`,`id_empresa`) REFERENCES `granja` (`id`, `id_empresa`);

--
-- Filtros para la tabla `granja`
--
ALTER TABLE `granja`
  ADD CONSTRAINT `granja_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`);

--
-- Filtros para la tabla `hoja_verificacion`
--
ALTER TABLE `hoja_verificacion`
  ADD CONSTRAINT `hoja_verificacion_ibfk_1` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnico` (`id`),
  ADD CONSTRAINT `hoja_verificacion_ibfk_2` FOREIGN KEY (`id_unidad`,`id_empresa`) REFERENCES `unidad` (`id`, `id_empresa`);

--
-- Filtros para la tabla `inspeccion_funcionamiento`
--
ALTER TABLE `inspeccion_funcionamiento`
  ADD CONSTRAINT `inspeccion_funcionamiento_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio_mantenimiento` (`id`);

--
-- Filtros para la tabla `inspeccion_visual`
--
ALTER TABLE `inspeccion_visual`
  ADD CONSTRAINT `inspeccion_visual_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio_mantenimiento` (`id`);

--
-- Filtros para la tabla `limpieza`
--
ALTER TABLE `limpieza`
  ADD CONSTRAINT `limpieza_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio_mantenimiento` (`id`);

--
-- Filtros para la tabla `linea_genetica`
--
ALTER TABLE `linea_genetica`
  ADD CONSTRAINT `linea_genetica_ibfk_1` FOREIGN KEY (`id_hoja_verificacion`) REFERENCES `hoja_verificacion` (`id`);

--
-- Filtros para la tabla `manipulacion_dilucion`
--
ALTER TABLE `manipulacion_dilucion`
  ADD CONSTRAINT `manipulacion_dilucion_ibfk_1` FOREIGN KEY (`id_hoja_verificacion`) REFERENCES `hoja_verificacion` (`id`);

--
-- Filtros para la tabla `mantenimiento_limpieza`
--
ALTER TABLE `mantenimiento_limpieza`
  ADD CONSTRAINT `mantenimiento_limpieza_ibfk_1` FOREIGN KEY (`id_hoja_verificacion`) REFERENCES `hoja_verificacion` (`id`),
  ADD CONSTRAINT `mantenimiento_limpieza_ibfk_2` FOREIGN KEY (`id_vacunador`) REFERENCES `vacunador` (`id`);

--
-- Filtros para la tabla `peso`
--
ALTER TABLE `peso`
  ADD CONSTRAINT `peso_ibfk_1` FOREIGN KEY (`id_sistema`) REFERENCES `sistema_integral` (`id`);

--
-- Filtros para la tabla `puntuacion`
--
ALTER TABLE `puntuacion`
  ADD CONSTRAINT `puntuacion_ibfk_1` FOREIGN KEY (`id_sistema`) REFERENCES `sistema_integral` (`id`);

--
-- Filtros para la tabla `servicio_mantenimiento`
--
ALTER TABLE `servicio_mantenimiento`
  ADD CONSTRAINT `servicio_mantenimiento_ibfk_1` FOREIGN KEY (`id_maquina`) REFERENCES `maquina` (`id`),
  ADD CONSTRAINT `servicio_mantenimiento_ibfk_2` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnico` (`id`),
  ADD CONSTRAINT `servicio_mantenimiento_ibfk_3` FOREIGN KEY (`id_compania`) REFERENCES `compania` (`id`);

--
-- Filtros para la tabla `sistema_integral`
--
ALTER TABLE `sistema_integral`
  ADD CONSTRAINT `sistema_integral_ibfk_1` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnico` (`id`),
  ADD CONSTRAINT `sistema_integral_ibfk_2` FOREIGN KEY (`id_galpon`,`id_granja`,`id_empresa`) REFERENCES `galpon` (`id`, `id_granja`, `id_empresa`);

--
-- Filtros para la tabla `unidad`
--
ALTER TABLE `unidad`
  ADD CONSTRAINT `unidad_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`);

--
-- Filtros para la tabla `viabilidad_celular`
--
ALTER TABLE `viabilidad_celular`
  ADD CONSTRAINT `viabilidad_celular_ibfk_1` FOREIGN KEY (`id_hoja_verificacion`) REFERENCES `hoja_verificacion` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
