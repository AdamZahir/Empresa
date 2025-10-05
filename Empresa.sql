-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: fdb1034.awardspace.net
-- Tiempo de generación: 05-10-2025 a las 00:48:09
-- Versión del servidor: 8.0.32
-- Versión de PHP: 8.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `4667282_votacionespagina`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `dni` int NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `fecha_na` date DEFAULT NULL,
  `tfno` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`dni`, `nombre`, `fecha_na`, `tfno`) VALUES
(1, 'Federico', '1111-01-01', '1111111111'),
(22, 'aadam', '2222-02-02', '2222222222'),
(220, 'Fudo', '1960-02-02', '2222455677'),
(877, 'Nicolas Garcia', '2000-11-12', '656534312');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `dni_cliente` int DEFAULT NULL,
  `codigo_producto` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`dni_cliente`, `codigo_producto`) VALUES
(1, 200172),
(1, 273002),
(1, 505005),
(1, 630076),
(1, 200172),
(1, 273002),
(1, 505005),
(1, 630076),
(22, 320703),
(22, 323003),
(22, 464004),
(22, 468594),
(22, 508125),
(22, 566105),
(22, 680106),
(220, 680106),
(220, 680106),
(220, 680106),
(220, 680106),
(877, 323003),
(877, 395063),
(877, 464004),
(877, 468594),
(877, 630076),
(877, 680106),
(877, 810018);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codigo` int NOT NULL,
  `nombre` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `nif_proveedor` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigo`, `nombre`, `precio`, `nif_proveedor`) VALUES
(200172, 'Leche Lala Fresca Entera', 41.6, 2719680),
(250402, 'Leche Evaporada Lala', 32.99, 2719680),
(273002, 'Yoghurt bebible Mango', 19.6, 2719680),
(320703, 'Salsa de Guacamole', 23.99, 3305074),
(323003, 'Frijoles Charros', 39.99, 3305074),
(395063, 'Aderezo de Mayonesa', 59.99, 3305074),
(455754, 'Papa grande', 26.99, 44445923),
(464004, 'Cebolla', 36.99, 44445923),
(468594, 'Zanahoria', 27.99, 44445923),
(476984, 'Nopal ', 35.99, 44445923),
(503105, 'Aromatizante para Auto Vainilla', 20.99, 5555512),
(505005, 'Jabon Liquido', 24.99, 5555512),
(508125, 'Comida para Gato', 79.99, 5555512),
(566105, 'Trapeador de Fibra', 125.99, 5555512),
(630076, 'Big Mix Barcel Queso', 68.99, 62071063),
(680106, 'Botana Runners', 16.99, 62071063),
(692226, 'Papas Chips Jalapeños', 26.99, 62071063),
(810018, 'Pan Blanco', 89.99, 8152621),
(820018, 'Bimbuñuelos', 49.99, 8152621),
(860048, 'Donitas Espolvoreadas', 35.99, 8152621);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `nif` int NOT NULL,
  `nombre` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `direccion` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`nif`, `nombre`, `direccion`) VALUES
(2719680, 'Lala', 'lvd. Manuel Gómez Morín 11260'),
(3305074, 'La Costeña', 'Vía Morelos 268, colonia Santa María'),
(5555512, 'El Patito ', 'Av. Las Nieves 1313 Col.Triperon'),
(8152621, 'Bimbo', 'Av. P.º de la Victoria 9935'),
(44445923, 'Huerto Grande', 'Av. Campos Eliseos 2518 Col. Olimpo'),
(62071063, 'Barcel', 'Villas del Bravo, 32417 ');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD KEY `dni_cliente` (`dni_cliente`),
  ADD KEY `codigo_producto` (`codigo_producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `nif_proveedor` (`nif_proveedor`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`nif`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`dni_cliente`) REFERENCES `cliente` (`dni`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`codigo_producto`) REFERENCES `producto` (`codigo`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`nif_proveedor`) REFERENCES `proveedor` (`nif`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
