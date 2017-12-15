-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 10, 2017 at 01:14 PM
-- Server version: 5.5.54-0+deb8u1
-- PHP Version: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `invetsa`
--

-- --------------------------------------------------------

--
-- Table structure for table `accion`
--

CREATE TABLE IF NOT EXISTS `accion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `id_hoja_verificacion` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `compania`
--

CREATE TABLE IF NOT EXISTS `compania` (
`id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `compania`
--

INSERT INTO `compania` (`id`, `nombre`) VALUES
(1, 'Jose Alfredo'),
(2, 'Nolberto Zabala'),
(3, 'Edgar Elio');

-- --------------------------------------------------------

--
-- Table structure for table `control_indice`
--

CREATE TABLE IF NOT EXISTS `control_indice` (
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

-- --------------------------------------------------------

--
-- Table structure for table `detalle_accion`
--

CREATE TABLE IF NOT EXISTS `detalle_accion` (
  `id` int(11) NOT NULL,
  `esperado` varchar(50) DEFAULT NULL,
  `encontrado` varchar(50) DEFAULT NULL,
  `id_accion` int(11) NOT NULL,
  `id_hoja_verificacion` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detalle_inspeccion_funcionamiento`
--

CREATE TABLE IF NOT EXISTS `detalle_inspeccion_funcionamiento` (
`id` int(11) NOT NULL,
  `id_inspeccion` int(11) NOT NULL,
  `criterio_evaluacion` text,
  `estado` tinyint(4) DEFAULT NULL,
  `imei` varchar(18) DEFAULT NULL,
  `id_servicio` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detalle_inspeccion_funcionamiento`
--

INSERT INTO `detalle_inspeccion_funcionamiento` (`id`, `id_inspeccion`, `criterio_evaluacion`, `estado`, `imei`, `id_servicio`) VALUES
(1, 1, 'UBICACION DE MAQUINA', 1, '000000000000000', 258),
(1, 2, 'MATERIALES UTILIZADOS', 1, '000000000000000', 258),
(2, 1, 'PRESION DE COMPRESORA', 1, '000000000000000', 258),
(2, 2, 'CAMBIO DE PIEZAS DESCARTABLES', 1, '000000000000000', 258),
(3, 1, 'PRESION DE MAQUINA', 1, '000000000000000', 258),
(3, 2, 'LIMPIEZA DE PLACA TWIN TOUCH', 1, '000000000000000', 258),
(4, 1, 'ACTIVACION', 1, '000000000000000', 258),
(4, 2, 'ESTERILIZADO DE VALVULA', 1, '000000000000000', 258),
(5, 1, 'FUNCIONAMIENTO DE CONTADORES', 1, '000000000000000', 258),
(5, 2, 'LIMPIEZA DE MODULO INYECTOR', 1, '000000000000000', 258),
(6, 1, 'FUNCIONAMIENTO SILBATO', 1, '000000000000000', 258),
(6, 2, 'LIMPIEZA DE CEREBRO', 1, '000000000000000', 258),
(7, 1, 'SALIDA DE AGUJA', 1, '000000000000000', 258),
(7, 2, 'SECADO', 1, '000000000000000', 258),
(8, 1, 'CALIBRACION', 1, '000000000000000', 258),
(8, 2, 'PROTECCION', 1, '000000000000000', 258);

-- --------------------------------------------------------

--
-- Table structure for table `detalle_inspeccion_visual`
--

CREATE TABLE IF NOT EXISTS `detalle_inspeccion_visual` (
`id` int(11) NOT NULL,
  `id_inspeccion` int(11) NOT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `descripcion` text,
  `estado` tinyint(4) DEFAULT NULL,
  `imei` varchar(18) DEFAULT NULL,
  `id_servicio` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detalle_inspeccion_visual`
--

INSERT INTO `detalle_inspeccion_visual` (`id`, `id_inspeccion`, `codigo`, `descripcion`, `estado`, `imei`, `id_servicio`) VALUES
(1, 1, 'AV-131', 'BASE DE ALUMINIO', 1, '000000000000000', 258),
(2, 1, 'AV-1331', 'BLOQUE POSTERIOR', 1, '000000000000000', 258),
(3, 1, 'AV-13413', 'BLOQUE DE CILINDRO DE FUERZA', 1, '000000000000000', 258),
(4, 1, 'AV-13421', 'BLOQUE DE JERINGA', 1, '000000000000000', 258),
(5, 1, 'AV-13511', 'BLOQUE DELANTERO GUIA', 1, '000000000000000', 258),
(6, 1, 'AV-137', 'VALVULA DE CONTROL', 1, '000000000000000', 258),
(7, 1, 'AV-1378', 'REPTS. DE VALVULA DE CONTROL', 1, '000000000000000', 258),
(8, 1, 'AV-111', 'PLACA TWIN TOUCH', 1, '000000000000000', 258),
(9, 1, 'AV-114', 'BOLITAS DE TEFLON (bueno)', 0, '000000000000000', 258),
(10, 1, 'AV-114', 'BOLITAS DE TEFLON (regular)', 0, '000000000000000', 258),
(11, 1, 'AV-114', 'BOLITAS DE TEFLON (malo)', 0, '000000000000000', 258),
(12, 1, 'AV-117', 'CONECTOR DE AIRE DE TWIN SHOT', 1, '000000000000000', 258),
(13, 1, 'AV-121', 'SEGURO DE TAPA', 1, '000000000000000', 258),
(14, 1, 'AV-118', 'TUERCAS DE BASE DE ALUMINIO (bueno)', 0, '000000000000000', 258),
(15, 1, 'AV-118', 'TUERCAS DE BASE DE ALUMINIO (regular)', 0, '000000000000000', 258),
(16, 1, 'AV-118', 'TUERCAS DE BASE DE ALUMINIO (malo)', 0, '000000000000000', 258),
(17, 1, 'AV-1357', 'SEGURO DE VALVULA', 1, '000000000000000', 258),
(18, 1, '5647', 'CLAMP DE TUBERIA DE 1/2', 1, '000000000000000', 258),
(19, 1, '5548', 'CLAMP DE TUBERIA DE 5/16', 1, '000000000000000', 258),
(20, 1, '5732', 'DETECTOR DE POSICION', 1, '000000000000000', 258),
(21, 1, '3543', 'CONECTOR DE 5/32', 1, '000000000000000', 258),
(22, 1, 'AV-1346', 'ACOPLADURA COLDER MACHO', 1, '000000000000000', 258),
(23, 1, 'AV-1344', 'CILINDRO DE FUERZA', 1, '000000000000000', 258),
(24, 1, 'AV-1345', 'CILINDRO DE AJUSTE', 1, '000000000000000', 258),
(25, 1, '5720', 'CONECTOR RAPIDO 5/32', 1, '000000000000000', 258),
(26, 1, '5641', 'CONECTOR DE AIRE DE BRONCE', 1, '000000000000000', 258),
(27, 1, 'AV-13411', 'SELLO DE CILINDRO DE FUERZA', 1, '000000000000000', 258),
(28, 1, 'AV-13422', 'RETENEDOR DE JERINGA', 1, '000000000000000', 258),
(29, 1, 'AV-13521', 'SOSTENEDOR DE LA AGUJA', 1, '000000000000000', 258),
(30, 1, 'AV-13522', 'TUERCA COLLARIN DE LA AGUJA (bueno)', 0, '000000000000000', 258),
(31, 1, 'AV-13522', 'TUERCA COLLARIN DE LA AGUJA (regular)', 0, '000000000000000', 258),
(32, 1, 'AV-13522', 'TUERCA COLLARIN DE LA AGUJA (malo)', 0, '000000000000000', 258),
(33, 1, 'AV-1374', 'EMPAQUE O ASIENTO (bueno)', 0, '000000000000000', 258),
(34, 1, 'AV-1374', 'EMPAQUE O ASIENTO (regular)', 0, '000000000000000', 258),
(35, 1, 'AV-1374', 'EMPAQUE O ASIENTO (malo)', 0, '000000000000000', 258),
(36, 1, 'AV-1375', 'EMPAQUE O CAPTURA (bueno)', 0, '000000000000000', 258),
(37, 1, 'AV-1375', 'EMPAQUE O CAPTURA (regular)', 0, '000000000000000', 258),
(38, 1, 'AV-1375', 'EMPAQUE O CAPTURA (malo)', 0, '000000000000000', 258),
(39, 1, 'AV-1377', 'BOLITAS DE ACERO (bueno)', 2, '000000000000000', 258),
(40, 1, 'AV-1377', 'BOLITAS DE ACERO (regular)', 3, '000000000000000', 258),
(41, 1, 'AV-1377', 'BOLITAS DE ACERO (malo)', 2, '000000000000000', 258),
(42, 1, 'AV-1376', 'RESORTES (bueno)', 0, '000000000000000', 258),
(43, 1, 'AV-1376', 'RESORTES (regular)', 0, '000000000000000', 258),
(44, 1, 'AV-1376', 'RESORTES (malo)', 0, '000000000000000', 258),
(45, 1, 'AV-13523', 'REGULADORES SALIDA DE AGUJA', 1, '000000000000000', 258),
(46, 1, 'AV-1347', 'ACOPLADURA COLDER HEMBRA', 1, '000000000000000', 258),
(47, 1, 'AV-230', 'DISTRIBUIDOR DE AIRE', 1, '000000000000000', 258),
(48, 1, 'AV-1032', 'CONECTOR RAPIDO ENTRADA', 1, '000000000000000', 258),
(49, 1, '5430', 'SILBATO', 1, '000000000000000', 258),
(50, 1, '5443', 'CONECTOR RAPIDO HEMBRA', 1, '000000000000000', 258),
(51, 1, '5445', 'CONECTOR RAPIDO MACHO', 1, '000000000000000', 258),
(52, 1, '5728', 'VALVULA DE CUATRO SALIDAS', 1, '000000000000000', 258),
(53, 1, '5700', 'VALVULA DE UNA SALIDA', 1, '000000000000000', 258),
(54, 1, '5709', ' SUBPLACA SENCILLA', 1, '000000000000000', 258),
(55, 1, '5730', 'RELAY SENSOR', 1, '000000000000000', 258),
(56, 1, '5701', '', 1, '000000000000000', 258),
(57, 1, '5738', 'VALVULA DE LA AGUJA', 1, '000000000000000', 258),
(58, 1, '5703', 'VALVULA DE IMPULSO', 1, '000000000000000', 258),
(59, 1, '5600', 'PATAS DE CAUCHO', 1, '000000000000000', 258),
(60, 1, '5710', 'SWITCH DE TRES POSICIONES', 1, '000000000000000', 258),
(61, 1, '5726', 'REGULADOR DE AIRE', 1, '000000000000000', 258),
(62, 1, '5724', 'MANOMETRO', 1, '000000000000000', 258),
(63, 1, '5423', 'CONTADOR TOTAL', 1, '000000000000000', 258),
(64, 1, '5426', 'PROTECTOR DE CONT. TOTAL', 1, '000000000000000', 258),
(65, 1, '5422', 'CONTADOR PREFIJADO', 1, '000000000000000', 258),
(66, 1, '5418', 'RE-ESTABLECEDOR DE CONTADOR', 1, '000000000000000', 258),
(67, 1, '5425', 'PROTECTOR DE CONT.PREFIJADO', 1, '000000000000000', 258),
(68, 1, 'AV-138', 'JERINGA DESCARTABLE', 1, '000000000000000', 258),
(69, 1, '3520', 'TUBERIA PEQUENA (bueno)', 0, '000000000000000', 258),
(70, 1, '3520', 'TUBERIA PEQUENA (regular)', 0, '000000000000000', 258),
(71, 1, '3520', 'TUBERIA PEQUENA (malo)', 0, '000000000000000', 258),
(72, 1, 'SV-11155', 'TUBERIA LATEX (bueno)', 0, '000000000000000', 258),
(73, 1, 'SV-11155', 'TUBERIA LATEX (regular)', 0, '000000000000000', 258),
(74, 1, 'SV-11155', 'TUBERIA LATEX (malo)', 0, '000000000000000', 258);

-- --------------------------------------------------------

--
-- Table structure for table `detalle_limpieza`
--

CREATE TABLE IF NOT EXISTS `detalle_limpieza` (
`id` int(11) NOT NULL,
  `id_inspeccion` int(11) NOT NULL,
  `criterio_evaluacion` text,
  `estado` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `detalle_puntuacion`
--

CREATE TABLE IF NOT EXISTS `detalle_puntuacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `id_puntuacion` int(11) NOT NULL,
  `id_sistema` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
`id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `empresa`
--

INSERT INTO `empresa` (`id`, `nombre`) VALUES
(1, 'grayhatcorp'),
(2, 'pollos Kiky'),
(3, 'Nano'),
(4, 'Norte Santines'),
(5, 'isolmedia');

-- --------------------------------------------------------

--
-- Table structure for table `galpon`
--

CREATE TABLE IF NOT EXISTS `galpon` (
`id` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_granja` int(11) NOT NULL,
  `cantidad_pollo` int(11) DEFAULT NULL,
  `codigo` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `galpon`
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
-- Table structure for table `granja`
--

CREATE TABLE IF NOT EXISTS `granja` (
`id` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `zona` text,
  `nombre` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `granja`
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
-- Table structure for table `hoja_verificacion`
--

CREATE TABLE IF NOT EXISTS `hoja_verificacion` (
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
  `id_galpon` int(11) DEFAULT NULL,
  `id_granja` int(11) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_sqlite` int(11) DEFAULT NULL,
  `imei` varchar(18) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_tecnico` int(11) DEFAULT NULL,
  `imagen_jefe` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inspeccion_funcionamiento`
--

CREATE TABLE IF NOT EXISTS `inspeccion_funcionamiento` (
  `id` int(11) NOT NULL,
  `observaciones` text,
  `frecuencia_de_uso` text,
  `id_servicio` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inspeccion_funcionamiento`
--

INSERT INTO `inspeccion_funcionamiento` (`id`, `observaciones`, `frecuencia_de_uso`, `id_servicio`, `imei`) VALUES
(1, '', '', 258, '000000000000000'),
(2, '', '', 258, '000000000000000');

-- --------------------------------------------------------

--
-- Table structure for table `inspeccion_visual`
--

CREATE TABLE IF NOT EXISTS `inspeccion_visual` (
  `id` int(11) NOT NULL,
  `observaciones` text,
  `piesas_cambiadas` text,
  `id_servicio` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inspeccion_visual`
--

INSERT INTO `inspeccion_visual` (`id`, `observaciones`, `piesas_cambiadas`, `id_servicio`, `imei`) VALUES
(1, '', '', 258, '000000000000000');

-- --------------------------------------------------------

--
-- Table structure for table `limpieza`
--

CREATE TABLE IF NOT EXISTS `limpieza` (
`id` int(11) NOT NULL,
  `observaciones` text,
  `cantidad_aves_vacunadas` text,
  `id_servicio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `manipulacion_dilucion`
--

CREATE TABLE IF NOT EXISTS `manipulacion_dilucion` (
  `id` int(11) NOT NULL,
  `descripcion` text,
  `puntaje` decimal(2,2) DEFAULT NULL,
  `id_hoja_verificacion` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mantenimiento_limpieza`
--

CREATE TABLE IF NOT EXISTS `mantenimiento_limpieza` (
`id` int(11) NOT NULL,
  `nro_twin_shot_zootec` int(11) DEFAULT NULL,
  `irregularidades` int(11) DEFAULT NULL,
  `id_hoja_verificacion` int(11) DEFAULT NULL,
  `id_vacunador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `maquina`
--

CREATE TABLE IF NOT EXISTS `maquina` (
`id` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `maquina`
--

INSERT INTO `maquina` (`id`, `codigo`, `nombre`) VALUES
(1, 'A001', 'xyz'),
(2, 'A002', 'stll'),
(3, 'A003', 'franz'),
(4, 'A004', 'AXC'),
(5, 'A005', 'AXCD-1');

-- --------------------------------------------------------

--
-- Table structure for table `peso`
--

CREATE TABLE IF NOT EXISTS `peso` (
  `id` int(11) NOT NULL,
  `peso_corporal` decimal(2,2) DEFAULT NULL,
  `pedo_bursa` decimal(2,2) DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `puntuacion`
--

CREATE TABLE IF NOT EXISTS `puntuacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `id_sistema` int(11) NOT NULL,
  `imei` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `servicio_mantenimiento`
--

CREATE TABLE IF NOT EXISTS `servicio_mantenimiento` (
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
  `imagen_jefe` text
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `servicio_mantenimiento`
--

INSERT INTO `servicio_mantenimiento` (`id`, `fecha`, `hora_ingreso`, `hora_salidas`, `codigo`, `revision`, `firma_jefe_planta`, `firma_invetsa`, `id_maquina`, `id_tecnico`, `id_compania`, `id_sqlite`, `imei`, `formulario`, `imagen_jefe`) VALUES
(258, '2017-04-02', '12:42:00', '12:42:00', 'R53', '00', 'servicio_mantenimiento/firma/258_firma_empresa_2017-4-2.txt', 'servicio_mantenimiento/firma/258_firma_invetsa_2017-4-2.txt', 1, 1, 1, 1, '000000000000000', 'TWIN SHOT', '');

-- --------------------------------------------------------

--
-- Table structure for table `sistema_integral`
--

CREATE TABLE IF NOT EXISTS `sistema_integral` (
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
  `imagen_jefe` text
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sistema_integral`
--

INSERT INTO `sistema_integral` (`id`, `codigo`, `revision`, `edad`, `sexo`, `observaciones`, `fecha`, `nro_pollos`, `imagen1`, `imagen2`, `imagen3`, `imagen4`, `imagen5`, `id_galpon`, `id_granja`, `id_empresa`, `id_sqlite`, `imei`, `firma_invetsa`, `firma_empresa`, `id_tecnico`, `imagen_jefe`) VALUES
(4, 'R50', '00', 0, '0', '', '0005-02-01', 0, 'sistema_integral_de_monitoreo/imagen/4_imagen_1_5-2-1.txt', 'sistema_integral_de_monitoreo/imagen/4_imagen_2_5-2-1.txt', 'sistema_integral_de_monitoreo/imagen/4_imagen_3_5-2-1.txt', 'sistema_integral_de_monitoreo/imagen/4_imagen_4_5-2-1.txt', 'sistema_integral_de_monitoreo/imagen/4_imagen_5_5-2-1.txt', 1, 1, 1, '100', '000000000000000', 'sistema_integral_de_monitoreo/firma/4_firma_invetsa_5-2-1.txt', 'sistema_integral_de_monitoreo/firma/4_firma_empresa_5-2-1.txt', 1, NULL),
(5, 'R50', '00', 0, '0', '', '2017-04-02', 0, 'sistema_integral_de_monitoreo/imagen/5_imagen_1_2017-4-2.txt', 'sistema_integral_de_monitoreo/imagen/5_imagen_2_2017-4-2.txt', 'sistema_integral_de_monitoreo/imagen/5_imagen_3_2017-4-2.txt', 'sistema_integral_de_monitoreo/imagen/5_imagen_4_2017-4-2.txt', 'sistema_integral_de_monitoreo/imagen/5_imagen_5_2017-4-2.txt', 1, 1, 1, '1', '000000000000000', 'sistema_integral_de_monitoreo/firma/5_firma_invetsa_2017-4-2.txt', 'sistema_integral_de_monitoreo/firma/5_firma_empresa_2017-4-2.txt', 1, NULL),
(6, 'R50', '00', 0, '0', '', '2017-04-02', 0, 'sistema_integral_de_monitoreo/imagen/6_imagen_1_2017-4-2.txt', 'sistema_integral_de_monitoreo/imagen/6_imagen_2_2017-4-2.txt', 'sistema_integral_de_monitoreo/imagen/6_imagen_3_2017-4-2.txt', 'sistema_integral_de_monitoreo/imagen/6_imagen_4_2017-4-2.txt', 'sistema_integral_de_monitoreo/imagen/6_imagen_5_2017-4-2.txt', 1, 1, 1, '2', '000000000000000', 'sistema_integral_de_monitoreo/firma/6_firma_invetsa_2017-4-2.txt', 'sistema_integral_de_monitoreo/firma/6_firma_empresa_2017-4-2.txt', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tecnico`
--

CREATE TABLE IF NOT EXISTS `tecnico` (
`id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tecnico`
--

INSERT INTO `tecnico` (`id`, `nombre`, `codigo`) VALUES
(1, 'edgar Elio', 1234),
(2, 'Fernando', 12345);

-- --------------------------------------------------------

--
-- Table structure for table `vacunador`
--

CREATE TABLE IF NOT EXISTS `vacunador` (
`id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vacunador`
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accion`
--
ALTER TABLE `accion`
 ADD PRIMARY KEY (`id`,`id_hoja_verificacion`), ADD KEY `id_hoja_verificacion` (`id_hoja_verificacion`);

--
-- Indexes for table `compania`
--
ALTER TABLE `compania`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `control_indice`
--
ALTER TABLE `control_indice`
 ADD PRIMARY KEY (`id`,`id_hoja_verificacion`), ADD KEY `id_hoja_verificacion` (`id_hoja_verificacion`), ADD KEY `id_vacunador` (`id_vacunador`);

--
-- Indexes for table `detalle_accion`
--
ALTER TABLE `detalle_accion`
 ADD PRIMARY KEY (`id`,`id_accion`,`id_hoja_verificacion`), ADD KEY `id_accion` (`id_accion`,`id_hoja_verificacion`);

--
-- Indexes for table `detalle_inspeccion_funcionamiento`
--
ALTER TABLE `detalle_inspeccion_funcionamiento`
 ADD PRIMARY KEY (`id`,`id_inspeccion`,`id_servicio`), ADD KEY `id_inspeccion` (`id_inspeccion`,`id_servicio`);

--
-- Indexes for table `detalle_inspeccion_visual`
--
ALTER TABLE `detalle_inspeccion_visual`
 ADD PRIMARY KEY (`id`,`id_inspeccion`,`id_servicio`), ADD KEY `id_inspeccion` (`id_inspeccion`,`id_servicio`);

--
-- Indexes for table `detalle_limpieza`
--
ALTER TABLE `detalle_limpieza`
 ADD PRIMARY KEY (`id`,`id_inspeccion`), ADD KEY `id_inspeccion` (`id_inspeccion`);

--
-- Indexes for table `detalle_puntuacion`
--
ALTER TABLE `detalle_puntuacion`
 ADD PRIMARY KEY (`id`,`id_puntuacion`,`id_sistema`), ADD KEY `id_puntuacion` (`id_puntuacion`,`id_sistema`);

--
-- Indexes for table `empresa`
--
ALTER TABLE `empresa`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galpon`
--
ALTER TABLE `galpon`
 ADD PRIMARY KEY (`id`,`id_granja`,`id_empresa`), ADD KEY `id_granja` (`id_granja`,`id_empresa`);

--
-- Indexes for table `granja`
--
ALTER TABLE `granja`
 ADD PRIMARY KEY (`id`,`id_empresa`), ADD KEY `id_empresa` (`id_empresa`);

--
-- Indexes for table `hoja_verificacion`
--
ALTER TABLE `hoja_verificacion`
 ADD PRIMARY KEY (`id`), ADD KEY `id_tecnico` (`id_tecnico`), ADD KEY `id_galpon` (`id_galpon`,`id_granja`,`id_empresa`);

--
-- Indexes for table `inspeccion_funcionamiento`
--
ALTER TABLE `inspeccion_funcionamiento`
 ADD PRIMARY KEY (`id`,`id_servicio`), ADD KEY `id_servicio` (`id_servicio`);

--
-- Indexes for table `inspeccion_visual`
--
ALTER TABLE `inspeccion_visual`
 ADD PRIMARY KEY (`id`,`id_servicio`), ADD KEY `id_servicio` (`id_servicio`);

--
-- Indexes for table `limpieza`
--
ALTER TABLE `limpieza`
 ADD PRIMARY KEY (`id`), ADD KEY `id_servicio` (`id_servicio`);

--
-- Indexes for table `manipulacion_dilucion`
--
ALTER TABLE `manipulacion_dilucion`
 ADD PRIMARY KEY (`id`,`id_hoja_verificacion`), ADD KEY `id_hoja_verificacion` (`id_hoja_verificacion`);

--
-- Indexes for table `mantenimiento_limpieza`
--
ALTER TABLE `mantenimiento_limpieza`
 ADD PRIMARY KEY (`id`), ADD KEY `id_hoja_verificacion` (`id_hoja_verificacion`), ADD KEY `id_vacunador` (`id_vacunador`);

--
-- Indexes for table `maquina`
--
ALTER TABLE `maquina`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peso`
--
ALTER TABLE `peso`
 ADD PRIMARY KEY (`id`,`id_sistema`), ADD KEY `id_sistema` (`id_sistema`);

--
-- Indexes for table `puntuacion`
--
ALTER TABLE `puntuacion`
 ADD PRIMARY KEY (`id`,`id_sistema`), ADD KEY `id_sistema` (`id_sistema`);

--
-- Indexes for table `servicio_mantenimiento`
--
ALTER TABLE `servicio_mantenimiento`
 ADD PRIMARY KEY (`id`), ADD KEY `id_maquina` (`id_maquina`), ADD KEY `id_tecnico` (`id_tecnico`), ADD KEY `id_compania` (`id_compania`);

--
-- Indexes for table `sistema_integral`
--
ALTER TABLE `sistema_integral`
 ADD PRIMARY KEY (`id`), ADD KEY `id_tecnico` (`id_tecnico`), ADD KEY `id_galpon` (`id_galpon`,`id_granja`,`id_empresa`);

--
-- Indexes for table `tecnico`
--
ALTER TABLE `tecnico`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vacunador`
--
ALTER TABLE `vacunador`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `compania`
--
ALTER TABLE `compania`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `detalle_inspeccion_funcionamiento`
--
ALTER TABLE `detalle_inspeccion_funcionamiento`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `detalle_inspeccion_visual`
--
ALTER TABLE `detalle_inspeccion_visual`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT for table `detalle_limpieza`
--
ALTER TABLE `detalle_limpieza`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `empresa`
--
ALTER TABLE `empresa`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `galpon`
--
ALTER TABLE `galpon`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `granja`
--
ALTER TABLE `granja`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `hoja_verificacion`
--
ALTER TABLE `hoja_verificacion`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `limpieza`
--
ALTER TABLE `limpieza`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mantenimiento_limpieza`
--
ALTER TABLE `mantenimiento_limpieza`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `maquina`
--
ALTER TABLE `maquina`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `servicio_mantenimiento`
--
ALTER TABLE `servicio_mantenimiento`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=259;
--
-- AUTO_INCREMENT for table `sistema_integral`
--
ALTER TABLE `sistema_integral`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tecnico`
--
ALTER TABLE `tecnico`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `vacunador`
--
ALTER TABLE `vacunador`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `accion`
--
ALTER TABLE `accion`
ADD CONSTRAINT `accion_ibfk_1` FOREIGN KEY (`id_hoja_verificacion`) REFERENCES `hoja_verificacion` (`id`);

--
-- Constraints for table `control_indice`
--
ALTER TABLE `control_indice`
ADD CONSTRAINT `control_indice_ibfk_1` FOREIGN KEY (`id_hoja_verificacion`) REFERENCES `hoja_verificacion` (`id`),
ADD CONSTRAINT `control_indice_ibfk_2` FOREIGN KEY (`id_vacunador`) REFERENCES `vacunador` (`id`);

--
-- Constraints for table `detalle_accion`
--
ALTER TABLE `detalle_accion`
ADD CONSTRAINT `detalle_accion_ibfk_1` FOREIGN KEY (`id_accion`, `id_hoja_verificacion`) REFERENCES `accion` (`id`, `id_hoja_verificacion`);

--
-- Constraints for table `detalle_inspeccion_funcionamiento`
--
ALTER TABLE `detalle_inspeccion_funcionamiento`
ADD CONSTRAINT `detalle_inspeccion_funcionamiento_ibfk_1` FOREIGN KEY (`id_inspeccion`, `id_servicio`) REFERENCES `inspeccion_funcionamiento` (`id`, `id_servicio`);

--
-- Constraints for table `detalle_inspeccion_visual`
--
ALTER TABLE `detalle_inspeccion_visual`
ADD CONSTRAINT `detalle_inspeccion_visual_ibfk_1` FOREIGN KEY (`id_inspeccion`, `id_servicio`) REFERENCES `inspeccion_visual` (`id`, `id_servicio`);

--
-- Constraints for table `detalle_limpieza`
--
ALTER TABLE `detalle_limpieza`
ADD CONSTRAINT `detalle_limpieza_ibfk_1` FOREIGN KEY (`id_inspeccion`) REFERENCES `limpieza` (`id`);

--
-- Constraints for table `detalle_puntuacion`
--
ALTER TABLE `detalle_puntuacion`
ADD CONSTRAINT `detalle_puntuacion_ibfk_1` FOREIGN KEY (`id_puntuacion`, `id_sistema`) REFERENCES `puntuacion` (`id`, `id_sistema`);

--
-- Constraints for table `galpon`
--
ALTER TABLE `galpon`
ADD CONSTRAINT `galpon_ibfk_1` FOREIGN KEY (`id_granja`, `id_empresa`) REFERENCES `granja` (`id`, `id_empresa`);

--
-- Constraints for table `granja`
--
ALTER TABLE `granja`
ADD CONSTRAINT `granja_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`);

--
-- Constraints for table `hoja_verificacion`
--
ALTER TABLE `hoja_verificacion`
ADD CONSTRAINT `hoja_verificacion_ibfk_1` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnico` (`id`),
ADD CONSTRAINT `hoja_verificacion_ibfk_2` FOREIGN KEY (`id_galpon`, `id_granja`, `id_empresa`) REFERENCES `galpon` (`id`, `id_granja`, `id_empresa`);

--
-- Constraints for table `inspeccion_funcionamiento`
--
ALTER TABLE `inspeccion_funcionamiento`
ADD CONSTRAINT `inspeccion_funcionamiento_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio_mantenimiento` (`id`);

--
-- Constraints for table `inspeccion_visual`
--
ALTER TABLE `inspeccion_visual`
ADD CONSTRAINT `inspeccion_visual_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio_mantenimiento` (`id`);

--
-- Constraints for table `limpieza`
--
ALTER TABLE `limpieza`
ADD CONSTRAINT `limpieza_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio_mantenimiento` (`id`);

--
-- Constraints for table `manipulacion_dilucion`
--
ALTER TABLE `manipulacion_dilucion`
ADD CONSTRAINT `manipulacion_dilucion_ibfk_1` FOREIGN KEY (`id_hoja_verificacion`) REFERENCES `hoja_verificacion` (`id`);

--
-- Constraints for table `mantenimiento_limpieza`
--
ALTER TABLE `mantenimiento_limpieza`
ADD CONSTRAINT `mantenimiento_limpieza_ibfk_1` FOREIGN KEY (`id_hoja_verificacion`) REFERENCES `hoja_verificacion` (`id`),
ADD CONSTRAINT `mantenimiento_limpieza_ibfk_2` FOREIGN KEY (`id_vacunador`) REFERENCES `vacunador` (`id`);

--
-- Constraints for table `peso`
--
ALTER TABLE `peso`
ADD CONSTRAINT `peso_ibfk_1` FOREIGN KEY (`id_sistema`) REFERENCES `sistema_integral` (`id`);

--
-- Constraints for table `puntuacion`
--
ALTER TABLE `puntuacion`
ADD CONSTRAINT `puntuacion_ibfk_1` FOREIGN KEY (`id_sistema`) REFERENCES `sistema_integral` (`id`);

--
-- Constraints for table `servicio_mantenimiento`
--
ALTER TABLE `servicio_mantenimiento`
ADD CONSTRAINT `servicio_mantenimiento_ibfk_1` FOREIGN KEY (`id_maquina`) REFERENCES `maquina` (`id`),
ADD CONSTRAINT `servicio_mantenimiento_ibfk_2` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnico` (`id`),
ADD CONSTRAINT `servicio_mantenimiento_ibfk_3` FOREIGN KEY (`id_compania`) REFERENCES `compania` (`id`);

--
-- Constraints for table `sistema_integral`
--
ALTER TABLE `sistema_integral`
ADD CONSTRAINT `sistema_integral_ibfk_1` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnico` (`id`),
ADD CONSTRAINT `sistema_integral_ibfk_2` FOREIGN KEY (`id_galpon`, `id_granja`, `id_empresa`) REFERENCES `galpon` (`id`, `id_granja`, `id_empresa`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
