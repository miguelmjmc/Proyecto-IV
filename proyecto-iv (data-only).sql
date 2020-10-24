-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 23, 2020 at 11:21 PM
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
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_brand_id`, `code`, `description`, `price`, `stock`, `comment`, `viewCounter`, `img`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'TD-405', 'Muñon superior 10268', '12.00', 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 9, 'img/aa64d8cc9ca8e003da71b549161a9936.jpeg', '2020-10-23 15:21:23', '2020-10-23 20:48:58'),
(2, 6, 'FA-03', 'Liga de freno Dot-4 (335ml)', '3.00', 24, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 50, 'img/1b7e12b2231ab46305577e03970a8ac3.jpeg', '2020-10-23 15:22:57', '2020-10-23 22:00:55'),
(3, 6, 'FA-04', 'Liga de freno Dot-4 (500ml)', '5.00', 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 7, 'img/9d1db2158cda6fd64e39ea7d6ef61c80.png', '2020-10-23 15:23:59', '2020-10-23 20:43:51'),
(4, 6, 'AA-21', 'Aceite de motor 20w50 (1l)', '5.00', 12, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1, 'img/682b54c84d50cfe9cd877de81ea763b6.jpeg', '2020-10-23 15:26:03', '2020-10-23 20:44:43'),
(5, 6, 'AA-23', 'Aceite de motor 20w50 (18.9l)', '80.00', 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 4, 'img/91ec0a682dd650b77d4c2d7286570fbd.jpeg', '2020-10-23 15:28:27', '2020-10-23 20:45:16');

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
-- Dumping data for table `reservation_status`
--

INSERT INTO `reservation_status` (`id`, `name`) VALUES
(1, 'Nuevo'),
(2, 'En espera'),
(3, 'Confirmado'),
(4, 'Finalizado'),
(5, 'Cancelado');

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `name`, `lastName`, `img`, `createdAt`, `updatedAt`) VALUES
(1, 'Admin', 'admin', 'admin@mail.com', 'admin@mail.com', 1, NULL, '$2y$13$JoOJVmM5F1j6fosM8PcUEe6ihMTHrXYXI1AVDl/0JwFI27m8hcc8K', '2020-10-23 22:44:37', NULL, NULL, 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:16:\"ROLE_SUPER_ADMIN\";}', 'Diego', 'de la Vega', NULL, '2020-01-23 15:20:26', '2020-10-23 22:44:37'),
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
