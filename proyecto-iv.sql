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

-- --------------------------------------------------------

--
-- Table structure for table `company_settings`
--

CREATE TABLE `company_settings` (
  `id` int(11) NOT NULL,
  `identificationNumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slogan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` decimal(8,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mission` longtext COLLATE utf8_unicode_ci NOT NULL,
  `vision` longtext COLLATE utf8_unicode_ci NOT NULL,
  `history` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company_settings`
--

INSERT INTO `company_settings` (`id`, `identificationNumber`, `name`, `slogan`, `address`, `latitude`, `longitude`, `email`, `phone1`, `phone2`, `img`, `facebook`, `twitter`, `instagram`, `youtube`, `mission`, `vision`, `history`) VALUES
(1, 'J-30666573-0', 'Representaciones Jemaro.C.A', 'Cuidando la salud de su vehículo', 'Locales n° 20 y n° 21 del Terminal de Pasajeros de Carúpano, Municipio Bermúdez, Estado Sucre, Venezuela.', '10.670287', '-63.253175', 'jemaroca@mail.com', '+58 (294) 332-1405', '+58 (000) 000-0000', '/img/logo.png', 'http://facebook.com/', 'http://twitter.com/', 'http://instagram.com', 'https://www.youtube.com/', 'Atender las necesidades de repuestos y servicios en el mercado\r\nautomotor a través del mejor equipo humano, brindando un excelente\r\nservicio de venta y post venta a nuestros clientes.', 'Ser una organización líder en soluciones automotrices de las marcas\r\nmás prestigiosas y reconocidas del mundo, ofreciendo productos y servicios\r\nde excelente calidad a precios competitivos.', 'Representaciones Jemaro.C.A nace en 1992, bajo la idea de cubrir las necesidades de repuestos y servicios para vehículos en la rama diesel, dando inicio mercantil como “Representaciones Jemaro” (firma personal). En el año 1994, se apertura el primer local en la calle Juncal, sector plaza Bolívar, donde se desenvolvieron las actividades durante cinco (05) años, sin lograr consolidar una cartera de clientes estable. Para finales del año 1998 el proyecto inicial cambia de rumbo hacia repuestos automotrices para vehículos a gasolina y se transforma en “Representaciones Jemaro.C.A” con un mejor y mayor mercado que explotar. Se inician las actividades en calle Carabobo a la altura de barrio Sucre y para el 20 de diciembre de 1999 se traslada la sede al terminal de  4 pasajeros de Carúpano, donde ha permanecido y desarrollado sus actividades hasta el día de hoy.');

-- --------------------------------------------------------

--
-- Table structure for table `currency_conversion`
--

CREATE TABLE `currency_conversion` (
  `id` int(11) NOT NULL,
  `dollarValue` decimal(10,2) NOT NULL,
  `euroValue` decimal(10,2) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currency_conversion`
--

INSERT INTO `currency_conversion` (`id`, `dollarValue`, `euroValue`, `createdAt`, `updatedAt`) VALUES
(3, '470183.51', '512500.03', '2020-10-23 14:31:14', '2020-10-23 14:31:14');

-- --------------------------------------------------------

--
-- Table structure for table `operation_log`
--

CREATE TABLE `operation_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `entity` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entityId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `request` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `changeSet` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `product_brand_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `viewCounter` int(11) NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_brand_id`, `code`, `description`, `price`, `stock`, `comment`, `viewCounter`, `img`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'TD-405', 'Muñon superior 10268', '12.00', 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 9, 'img/aa64d8cc9ca8e003da71b549161a9936.jpeg', '2020-10-23 15:21:23', '2020-10-23 20:48:58'),
(2, 6, 'FA-03', 'Liga de freno Dot-4 (335ml)', '3.00', 24, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 50, 'img/1b7e12b2231ab46305577e03970a8ac3.jpeg', '2020-10-23 15:22:57', '2020-10-23 22:00:55'),
(3, 6, 'FA-04', 'Liga de freno Dot-4 (500ml)', '5.00', 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 7, 'img/9d1db2158cda6fd64e39ea7d6ef61c80.png', '2020-10-23 15:23:59', '2020-10-23 20:43:51'),
(4, 6, 'AA-21', 'Aceite de motor 20w50 (1l)', '5.00', 12, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1, 'img/682b54c84d50cfe9cd877de81ea763b6.jpeg', '2020-10-23 15:26:03', '2020-10-23 20:44:43'),
(5, 6, 'AA-23', 'Aceite de motor 20w50 (18.9l)', '80.00', 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 4, 'img/91ec0a682dd650b77d4c2d7286570fbd.jpeg', '2020-10-23 15:28:27', '2020-10-23 20:45:16');

-- --------------------------------------------------------

--
-- Table structure for table `product_brand`
--

CREATE TABLE `product_brand` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `product_product_category`
--

CREATE TABLE `product_product_category` (
  `product_id` int(11) NOT NULL,
  `product_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `product_vehicle`
--

CREATE TABLE `product_vehicle` (
  `product_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `reservation_status_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_join_product`
--

CREATE TABLE `reservation_join_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_status`
--

CREATE TABLE `reservation_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reservation_status`
--

INSERT INTO `reservation_status` (`id`, `name`) VALUES
(1, 'Nuevo'),
(2, 'En espera'),
(3, 'Confirmado'),
(4, 'Finalizado'),
(5, 'Cancelado');

-- --------------------------------------------------------

--
-- Table structure for table `session_log`
--

CREATE TABLE `session_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `login` datetime NOT NULL,
  `logout` datetime DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `name`, `lastName`, `img`, `createdAt`, `updatedAt`) VALUES
(1, 'Admin', 'admin', 'admin@mail.com', 'admin@mail.com', 1, NULL, '$2y$13$JoOJVmM5F1j6fosM8PcUEe6ihMTHrXYXI1AVDl/0JwFI27m8hcc8K', '2020-10-23 22:44:37', NULL, NULL, 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:16:\"ROLE_SUPER_ADMIN\";}', 'Diego', 'de la Vega', NULL, '2020-01-23 15:20:26', '2020-10-23 22:44:37'),
(2, 'User', 'user', 'user@mail.com', 'user@mail.com', 1, NULL, '$2y$13$JoOJVmM5F1j6fosM8PcUEe6ihMTHrXYXI1AVDl/0JwFI27m8hcc8K', '2020-10-23 14:50:55', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}', 'Quijote', 'de la Mancha', NULL, '2020-10-23 12:22:20', '2020-10-23 14:50:55');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL,
  `vehicle_category_id` int(11) DEFAULT NULL,
  `vehicle_brand_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seriesStart` int(11) NOT NULL,
  `seriesEnd` int(11) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_brand`
--

CREATE TABLE `vehicle_brand` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_category`
--

CREATE TABLE `vehicle_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company_settings`
--
ALTER TABLE `company_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_conversion`
--
ALTER TABLE `currency_conversion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operation_log`
--
ALTER TABLE `operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_901E7EF9A76ED395` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D34A04AD77153098` (`code`),
  ADD KEY `IDX_D34A04AD8F45BA9F` (`product_brand_id`);

--
-- Indexes for table `product_brand`
--
ALTER TABLE `product_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_BD0E82045E237E06` (`name`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_CDFC73565E237E06` (`name`);

--
-- Indexes for table `product_product_category`
--
ALTER TABLE `product_product_category`
  ADD PRIMARY KEY (`product_id`,`product_category_id`),
  ADD KEY `IDX_437017AA4584665A` (`product_id`),
  ADD KEY `IDX_437017AABE6903FD` (`product_category_id`);

--
-- Indexes for table `product_vehicle`
--
ALTER TABLE `product_vehicle`
  ADD PRIMARY KEY (`product_id`,`vehicle_id`),
  ADD KEY `IDX_CA59FF364584665A` (`product_id`),
  ADD KEY `IDX_CA59FF36545317D1` (`vehicle_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_42C84955E7927C74` (`email`),
  ADD KEY `IDX_42C8495571B06122` (`reservation_status_id`);

--
-- Indexes for table `reservation_join_product`
--
ALTER TABLE `reservation_join_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_63FE1ECF4584665A` (`product_id`),
  ADD KEY `IDX_63FE1ECFB83297E7` (`reservation_id`);

--
-- Indexes for table `reservation_status`
--
ALTER TABLE `reservation_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `session_log`
--
ALTER TABLE `session_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F2E6F0FFA76ED395` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D64992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_8D93D649A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_8D93D649C05FB297` (`confirmation_token`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1B80E4869C7DE094` (`vehicle_category_id`),
  ADD KEY `IDX_1B80E48699E7DF9C` (`vehicle_brand_id`);

--
-- Indexes for table `vehicle_brand`
--
ALTER TABLE `vehicle_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_7EFD79B45E237E06` (`name`);

--
-- Indexes for table `vehicle_category`
--
ALTER TABLE `vehicle_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_DB5E16555E237E06` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company_settings`
--
ALTER TABLE `company_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currency_conversion`
--
ALTER TABLE `currency_conversion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `operation_log`
--
ALTER TABLE `operation_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_brand`
--
ALTER TABLE `product_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation_join_product`
--
ALTER TABLE `reservation_join_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation_status`
--
ALTER TABLE `reservation_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `session_log`
--
ALTER TABLE `session_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vehicle_brand`
--
ALTER TABLE `vehicle_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `vehicle_category`
--
ALTER TABLE `vehicle_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `operation_log`
--
ALTER TABLE `operation_log`
  ADD CONSTRAINT `FK_901E7EF9A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD8F45BA9F` FOREIGN KEY (`product_brand_id`) REFERENCES `product_brand` (`id`);

--
-- Constraints for table `product_product_category`
--
ALTER TABLE `product_product_category`
  ADD CONSTRAINT `FK_437017AA4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_437017AABE6903FD` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_vehicle`
--
ALTER TABLE `product_vehicle`
  ADD CONSTRAINT `FK_CA59FF364584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CA59FF36545317D1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_42C8495571B06122` FOREIGN KEY (`reservation_status_id`) REFERENCES `reservation_status` (`id`);

--
-- Constraints for table `reservation_join_product`
--
ALTER TABLE `reservation_join_product`
  ADD CONSTRAINT `FK_63FE1ECF4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_63FE1ECFB83297E7` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`);

--
-- Constraints for table `session_log`
--
ALTER TABLE `session_log`
  ADD CONSTRAINT `FK_F2E6F0FFA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `FK_1B80E48699E7DF9C` FOREIGN KEY (`vehicle_brand_id`) REFERENCES `vehicle_brand` (`id`),
  ADD CONSTRAINT `FK_1B80E4869C7DE094` FOREIGN KEY (`vehicle_category_id`) REFERENCES `vehicle_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
