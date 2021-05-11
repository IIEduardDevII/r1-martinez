-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2021 at 12:54 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `accounts_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(25) NOT NULL,
  `nombreCliente` varchar(25) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `numCuenta` int(25) NOT NULL,
  `saldoCuenta` int(50) NOT NULL DEFAULT '0',
  `estadoCuenta` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT 'DESACTIVADA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `nombreCliente`, `numCuenta`, `saldoCuenta`, `estadoCuenta`) VALUES
(1, 'Juana Coder', 1800000369, 0, 'Desactivada'),
(2, 'Santos Mateo', 2147483647, 0, 'DESACTIVADA'),
(3, 'Nadia Volumen', 1800000369, 0, 'DESACTIVADA'),
(4, 'Evelyn Arrocha', 1800000309, 0, 'DESACTIVADA'),
(5, 'Ximena Mejia', 2147483647, 0, 'DESACTIVADA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
