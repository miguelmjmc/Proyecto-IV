-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 23, 2020 at 03:48 PM
-- Server version: 10.3.24-MariaDB-2
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyecto-iv`
--

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `identificationNumber`, `name`, `lastName`, `address`, `email`, `phone`, `comment`, `disabled`, `createdAt`, `updatedAt`) VALUES
(1, 'V-12345678', 'Demetrio', 'López García', 'Av. Universitaria', 'demetrio@mail.com', '+58 (1234) 123-4567', NULL, 0, '2020-01-25 17:12:35', '2020-01-25 18:04:15');

--
-- Dumping data for table `company_settings`
--

INSERT INTO `company_settings` (`id`, `identificationNumber`, `name`, `slogan`, `address`, `latitude`, `longitude`, `email`, `phone1`, `phone2`, `img`, `facebook`, `twitter`, `instagram`, `youtube`, `mission`, `vision`, `history`) VALUES
(1, 'J-30666573-0', 'Representaciones Jemaro.C.A', 'Cuidando la salud de su vehículo', 'Locales n° 20 y n° 21 del Terminal de Pasajeros de Carúpano, Municipio Bermúdez, Estado Sucre, Venezuela.', '10.670287', '-63.253175', 'jemaroca@mail.com', '+58 (294) 332-1405', '+58 (000) 000-0000', '/img/logo.png', 'http://facebook.com/', 'http://twitter.com/', 'http://instagram.com', 'https://www.youtube.com/', 'Atender las necesidades de repuestos y servicios en el mercado\r\nautomotor a través del mejor equipo humano, brindando un excelente\r\nservicio de venta y post venta a nuestros clientes.', 'Ser una organización líder en soluciones automotrices de las marcas\r\nmás prestigiosas y reconocidas del mundo, ofreciendo productos y servicios\r\nde excelente calidad a precios competitivos.', 'Representaciones Jemaro.C.A nace en 1992, bajo la idea de cubrir las necesidades de repuestos y servicios para vehículos en la rama diesel, dando inicio mercantil como “Representaciones Jemaro” (firma personal). En el año 1994, se apertura el primer local en la calle Juncal, sector plaza Bolívar, donde se desenvolvieron las actividades durante cinco (05) años, sin lograr consolidar una cartera de clientes estable. Para finales del año 1998 el proyecto inicial cambia de rumbo hacia repuestos automotrices para vehículos a gasolina y se transforma en “Representaciones Jemaro.C.A” con un mejor y mayor mercado que explotar. Se inician las actividades en calle Carabobo a la altura de barrio Sucre y para el 20 de diciembre de 1999 se traslada la sede al terminal de  4 pasajeros de Carúpano, donde ha permanecido y desarrollado sus actividades hasta el día de hoy.');

--
-- Dumping data for table `currency_conversion`
--

INSERT INTO `currency_conversion` (`id`, `dollarValue`, `euroValue`, `createdAt`, `updatedAt`) VALUES
(3, '470183.51', '512500.03', '2020-10-23 14:31:14', '2020-10-23 14:31:14');

--
-- Dumping data for table `operation_log`
--

INSERT INTO `operation_log` (`id`, `user_id`, `date`, `entity`, `entityId`, `request`, `method`, `action`, `changeSet`) VALUES
(1, 1, '2020-10-23 11:38:25', 'VehicleBrand', NULL, '/system/crud/VehicleBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:6:\"Toyota\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(2, 1, '2020-10-23 11:38:37', 'VehicleBrand', NULL, '/system/crud/VehicleBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:7:\"Renault\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(3, 1, '2020-10-23 11:38:55', 'VehicleBrand', NULL, '/system/crud/VehicleBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:6:\"Nissan\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(4, 1, '2020-10-23 11:39:07', 'VehicleBrand', NULL, '/system/crud/VehicleBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:5:\"Mazda\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(5, 1, '2020-10-23 11:39:33', 'VehicleBrand', NULL, '/system/crud/VehicleBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:7:\"Hyundai\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(6, 1, '2020-10-23 11:41:40', 'VehicleBrand', NULL, '/system/crud/VehicleBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:4:\"Audi\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(7, 1, '2020-10-23 11:42:14', 'VehicleBrand', NULL, '/system/crud/VehicleBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:9:\"Chevrolet\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(8, 1, '2020-10-23 11:42:33', 'VehicleBrand', NULL, '/system/crud/VehicleBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:5:\"Dodge\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(9, 1, '2020-10-23 11:42:39', 'VehicleBrand', NULL, '/system/crud/VehicleBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:3:\"For\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(10, 1, '2020-10-23 11:43:14', 'VehicleBrand', NULL, '/system/crud/VehicleBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:7:\"Hyundai\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(11, 1, '2020-10-23 11:43:28', 'VehicleBrand', NULL, '/system/crud/VehicleBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:5:\"Mazda\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(12, 1, '2020-10-23 11:43:47', 'VehicleBrand', NULL, '/system/crud/VehicleBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:6:\"Nissan\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(13, 1, '2020-10-23 11:44:00', 'VehicleBrand', NULL, '/system/crud/VehicleBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:7:\"Renault\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(14, 1, '2020-10-23 11:44:04', 'VehicleBrand', NULL, '/system/crud/VehicleBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:6:\"Toyota\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(15, 1, '2020-10-23 11:52:44', 'VehicleCategory', NULL, '/system/crud/VehicleCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:9:\"Autobuses\";}}'),
(16, 1, '2020-10-23 11:53:32', 'VehicleCategory', NULL, '/system/crud/VehicleCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:13:\"Autocaravanas\";}}'),
(17, 1, '2020-10-23 11:54:25', 'VehicleCategory', NULL, '/system/crud/VehicleCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:12:\"Automóviles\";}}'),
(18, 1, '2020-10-23 11:54:50', 'VehicleCategory', NULL, '/system/crud/VehicleCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:8:\"Camiones\";}}'),
(19, 1, '2020-10-23 11:54:57', 'VehicleCategory', NULL, '/system/crud/VehicleCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:10:\"Camionetas\";}}'),
(20, 1, '2020-10-23 11:55:11', 'VehicleCategory', NULL, '/system/crud/VehicleCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:8:\"Furgones\";}}'),
(21, 1, '2020-10-23 11:55:21', 'VehicleCategory', NULL, '/system/crud/VehicleCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:12:\"Motocicletas\";}}'),
(22, 1, '2020-10-23 11:56:33', 'VehicleCategory', NULL, '/system/crud/VehicleCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:12:\"Todoterrenos\";}}'),
(23, 1, '2020-10-23 12:00:23', 'Vehicle', NULL, '/system/crud/Vehicle', 'POST', 'Insert', 'a:7:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:6:\"Malibu\";}s:11:\"seriesStart\";a:2:{s:4:\"from\";N;s:2:\"to\";i:1978;}s:9:\"seriesEnd\";a:2:{s:4:\"from\";N;s:2:\"to\";i:1983;}s:9:\"createdAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 12:00:23\";}s:9:\"updatedAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 12:00:23\";}s:15:\"vehicleCategory\";a:2:{s:4:\"from\";N;s:2:\"to\";i:3;}s:12:\"vehicleBrand\";a:2:{s:4:\"from\";N;s:2:\"to\";i:2;}}'),
(24, 1, '2020-10-23 12:03:03', 'Vehicle', NULL, '/system/crud/Vehicle', 'POST', 'Insert', 'a:7:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:6:\"Malibu\";}s:11:\"seriesStart\";a:2:{s:4:\"from\";N;s:2:\"to\";i:1978;}s:9:\"seriesEnd\";a:2:{s:4:\"from\";N;s:2:\"to\";i:1982;}s:9:\"createdAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 12:03:03\";}s:9:\"updatedAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 12:03:03\";}s:15:\"vehicleCategory\";a:2:{s:4:\"from\";N;s:2:\"to\";i:3;}s:12:\"vehicleBrand\";a:2:{s:4:\"from\";N;s:2:\"to\";i:2;}}'),
(25, 1, '2020-10-23 12:04:41', 'Vehicle', '1', '/system/crud/Vehicle/1', 'PUT', 'Update', 'a:3:{s:4:\"name\";a:2:{s:4:\"from\";s:6:\"Malibu\";s:2:\"to\";s:7:\"Caprice\";}s:11:\"seriesStart\";a:2:{s:4:\"from\";i:1978;s:2:\"to\";i:1971;}s:9:\"seriesEnd\";a:2:{s:4:\"from\";i:1983;s:2:\"to\";i:1976;}}'),
(26, 1, '2020-10-23 12:05:56', 'Vehicle', '1', '/system/crud/Vehicle/1', 'PUT', 'Update', 'a:3:{s:4:\"name\";a:2:{s:4:\"from\";s:7:\"Caprice\";s:2:\"to\";s:6:\"Malibu\";}s:11:\"seriesStart\";a:2:{s:4:\"from\";i:1971;s:2:\"to\";i:1978;}s:9:\"seriesEnd\";a:2:{s:4:\"from\";i:1976;s:2:\"to\";i:1983;}}'),
(27, 1, '2020-10-23 12:06:54', 'Vehicle', '2', '/system/crud/Vehicle/2', 'PUT', 'Update', 'a:3:{s:4:\"name\";a:2:{s:4:\"from\";s:6:\"Malibu\";s:2:\"to\";s:7:\"Caprice\";}s:11:\"seriesStart\";a:2:{s:4:\"from\";i:1978;s:2:\"to\";i:1971;}s:9:\"seriesEnd\";a:2:{s:4:\"from\";i:1982;s:2:\"to\";i:1976;}}'),
(28, 1, '2020-10-23 12:07:19', 'Vehicle', NULL, '/system/crud/Vehicle', 'POST', 'Insert', 'a:7:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:7:\"Caprice\";}s:11:\"seriesStart\";a:2:{s:4:\"from\";N;s:2:\"to\";i:1977;}s:9:\"seriesEnd\";a:2:{s:4:\"from\";N;s:2:\"to\";i:1990;}s:9:\"createdAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 12:07:19\";}s:9:\"updatedAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 12:07:19\";}s:15:\"vehicleCategory\";a:2:{s:4:\"from\";N;s:2:\"to\";i:3;}s:12:\"vehicleBrand\";a:2:{s:4:\"from\";N;s:2:\"to\";i:2;}}'),
(29, 1, '2020-10-23 12:08:17', 'Vehicle', NULL, '/system/crud/Vehicle', 'POST', 'Insert', 'a:7:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:5:\"Camry\";}s:11:\"seriesStart\";a:2:{s:4:\"from\";N;s:2:\"to\";i:1997;}s:9:\"seriesEnd\";a:2:{s:4:\"from\";N;s:2:\"to\";i:2001;}s:9:\"createdAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 12:08:17\";}s:9:\"updatedAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 12:08:17\";}s:15:\"vehicleCategory\";a:2:{s:4:\"from\";N;s:2:\"to\";i:3;}s:12:\"vehicleBrand\";a:2:{s:4:\"from\";N;s:2:\"to\";i:9;}}'),
(30, 1, '2020-10-23 12:09:26', 'Vehicle', NULL, '/system/crud/Vehicle', 'POST', 'Insert', 'a:7:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:5:\"Hilux\";}s:11:\"seriesStart\";a:2:{s:4:\"from\";N;s:2:\"to\";i:1997;}s:9:\"seriesEnd\";a:2:{s:4:\"from\";N;s:2:\"to\";i:2004;}s:9:\"createdAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 12:09:26\";}s:9:\"updatedAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 12:09:26\";}s:15:\"vehicleCategory\";a:2:{s:4:\"from\";N;s:2:\"to\";i:5;}s:12:\"vehicleBrand\";a:2:{s:4:\"from\";N;s:2:\"to\";i:9;}}'),
(31, 1, '2020-10-23 12:10:08', 'Vehicle', NULL, '/system/crud/Vehicle', 'POST', 'Insert', 'a:7:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:5:\"Hilux\";}s:11:\"seriesStart\";a:2:{s:4:\"from\";N;s:2:\"to\";i:2004;}s:9:\"seriesEnd\";a:2:{s:4:\"from\";N;s:2:\"to\";i:2015;}s:9:\"createdAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 12:10:08\";}s:9:\"updatedAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 12:10:08\";}s:15:\"vehicleCategory\";a:2:{s:4:\"from\";N;s:2:\"to\";i:5;}s:12:\"vehicleBrand\";a:2:{s:4:\"from\";N;s:2:\"to\";i:9;}}'),
(32, 1, '2020-10-23 12:31:17', 'ProductBrand', NULL, '/system/crud/ProductBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:3:\"555\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(33, 1, '2020-10-23 12:31:49', 'ProductBrand', NULL, '/system/crud/ProductBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:11:\"Bridgestone\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(34, 1, '2020-10-23 12:32:08', 'ProductBrand', NULL, '/system/crud/ProductBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:8:\"Champion\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(35, 1, '2020-10-23 12:32:36', 'ProductBrand', NULL, '/system/crud/ProductBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:8:\"Goodyear\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(36, 1, '2020-10-23 12:33:00', 'ProductBrand', NULL, '/system/crud/ProductBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:7:\"Hyundai\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(37, 1, '2020-10-23 12:33:27', 'ProductBrand', '5', '/system/crud/ProductBrand/5', 'PUT', 'Update', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";s:7:\"Hyundai\";s:2:\"to\";s:4:\"Koyo\";}}'),
(38, 1, '2020-10-23 12:33:48', 'ProductBrand', NULL, '/system/crud/ProductBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:5:\"Mobil\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(39, 1, '2020-10-23 12:34:00', 'ProductBrand', NULL, '/system/crud/ProductBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:4:\"Moog\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(40, 1, '2020-10-23 12:35:11', 'ProductBrand', NULL, '/system/crud/ProductBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:3:\"NGK\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(41, 1, '2020-10-23 12:35:35', 'ProductBrand', NULL, '/system/crud/ProductBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:7:\"Philips\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(42, 1, '2020-10-23 12:35:45', 'ProductBrand', NULL, '/system/crud/ProductBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:6:\"Timken\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(43, 1, '2020-10-23 14:18:10', 'CurrencyConversion', NULL, '/system/crud/CurrencyConversion', 'POST', 'Insert', 'a:4:{s:11:\"dollarValue\";a:2:{s:4:\"from\";N;s:2:\"to\";d:470183.51;}s:9:\"euroValue\";a:2:{s:4:\"from\";N;s:2:\"to\";d:512500.03;}s:9:\"createdAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 14:18:10\";}s:9:\"updatedAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 14:18:10\";}}'),
(44, 1, '2020-10-23 14:31:14', 'CurrencyConversion', NULL, '/system/crud/CurrencyConversion', 'POST', 'Insert', 'a:4:{s:11:\"dollarValue\";a:2:{s:4:\"from\";N;s:2:\"to\";d:470183.51;}s:9:\"euroValue\";a:2:{s:4:\"from\";N;s:2:\"to\";d:512500.03;}s:9:\"createdAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 14:31:14\";}s:9:\"updatedAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 14:31:14\";}}'),
(45, 1, '2020-10-23 14:50:10', 'User', '2', '/system/crud/User/2', 'PUT', 'Update', 'a:1:{s:5:\"roles\";a:2:{s:4:\"from\";a:0:{}s:2:\"to\";a:1:{i:0;s:10:\"ROLE_ADMIN\";}}}'),
(46, 1, '2020-10-23 14:52:27', 'ProductCategory', NULL, '/system/crud/ProductCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:10:\"Accesorios\";}}'),
(47, 1, '2020-10-23 14:52:38', 'ProductCategory', NULL, '/system/crud/ProductCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:18:\"Aceites y Aditivos\";}}'),
(48, 1, '2020-10-23 14:52:58', 'ProductCategory', NULL, '/system/crud/ProductCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:6:\"Bombas\";}}'),
(49, 1, '2020-10-23 14:53:05', 'ProductCategory', NULL, '/system/crud/ProductCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:7:\"Correas\";}}'),
(50, 1, '2020-10-23 14:53:19', 'ProductCategory', NULL, '/system/crud/ProductCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:7:\"Filtros\";}}'),
(51, 1, '2020-10-23 14:53:25', 'ProductCategory', NULL, '/system/crud/ProductCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:6:\"Frenos\";}}'),
(52, 1, '2020-10-23 14:53:40', 'ProductCategory', NULL, '/system/crud/ProductCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:9:\"Mangueras\";}}'),
(53, 1, '2020-10-23 14:53:52', 'ProductCategory', NULL, '/system/crud/ProductCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:18:\"Partes Eléctricas\";}}'),
(54, 1, '2020-10-23 14:54:17', 'ProductCategory', NULL, '/system/crud/ProductCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:11:\"Rodamientos\";}}'),
(55, 1, '2020-10-23 14:54:31', 'ProductCategory', NULL, '/system/crud/ProductCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:11:\"Suspensión\";}}'),
(56, 1, '2020-10-23 14:55:12', 'ProductCategory', NULL, '/system/crud/ProductCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:14:\"Tren Delantero\";}}'),
(57, 1, '2020-10-23 15:21:23', 'Product', NULL, '/system/crud/Product', 'POST', 'Insert', 'a:10:{s:4:\"code\";a:2:{s:4:\"from\";N;s:2:\"to\";s:5:\"10268\";}s:11:\"description\";a:2:{s:4:\"from\";N;s:2:\"to\";s:15:\"Muñon superior\";}s:5:\"price\";a:2:{s:4:\"from\";N;s:2:\"to\";d:12;}s:5:\"stock\";a:2:{s:4:\"from\";N;s:2:\"to\";i:4;}s:7:\"comment\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}s:11:\"viewCounter\";a:2:{s:4:\"from\";N;s:2:\"to\";i:0;}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";s:41:\"img/aa64d8cc9ca8e003da71b549161a9936.jpeg\";}s:9:\"createdAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 15:21:23\";}s:9:\"updatedAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 15:21:23\";}s:12:\"productBrand\";a:2:{s:4:\"from\";N;s:2:\"to\";i:1;}}'),
(58, 1, '2020-10-23 15:22:57', 'Product', NULL, '/system/crud/Product', 'POST', 'Insert', 'a:10:{s:4:\"code\";a:2:{s:4:\"from\";N;s:2:\"to\";s:5:\"Dot-4\";}s:11:\"description\";a:2:{s:4:\"from\";N;s:2:\"to\";s:20:\"Liga de freno 0.335L\";}s:5:\"price\";a:2:{s:4:\"from\";N;s:2:\"to\";d:3;}s:5:\"stock\";a:2:{s:4:\"from\";N;s:2:\"to\";i:24;}s:7:\"comment\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}s:11:\"viewCounter\";a:2:{s:4:\"from\";N;s:2:\"to\";i:0;}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";s:41:\"img/1b7e12b2231ab46305577e03970a8ac3.jpeg\";}s:9:\"createdAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 15:22:57\";}s:9:\"updatedAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 15:22:57\";}s:12:\"productBrand\";a:2:{s:4:\"from\";N;s:2:\"to\";i:6;}}'),
(59, 1, '2020-10-23 15:23:59', 'Product', NULL, '/system/crud/Product', 'POST', 'Insert', 'a:10:{s:4:\"code\";a:2:{s:4:\"from\";N;s:2:\"to\";s:5:\"Dot-4\";}s:11:\"description\";a:2:{s:4:\"from\";N;s:2:\"to\";s:16:\"Liga de freno 1L\";}s:5:\"price\";a:2:{s:4:\"from\";N;s:2:\"to\";d:8;}s:5:\"stock\";a:2:{s:4:\"from\";N;s:2:\"to\";i:10;}s:7:\"comment\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}s:11:\"viewCounter\";a:2:{s:4:\"from\";N;s:2:\"to\";i:0;}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";s:40:\"img/9d1db2158cda6fd64e39ea7d6ef61c80.png\";}s:9:\"createdAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 15:23:59\";}s:9:\"updatedAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 15:23:59\";}s:12:\"productBrand\";a:2:{s:4:\"from\";N;s:2:\"to\";i:6;}}'),
(60, 1, '2020-10-23 15:24:53', 'Product', '2', '/system/crud/Product/2', 'PUT', 'Update', 'a:2:{s:11:\"description\";a:2:{s:4:\"from\";s:20:\"Liga de freno 0.335L\";s:2:\"to\";s:19:\"Liga de freno 335ml\";}s:5:\"price\";a:2:{s:4:\"from\";s:4:\"3.00\";s:2:\"to\";d:3;}}'),
(61, 1, '2020-10-23 15:25:08', 'Product', '3', '/system/crud/Product/3', 'PUT', 'Update', 'a:2:{s:11:\"description\";a:2:{s:4:\"from\";s:16:\"Liga de freno 1L\";s:2:\"to\";s:17:\"Liga de freno 500\";}s:5:\"price\";a:2:{s:4:\"from\";s:4:\"8.00\";s:2:\"to\";d:5;}}'),
(62, 1, '2020-10-23 15:26:03', 'Product', NULL, '/system/crud/Product', 'POST', 'Insert', 'a:10:{s:4:\"code\";a:2:{s:4:\"from\";N;s:2:\"to\";s:5:\"20w50\";}s:11:\"description\";a:2:{s:4:\"from\";N;s:2:\"to\";s:18:\"Aceite de motor 1l\";}s:5:\"price\";a:2:{s:4:\"from\";N;s:2:\"to\";d:5;}s:5:\"stock\";a:2:{s:4:\"from\";N;s:2:\"to\";i:12;}s:7:\"comment\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}s:11:\"viewCounter\";a:2:{s:4:\"from\";N;s:2:\"to\";i:0;}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";s:41:\"img/682b54c84d50cfe9cd877de81ea763b6.jpeg\";}s:9:\"createdAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 15:26:03\";}s:9:\"updatedAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 15:26:03\";}s:12:\"productBrand\";a:2:{s:4:\"from\";N;s:2:\"to\";i:6;}}'),
(63, 1, '2020-10-23 15:28:27', 'Product', NULL, '/system/crud/Product', 'POST', 'Insert', 'a:10:{s:4:\"code\";a:2:{s:4:\"from\";N;s:2:\"to\";s:5:\"20w50\";}s:11:\"description\";a:2:{s:4:\"from\";N;s:2:\"to\";s:21:\"Aceite de motor 18.9l\";}s:5:\"price\";a:2:{s:4:\"from\";N;s:2:\"to\";d:80;}s:5:\"stock\";a:2:{s:4:\"from\";N;s:2:\"to\";i:2;}s:7:\"comment\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}s:11:\"viewCounter\";a:2:{s:4:\"from\";N;s:2:\"to\";i:0;}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";s:41:\"img/91ec0a682dd650b77d4c2d7286570fbd.jpeg\";}s:9:\"createdAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 15:28:27\";}s:9:\"updatedAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-10-23 15:28:27\";}s:12:\"productBrand\";a:2:{s:4:\"from\";N;s:2:\"to\";i:6;}}'),
(64, 1, '2020-10-23 15:29:13', 'Product', '2', '/product/2', 'GET', 'Update', 'a:1:{s:11:\"viewCounter\";a:2:{s:4:\"from\";i:0;s:2:\"to\";i:1;}}'),
(65, 1, '2020-10-23 15:32:07', 'Product', '3', '/product/3', 'GET', 'Update', 'a:1:{s:11:\"viewCounter\";a:2:{s:4:\"from\";i:0;s:2:\"to\";i:1;}}'),
(66, 1, '2020-10-23 15:33:21', 'Product', '1', '/product/1', 'GET', 'Update', 'a:1:{s:11:\"viewCounter\";a:2:{s:4:\"from\";i:0;s:2:\"to\";i:1;}}'),
(67, 1, '2020-10-23 15:35:21', 'Product', '1', '/system/crud/Product/1', 'PUT', 'Update', 'a:3:{s:4:\"code\";a:2:{s:4:\"from\";s:5:\"10268\";s:2:\"to\";s:6:\"TD-405\";}s:11:\"description\";a:2:{s:4:\"from\";s:15:\"Muñon superior\";s:2:\"to\";s:21:\"Muñon superior 10268\";}s:5:\"price\";a:2:{s:4:\"from\";s:5:\"12.00\";s:2:\"to\";d:12;}}'),
(68, 1, '2020-10-23 15:36:33', 'Product', '5', '/system/crud/Product/5', 'PUT', 'Update', 'a:3:{s:4:\"code\";a:2:{s:4:\"from\";s:5:\"20w50\";s:2:\"to\";s:5:\"AA-23\";}s:11:\"description\";a:2:{s:4:\"from\";s:21:\"Aceite de motor 18.9l\";s:2:\"to\";s:29:\"Aceite de motor 20w50 (18.9l)\";}s:5:\"price\";a:2:{s:4:\"from\";s:5:\"80.00\";s:2:\"to\";d:80;}}'),
(69, 1, '2020-10-23 15:37:04', 'Product', '4', '/system/crud/Product/4', 'PUT', 'Update', 'a:3:{s:4:\"code\";a:2:{s:4:\"from\";s:5:\"20w50\";s:2:\"to\";s:5:\"AA-21\";}s:11:\"description\";a:2:{s:4:\"from\";s:18:\"Aceite de motor 1l\";s:2:\"to\";s:26:\"Aceite de motor 20w50 (1l)\";}s:5:\"price\";a:2:{s:4:\"from\";s:4:\"5.00\";s:2:\"to\";d:5;}}'),
(70, 1, '2020-10-23 15:37:56', 'Product', '2', '/system/crud/Product/2', 'PUT', 'Update', 'a:3:{s:4:\"code\";a:2:{s:4:\"from\";s:5:\"Dot-4\";s:2:\"to\";s:5:\"FA-03\";}s:11:\"description\";a:2:{s:4:\"from\";s:19:\"Liga de freno 335ml\";s:2:\"to\";s:27:\"Liga de freno Dot-4 (335ml)\";}s:5:\"price\";a:2:{s:4:\"from\";s:4:\"3.00\";s:2:\"to\";d:3;}}'),
(71, 1, '2020-10-23 15:38:38', 'Product', '3', '/system/crud/Product/3', 'PUT', 'Update', 'a:3:{s:4:\"code\";a:2:{s:4:\"from\";s:5:\"Dot-4\";s:2:\"to\";s:5:\"FA-04\";}s:11:\"description\";a:2:{s:4:\"from\";s:17:\"Liga de freno 500\";s:2:\"to\";s:27:\"Liga de freno Dot-4 (500ml)\";}s:5:\"price\";a:2:{s:4:\"from\";s:4:\"5.00\";s:2:\"to\";d:5;}}');

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_brand_id`, `code`, `description`, `price`, `stock`, `comment`, `viewCounter`, `img`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'TD-405', 'Muñon superior 10268', '12.00', 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1, 'img/aa64d8cc9ca8e003da71b549161a9936.jpeg', '2020-10-23 15:21:23', '2020-10-23 15:35:21'),
(2, 6, 'FA-03', 'Liga de freno Dot-4 (335ml)', '3.00', 24, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1, 'img/1b7e12b2231ab46305577e03970a8ac3.jpeg', '2020-10-23 15:22:57', '2020-10-23 15:37:56'),
(3, 6, 'FA-04', 'Liga de freno Dot-4 (500ml)', '5.00', 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1, 'img/9d1db2158cda6fd64e39ea7d6ef61c80.png', '2020-10-23 15:23:59', '2020-10-23 15:38:38'),
(4, 6, 'AA-21', 'Aceite de motor 20w50 (1l)', '5.00', 12, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 0, 'img/682b54c84d50cfe9cd877de81ea763b6.jpeg', '2020-10-23 15:26:03', '2020-10-23 15:37:04'),
(5, 6, 'AA-23', 'Aceite de motor 20w50 (18.9l)', '80.00', 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 0, 'img/91ec0a682dd650b77d4c2d7286570fbd.jpeg', '2020-10-23 15:28:27', '2020-10-23 15:36:33');

