-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 09, 2022 at 11:55 AM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hanasaku_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `ranks`
--

CREATE TABLE `ranks` (
  `rank_id` int(11) NOT NULL,
  `code` varchar(2) NOT NULL,
  `value` varchar(32) NOT NULL,
  `lang_code` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ranks`
--

INSERT INTO `ranks` (`rank_id`, `code`, `value`, `lang_code`) VALUES
(1, 'D', 'Разработчик', 'RU'),
(2, 'T', 'Тестер', 'RU'),
(3, 'DE', 'Дизайнер', 'RU'),
(4, 'D', 'Developer', 'EN'),
(5, 'T', 'Tester', 'EN'),
(6, 'DE', 'Designer', 'EN');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`price`) VALUES
(10000);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `user_id` int(11) NOT NULL,
  `userlogin` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `post` varchar(32) NOT NULL DEFAULT 'Junior',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`user_id`, `userlogin`, `email`, `post`, `firstname`, `lastname`) VALUES
(1, 'Easymaki', 'easymaki@hanasaku.com', 'developer', 'Nikita', 'Shibeko'),
(2, 'AkaneSenri', 'AkaneSenri@hanasaku.com', 'Junior developer', 'Sergey', 'Krotov');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `status_id` int(11) NOT NULL,
  `code` varchar(1) NOT NULL,
  `value` varchar(32) NOT NULL,
  `lang_code` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`status_id`, `code`, `value`, `lang_code`) VALUES
(1, 'N', 'Новый', 'RU'),
(2, 'W', 'В процессе', 'RU'),
(3, 'C', 'Завершён', 'RU'),
(4, 'S', 'Отменён', 'RU'),
(5, 'N', 'New', 'EN'),
(6, 'W', 'In process', 'EN'),
(7, 'C', 'Completed', 'EN'),
(8, 'S', 'Canceled', 'EN');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `task_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `description` text,
  `developer` int(11) DEFAULT NULL,
  `tester` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `time_start` date DEFAULT NULL,
  `time_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`task_id`, `time`, `name`, `type`, `status`, `description`, `developer`, `tester`, `timestamp`, `time_start`, `time_end`) VALUES
(2, 2, 'Реализация отправки форм', 'Разработка', 'C', 'Сделать сохранение этой формы в базу данных. \r\nПример реализации можно взять в предыдущем подобном задании. \r\nРезультатом выполнения считается изменение статуса этого задания на \"Выполнено\".', 1, 2, '2022-03-23 14:28:22', '2022-03-24', '2022-03-28'),
(3, 4, 'Разработка профилей', 'development', 'C', 'Разработать профили пользователей', 2, 1, '2022-04-23 12:33:58', '2022-05-11', '2022-05-19'),
(4, 3, 'Верстка нового вида профиля', 'development', 'C', 'Новый profile.view', 1, 1, '2022-04-23 12:55:30', '2022-05-08', '2022-05-10'),
(5, 1, 'Фикс багов в Хелпдеске', 'development', 'C', 'Почистить код во всех файлах', 1, 1, '2022-04-23 12:59:53', '2022-05-12', '2022-05-31'),
(7, 5, 'Считать выполненные часы', 'development', 'N', 'На странице профиля добавить надпись \"Выполнено часов\", рядом с которой будет отображаться сколько часов отработано у пользователя за всё время. Отработанными считаются только выполненные таски.', 2, 1, '2022-04-23 13:37:35', '2022-05-29', '2022-06-03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ranks`
--
ALTER TABLE `ranks`
  ADD PRIMARY KEY (`rank_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`task_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ranks`
--
ALTER TABLE `ranks`
  MODIFY `rank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
