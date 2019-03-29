-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 29 2019 г., 18:55
-- Версия сервера: 5.7.20
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `pp_lab_2`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`%` PROCEDURE `AddClient` (IN `name` VARCHAR(50))  NO SQL
INSERT INTO client(name) VALUES(name)$$

CREATE DEFINER=`root`@`%` PROCEDURE `AddRequest` (IN `id` INT)  NO SQL
INSERT INTO request(client_id) VALUES(id)$$

CREATE DEFINER=`root`@`%` PROCEDURE `AddRequestDetails` (IN `request_id` INT, IN `service_id` INT, IN `count` INT)  NO SQL
INSERT INTO request_service(request_id, service_id, count) VALUES(request_id, service_id, count)$$

CREATE DEFINER=`root`@`%` PROCEDURE `AddService` (IN `name` VARCHAR(50), IN `price` INT)  NO SQL
INSERT INTO service(name, price) VALUES(name, price)$$

CREATE DEFINER=`root`@`%` PROCEDURE `DeleteClient` (IN `id` INT)  NO SQL
DELETE FROM client WHERE id_client = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `DeleteRequest` (IN `id` INT)  NO SQL
DELETE FROM request WHERE id_request = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `DeleteRequestDetails` (IN `request_id` INT, IN `service_id` INT)  NO SQL
DELETE FROM request_service WHERE request_id = request_id AND service_id = service_id$$

CREATE DEFINER=`root`@`%` PROCEDURE `DeleteService` (IN `id` INT)  NO SQL
DELETE FROM service WHERE id_service = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `EditClient` (IN `id` INT, IN `name` VARCHAR(50))  NO SQL
UPDATE client SET name = name WHERE id_client = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `EditRequest` (IN `id` INT, IN `client_id` INT)  NO SQL
UPDATE request SET client_id = client_id WHERE id_request = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `EditService` (IN `id` INT, IN `name` VARCHAR(50), IN `price` INT)  NO SQL
UPDATE service SET name = name, price = price WHERE id_service = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `GetAllClients` ()  NO SQL
SELECT id_client, name FROM client$$

CREATE DEFINER=`root`@`%` PROCEDURE `GetAllRequests` ()  NO SQL
SELECT id_request, client_id, name FROM request
INNER JOIN client ON id_client = client_id$$

CREATE DEFINER=`root`@`%` PROCEDURE `GetAllServices` ()  NO SQL
SELECT id_service, name, price FROM service$$

CREATE DEFINER=`root`@`%` PROCEDURE `GetClient` (IN `id` INT)  NO SQL
SELECT id_client, name FROM client WHERE id_client = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `GetRequest` (IN `id` INT)  NO SQL
SELECT id_request, client_id, name as name 
FROM request INNER JOIN client ON id_client = client_id
WHERE id_request = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `GetRequestDetails` (IN `id` INT)  NO SQL
SELECT id_service, name, count FROM request_service
INNER JOIN service ON service_id = id_service
WHERE request_id = id$$

CREATE DEFINER=`root`@`%` PROCEDURE `GetService` (IN `id` INT)  NO SQL
SELECT id_service, name, price FROM service WHERE id_service = id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`id_client`, `name`) VALUES
(1, 'Ivanov'),
(2, 'Petrov'),
(4, 'Sidorov');

-- --------------------------------------------------------

--
-- Структура таблицы `request`
--

CREATE TABLE `request` (
  `id_request` int(11) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `request`
--

INSERT INTO `request` (`id_request`, `client_id`) VALUES
(1, 1),
(2, 2),
(3, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `request_service`
--

CREATE TABLE `request_service` (
  `request_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `request_service`
--

INSERT INTO `request_service` (`request_id`, `service_id`, `count`) VALUES
(2, 1, 2),
(3, 1, 1),
(1, 2, 1),
(3, 3, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `service`
--

CREATE TABLE `service` (
  `id_service` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `service`
--

INSERT INTO `service` (`id_service`, `name`, `price`) VALUES
(1, 'Медвежья услуга', 300),
(2, 'Такси (нет)', 150),
(3, 'Нарезка хлеба', 10);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Индексы таблицы `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id_request`),
  ADD KEY `client_id` (`client_id`);

--
-- Индексы таблицы `request_service`
--
ALTER TABLE `request_service`
  ADD PRIMARY KEY (`service_id`,`request_id`),
  ADD KEY `request_id` (`request_id`);

--
-- Индексы таблицы `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id_service`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `request`
--
ALTER TABLE `request`
  MODIFY `id_request` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `service`
--
ALTER TABLE `service`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id_client`);

--
-- Ограничения внешнего ключа таблицы `request_service`
--
ALTER TABLE `request_service`
  ADD CONSTRAINT `request_service_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `request` (`id_request`),
  ADD CONSTRAINT `request_service_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`id_service`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
