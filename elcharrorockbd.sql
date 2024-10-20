-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-05-2023 a las 19:15:41
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `elcharrorockbd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `charros`
--

CREATE TABLE `charros` (
  `id` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(25) NOT NULL,
  `correo` varchar(25) NOT NULL,
  `contrasena` varchar(25) NOT NULL,
  `telefono` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `charros`
--

INSERT INTO `charros` (`id`, `nombre`, `apellidos`, `correo`, `contrasena`, `telefono`) VALUES
(1, 'Javier', 'Inyesto Fontaneda', 'javier@gmail.com', '12345678', '987654321'),
(2, 'Ana', 'Garcia Velazquez', 'ana@gmail.com', '123456', '123456789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `mensaje` varchar(255) NOT NULL,
  `politica` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contactos`
--

INSERT INTO `contactos` (`id`, `nombre`, `apellidos`, `correo`, `telefono`, `mensaje`, `politica`) VALUES
(1, 'Antonio Manuel', 'Garcia Velazquez', 'antoniomanuel@gmail.com', '987654321', 'Hola, buenas. Me gustaría reservar para más de 10 personas en la terraza. Por un cumpleaños. Sería para 20 personas y 3 horas.', 1),
(2, 'Manuel Antonio', 'Velazquez Garcia', 'manuelantonio@gmail.com', '123456789', 'Hola, buenas. Me gustaría hacer una reserva de 4 horas en la terraza por motivo de cumpleaños, para 30 personas. Sería posible realizar la reserva.', 1),
(3, 'Ana', 'Garcia Velazquez', 'ana@gmail.com', '123456789', 'Hola esto es un mensaje de prueba.', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `fecha` varchar(255) NOT NULL,
  `hora` varchar(255) NOT NULL,
  `personas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id`, `nombre`, `correo`, `fecha`, `hora`, `personas`) VALUES
(1, 'Javier', 'javier@gmail.com', '2023-05-26', '19:00', '10'),
(2, 'Maria', 'maria@gmail.com', '2023-05-26', '20:00', '8'),
(3, 'Roberto', 'roberto@gmail.com', '2023-05-26', '21:00', '6'),
(4, 'Lucia', 'lucia@gmail.com', '2023-05-26', '22:00', '4'),
(7, 'Ana Garcia Velazquez', 'ana@gmail.com', '2023-05-29', '20:00', '8');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `charros`
--
ALTER TABLE `charros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contactos`
--
ALTER TABLE `contactos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `charros`
--
ALTER TABLE `charros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
