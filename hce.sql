-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2023 a las 03:26:32
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patients`
--

CREATE TABLE `patients` (
  `id` int(3) NOT NULL,
  `doc` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `age` varchar(3) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `EPS` varchar(30) NOT NULL,
  `TP` varchar(20) NOT NULL,
  `PTT` varchar(20) NOT NULL,
  `AT_lll` varchar(20) NOT NULL,
  `TT` varchar(20) NOT NULL,
  `fibrinogeno` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `patients`
--

INSERT INTO `patients` (`id`, `doc`, `name`, `lastname`, `age`, `gender`, `EPS`, `TP`, `PTT`, `AT_lll`, `TT`, `fibrinogeno`) VALUES
(28, '1005700', 'Santiago', 'Salazar', '23', 'Masculino', 'Nueva EPS', '20', '30', '78', '48', '470'),
(30, '43432842', 'karen', 'bastidas', '27', 'Femenino', 'Sura', '74', '85', '96', '12', '132'),
(31, '74185963', 'deiner alonso', 'rivera', '28', 'Masculino', 'Salud Total', '74', '12', '65', '98', '120');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