--
-- Dumping data for table `product_brand`
--

INSERT INTO `product_brand` (`id`, `name`, `img`) VALUES
(1, '555', 'img/555.png'),
(2, 'Bridgestone', 'img/bridgestone.png'),
(3, 'Champion', 'img/champion.jpg'),
(4, 'Goodyear', 'img/goodyear.png'),
(5, 'Koyo', 'img/koyo.png'),
(6, 'Mobil', 'img/mobil.png'),
(7, 'Moog', 'img/moog.jpg'),
(8, 'NGK', 'img/ngk.svg'),
(9, 'Philips', 'img/philips.png'),
(10, 'Timken', 'img/timken.svg');

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `name`) VALUES
(1, 'Accesorios'),
(2, 'Aceites y Aditivos'),
(3, 'Bombas'),
(4, 'Correas'),
(5, 'Filtros'),
(6, 'Frenos'),
(7, 'Mangueras'),
(8, 'Partes Eléctricas'),
(9, 'Rodamientos'),
(10, 'Suspensión'),
(11, 'Tren Delantero');

--
-- Dumping data for table `product_product_category`
--

INSERT INTO `product_product_category` (`product_id`, `product_category_id`) VALUES
(1, 11),
(2, 2),
(2, 6),
(3, 2),
(3, 6),
(4, 2),
(5, 2);

