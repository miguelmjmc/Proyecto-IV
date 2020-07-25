-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 27, 2020 at 01:54 AM
-- Server version: 10.3.18-MariaDB-0+deb10u1
-- PHP Version: 7.3.11-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Proyecto-IV`
--

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `identificationNumber`, `name`, `lastName`, `address`, `email`, `phone`, `createdAt`, `updatedAt`, `comment`, `disabled`) VALUES
(1, 'V-12345678', 'Demetrio', 'López García', 'Av. Universitaria', 'demetrio@mail.com', '+58 (1234) 123-4567', '2020-01-25 17:12:35', '2020-01-25 18:04:15', NULL, 0);

--
-- Dumping data for table `company_settings`
--

INSERT INTO `company_settings` (`id`, `identificationNumber`, `name`, `slogan`, `address`, `latitude`, `longitude`, `email`, `phone1`, `phone2`, `img`, `facebook`, `twitter`, `instagram`, `youtube`, `whatsapp`, `telegram`, `skype`, `mission`, `vision`, `history`) VALUES
(1, 'J-30666573-0', 'Representaciones Jemaro.C.A', 'Cuidando la salud de su vehículo', 'Locales n° 20 y n° 21 del Terminal de Pasajeros de Carúpano, Municipio Bermúdez, Estado Sucre, Venezuela.', '10.670287', '-63.253175', 'jemaroca@mail.com', '+58 (294) 332-1405', '+58 (000) 000-0000', '/img/logo.png', 'http://facebook.com/', 'http://twitter.com/', 'http://instagram.com', 'https://www.youtube.com/', '+58 (000) 000-0000', '+58 (0294) 000-0000', '+58 (0294) 000-0000', 'Atender las necesidades de repuestos y servicios en el mercado\r\nautomotor a través del mejor equipo humano, brindando un excelente\r\nservicio de venta y post venta a nuestros clientes.', 'Ser una organización líder en soluciones automotrices de las marcas\r\nmás prestigiosas y reconocidas del mundo, ofreciendo productos y servicios\r\nde excelente calidad a precios competitivos.', 'Representaciones Jemaro.C.A nace en 1992, bajo la idea de cubrir las necesidades de repuestos y servicios para vehículos en la rama diesel, dando inicio mercantil como “Representaciones Jemaro” (firma personal). En el año 1994, se apertura el primer local en la calle Juncal, sector plaza Bolívar, donde se desenvolvieron las actividades durante cinco (05) años, sin lograr consolidar una cartera de clientes estable. Para finales del año 1998 el proyecto inicial cambia de rumbo hacia repuestos automotrices para vehículos a gasolina y se transforma en “Representaciones Jemaro.C.A” con un mejor y mayor mercado que explotar. Se inician las actividades en calle Carabobo a la altura de barrio Sucre y para el 20 de diciembre de 1999 se traslada la sede al terminal de  4 pasajeros de Carúpano, donde ha permanecido y desarrollado sus actividades hasta el día de hoy.');

--
-- Dumping data for table `operation_log`
--

INSERT INTO `operation_log` (`id`, `user_id`, `date`, `entity`, `entityId`, `request`, `method`, `action`, `changeSet`) VALUES
(1, 1, '2020-01-25 02:46:18', 'User', '1', '/login_check', 'POST', 'Update', 'a:1:{s:9:\"lastLogin\";a:2:{s:4:\"from\";s:19:\"2020-01-25 00:46:40\";s:2:\"to\";s:19:\"2020-01-25 02:46:18\";}}'),
(2, 1, '2020-01-25 02:47:36', 'User', '1', '/login_check', 'POST', 'Update', 'a:1:{s:9:\"lastLogin\";a:2:{s:4:\"from\";s:19:\"2020-01-25 02:46:18\";s:2:\"to\";s:19:\"2020-01-25 02:47:36\";}}'),
(3, 1, '2020-01-25 02:50:09', 'ProductCategory', NULL, '/system/crud/ProductCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:12:\"fghfghfghgfh\";}}'),
(4, 1, '2020-01-25 02:50:18', 'ProductCategory', '4', '/system/crud/ProductCategory/4', 'PUT', 'Update', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";s:12:\"fghfghfghgfh\";s:2:\"to\";s:10:\"aaaaaaaaaa\";}}'),
(5, 1, '2020-01-25 02:50:22', 'ProductCategory', '4', '/system/crud/ProductCategory/4', 'DELETE', 'Delete', 'a:0:{}'),
(6, 1, '2020-01-25 17:23:13', 'User', NULL, '/system/crud/User', 'POST', 'Insert', 'a:16:{s:8:\"username\";a:2:{s:4:\"from\";N;s:2:\"to\";s:4:\"aaaa\";}s:17:\"usernameCanonical\";a:2:{s:4:\"from\";N;s:2:\"to\";s:4:\"aaaa\";}s:5:\"email\";a:2:{s:4:\"from\";N;s:2:\"to\";s:13:\"aaaa@mail.com\";}s:14:\"emailCanonical\";a:2:{s:4:\"from\";N;s:2:\"to\";s:13:\"aaaa@mail.com\";}s:7:\"enabled\";a:2:{s:4:\"from\";N;s:2:\"to\";b:1;}s:4:\"salt\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}s:8:\"password\";a:2:{s:4:\"from\";N;s:2:\"to\";s:60:\"$2y$13$8c6gSPVv9WSe0uXwV9eX/uT0LaK5nq45Cv72fvIgElkgCAomLkfTu\";}s:9:\"lastLogin\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}s:17:\"confirmationToken\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}s:19:\"passwordRequestedAt\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}s:5:\"roles\";a:2:{s:4:\"from\";N;s:2:\"to\";a:0:{}}s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:7:\"fdgdfgg\";}s:8:\"lastName\";a:2:{s:4:\"from\";N;s:2:\"to\";s:9:\"dfgdfgfdg\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}s:9:\"createdAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-01-25 17:23:13\";}s:9:\"updatedAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-01-25 17:23:13\";}}'),
(7, 1, '2020-01-25 17:23:53', 'User', '2', '/system/crud/User/2', 'PUT', 'Update', 'a:1:{s:7:\"enabled\";a:2:{s:4:\"from\";b:1;s:2:\"to\";b:0;}}'),
(8, 1, '2020-01-25 17:24:01', 'User', '2', '/system/crud/User/2', 'PUT', 'Update', 'a:1:{s:5:\"roles\";a:2:{s:4:\"from\";a:0:{}s:2:\"to\";a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}}}'),
(9, 1, '2020-01-25 17:24:21', 'User', '2', '/system/crud/User/2', 'PUT', 'Update', 'a:1:{s:7:\"enabled\";a:2:{s:4:\"from\";b:0;s:2:\"to\";b:1;}}'),
(10, 1, '2020-01-25 17:36:28', 'Client', NULL, '/system/crud/Client', 'POST', 'Insert', 'a:6:{s:20:\"identificationNumber\";a:2:{s:4:\"from\";N;s:2:\"to\";s:10:\"V-12345678\";}s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:8:\"Demetrio\";}s:8:\"lastName\";a:2:{s:4:\"from\";N;s:2:\"to\";s:14:\"López García\";}s:7:\"address\";a:2:{s:4:\"from\";N;s:2:\"to\";s:17:\"Av. Universitaria\";}s:5:\"email\";a:2:{s:4:\"from\";N;s:2:\"to\";s:17:\"Demetrio@mail.com\";}s:5:\"phone\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"+58 (1234) 123-4567\";}}'),
(11, 1, '2020-01-25 17:43:41', 'Client', '1', '/system/crud/Client/1', 'PUT', 'Update', 'a:1:{s:7:\"address\";a:2:{s:4:\"from\";s:17:\"Av. Universitaria\";s:2:\"to\";s:35:\"Av. Universitaria, Sector el Mangle\";}}'),
(12, 1, '2020-01-25 17:44:33', 'Client', '1', '/system/crud/Client/1', 'PUT', 'Update', 'a:1:{s:7:\"address\";a:2:{s:4:\"from\";s:35:\"Av. Universitaria, Sector el Mangle\";s:2:\"to\";s:17:\"Av. Universitaria\";}}'),
(13, 1, '2020-01-25 17:47:22', 'Client', '1', '/system/crud/Client/1', 'PUT', 'Update', 'a:1:{s:5:\"email\";a:2:{s:4:\"from\";s:17:\"Demetrio@mail.com\";s:2:\"to\";s:17:\"demetrio@mail.com\";}}'),
(14, 1, '2020-01-25 17:48:23', 'Client', '1', '/system/crud/Client/1', 'PUT', 'Update', 'a:1:{s:5:\"email\";a:2:{s:4:\"from\";s:17:\"demetrio@mail.com\";s:2:\"to\";s:18:\"demetrio@mail.coma\";}}'),
(15, 1, '2020-01-25 17:49:06', 'Client', '1', '/system/crud/Client/1', 'PUT', 'Update', 'a:1:{s:5:\"email\";a:2:{s:4:\"from\";s:18:\"demetrio@mail.coma\";s:2:\"to\";s:17:\"demetrio@mail.com\";}}'),
(16, 1, '2020-01-25 18:00:12', 'Client', '1', '/system/crud/Client/1', 'PUT', 'Update', 'a:1:{s:8:\"disabled\";a:2:{s:4:\"from\";N;s:2:\"to\";b:1;}}'),
(17, 1, '2020-01-25 18:01:42', 'Client', '1', '/system/crud/Client/1', 'PUT', 'Update', 'a:1:{s:8:\"disabled\";a:2:{s:4:\"from\";b:1;s:2:\"to\";b:0;}}'),
(18, 1, '2020-01-25 18:04:04', 'Client', '1', '/system/crud/Client/1', 'PUT', 'Update', 'a:1:{s:8:\"disabled\";a:2:{s:4:\"from\";b:0;s:2:\"to\";b:1;}}'),
(19, 1, '2020-01-25 18:04:14', 'Client', '1', '/system/crud/Client/1', 'PUT', 'Update', 'a:1:{s:8:\"disabled\";a:2:{s:4:\"from\";b:1;s:2:\"to\";b:0;}}'),
(20, 1, '2020-01-26 23:16:38', 'CompanySettings', '1', '/system/modal/companySettings', 'PUT', 'Update', 'a:4:{s:7:\"address\";a:2:{s:4:\"from\";s:109:\"Locales n° 20 y n° 21 del Terminal de Pasajeros de Carúpano, Municipio Bermúdez, Estado Sucre, Venezuela.\";s:2:\"to\";s:106:\"Locales n° 20 y n° 21 del Terminal de Pasajeros de Carúpano, Municipio Bermúdez, Estado Sucre, Venezue\";}s:8:\"latitude\";a:2:{s:4:\"from\";s:9:\"10.670287\";s:2:\"to\";d:10.670287;}s:9:\"longitude\";a:2:{s:4:\"from\";s:10:\"-63.253175\";s:2:\"to\";d:-63.253175;}s:9:\"instagram\";a:2:{s:4:\"from\";s:13:\"instagram.com\";s:2:\"to\";s:20:\"http://instagram.com\";}}'),
(21, 1, '2020-01-26 23:16:49', 'CompanySettings', '1', '/system/modal/companySettings', 'PUT', 'Update', 'a:3:{s:7:\"address\";a:2:{s:4:\"from\";s:106:\"Locales n° 20 y n° 21 del Terminal de Pasajeros de Carúpano, Municipio Bermúdez, Estado Sucre, Venezue\";s:2:\"to\";s:109:\"Locales n° 20 y n° 21 del Terminal de Pasajeros de Carúpano, Municipio Bermúdez, Estado Sucre, Venezuela.\";}s:8:\"latitude\";a:2:{s:4:\"from\";s:9:\"10.670287\";s:2:\"to\";d:10.670287;}s:9:\"longitude\";a:2:{s:4:\"from\";s:10:\"-63.253175\";s:2:\"to\";d:-63.253175;}}'),
(22, 1, '2020-01-26 23:26:41', 'User', '1', '/system/crud/User/1', 'PUT', 'Update', 'a:1:{s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";s:41:\"img/8d78889105f06223525eae9825b73733.jpeg\";}}'),
(23, 1, '2020-01-26 23:41:36', 'ProductCategory', NULL, '/system/crud/ProductCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:6:\"Frenos\";}}'),
(24, 1, '2020-01-26 23:41:46', 'ProductCategory', NULL, '/system/crud/ProductCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:5:\"sdsdd\";}}'),
(25, 1, '2020-01-26 23:41:52', 'ProductCategory', '6', '/system/crud/ProductCategory/6', 'PUT', 'Update', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";s:5:\"sdsdd\";s:2:\"to\";s:7:\"ddddddd\";}}'),
(26, 1, '2020-01-26 23:50:30', 'ProductBrand', NULL, '/system/crud/ProductBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:3:\"aaa\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(27, 1, '2020-01-26 23:52:04', 'ProductBrand', '1', '/system/crud/ProductBrand/1', 'PUT', 'Update', 'a:1:{s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";s:41:\"img/1fbbddf681598782bba1ef8908da9693.jpeg\";}}'),
(28, 1, '2020-01-26 23:56:20', 'ProductBrand', '1', '/system/crud/ProductBrand/1', 'DELETE', 'Delete', 'a:0:{}'),
(29, 1, '2020-01-27 00:03:48', 'ProductBrand', NULL, '/system/crud/ProductBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:11:\"fgdfgdfgdfg\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";s:40:\"img/7b9037bc5100dd631d3d2ebc0047404f.png\";}}'),
(30, 1, '2020-01-27 00:04:13', 'ProductBrand', '2', '/system/crud/ProductBrand/2', 'DELETE', 'Delete', 'a:0:{}'),
(31, 1, '2020-01-27 00:04:25', 'ProductBrand', NULL, '/system/crud/ProductBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:8:\"fgfgfgfg\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";s:41:\"img/8865855ed206e19ed4bf0a0084b80df2.jpeg\";}}'),
(32, 1, '2020-01-27 00:04:35', 'ProductBrand', '3', '/system/crud/ProductBrand/3', 'PUT', 'Update', 'a:1:{s:3:\"img\";a:2:{s:4:\"from\";s:41:\"img/8865855ed206e19ed4bf0a0084b80df2.jpeg\";s:2:\"to\";s:41:\"img/f8b4fb28bb00c64f07c0443ae3c3bd85.jpeg\";}}'),
(33, 1, '2020-01-27 00:05:06', 'ProductBrand', '3', '/system/crud/ProductBrand/3', 'PUT', 'Update', 'a:1:{s:3:\"img\";a:2:{s:4:\"from\";s:41:\"img/f8b4fb28bb00c64f07c0443ae3c3bd85.jpeg\";s:2:\"to\";s:41:\"img/3b8f879a87e1bb0b20638ffdc6d52c99.jpeg\";}}'),
(34, 1, '2020-01-27 00:05:27', 'ProductBrand', '3', '/system/crud/ProductBrand/3', 'DELETE', 'Delete', 'a:0:{}'),
(35, 1, '2020-01-27 00:05:56', 'ProductCategory', '6', '/system/crud/ProductCategory/6', 'DELETE', 'Delete', 'a:0:{}'),
(36, 1, '2020-01-27 00:05:59', 'ProductCategory', '5', '/system/crud/ProductCategory/5', 'DELETE', 'Delete', 'a:0:{}'),
(37, 1, '2020-01-27 01:12:25', 'VehicleBrand', NULL, '/system/crud/VehicleBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:4:\"aaaa\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";s:41:\"img/92689341d1d1afa67f4067eef8704fb6.jpeg\";}}'),
(38, 1, '2020-01-27 01:12:33', 'VehicleBrand', '1', '/system/crud/VehicleBrand/1', 'PUT', 'Update', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";s:4:\"aaaa\";s:2:\"to\";s:8:\"aaaazzzz\";}}'),
(39, 1, '2020-01-27 01:12:36', 'VehicleBrand', '1', '/system/crud/VehicleBrand/1', 'DELETE', 'Delete', 'a:0:{}'),
(40, 1, '2020-01-27 01:13:34', 'VehicleType', NULL, '/system/crud/VehicleType', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:6:\"nbvnbn\";}}'),
(41, 1, '2020-01-27 01:13:39', 'VehicleType', '1', '/system/crud/VehicleType/1', 'PUT', 'Update', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";s:6:\"nbvnbn\";s:2:\"to\";s:5:\"rrrrr\";}}'),
(42, 1, '2020-01-27 01:13:42', 'VehicleType', '1', '/system/crud/VehicleType/1', 'DELETE', 'Delete', 'a:0:{}'),
(44, 1, '2020-01-27 01:15:03', 'VehicleBrand', NULL, '/system/crud/VehicleBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:5:\"aaaaa\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(45, 1, '2020-01-27 01:15:12', 'VehicleBrand', '2', '/system/crud/VehicleBrand/2', 'PUT', 'Update', 'a:1:{s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";s:40:\"img/399ba5babf7113b0f89e533d1bd1aafd.png\";}}'),
(46, 1, '2020-01-27 01:15:17', 'VehicleBrand', '2', '/system/crud/VehicleBrand/2', 'DELETE', 'Delete', 'a:0:{}'),
(47, 1, '2020-01-27 01:15:20', 'VehicleBrand', NULL, '/system/crud/VehicleBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:6:\"aaaaaa\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(48, 1, '2020-01-27 01:15:34', 'VehicleType', NULL, '/system/crud/VehicleType', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:4:\"bbbb\";}}'),
(49, 1, '2020-01-27 01:16:47', 'Vehicle', NULL, '/system/crud/Vehicle', 'POST', 'Insert', 'a:6:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:3:\"aaa\";}s:5:\"years\";a:2:{s:4:\"from\";N;s:2:\"to\";s:3:\"123\";}s:9:\"createdAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-01-27 01:16:47\";}s:9:\"updatedAt\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}s:11:\"vehicleType\";a:2:{s:4:\"from\";N;s:2:\"to\";i:2;}s:12:\"vehicleBrand\";a:2:{s:4:\"from\";N;s:2:\"to\";i:3;}}'),
(50, 1, '2020-01-27 01:16:57', 'VehicleBrand', NULL, '/system/crud/VehicleBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:5:\"11111\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(51, 1, '2020-01-27 01:17:08', 'Vehicle', NULL, '/system/crud/Vehicle', 'POST', 'Insert', 'a:6:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:3:\"aaa\";}s:5:\"years\";a:2:{s:4:\"from\";N;s:2:\"to\";s:4:\"4545\";}s:9:\"createdAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-01-27 01:17:08\";}s:9:\"updatedAt\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}s:11:\"vehicleType\";a:2:{s:4:\"from\";N;s:2:\"to\";i:2;}s:12:\"vehicleBrand\";a:2:{s:4:\"from\";N;s:2:\"to\";i:4;}}'),
(52, 1, '2020-01-27 01:17:30', 'Vehicle', NULL, '/system/crud/Vehicle', 'POST', 'Insert', 'a:6:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:3:\"aaa\";}s:5:\"years\";a:2:{s:4:\"from\";N;s:2:\"to\";s:6:\"545454\";}s:9:\"createdAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-01-27 01:17:30\";}s:9:\"updatedAt\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}s:11:\"vehicleType\";a:2:{s:4:\"from\";N;s:2:\"to\";i:2;}s:12:\"vehicleBrand\";a:2:{s:4:\"from\";N;s:2:\"to\";i:3;}}'),
(53, 1, '2020-01-27 01:19:20', 'Vehicle', NULL, '/system/crud/Vehicle', 'POST', 'Insert', 'a:6:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:3:\"aaa\";}s:5:\"years\";a:2:{s:4:\"from\";N;s:2:\"to\";s:5:\"12355\";}s:9:\"createdAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-01-27 01:19:20\";}s:9:\"updatedAt\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}s:11:\"vehicleType\";a:2:{s:4:\"from\";N;s:2:\"to\";i:2;}s:12:\"vehicleBrand\";a:2:{s:4:\"from\";N;s:2:\"to\";i:3;}}'),
(54, 1, '2020-01-27 01:19:29', 'Vehicle', '4', '/system/crud/Vehicle/4', 'PUT', 'Update', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";s:3:\"aaa\";s:2:\"to\";s:11:\"fgnhfjnhngn\";}}'),
(55, 1, '2020-01-27 01:19:40', 'Vehicle', '4', '/system/crud/Vehicle/4', 'DELETE', 'Delete', 'a:0:{}'),
(56, 1, '2020-01-27 01:19:43', 'Vehicle', '3', '/system/crud/Vehicle/3', 'DELETE', 'Delete', 'a:0:{}'),
(57, 1, '2020-01-27 01:19:53', 'Vehicle', '2', '/system/crud/Vehicle/2', 'PUT', 'Update', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";s:3:\"aaa\";s:2:\"to\";s:4:\"bbbb\";}}'),
(58, 1, '2020-01-27 01:20:09', 'ProductBrand', NULL, '/system/crud/ProductBrand', 'POST', 'Insert', 'a:2:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:5:\"22222\";}s:3:\"img\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}}'),
(59, 1, '2020-01-27 01:20:18', 'ProductCategory', NULL, '/system/crud/ProductCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:4:\"zzzz\";}}'),
(60, 1, '2020-01-27 01:20:25', 'ProductCategory', NULL, '/system/crud/ProductCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:3:\"ccc\";}}'),
(63, 1, '2020-01-27 01:37:18', 'Product', NULL, '/system/crud/Product', 'POST', 'Insert', 'a:8:{s:4:\"code\";a:2:{s:4:\"from\";N;s:2:\"to\";s:6:\"554545\";}s:11:\"description\";a:2:{s:4:\"from\";N;s:2:\"to\";s:13:\"ghgfhfghghgfh\";}s:5:\"price\";a:2:{s:4:\"from\";N;s:2:\"to\";d:1;}s:5:\"stock\";a:2:{s:4:\"from\";N;s:2:\"to\";i:45;}s:7:\"comment\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}s:9:\"createdAt\";a:2:{s:4:\"from\";N;s:2:\"to\";s:19:\"2020-01-27 01:37:18\";}s:9:\"updatedAt\";a:2:{s:4:\"from\";N;s:2:\"to\";N;}s:12:\"productBrand\";a:2:{s:4:\"from\";N;s:2:\"to\";i:4;}}'),
(64, 1, '2020-01-27 01:37:34', 'Product', '1', '/system/crud/Product/1', 'PUT', 'Update', 'a:2:{s:11:\"description\";a:2:{s:4:\"from\";s:13:\"ghgfhfghghgfh\";s:2:\"to\";s:6:\"aaaaaa\";}s:5:\"price\";a:2:{s:4:\"from\";s:4:\"1.00\";s:2:\"to\";d:1;}}'),
(67, 1, '2020-01-27 01:49:27', 'Vehicle', '2', '/system/crud/Vehicle/2', 'DELETE', 'Delete', 'a:0:{}'),
(68, 1, '2020-01-27 01:49:30', 'Vehicle', '1', '/system/crud/Vehicle/1', 'DELETE', 'Delete', 'a:0:{}'),
(69, 1, '2020-01-27 01:49:35', 'VehicleBrand', '3', '/system/crud/VehicleBrand/3', 'DELETE', 'Delete', 'a:0:{}'),
(70, 1, '2020-01-27 01:49:37', 'VehicleBrand', '4', '/system/crud/VehicleBrand/4', 'DELETE', 'Delete', 'a:0:{}'),
(71, 1, '2020-01-27 01:49:42', 'VehicleType', '2', '/system/crud/VehicleType/2', 'DELETE', 'Delete', 'a:0:{}'),
(72, 1, '2020-01-27 01:49:50', 'ProductCategory', '7', '/system/crud/ProductCategory/7', 'DELETE', 'Delete', 'a:0:{}'),
(73, 1, '2020-01-27 01:49:53', 'ProductCategory', '8', '/system/crud/ProductCategory/8', 'DELETE', 'Delete', 'a:0:{}'),
(75, 1, '2020-01-27 01:50:37', 'ProductCategory', NULL, '/system/crud/ProductCategory', 'POST', 'Insert', 'a:1:{s:4:\"name\";a:2:{s:4:\"from\";N;s:2:\"to\";s:4:\"opop\";}}'),
(76, 1, '2020-01-27 01:50:43', 'Product', '1', '/system/crud/Product/1', 'PUT', 'Update', 'a:1:{s:5:\"price\";a:2:{s:4:\"from\";s:4:\"1.00\";s:2:\"to\";d:1;}}'),
(77, 1, '2020-01-27 01:50:48', 'ProductCategory', '9', '/system/crud/ProductCategory/9', 'DELETE', 'Delete', 'a:0:{}'),
(78, 1, '2020-01-27 01:51:42', 'Product', '1', '/system/crud/Product/1', 'DELETE', 'Delete', 'a:0:{}'),
(79, 1, '2020-01-27 01:51:45', 'ProductBrand', '4', '/system/crud/ProductBrand/4', 'DELETE', 'Delete', 'a:0:{}');

--
-- Dumping data for table `session_log`
--

INSERT INTO `session_log` (`id`, `user_id`, `login`, `logout`, `ip`) VALUES
(1, 1, '2020-01-25 02:46:18', '2020-01-25 02:46:59', '127.0.0.1'),
(2, 1, '2020-01-25 02:47:36', '2020-01-25 02:53:36', '127.0.0.1'),
(3, 1, '2020-01-25 02:54:19', '2020-01-25 03:33:05', '127.0.0.1'),
(4, 1, '2020-01-25 14:49:57', '2020-01-25 15:04:19', '127.0.0.1'),
(5, 1, '2020-01-25 15:04:51', '2020-01-25 15:07:48', '127.0.0.1'),
(6, 1, '2020-01-25 15:08:17', '2020-01-25 15:10:39', '127.0.0.1'),
(7, 1, '2020-01-25 15:20:02', '2020-01-25 18:18:41', '127.0.0.1'),
(8, 1, '2020-01-26 10:20:27', '2020-01-26 10:28:50', '127.0.0.1'),
(9, 1, '2020-01-26 13:50:24', '2020-01-26 14:23:26', '127.0.0.1'),
(10, 1, '2020-01-26 14:26:37', '2020-01-26 17:27:54', '127.0.0.1'),
(11, 1, '2020-01-26 19:54:40', '2020-01-27 01:51:53', '127.0.0.1');

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `name`, `lastName`, `img`, `createdAt`, `updatedAt`) VALUES
(1, 'Admin', 'admin', 'admin@mail.com', 'admin@mail.com', 1, NULL, '$2y$13$JoOJVmM5F1j6fosM8PcUEe6ihMTHrXYXI1AVDl/0JwFI27m8hcc8K', '2020-01-26 19:54:40', NULL, NULL, 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:16:\"ROLE_SUPER_ADMIN\";}', 'Diego', 'de la Vega', NULL, '2020-01-23 15:20:26', '2020-01-26 23:26:41');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
