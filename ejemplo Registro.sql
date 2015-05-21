-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 20-05-2015 a las 21:34:40
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

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` VALUES
(1, 1, 1, 1, '2015-01-05', b'1', 'Dinero en efectivo L. 22,600', 22600.00, NULL),
(2, 3, 1, 1, '2015-01-05', b'1', 'Deposito en cuenta de cheques en HSBC por L.84,300 y en Bancatlan de L. 92,200', 176500.00, NULL),
(3, 3, 1, 2, '2015-01-05', b'1', 'Existencia en mercaderias L.1,572,700 de los cuales adeuda en cuenta corriente a diferentes casas comerciales L. 482,800 y firmando pagares y letras de cambio a corto plazo L. 378,600', 378600.00, NULL),
(3, 4, 1, 2, '2015-01-05', b'1', 'Existencia en mercaderias L.1,572,700 de los cuales adeuda en cuenta corriente a diferentes casas comerciales L. 482,800 y firmando pagares y letras de cambio a corto plazo L. 378,600', 482800.00, NULL),
(3, 11, 3, 1, '2015-01-05', b'1', 'Existencia en mercaderias L.1,572,700 de los cuales adeuda en cuenta corriente a diferentes casas comerciales L. 482,800 y firmando pagares y letras de cambio a corto plazo L. 378,600', 1572700.00, NULL),
(4, 6, 2, 1, '2015-01-05', b'1', 'Le deben mercaderias en cuenta corriente L. 238,500', 238500.00, NULL),
(5, 8, 2, 1, '2015-01-05', b'1', 'Le adeudan por concepto distinto a la venta de mercaderias L. 18,400', 18400.00, NULL),
(6, 3, 1, 2, '2015-01-05', b'1', 'Muebles y equipos por L. 48,200(valor neto) por el cual firma 10 letras de cambio de L. 2,000 c/u, pagaderas mensualmente', 20000.00, NULL),
(6, 31, 6, 1, '2015-01-05', b'1', 'Muebles y equipos por L. 48,200(valor neto) por el cual firma 10 letras de cambio de L. 2,000 c/u, pagaderas mensualmente', 48200.00, NULL),
(7, 32, 6, 1, '2015-01-05', b'1', 'Posee una camioneta para distribuir mercaderias, valor neto L. 290,000', 290000.00, NULL),
(8, 1, 1, 2, '2015-01-05', b'1', 'Pago por constitucion L. 40,000 del cual aun adeuda L. 20,000', 20000.00, NULL),
(8, 42, 4, 1, '2015-01-05', b'0', 'Pago por constitucion L. 40,000 del cual aun adeuda L. 20,000', 40000.00, NULL),
(9, 43, 4, 1, '2015-01-05', b'1', 'Compra un seguro para la camioneta por L. 12,000', 12000.00, 7),
(10, 8, 2, 2, '2015-01-05', b'1', 'Pago anticipadamente 6 meses de alquiler del local en L. 980,000, el cual hipoteca en Banco Atlantida en L. 600,000 a 5 años plazo', 600000.00, NULL),
(10, 28, 6, 1, '2015-01-05', b'1', 'Pago anticipadamente 6 meses de alquiler del local en L. 980,000, el cual hipoteca en Banco Atlantida en L. 600,000 a 5 años plazo', 980000.00, NULL),
(11, 11, 4, 2, '2015-01-05', b'0', 'Da en subarrendamiento una parte del local por el que cobro anticipadamente 4 meses, a razon de L. 3,000 c/mes', 12000.00, NULL),
(12, 2, 1, 3, '2015-01-05', b'1', 'Utilidad neta del periodo L. 379,940', 379940.00, NULL),
(13, 6, 1, 2, '2015-01-05', b'1', 'Impuesto sobre la renta a pagar L. 51,860', 51860.00, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