--
-- Dumping data for table `product_vehicle`
--

INSERT INTO `product_vehicle` (`product_id`, `vehicle_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6);

--
-- Dumping data for table `session_log`
--

INSERT INTO `session_log` (`id`, `user_id`, `login`, `logout`, `ip`) VALUES
(1, 1, '2020-10-23 10:54:24', '2020-10-23 12:19:21', '127.0.0.1'),
(2, 1, '2020-10-23 12:20:29', '2020-10-23 14:37:24', '127.0.0.1'),
(3, 1, '2020-10-23 14:39:38', '2020-10-23 14:41:22', '127.0.0.1'),
(4, 2, '2020-10-23 14:41:40', '2020-10-23 14:42:16', '127.0.0.1'),
(5, 1, '2020-10-23 14:42:29', '2020-10-23 14:50:10', '127.0.0.1'),
(6, 2, '2020-10-23 14:50:54', '2020-10-23 14:51:44', '127.0.0.1'),
(7, 1, '2020-10-23 14:51:58', '2020-10-23 15:41:24', '127.0.0.1');

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `name`, `lastName`, `img`, `createdAt`, `updatedAt`) VALUES
(1, 'Admin', 'admin', 'admin@mail.com', 'admin@mail.com', 1, NULL, '$2y$13$JoOJVmM5F1j6fosM8PcUEe6ihMTHrXYXI1AVDl/0JwFI27m8hcc8K', '2020-10-23 14:51:58', NULL, NULL, 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:16:\"ROLE_SUPER_ADMIN\";}', 'Diego', 'de la Vega', NULL, '2020-01-23 15:20:26', '2020-10-23 14:51:58'),
(2, 'User', 'user', 'user@mail.com', 'user@mail.com', 1, NULL, '$2y$13$JoOJVmM5F1j6fosM8PcUEe6ihMTHrXYXI1AVDl/0JwFI27m8hcc8K', '2020-10-23 14:50:55', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}', 'Quijote', 'de la Mancha', NULL, '2020-10-23 12:22:20', '2020-10-23 14:50:55');

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`id`, `vehicle_category_id`, `vehicle_brand_id`, `name`, `seriesStart`, `seriesEnd`, `createdAt`, `updatedAt`) VALUES
(1, 3, 2, 'Malibu', 1978, 1983, '2020-10-23 12:00:23', '2020-10-23 12:05:56'),
(2, 3, 2, 'Caprice', 1971, 1976, '2020-10-23 12:03:03', '2020-10-23 12:06:54'),
(3, 3, 2, 'Caprice', 1977, 1990, '2020-10-23 12:07:19', '2020-10-23 12:07:19'),
(4, 3, 9, 'Camry', 1997, 2001, '2020-10-23 12:08:17', '2020-10-23 12:08:17'),
(5, 5, 9, 'Hilux', 1997, 2004, '2020-10-23 12:09:26', '2020-10-23 12:09:26'),
(6, 5, 9, 'Hilux', 2004, 2015, '2020-10-23 12:10:08', '2020-10-23 12:10:08');

--
-- Dumping data for table `vehicle_brand`
--

INSERT INTO `vehicle_brand` (`id`, `name`, `img`) VALUES
(1, 'Audi', 'img/audi.png'),
(2, 'Chevrolet', 'img/chevrolet.png'),
(3, 'Dodge', 'img/dodge.png'),
(4, 'Ford', 'img/ford.png'),
(5, 'Hyundai', 'img/hyundai.png'),
(6, 'Mazda', 'img/mazda.png'),
(7, 'Nissan', 'img/nissan.png'),
(8, 'Renault', 'img/renault.png'),
(9, 'Toyota', 'img/toyota.png');

--
-- Dumping data for table `vehicle_category`
--

INSERT INTO `vehicle_category` (`id`, `name`) VALUES
(1, 'Autobus'),
(2, 'Autocaravana'),
(3, 'Automóvil'),
(4, 'Camión'),
(5, 'Camioneta'),
(6, 'Furgón'),
(7, 'Motocicleta'),
(8, 'Todoterreno');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
