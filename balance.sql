-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 17-08-2015 a las 23:42:07
-- Versión del servidor: 5.5.44-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `balance`
--
CREATE DATABASE IF NOT EXISTS `balance` DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci;
USE `balance`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `sp_get_clasificacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_clasificacion`()
    NO SQL
SELECT * FROM clasificacion$$

DROP PROCEDURE IF EXISTS `sp_get_cuenta`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_cuenta`()
    NO SQL
SELECT * FROM cuenta$$

DROP PROCEDURE IF EXISTS `sp_get_elemento`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_elemento`()
    NO SQL
SELECT * FROM elemento$$

DROP PROCEDURE IF EXISTS `sp_get_registro`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_registro`()
    NO SQL
SELECT DISTINCT * FROM registro GROUP BY descripcion$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacion`
--

DROP TABLE IF EXISTS `clasificacion`;
CREATE TABLE IF NOT EXISTS `clasificacion` (
  `clasificacionId` int(2) NOT NULL,
  `elementoId` int(1) NOT NULL,
  `nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`clasificacionId`,`elementoId`),
  KEY `clasificacion_elementoId_PK` (`elementoId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `clasificacion`
--

INSERT INTO `clasificacion` VALUES
(1, 1, 'Efectivo y Equivalentes'),
(1, 2, 'Cuentas por Pagar'),
(1, 3, 'Individual'),
(2, 1, 'Cuentas por Cobrar'),
(2, 2, 'Prestamos'),
(2, 3, 'Social'),
(3, 1, 'Inventarios'),
(3, 2, 'Obligaciones por Provisiones'),
(4, 1, 'Pagos por Anticipado'),
(4, 2, 'Valores Cobrados por Anticipado'),
(5, 1, 'Inversiones y Valores'),
(6, 1, 'Propiedad, Planta y Equipo'),
(7, 1, 'Activos Intangibles'),
(8, 1, 'Otros Activos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
CREATE TABLE IF NOT EXISTS `cuenta` (
  `cuentaId` int(2) NOT NULL,
  `clasificacionId` int(2) NOT NULL,
  `elementoId` int(1) NOT NULL,
  `nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`cuentaId`,`clasificacionId`,`elementoId`),
  KEY `elementoId` (`elementoId`),
  KEY `cuenta_clasificacionId_PK` (`clasificacionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` VALUES
(1, 1, 1, 'Caja'),
(1, 1, 2, 'Acreedores Varios'),
(1, 1, 3, 'Capital'),
(2, 1, 1, 'Caja Chica'),
(2, 1, 2, 'Obligaciones por Provisiones'),
(2, 1, 3, 'Utilidad o Perdida del Periodo'),
(3, 1, 1, 'Bancos'),
(3, 1, 2, 'Documentos por Pagar'),
(3, 1, 3, 'Utilidad o Perdida de Periodos Anteriores'),
(4, 1, 1, 'Bancos Ahorros'),
(4, 1, 2, 'Proveedores'),
(4, 2, 3, 'Capital Social'),
(5, 1, 1, 'Inversiones Temporales'),
(5, 2, 3, 'Reserva Legal'),
(6, 1, 2, 'Otras Cuentas por Pagar'),
(6, 2, 1, 'Clientes'),
(6, 2, 3, 'Reserva de Presion'),
(7, 2, 1, 'Documentos por Cobrar'),
(7, 2, 2, 'Prestamos Bancarios'),
(7, 2, 3, 'Reserva de Reinversion'),
(8, 2, 1, 'Deudores Varios'),
(8, 2, 2, 'Hipotecas por Pagar'),
(8, 2, 3, 'Reserva de Educacion'),
(9, 2, 1, 'Anticipos a Empleados'),
(9, 2, 3, 'Utilidades Acumuladas'),
(9, 3, 2, 'Provisiones por Garantias'),
(10, 2, 1, 'Servicios por Cobrar'),
(10, 2, 3, 'Perdidas No Aplicadas'),
(10, 3, 2, 'Provisiones para Beneficios de Empleados'),
(11, 2, 3, 'Utilidad o Perdida del Periodo'),
(11, 3, 1, 'Inventario de Mercaderias'),
(11, 4, 2, 'Rentas Cobradas por Anticipado'),
(12, 3, 1, 'Almacen de Materia Prima'),
(12, 4, 2, 'Anticipos de Clientes'),
(13, 3, 1, 'Almacen de Productos en Proceso'),
(13, 4, 2, 'Intereses Cobrados por Anticipado'),
(14, 4, 1, 'Seguros Pagados por Anticipado'),
(15, 4, 1, 'Rentas Pagadas por Anticipado'),
(16, 4, 1, 'Impuesto Sobre Ventas Pagados'),
(17, 4, 1, 'Pago Anticipado de Impuesto'),
(18, 4, 1, 'Intereses Pagados por Anticipado'),
(19, 4, 1, 'Papeleria y Utiles'),
(20, 4, 1, 'Material de Empaque'),
(21, 4, 1, 'Material de Aseo'),
(22, 4, 1, 'Anticipos a Proveedores'),
(23, 4, 1, 'Publicidad'),
(24, 4, 1, 'Accesorios y Suministros'),
(25, 5, 1, 'Depositos a Plazo Fijo'),
(26, 5, 1, 'Inversiones y Valores'),
(27, 5, 1, 'Inversiones en Bonos'),
(28, 6, 1, 'Terrenos'),
(29, 6, 1, 'Edificios'),
(30, 6, 1, 'Maquinaria'),
(31, 6, 1, 'Mobiliario y Equipo'),
(32, 6, 1, 'Equipo de Reparto'),
(33, 6, 1, 'Equipo de Transporte'),
(34, 6, 1, 'Herramientas'),
(35, 7, 1, 'Marcas'),
(36, 7, 1, 'Patentes'),
(37, 7, 1, 'Derechos de Autor'),
(38, 7, 1, 'Franquicias'),
(39, 7, 1, 'Aplicaciones de Informatica'),
(40, 7, 1, 'Credito Mercantil'),
(41, 8, 1, 'Depositos en Garantia'),
(42, 4, 1, 'Gastos de Organizacion'),
(43, 4, 1, 'Primas de Seguro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elemento`
--

DROP TABLE IF EXISTS `elemento`;
CREATE TABLE IF NOT EXISTS `elemento` (
  `elementoId` int(1) NOT NULL,
  `nombre` varchar(7) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`elementoId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `elemento`
--

INSERT INTO `elemento` VALUES
(1, 'Activo'),
(2, 'Pasivo'),
(3, 'Capital');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

DROP TABLE IF EXISTS `registro`;
CREATE TABLE IF NOT EXISTS `registro` (
  `registroId` int(3) NOT NULL AUTO_INCREMENT,
  `cuentaId` int(2) NOT NULL,
  `clasificacionId` int(2) NOT NULL,
  `elementoId` int(1) NOT NULL,
  `fecha` date NOT NULL,
  `corriente` bit(1) NOT NULL,
  `descripcion` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `cantidad` decimal(9,2) NOT NULL,
  `registro` int(3) DEFAULT NULL,
  PRIMARY KEY (`registroId`,`cuentaId`,`clasificacionId`,`elementoId`),
  KEY `registro` (`registro`),
  KEY `cuentaId` (`cuentaId`),
  KEY `elementoId` (`elementoId`),
  KEY `registro_clasificacionId_PK` (`clasificacionId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` VALUES
(1, 1, 1, 1, '2015-08-15', b'1', 'Dinero en efectivo L. 22,600', 22600.00, NULL),
(2, 3, 1, 1, '2015-08-15', b'1', 'Deposito en cuenta de cheques en HSBC por L.84,300 y en Bancatlan de L. 92,200', 176500.00, NULL),
(3, 3, 1, 2, '2015-08-15', b'1', 'Existencia en mercaderias L.1,572,700 de los cuales adeuda en cuenta corriente a diferentes casas comerciales L. 482,800 y firmando pagares y letras de cambio a corto plazo L. 378,600', 378600.00, NULL),
(3, 4, 1, 2, '2015-08-15', b'1', 'Existencia en mercaderias L.1,572,700 de los cuales adeuda en cuenta corriente a diferentes casas comerciales L. 482,800 y firmando pagares y letras de cambio a corto plazo L. 378,600', 482800.00, NULL),
(3, 11, 3, 1, '2015-08-15', b'1', 'Existencia en mercaderias L.1,572,700 de los cuales adeuda en cuenta corriente a diferentes casas comerciales L. 482,800 y firmando pagares y letras de cambio a corto plazo L. 378,600', 1572700.00, NULL),
(4, 6, 2, 1, '2015-08-15', b'1', 'Le deben mercaderias en cuenta corriente L. 238,500', 238500.00, NULL),
(5, 8, 2, 1, '2015-08-15', b'1', 'Le adeudan por concepto distinto a la venta de mercaderias L. 18,400', 18400.00, NULL),
(6, 3, 1, 2, '2015-08-15', b'1', 'Muebles y equipos por L. 48,200(valor neto) por el cual firma 10 letras de cambio de L. 2,000 c/u, pagaderas mensualmente', 20000.00, NULL),
(6, 31, 6, 1, '2015-08-15', b'1', 'Muebles y equipos por L. 48,200(valor neto) por el cual firma 10 letras de cambio de L. 2,000 c/u, pagaderas mensualmente', 48200.00, NULL),
(7, 32, 6, 1, '2015-08-15', b'1', 'Posee una camioneta para distribuir mercaderias, valor neto L. 290,000', 290000.00, NULL),
(8, 1, 1, 2, '2015-08-15', b'1', 'Pago por constitucion L. 40,000 del cual aun adeuda L. 20,000', 20000.00, NULL),
(8, 42, 4, 1, '2015-08-15', b'0', 'Pago por constitucion L. 40,000 del cual aun adeuda L. 20,000', 40000.00, NULL),
(9, 43, 4, 1, '2015-08-15', b'1', 'Compra un seguro para la camioneta por L. 12,000', 12000.00, 7),
(10, 8, 2, 2, '2015-08-15', b'1', 'Pago anticipadamente 6 meses de alquiler del local en L. 980,000, el cual hipoteca en Banco Atlantida en L. 600,000 a 5 años plazo', 600000.00, NULL),
(10, 28, 6, 1, '2015-08-15', b'1', 'Pago anticipadamente 6 meses de alquiler del local en L. 980,000, el cual hipoteca en Banco Atlantida en L. 600,000 a 5 años plazo', 980000.00, NULL),
(11, 11, 4, 2, '2015-08-15', b'0', 'Da en subarrendamiento una parte del local por el que cobro anticipadamente 4 meses, a razon de L. 3,000 c/mes', 12000.00, NULL),
(12, 2, 1, 3, '2015-08-15', b'1', 'Utilidad neta del periodo L. 379,940', 379940.00, NULL),
(13, 6, 1, 2, '2015-08-15', b'1', 'Impuesto sobre la renta a pagar L. 51,860', 51860.00, NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  ADD CONSTRAINT `clasificacion_elementoId_PK` FOREIGN KEY (`elementoId`) REFERENCES `elemento` (`elementoId`);

--
-- Filtros para la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD CONSTRAINT `cuenta_clasificacionId_PK` FOREIGN KEY (`clasificacionId`) REFERENCES `clasificacion` (`clasificacionId`),
  ADD CONSTRAINT `cuenta_elementoId_PK` FOREIGN KEY (`elementoId`) REFERENCES `clasificacion` (`elementoId`);

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `registro_clasificacionId_PK` FOREIGN KEY (`clasificacionId`) REFERENCES `cuenta` (`clasificacionId`),
  ADD CONSTRAINT `registro_cuentaId_PK` FOREIGN KEY (`cuentaId`) REFERENCES `cuenta` (`cuentaId`),
  ADD CONSTRAINT `registro_elementoId_PK` FOREIGN KEY (`elementoId`) REFERENCES `cuenta` (`elementoId`),
  ADD CONSTRAINT `registro_registro_FK` FOREIGN KEY (`registro`) REFERENCES `registro` (`registroId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
