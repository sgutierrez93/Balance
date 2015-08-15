-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 14, 2015 at 07:44 AM
-- Server version: 5.5.44-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `balance`
--
CREATE DATABASE IF NOT EXISTS `balance` DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci;
USE `balance`;

-- --------------------------------------------------------

--
-- Table structure for table `clasificacion`
--

CREATE TABLE IF NOT EXISTS `clasificacion` (
  `clasificacionId` int(2) NOT NULL,
  `elementoId` int(1) NOT NULL,
  `nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`clasificacionId`,`elementoId`),
  KEY `clasificacion_elementoId_PK` (`elementoId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `clasificacion`
--

INSERT INTO `clasificacion` VALUES(1, 1, 'Efectivo y Equivalentes');
INSERT INTO `clasificacion` VALUES(1, 2, 'Cuentas por Pagar');
INSERT INTO `clasificacion` VALUES(1, 3, 'Individual');
INSERT INTO `clasificacion` VALUES(2, 1, 'Cuentas por Cobrar');
INSERT INTO `clasificacion` VALUES(2, 2, 'Prestamos');
INSERT INTO `clasificacion` VALUES(2, 3, 'Social');
INSERT INTO `clasificacion` VALUES(3, 1, 'Inventarios');
INSERT INTO `clasificacion` VALUES(3, 2, 'Obligaciones por Provisiones');
INSERT INTO `clasificacion` VALUES(4, 1, 'Pagos por Anticipado');
INSERT INTO `clasificacion` VALUES(4, 2, 'Valores Cobrados por Anticipado');
INSERT INTO `clasificacion` VALUES(5, 1, 'Inversiones y Valores');
INSERT INTO `clasificacion` VALUES(6, 1, 'Propiedad, Planta y Equipo');
INSERT INTO `clasificacion` VALUES(7, 1, 'Activos Intangibles');
INSERT INTO `clasificacion` VALUES(8, 1, 'Otros Activos');

-- --------------------------------------------------------

--
-- Table structure for table `cuenta`
--

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
-- Dumping data for table `cuenta`
--

INSERT INTO `cuenta` VALUES(1, 1, 1, 'Caja');
INSERT INTO `cuenta` VALUES(1, 1, 2, 'Acreedores Varios');
INSERT INTO `cuenta` VALUES(1, 1, 3, 'Capital');
INSERT INTO `cuenta` VALUES(2, 1, 1, 'Caja Chica');
INSERT INTO `cuenta` VALUES(2, 1, 2, 'Obligaciones por Provisiones');
INSERT INTO `cuenta` VALUES(2, 1, 3, 'Utilidad o Perdida del Periodo');
INSERT INTO `cuenta` VALUES(3, 1, 1, 'Bancos');
INSERT INTO `cuenta` VALUES(3, 1, 2, 'Documentos por Pagar');
INSERT INTO `cuenta` VALUES(3, 1, 3, 'Utilidad o Perdida de Periodos Anteriores');
INSERT INTO `cuenta` VALUES(4, 1, 1, 'Bancos Ahorros');
INSERT INTO `cuenta` VALUES(4, 1, 2, 'Proveedores');
INSERT INTO `cuenta` VALUES(4, 2, 3, 'Capital Social');
INSERT INTO `cuenta` VALUES(5, 1, 1, 'Inversiones Temporales');
INSERT INTO `cuenta` VALUES(5, 1, 2, 'Acreedores Varios');
INSERT INTO `cuenta` VALUES(5, 2, 3, 'Reserva Legal');
INSERT INTO `cuenta` VALUES(6, 1, 2, 'Otras Cuentas por Pagar');
INSERT INTO `cuenta` VALUES(6, 2, 1, 'Clientes');
INSERT INTO `cuenta` VALUES(6, 2, 3, 'Reserva de Presion');
INSERT INTO `cuenta` VALUES(7, 2, 1, 'Documentos por Cobrar');
INSERT INTO `cuenta` VALUES(7, 2, 2, 'Prestamos Bancarios');
INSERT INTO `cuenta` VALUES(7, 2, 3, 'Reserva de Reinversion');
INSERT INTO `cuenta` VALUES(8, 2, 1, 'Deudores Varios');
INSERT INTO `cuenta` VALUES(8, 2, 2, 'Hipotecas por Pagar');
INSERT INTO `cuenta` VALUES(8, 2, 3, 'Reserva de Educacion');
INSERT INTO `cuenta` VALUES(9, 2, 1, 'Anticipos a Empleados');
INSERT INTO `cuenta` VALUES(9, 2, 3, 'Utilidades Acumuladas');
INSERT INTO `cuenta` VALUES(9, 3, 2, 'Provisiones por Garantias');
INSERT INTO `cuenta` VALUES(10, 2, 1, 'Servicios por Cobrar');
INSERT INTO `cuenta` VALUES(10, 2, 3, 'Perdidas No Aplicadas');
INSERT INTO `cuenta` VALUES(10, 3, 2, 'Provisiones para Beneficios de Empleados');
INSERT INTO `cuenta` VALUES(11, 2, 3, 'Utilidad o Perdida del Periodo');
INSERT INTO `cuenta` VALUES(11, 3, 1, 'Inventario de Mercaderias');
INSERT INTO `cuenta` VALUES(11, 4, 2, 'Rentas Cobradas por Anticipado');
INSERT INTO `cuenta` VALUES(12, 3, 1, 'Almacen de Materia Prima');
INSERT INTO `cuenta` VALUES(12, 4, 2, 'Anticipos de Clientes');
INSERT INTO `cuenta` VALUES(13, 3, 1, 'Almacen de Productos en Proceso');
INSERT INTO `cuenta` VALUES(13, 4, 2, 'Intereses Cobrados por Anticipado');
INSERT INTO `cuenta` VALUES(14, 4, 1, 'Seguros Pagados por Anticipado');
INSERT INTO `cuenta` VALUES(15, 4, 1, 'Rentas Pagadas por Anticipado');
INSERT INTO `cuenta` VALUES(16, 4, 1, 'Impuesto Sobre Ventas Pagados');
INSERT INTO `cuenta` VALUES(17, 4, 1, 'Pago Anticipado de Impuesto');
INSERT INTO `cuenta` VALUES(18, 4, 1, 'Intereses Pagados por Anticipado');
INSERT INTO `cuenta` VALUES(19, 4, 1, 'Papeleria y Utiles');
INSERT INTO `cuenta` VALUES(20, 4, 1, 'Material de Empaque');
INSERT INTO `cuenta` VALUES(21, 4, 1, 'Material de Aseo');
INSERT INTO `cuenta` VALUES(22, 4, 1, 'Anticipos a Proveedores');
INSERT INTO `cuenta` VALUES(23, 4, 1, 'Publicidad');
INSERT INTO `cuenta` VALUES(24, 4, 1, 'Accesorios y Suministros');
INSERT INTO `cuenta` VALUES(25, 5, 1, 'Depositos a Plazo Fijo');
INSERT INTO `cuenta` VALUES(26, 5, 1, 'Inversiones y Valores');
INSERT INTO `cuenta` VALUES(27, 5, 1, 'Inversiones en Bonos');
INSERT INTO `cuenta` VALUES(28, 6, 1, 'Terrenos');
INSERT INTO `cuenta` VALUES(29, 6, 1, 'Edificios');
INSERT INTO `cuenta` VALUES(30, 6, 1, 'Maquinaria');
INSERT INTO `cuenta` VALUES(31, 6, 1, 'Mobiliario y Equipo');
INSERT INTO `cuenta` VALUES(32, 6, 1, 'Equipo de Reparto');
INSERT INTO `cuenta` VALUES(33, 6, 1, 'Equipo de Transporte');
INSERT INTO `cuenta` VALUES(34, 6, 1, 'Herramientas');
INSERT INTO `cuenta` VALUES(35, 7, 1, 'Marcas');
INSERT INTO `cuenta` VALUES(36, 7, 1, 'Patentes');
INSERT INTO `cuenta` VALUES(37, 7, 1, 'Derechos de Autor');
INSERT INTO `cuenta` VALUES(38, 7, 1, 'Franquicias');
INSERT INTO `cuenta` VALUES(39, 7, 1, 'Aplicaciones de Informatica');
INSERT INTO `cuenta` VALUES(40, 7, 1, 'Credito Mercantil');
INSERT INTO `cuenta` VALUES(41, 8, 1, 'Depositos en Garantia');

-- --------------------------------------------------------

--
-- Table structure for table `elemento`
--

CREATE TABLE IF NOT EXISTS `elemento` (
  `elementoId` int(1) NOT NULL,
  `nombre` varchar(7) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`elementoId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `elemento`
--

INSERT INTO `elemento` VALUES(1, 'Activo');
INSERT INTO `elemento` VALUES(2, 'Pasivo');
INSERT INTO `elemento` VALUES(3, 'Capital');

-- --------------------------------------------------------

--
-- Table structure for table `registro`
--

CREATE TABLE IF NOT EXISTS `registro` (
  `registroId` int(3) NOT NULL AUTO_INCREMENT,
  `cuentaId` int(2) NOT NULL,
  `clasificacionId` int(2) NOT NULL,
  `elementoId` int(1) NOT NULL,
  `descripcion` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `cantidad` decimal(7,2) NOT NULL,
  `registro` int(3) DEFAULT NULL,
  PRIMARY KEY (`registroId`,`cuentaId`,`clasificacionId`,`elementoId`),
  KEY `registro` (`registro`),
  KEY `cuentaId` (`cuentaId`),
  KEY `elementoId` (`elementoId`),
  KEY `registro_clasificacionId_PK` (`clasificacionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clasificacion`
--
ALTER TABLE `clasificacion`
  ADD CONSTRAINT `clasificacion_elementoId_PK` FOREIGN KEY (`elementoId`) REFERENCES `elemento` (`elementoId`);

--
-- Constraints for table `cuenta`
--
ALTER TABLE `cuenta`
  ADD CONSTRAINT `cuenta_clasificacionId_PK` FOREIGN KEY (`clasificacionId`) REFERENCES `clasificacion` (`clasificacionId`),
  ADD CONSTRAINT `cuenta_elementoId_PK` FOREIGN KEY (`elementoId`) REFERENCES `clasificacion` (`elementoId`);

--
-- Constraints for table `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `registro_clasificacionId_PK` FOREIGN KEY (`clasificacionId`) REFERENCES `cuenta` (`clasificacionId`),
  ADD CONSTRAINT `registro_cuentaId_PK` FOREIGN KEY (`cuentaId`) REFERENCES `cuenta` (`cuentaId`),
  ADD CONSTRAINT `registro_elementoId_PK` FOREIGN KEY (`elementoId`) REFERENCES `cuenta` (`elementoId`),
  ADD CONSTRAINT `registro_registro_FK` FOREIGN KEY (`registro`) REFERENCES `registro` (`registroId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
