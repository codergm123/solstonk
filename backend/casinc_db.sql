-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2022 at 09:30 PM
-- Server version: 10.6.7-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `casinc_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bet_histories`
--

CREATE TABLE `bet_histories` (
  `id` int(11) NOT NULL,
  `game_type` enum('coinflip','roulette') DEFAULT NULL,
  `bet_amount` decimal(10,2) DEFAULT 0.00,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chat_masters`
--

CREATE TABLE `chat_masters` (
  `id` int(11) NOT NULL,
  `chat_message` text DEFAULT NULL,
  `anymos` enum('1','0') DEFAULT '0',
  `is_deleted` enum('1','0') DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_masters`
--

INSERT INTO `chat_masters` (`id`, `chat_message`, `anymos`, `is_deleted`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'hey', '0', '0', '2022-03-12 17:50:08', '2022-03-12 17:50:08', 3),
(2, 'LFG', '0', '0', '2022-03-12 17:50:15', '2022-03-12 17:50:15', 3),
(3, 'hi', '0', '0', '2022-03-12 21:00:26', '2022-03-12 21:00:26', 6),
(4, 'greetings', '0', '0', '2022-03-12 21:02:29', '2022-03-12 21:02:29', 10),
(5, 'woooohooo', '0', '0', '2022-03-12 21:10:26', '2022-03-12 21:10:26', 16),
(6, 'hi FRENS', '0', '0', '2022-03-12 21:25:38', '2022-03-12 21:25:38', 17),
(7, 'anybody already played? ;)', '0', '0', '2022-03-12 21:25:58', '2022-03-12 21:25:58', 10),
(8, 'not ye', '0', '0', '2022-03-12 21:29:11', '2022-03-12 21:29:11', 7),
(9, 'play?', '0', '0', '2022-03-12 21:29:24', '2022-03-12 21:29:24', 19),
(10, 'Is the current game working well?', '0', '0', '2022-03-12 21:29:49', '2022-03-12 21:29:49', 19),
(11, 'hey', '0', '0', '2022-03-12 22:05:53', '2022-03-12 22:05:53', 27),
(12, 'lfg guys', '0', '0', '2022-03-12 22:09:20', '2022-03-12 22:09:20', 3),
(13, 'how do I join disc', '0', '0', '2022-03-12 22:09:25', '2022-03-12 22:09:25', 29),
(14, 'I bought 10', '0', '0', '2022-03-12 22:09:27', '2022-03-12 22:09:27', 29),
(15, 'lfgg', '0', '0', '2022-03-12 22:09:35', '2022-03-12 22:09:35', 27),
(16, 'yo', '0', '0', '2022-03-12 22:09:51', '2022-03-12 22:09:51', 28),
(17, 'discord opening public tomorrow', '0', '0', '2022-03-12 22:09:51', '2022-03-12 22:09:51', 3),
(18, 'when is magic eden', '0', '0', '2022-03-12 22:10:20', '2022-03-12 22:10:20', 29),
(19, 'already applied', '0', '0', '2022-03-12 22:12:05', '2022-03-12 22:12:05', 3),
(20, 'LFGG', '0', '0', '2022-03-12 22:16:16', '2022-03-12 22:16:16', 30),
(21, 'could u send invite link to rrkkid ? ', '0', '0', '2022-03-12 22:41:05', '2022-03-12 22:41:05', 12),
(22, 'he is stonk holder', '0', '0', '2022-03-12 22:41:16', '2022-03-12 22:41:16', 12),
(23, 'dm @Stonks_invite', '0', '0', '2022-03-12 22:54:33', '2022-03-12 22:54:33', 3),
(24, 'gogo', '0', '0', '2022-03-13 03:38:03', '2022-03-13 03:38:03', 33),
(25, 'wen discord wen me?', '0', '0', '2022-03-13 08:01:39', '2022-03-13 08:01:39', 31),
(26, 'wtf minimum bet amount is 1 sol?', '0', '0', '2022-03-13 08:08:57', '2022-03-13 08:08:57', 31),
(27, 'no you can manually lower it by typing it in or you can hit clear', '0', '0', '2022-03-13 09:41:21', '2022-03-13 09:41:21', 14),
(28, 'yay just won 3sol', '0', '0', '2022-03-13 15:41:29', '2022-03-13 15:41:29', 35),
(29, 'hi ', '0', '0', '2022-03-13 16:21:06', '2022-03-13 16:21:06', 12),
(30, 'when discord   ?', '0', '0', '2022-03-13 16:21:18', '2022-03-13 16:21:18', 12),
(31, 'Discord is up', '0', '0', '2022-03-13 17:14:15', '2022-03-13 17:14:15', 35),
(32, 'yo', '0', '0', '2022-03-13 23:49:44', '2022-03-13 23:49:44', 37),
(33, 'deposited sol and still have zero', '0', '0', '2022-03-13 23:58:15', '2022-03-13 23:58:15', 39),
(34, 'lmao', '0', '0', '2022-03-13 23:58:16', '2022-03-13 23:58:16', 39),
(35, 'who play', '0', '0', '2022-03-14 03:20:01', '2022-03-14 03:20:01', 9),
(36, 'Lets go', '0', '0', '2022-03-14 03:51:59', '2022-03-14 03:51:59', 41),
(37, 'im in', '0', '0', '2022-03-14 10:10:34', '2022-03-14 10:10:34', 14),
(38, 'great fix!!', '0', '0', '2022-03-14 11:32:31', '2022-03-14 11:32:31', 33),
(39, 'ji', '0', '0', '2022-03-14 12:01:29', '2022-03-14 12:01:29', 47),
(40, 'Hello', '0', '0', '2022-03-14 13:31:31', '2022-03-14 13:31:31', 48),
(41, 'all in!!', '0', '0', '2022-03-14 13:41:43', '2022-03-14 13:41:43', 33),
(42, 'yoo', '0', '0', '2022-03-14 14:51:23', '2022-03-14 14:51:23', 15),
(43, 'Hello', '0', '0', '2022-03-14 17:28:50', '2022-03-14 17:28:50', 46),
(44, 'lets gooo', '0', '0', '2022-03-14 17:35:05', '2022-03-14 17:35:05', 35),
(45, 'all in', '0', '0', '2022-03-14 17:35:16', '2022-03-14 17:35:16', 35),
(46, 'hi', '0', '0', '2022-03-15 16:09:32', '2022-03-15 16:09:32', 57),
(47, 'hello', '0', '0', '2022-03-15 16:29:28', '2022-03-15 16:29:28', 46),
(48, 'hi', '0', '0', '2022-03-15 16:45:42', '2022-03-15 16:45:42', 56),
(49, '???', '0', '0', '2022-03-16 12:37:31', '2022-03-16 12:37:31', 33);

-- --------------------------------------------------------

--
-- Table structure for table `cms_masters`
--

CREATE TABLE `cms_masters` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `meta_tag` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `is_deleted` enum('1','0') DEFAULT '0',
  `type` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_masters`
--

INSERT INTO `cms_masters` (`id`, `title`, `description`, `meta_tag`, `meta_title`, `meta_description`, `is_deleted`, `type`, `created_at`, `updated_at`) VALUES
(1, 'About', '<p>Test</p>\r\n', NULL, NULL, NULL, '1', 'abouts', '2022-03-15 16:35:17', '2022-03-15 16:35:46');

-- --------------------------------------------------------

--
-- Table structure for table `currency_masters`
--

CREATE TABLE `currency_masters` (
  `id` int(11) NOT NULL,
  `currency_name` varchar(255) DEFAULT NULL,
  `currency_image` varchar(255) DEFAULT 'btc.svg',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deposit_masters`
--

CREATE TABLE `deposit_masters` (
  `id` int(11) NOT NULL,
  `price` decimal(10,4) DEFAULT NULL,
  `coin` decimal(10,2) DEFAULT NULL,
  `actual_price` decimal(10,10) DEFAULT NULL,
  `actual_coin` decimal(10,2) DEFAULT NULL,
  `deposit_admin_comission` varchar(255) DEFAULT NULL,
  `admin_commission_in_chips` decimal(10,10) DEFAULT NULL,
  `deposit_inventory_count` varchar(255) DEFAULT NULL,
  `admin_rates` varchar(255) DEFAULT NULL,
  `response_price` decimal(10,10) DEFAULT NULL,
  `response_coin` decimal(10,2) DEFAULT NULL,
  `type` enum('coinPayment','creditCard','opskin') DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `status` enum('pending','accept','decline','fail') DEFAULT 'pending',
  `transaction_date` datetime DEFAULT NULL,
  `btc_type` varchar(255) DEFAULT NULL,
  `bot_account_index` int(11) DEFAULT NULL,
  `transaction_block` varchar(255) DEFAULT NULL,
  `transaction_signature` varchar(255) DEFAULT NULL,
  `user_wallet_address` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deposit_masters`
--

INSERT INTO `deposit_masters` (`id`, `price`, `coin`, `actual_price`, `actual_coin`, `deposit_admin_comission`, `admin_commission_in_chips`, `deposit_inventory_count`, `admin_rates`, `response_price`, `response_coin`, `type`, `transaction_id`, `status`, `transaction_date`, `btc_type`, `bot_account_index`, `transaction_block`, `transaction_signature`, `user_wallet_address`, `created_at`, `updated_at`, `user_id`) VALUES
(1, '0.0560', '0.05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-12 18:06:57', NULL, NULL, '124639207', '4iQqLkc48tho3keu4rkzNDaEuJpUyAC2YCTREJEzuKnDnyN6BKUbPgbR5s8tavdr4Mt8eSc88vhH38bwNxjx1sPN', 'Hgw9m1mq3rpzTDxCZzbPQuCpczeTPcVBNcxRo7DcuTJY', '2022-03-12 18:06:57', '2022-03-12 18:06:57', 3),
(2, '0.1120', '0.10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-12 18:15:41', NULL, NULL, '124640118', 'sWcowfR7YbSeBVLhskYELATBuzUEZbDaGNCGdBovQxBkYzcX5DPsqyzEKiqcx4R5vJoXK5MCBzyH4wKmV3LFHEp', 'Hgw9m1mq3rpzTDxCZzbPQuCpczeTPcVBNcxRo7DcuTJY', '2022-03-12 18:15:41', '2022-03-12 18:15:41', 3),
(3, '1.1200', '1.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-12 21:06:12', NULL, NULL, '124658001', '2oo9jFJwxiRsYfyXCq4Mp4sbWJjRJ3fJcdPVRLHcifJey9JWyLeALaej2m5LyX6ETBWjQbqTbzxwypMU8cLkck4B', '795V2XSF8MHJZB7EmVJo1ZkYHsz8V9XjdBNHDeC5sASe', '2022-03-12 21:06:12', '2022-03-12 21:06:12', 10),
(4, '0.0560', '0.05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-12 22:09:16', NULL, NULL, '124664699', '3HXgN3QvK1dgH3h4eRzTiyWXWdek93jzsRrSXrzumEEqkcKxswxwrbiKTMkqvB66aBV2RRDeHZ4YqurZqrKxvHW6', 'AeQpB28j2Ph9tXLbBzSYS5Gn5WcfHwhMWi4Kw2HM8kdZ', '2022-03-12 22:09:16', '2022-03-12 22:09:16', 28),
(5, '0.1680', '0.15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-12 22:12:42', NULL, NULL, '124665053', '3EEvg7iuUKVqYWskSzYMBF8PrCEAawFRLzbLN4wyHTpiCTMBmFh4PxxhnevASxPt2FiCL4ANqHFA7qemtJrtF6Vu', '9x4pzCR3PgZxwovUf54Xrx7JNZzHgRvWVfwLUmeWHPjs', '2022-03-12 22:12:42', '2022-03-12 22:12:42', 30),
(6, '0.0560', '0.05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-13 03:41:08', NULL, NULL, '124699149', 'NPPgoGVayV4q56U6krZww969JrgSdEWgekxZind4Z8A96VkvY7nRhtaKg94suvpDSguZKL9VfW5moSSXiqWnf7y', '3JJVTh6za5wiVLuxFCf2qSK3GwtdaEWfsdCVv3R9ECqL', '2022-03-13 03:41:08', '2022-03-13 03:41:08', 33),
(7, '0.0560', '0.05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-13 08:04:38', NULL, NULL, '124727275', 'YFDCuVC26zpNa43tonSifjzc5jrMjGx699yvXdsevFEfs5HM1ZE8oMsVVg5iNKhA3BxJQhqmBkfsvJrDaMonHEi', 'E4ht3T9TTQYjP5E2qmh4KhXtGmWe8q1Cy2N7HbzEivqa', '2022-03-13 08:04:38', '2022-03-13 08:04:38', 31),
(8, '0.0560', '0.05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-13 11:42:01', NULL, NULL, '124750405', '3yx18roGmsH6fkNrDHTtGZCquW3rJTvA5ZfBYpdJ3SyYPj7FH5AdoDGwJ3Sssp4kWaghBk26c663tcGE8NkQJ3cK', '6wuh8rZi6PF2ab4rrCHXm4eFBoEtP8mnEqvyVwBZJ24v', '2022-03-13 11:42:01', '2022-03-13 11:42:01', 14),
(9, '2.2400', '2.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-13 15:36:23', NULL, NULL, '124774594', 'drdkTeTKAy5LEQoqeiQp88DY8AG3rfiU5UN2BDvGeTwVTnVeDGCefnDeq4p6a18tQdQP4hbMwmBnYkP9tKiXs4L', '4srSB1USuaBgXsrrSHJdHQFzLuj2Ak2axuZRvFRXPiMG', '2022-03-13 15:36:23', '2022-03-13 15:36:23', 35),
(10, '0.5600', '0.50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-13 17:15:40', NULL, NULL, '124784883', '3L41vvo5GmwtBf9KQLJ2HQ2obdfF6uVr8McWSGLCnwV5u3wVxk4uC97YB1pvaFjoE2CSetZK4J7tU7bTGBTNwbnC', 'FB1nNR4tej4EVMw7eQ7gNqNRTi9KcPeZV3Zsrx32W13H', '2022-03-13 17:15:40', '2022-03-13 17:15:40', 36),
(11, '0.0560', '0.05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-14 03:21:58', NULL, NULL, '124847227', 'otTchhqwi6eVRRVBGEdJ8UC5KEMbGzdPgXa82LfjPh43PWwgySSWR4X8QHYqif46qewSH1AEPBRJ6c4LdkmPKgP', 'ExUGqiDLanncKTHJuuUao9X53sY5qgKhTW9xc15RWuup', '2022-03-14 03:21:58', '2022-03-14 03:21:58', 9),
(12, '0.0560', '0.05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-14 04:25:25', NULL, NULL, '124853595', '46YrrS9n5Y1xuuU4DwAwtHwTyTrVdpuSsBMRKED4WDEMjiZyf7wY6ik6Q9cqNfyhq5kzB3GGyQwgFVigUzC62xAe', 'EUub5UoZJJw3v9EM9HMZyYjHeV6LLbegHdpciAnzsM8t', '2022-03-14 04:25:25', '2022-03-14 04:25:25', 42),
(13, '0.1000', '0.10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-14 10:01:35', NULL, NULL, '124888578', '3GWm9yJraW3pMAtg8miyB2tjfaKXcCfzFykqrH6nUPxQuCELdbnpFftSPvUvyncZKwv6BHkQguYBq7KrnzkxxuTr', 'ExUGqiDLanncKTHJuuUao9X53sY5qgKhTW9xc15RWuup', '2022-03-14 10:01:35', '2022-03-14 10:01:35', 9),
(14, '0.1000', '0.10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-14 12:02:23', NULL, NULL, '124901117', '2Q6uFshVMHrK6vhL4w6FAiD5Kmx7xXo1PNJFnAcDpKSdAC1nrv9Un8LLuX6Up21aCkPE9PqLKJ7BWH6k6inxv3hY', 'FXTbghTQEbDSm6StynTZeQAzvFhVdXLkLoGUfiJUapWw', '2022-03-14 12:02:23', '2022-03-14 12:02:23', 47),
(15, '0.0500', '0.05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-14 13:40:29', NULL, NULL, '124910919', '3GvnQ3Q4ZTbhXvzecGvafCin6Kn5qgnpmFCpsT4RC7gDDxhkKAAw6J61kDHH9ee8Nk4Nmpsy3aBhYzwh14aVSBGo', 'E4ht3T9TTQYjP5E2qmh4KhXtGmWe8q1Cy2N7HbzEivqa', '2022-03-14 13:40:29', '2022-03-14 13:40:29', 31),
(16, '0.0500', '0.05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-14 13:53:11', NULL, NULL, '124912220', '2gojiocK8YCRgoREkn7P8DiVCvEnqMDS9wED9DJwhcqBv5As1CuBUuAthtUkFeHmCq7fSTmm95DuHEaERpKZuKFr', '3JJVTh6za5wiVLuxFCf2qSK3GwtdaEWfsdCVv3R9ECqL', '2022-03-14 13:53:11', '2022-03-14 13:53:11', 33),
(17, '0.1000', '0.10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-14 14:57:24', NULL, NULL, '124918693', '4vvzRejdZspMrK4a7gRqZ9mnbRPicc9ViAq3oQVpuZHu1HjpBRjNu5ajaXqHMePTPD5txrDZZFnPtDihKGLUSQog', '33YsxGSpg9he2iS3qhL2rTWMheprq3r3aqmpxFefiMRW', '2022-03-14 14:57:24', '2022-03-14 14:57:24', 15),
(18, '2.0000', '2.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-14 16:49:16', NULL, NULL, '124930118', 'obvyRn6gQYunuVwwdi8ucP3zv8mf2XVLjrW9mQikeGLooYWqAqFXoqwTDjENMawJpNBuLWqbW5G92vHPNW9pXGn', '4srSB1USuaBgXsrrSHJdHQFzLuj2Ak2axuZRvFRXPiMG', '2022-03-14 16:49:16', '2022-03-14 16:49:16', 35),
(19, '2.0000', '2.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-14 16:49:41', NULL, NULL, '124930167', 'dMujptZtNd1pnJcCMWeAwyQiS6mtdnbuoAwnDDbgAysi6eNb2tyF28epuVJAJdFpvFcRa1o9KCtsvkJDjvMkBET', '4srSB1USuaBgXsrrSHJdHQFzLuj2Ak2axuZRvFRXPiMG', '2022-03-14 16:49:41', '2022-03-14 16:49:41', 35),
(20, '0.0500', '0.05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-14 17:30:30', NULL, NULL, '124934219', '38Qwnqaxm66kyxjSxQFATzaNZ1NXVxqR9Nfagfod2BNbC423aKvMb5R6LjwT1eyiRHgyHymucgey2anjmruWtd7H', '3reM2QrxcKJALNrZjGy9L2k6SYGejf8MLty9XhFwWrxN', '2022-03-14 17:30:30', '2022-03-14 17:30:30', 46),
(21, '0.5000', '0.50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-14 19:59:55', NULL, NULL, '124949449', '27yzsUCNoeKEV3YuT1Tgw9CqXePTYZnudEiYwxcUNfZXAa6wPCqptDFwqjcKTZuYhG1Cm9nWS49deYLXDfTnFtzt', 'CPwcLM5zRfG2CE81vDJ7kq5TkW8DyB3CiPuPunnndsMc', '2022-03-14 19:59:55', '2022-03-14 19:59:55', 52),
(22, '0.1000', '0.10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-15 14:28:34', NULL, NULL, '125064318', '2kNxokkrXbEVK5NKu9Eign4adXctB7RkP1SLQqLQ12vDx1HvCXejeC9gMWSgzucHqDfuuCNXMCskD4A3k3sD58e5', 'Yms11g3Rsi9ZDBi1aLr19vZ6P8RoHqaJvFewqvgsDTp', '2022-03-15 14:28:34', '2022-03-15 14:28:34', 53),
(23, '0.2500', '0.25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-15 14:41:10', NULL, NULL, '125065547', '2UFipmKX91oPjhZUsQhbcXAbdwPVCURdkDJsk9FjFG9NyMgckRxnqB6JC2RsVAMPdzGo8dkvLt8nHB2h2ohehyRi', '7eEiaAySQX1o98HnQ7kUKauc8PdWa1ZDZ1fMmpCuPZwz', '2022-03-15 14:41:10', '2022-03-15 14:41:10', 54),
(24, '0.0500', '0.05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-15 16:08:44', NULL, NULL, '125074544', '2XuHuF1EcQw3Rpr1HPeJSveeTUZpEDxv8ibG8D25bwFRvQzTQPicbesYSUouMnYC925xw6DZ5KfmVBCGWC2NeVvW', '2upUxnTRrqnx84S53Sz9ymKCj4qBHn91qLfR1VU4s3aM', '2022-03-15 16:08:44', '2022-03-15 16:08:44', 57),
(25, '0.2000', '0.20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-15 17:36:20', NULL, NULL, '125083560', '4cjxZDsDdwzELwjFdfaoXqDcjoHXPTGTtcugrBD5byCt34TFLXVHLAmC2NQ91876h7pM6Q8eZ1vXRz6M5GwFKmf5', '3rC7ndgpyxHKkq9ctRoUQHP8rK7Fznz1WGSa4Pjik9p4', '2022-03-15 17:36:20', '2022-03-15 17:36:20', 58),
(26, '0.0500', '0.05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-15 20:05:00', NULL, NULL, '125098815', 'W2xsi1M8ab9zkgzTt7vg3wZdDemSiVJYJCYrqQBMKdCPSesiwijL2Tqanab8yrXxAz8RCfwUBWQ5CXoxL3mXVmu', 'E4ht3T9TTQYjP5E2qmh4KhXtGmWe8q1Cy2N7HbzEivqa', '2022-03-15 20:05:00', '2022-03-15 20:05:00', 31),
(27, '0.0500', '0.05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-15 20:08:21', NULL, NULL, '125099109', '3LSkibmJFQuCib8AxQgd76xyLkGkT9X7xMnj3SejHuEa7txk2CzXHGfjCvB2SndE6fvTuK6F5DWtqLuCGqLKaaWq', 'E4ht3T9TTQYjP5E2qmh4KhXtGmWe8q1Cy2N7HbzEivqa', '2022-03-15 20:08:21', '2022-03-15 20:08:21', 31),
(28, '0.6000', '0.60', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-16 13:12:06', NULL, NULL, '125209826', '2XpptB4DtMXuite6inVJdeq5dhXjHHm5zGbHxK8N39dsgBf4u4GeEofwdzeyUmdozLsAN7DLQisz9KXjnx2QJoaZ', '3rC7ndgpyxHKkq9ctRoUQHP8rK7Fznz1WGSa4Pjik9p4', '2022-03-16 13:12:06', '2022-03-16 13:12:06', 58),
(29, '1.0000', '1.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2022-03-30 20:00:10', NULL, NULL, '124647525', '3JR5G7MteWQ7AvygmeeLqQsAppfQYzLG675epnBQw2Xx2EtwYXfPEB1SSNT2rvZtCVGSeusr2jkynYUUejhZ5fca', '3chdpWVQmvjzdNZ1EcnWnQmVDWD5yreQwtSUFp9FbpVU', '2022-03-30 20:00:10', '2022-03-30 20:00:10', 64);

-- --------------------------------------------------------

--
-- Table structure for table `house_wallets`
--

CREATE TABLE `house_wallets` (
  `id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `house_wallets`
--

INSERT INTO `house_wallets` (`id`, `address`, `password`, `created_at`, `updated_at`) VALUES
(0, '36RYjWfhhuQx3LZ2Te3i6iU2WPzeAkGipcJcEskcpyB4', '3jxmKDj3grkF3TMejaUcfkmWgGg1iJo6LrQMvXN2cnnnAK7czLwTSfoL7EAxHSPnVzFYJqW14MVufkbxjCaa9Aaa', '2022-03-12 14:08:06', '2022-03-12 14:08:42');

-- --------------------------------------------------------

--
-- Table structure for table `roulette_histories`
--

CREATE TABLE `roulette_histories` (
  `id` int(11) NOT NULL,
  `selected_color` enum('danger','green','black') DEFAULT NULL,
  `winning_amount` decimal(10,2) DEFAULT 0.00,
  `is_won` enum('yes','no') DEFAULT 'no',
  `bet_amount` decimal(10,2) DEFAULT 0.00,
  `client_seed` varchar(255) DEFAULT NULL,
  `server_seed` varchar(255) DEFAULT NULL,
  `nonce` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `roulette_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roulette_histories`
--

INSERT INTO `roulette_histories` (`id`, `selected_color`, `winning_amount`, `is_won`, `bet_amount`, `client_seed`, `server_seed`, `nonce`, `created_at`, `updated_at`, `user_id`, `roulette_id`) VALUES
(1, 'danger', '2.00', 'no', '1.00', '09341165465213215786', 'f9fdba9b35d7af02c0dbd5df38201072724bab162cc8c8e02d47c6a86f852408', 1, '2022-03-12 21:10:12', '2022-03-12 21:10:12', 10, 1),
(2, 'black', '2.50', 'yes', '1.25', '97260390085000478130', '33e802e0f72d8a032cdb08378e8e732e937c924584c73cf21a18a7687d7a2836', 1, '2022-03-13 15:36:48', '2022-03-13 15:36:57', 35, 2),
(3, 'black', '3.00', 'yes', '1.50', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 1, '2022-03-13 15:37:12', '2022-03-13 15:37:19', 35, 3),
(4, 'danger', '3.00', 'no', '1.50', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 2, '2022-03-13 15:37:40', '2022-03-13 15:37:40', 35, 4),
(5, 'danger', '4.50', 'no', '2.25', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 3, '2022-03-13 15:38:00', '2022-03-13 15:38:00', 35, 5),
(6, 'danger', '2.00', 'yes', '1.00', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 4, '2022-03-13 15:38:38', '2022-03-13 15:38:47', 35, 6),
(7, 'danger', '2.00', 'yes', '1.00', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 5, '2022-03-13 15:39:24', '2022-03-13 15:39:31', 35, 7),
(8, 'danger', '2.00', 'no', '1.00', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 6, '2022-03-13 15:39:49', '2022-03-13 15:39:49', 35, 8),
(9, 'danger', '2.00', 'no', '1.00', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 7, '2022-03-13 15:40:09', '2022-03-13 15:40:09', 35, 9),
(10, 'danger', '2.00', 'yes', '1.00', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 8, '2022-03-13 15:40:33', '2022-03-13 15:40:37', 35, 10),
(11, 'danger', '4.00', 'no', '2.00', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 9, '2022-03-13 15:40:53', '2022-03-13 15:40:53', 35, 11),
(12, 'black', '0.10', 'yes', '0.05', '03390600348703245639', '6311b10b2775adfb26ab224c1cb70ae9bcbac81fc194c023102a36cf0663aa0c', 1, '2022-03-14 10:01:46', '2022-03-14 10:01:51', 9, 12),
(13, 'danger', '0.02', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 1, '2022-03-14 10:10:36', '2022-03-14 10:10:36', 14, 13),
(14, 'danger', '0.04', 'no', '0.02', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 2, '2022-03-14 10:10:57', '2022-03-14 10:10:57', 14, 14),
(15, 'danger', '0.02', 'yes', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 3, '2022-03-14 10:11:17', '2022-03-14 10:11:24', 14, 15),
(16, 'danger', '0.04', 'no', '0.02', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 4, '2022-03-14 10:11:41', '2022-03-14 10:11:41', 14, 16),
(17, 'danger', '0.02', 'yes', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 5, '2022-03-14 10:14:12', '2022-03-14 10:14:21', 14, 17),
(18, 'danger', '0.02', 'yes', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 6, '2022-03-14 10:15:18', '2022-03-14 10:15:27', 14, 18),
(19, 'black', '0.02', 'yes', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 7, '2022-03-14 10:16:09', '2022-03-14 10:16:11', 14, 19),
(20, 'danger', '0.04', 'no', '0.02', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 8, '2022-03-14 10:16:27', '2022-03-14 10:16:27', 14, 20),
(21, 'danger', '0.02', 'yes', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 9, '2022-03-14 10:16:47', '2022-03-14 10:16:55', 14, 21),
(22, 'black', '0.02', 'yes', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 10, '2022-03-14 10:17:10', '2022-03-14 10:17:17', 14, 22),
(23, 'danger', '0.04', 'yes', '0.02', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 11, '2022-03-14 10:17:32', '2022-03-14 10:17:39', 14, 23),
(24, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 12, '2022-03-14 10:17:59', '2022-03-14 10:17:59', 14, 24),
(25, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 13, '2022-03-14 10:18:17', '2022-03-14 10:18:17', 14, 25),
(26, 'green', '0.14', 'yes', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 14, '2022-03-14 10:18:38', '2022-03-14 10:18:45', 14, 26),
(27, 'danger', '0.04', 'no', '0.02', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 15, '2022-03-14 10:19:02', '2022-03-14 10:19:02', 14, 27),
(28, 'green', '0.70', 'no', '0.05', '50775404916273936672', '7c9c8d531f705f7a163d9738c49b625fb2710d0373dec87e9ce5fed2d75207c1', 1, '2022-03-14 12:02:51', '2022-03-14 12:02:51', 47, 28),
(29, 'danger', '0.10', 'no', '0.05', '26844230186873066790', '338aa6001e344029d11f738aeb19de3ad436f4babb44fa2e03f9e145c86a4537', 1, '2022-03-14 13:41:19', '2022-03-14 13:41:19', 31, 29),
(30, 'green', '0.70', 'no', '0.05', '56975209491272845778', '63b3f88a588a20f05a7b585ef2d9edc5e3ba3f5895488937d968f7fcbf4f4beb', 1, '2022-03-14 13:53:20', '2022-03-14 13:53:20', 33, 30),
(31, 'danger', '0.10', 'no', '0.05', '63695914441257683491', '4e1a6943cd3a3ce02ff9a61a755bee193160fa65286fcb698e3434cb0d36e2b2', 1, '2022-03-14 14:57:34', '2022-03-14 14:57:34', 15, 31),
(32, 'black', '0.10', 'no', '0.05', '63695914441257683491', '4e1a6943cd3a3ce02ff9a61a755bee193160fa65286fcb698e3434cb0d36e2b2', 2, '2022-03-14 14:58:18', '2022-03-14 14:58:18', 15, 32),
(33, 'danger', '0.10', 'yes', '0.05', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 10, '2022-03-14 16:50:44', '2022-03-14 16:50:54', 35, 33),
(34, 'black', '0.10', 'no', '0.05', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 11, '2022-03-14 16:51:05', '2022-03-14 16:51:05', 35, 33),
(35, 'danger', '0.10', 'yes', '0.05', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 12, '2022-03-14 16:51:50', '2022-03-14 16:52:00', 35, 34),
(36, 'danger', '0.10', 'yes', '0.05', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 13, '2022-03-14 16:51:56', '2022-03-14 16:52:00', 35, 34),
(37, 'black', '0.10', 'yes', '0.05', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 14, '2022-03-14 16:52:18', '2022-03-14 16:52:22', 35, 35),
(38, 'black', '0.10', 'yes', '0.05', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 15, '2022-03-14 16:52:19', '2022-03-14 16:52:22', 35, 35),
(39, 'black', '0.10', 'yes', '0.05', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 16, '2022-03-14 16:52:20', '2022-03-14 16:52:22', 35, 35),
(40, 'black', '0.10', 'yes', '0.05', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 17, '2022-03-14 16:52:21', '2022-03-14 16:52:22', 35, 35),
(41, 'danger', '0.02', 'yes', '0.01', '54715894844996425425', '9ad59ba87dd4e8f080a8e277f375c38412102b79aa4f0308ec5d84e724ae96ed', 1, '2022-03-14 17:31:56', '2022-03-14 17:32:02', 46, 36),
(42, 'danger', '0.02', 'yes', '0.01', '54715894844996425425', '9ad59ba87dd4e8f080a8e277f375c38412102b79aa4f0308ec5d84e724ae96ed', 2, '2022-03-14 17:32:18', '2022-03-14 17:32:24', 46, 37),
(43, 'black', '0.02', 'no', '0.01', '54715894844996425425', '9ad59ba87dd4e8f080a8e277f375c38412102b79aa4f0308ec5d84e724ae96ed', 3, '2022-03-14 17:34:14', '2022-03-14 17:34:14', 46, 38),
(44, 'black', '0.10', 'no', '0.05', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 18, '2022-03-14 17:34:35', '2022-03-14 17:34:35', 35, 38),
(45, 'danger', '0.10', 'no', '0.05', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 19, '2022-03-14 17:34:50', '2022-03-14 17:34:50', 35, 39),
(46, 'danger', '0.10', 'no', '0.05', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 20, '2022-03-14 17:34:52', '2022-03-14 17:34:52', 35, 39),
(47, 'danger', '0.10', 'no', '0.05', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 21, '2022-03-14 17:34:53', '2022-03-14 17:34:53', 35, 39),
(48, 'danger', '0.10', 'no', '0.05', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 22, '2022-03-14 17:34:55', '2022-03-14 17:34:55', 35, 39),
(49, 'black', '0.10', 'no', '0.05', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 23, '2022-03-14 17:35:18', '2022-03-14 17:35:18', 35, 40),
(50, 'black', '0.10', 'no', '0.05', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 24, '2022-03-14 17:35:19', '2022-03-14 17:35:19', 35, 40),
(51, 'black', '0.10', 'no', '0.05', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 25, '2022-03-14 17:35:20', '2022-03-14 17:35:20', 35, 40),
(52, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 1, '2022-03-14 20:00:17', '2022-03-14 20:00:22', 52, 41),
(53, 'green', '0.70', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 2, '2022-03-14 20:00:44', '2022-03-14 20:00:44', 52, 42),
(54, 'green', '0.70', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 3, '2022-03-14 20:00:57', '2022-03-14 20:00:57', 52, 43),
(55, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 4, '2022-03-14 20:01:21', '2022-03-14 20:01:21', 52, 44),
(56, 'black', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 5, '2022-03-14 20:01:43', '2022-03-14 20:01:43', 52, 45),
(57, 'black', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 6, '2022-03-14 20:01:47', '2022-03-14 20:01:47', 52, 45),
(58, 'black', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 7, '2022-03-14 20:02:11', '2022-03-14 20:02:11', 52, 46),
(59, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 8, '2022-03-14 20:02:29', '2022-03-14 20:02:29', 52, 47),
(60, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 9, '2022-03-14 20:02:33', '2022-03-14 20:02:33', 52, 47),
(61, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 10, '2022-03-14 20:02:50', '2022-03-14 20:02:57', 52, 48),
(62, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 11, '2022-03-14 20:02:51', '2022-03-14 20:02:57', 52, 48),
(63, 'black', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 12, '2022-03-14 20:03:12', '2022-03-14 20:03:19', 52, 49),
(64, 'black', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 13, '2022-03-14 20:03:14', '2022-03-14 20:03:19', 52, 49),
(65, 'black', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 14, '2022-03-14 20:03:15', '2022-03-14 20:03:19', 52, 49),
(66, 'black', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 15, '2022-03-14 20:03:17', '2022-03-14 20:03:19', 52, 49),
(67, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 16, '2022-03-14 20:03:33', '2022-03-14 20:03:41', 52, 50),
(68, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 17, '2022-03-14 20:03:37', '2022-03-14 20:03:41', 52, 50),
(69, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 18, '2022-03-14 20:03:39', '2022-03-14 20:03:41', 52, 50),
(70, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 19, '2022-03-14 20:03:57', '2022-03-14 20:03:57', 52, 51),
(71, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 20, '2022-03-14 20:03:58', '2022-03-14 20:03:58', 52, 51),
(72, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 21, '2022-03-14 20:03:59', '2022-03-14 20:03:59', 52, 51),
(73, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 22, '2022-03-14 20:04:16', '2022-03-14 20:04:16', 52, 52),
(74, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 23, '2022-03-14 20:04:17', '2022-03-14 20:04:17', 52, 52),
(75, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 24, '2022-03-14 20:04:18', '2022-03-14 20:04:18', 52, 52),
(76, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 25, '2022-03-14 20:04:19', '2022-03-14 20:04:19', 52, 52),
(77, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 26, '2022-03-14 20:04:19', '2022-03-14 20:04:19', 52, 52),
(78, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 27, '2022-03-14 20:04:20', '2022-03-14 20:04:20', 52, 52),
(79, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 28, '2022-03-14 20:04:38', '2022-03-14 20:04:47', 52, 53),
(80, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 29, '2022-03-14 20:04:38', '2022-03-14 20:04:47', 52, 53),
(81, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 30, '2022-03-14 20:04:40', '2022-03-14 20:04:47', 52, 53),
(82, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 31, '2022-03-14 20:05:03', '2022-03-14 20:05:09', 52, 54),
(83, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 32, '2022-03-14 20:05:04', '2022-03-14 20:05:09', 52, 54),
(84, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 33, '2022-03-14 20:05:04', '2022-03-14 20:05:09', 52, 54),
(85, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 34, '2022-03-14 20:05:07', '2022-03-14 20:05:09', 52, 54),
(86, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 35, '2022-03-14 20:05:09', '2022-03-14 20:05:09', 52, 54),
(87, 'black', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 36, '2022-03-14 20:05:24', '2022-03-14 20:05:31', 52, 55),
(88, 'black', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 37, '2022-03-14 20:05:26', '2022-03-14 20:05:31', 52, 55),
(89, 'black', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 38, '2022-03-14 20:05:28', '2022-03-14 20:05:31', 52, 55),
(90, 'green', '0.70', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 39, '2022-03-14 20:05:29', '2022-03-14 20:05:29', 52, 55),
(91, 'black', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 40, '2022-03-14 20:05:48', '2022-03-14 20:05:48', 52, 56),
(92, 'black', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 41, '2022-03-14 20:05:49', '2022-03-14 20:05:49', 52, 56),
(93, 'green', '0.70', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 42, '2022-03-14 20:05:51', '2022-03-14 20:05:51', 52, 56),
(94, 'black', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 43, '2022-03-14 20:06:06', '2022-03-14 20:06:15', 52, 57),
(95, 'black', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 44, '2022-03-14 20:06:07', '2022-03-14 20:06:15', 52, 57),
(96, 'black', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 45, '2022-03-14 20:06:08', '2022-03-14 20:06:15', 52, 57),
(97, 'black', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 46, '2022-03-14 20:06:10', '2022-03-14 20:06:15', 52, 57),
(98, 'green', '0.70', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 47, '2022-03-14 20:06:11', '2022-03-14 20:06:11', 52, 57),
(99, 'green', '0.70', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 48, '2022-03-14 20:06:29', '2022-03-14 20:06:29', 52, 58),
(100, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 49, '2022-03-14 20:06:31', '2022-03-14 20:06:37', 52, 58),
(101, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 50, '2022-03-14 20:06:32', '2022-03-14 20:06:37', 52, 58),
(102, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 51, '2022-03-14 20:06:33', '2022-03-14 20:06:37', 52, 58),
(103, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 52, '2022-03-14 20:06:34', '2022-03-14 20:06:37', 52, 58),
(104, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 53, '2022-03-14 20:06:34', '2022-03-14 20:06:37', 52, 58),
(105, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 54, '2022-03-14 20:06:36', '2022-03-14 20:06:37', 52, 58),
(106, 'green', '0.70', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 55, '2022-03-14 20:06:53', '2022-03-14 20:06:53', 52, 59),
(107, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 56, '2022-03-14 20:06:57', '2022-03-14 20:06:57', 52, 59),
(108, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 57, '2022-03-14 20:06:58', '2022-03-14 20:06:58', 52, 59),
(109, 'green', '0.70', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 58, '2022-03-14 20:07:13', '2022-03-14 20:07:13', 52, 60),
(110, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 59, '2022-03-14 20:07:14', '2022-03-14 20:07:14', 52, 60),
(111, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 60, '2022-03-14 20:07:15', '2022-03-14 20:07:15', 52, 60),
(112, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 61, '2022-03-14 20:07:15', '2022-03-14 20:07:15', 52, 60),
(113, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 62, '2022-03-14 20:07:17', '2022-03-14 20:07:17', 52, 60),
(114, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 63, '2022-03-14 20:07:17', '2022-03-14 20:07:17', 52, 60),
(115, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 64, '2022-03-14 20:07:18', '2022-03-14 20:07:18', 52, 60),
(116, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 65, '2022-03-14 20:07:19', '2022-03-14 20:07:19', 52, 60),
(117, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 66, '2022-03-14 20:07:21', '2022-03-14 20:07:21', 52, 60),
(118, 'green', '0.70', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 67, '2022-03-14 20:07:35', '2022-03-14 20:07:35', 52, 61),
(119, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 68, '2022-03-14 20:07:36', '2022-03-14 20:07:43', 52, 61),
(120, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 69, '2022-03-14 20:07:37', '2022-03-14 20:07:43', 52, 61),
(121, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 70, '2022-03-14 20:07:37', '2022-03-14 20:07:43', 52, 61),
(122, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 71, '2022-03-14 20:07:38', '2022-03-14 20:07:43', 52, 61),
(123, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 72, '2022-03-14 20:07:39', '2022-03-14 20:07:43', 52, 61),
(124, 'green', '0.70', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 73, '2022-03-14 20:07:56', '2022-03-14 20:07:56', 52, 62),
(125, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 74, '2022-03-14 20:07:58', '2022-03-14 20:08:05', 52, 62),
(126, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 75, '2022-03-14 20:08:05', '2022-03-14 20:08:05', 52, 62),
(127, 'green', '0.70', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 76, '2022-03-14 20:08:22', '2022-03-14 20:08:22', 52, 63),
(128, 'black', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 77, '2022-03-14 20:08:23', '2022-03-14 20:08:23', 52, 63),
(129, 'black', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 78, '2022-03-14 20:08:24', '2022-03-14 20:08:24', 52, 63),
(130, 'black', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 79, '2022-03-14 20:08:26', '2022-03-14 20:08:26', 52, 63),
(131, 'black', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 80, '2022-03-14 20:08:41', '2022-03-14 20:08:49', 52, 64),
(132, 'black', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 81, '2022-03-14 20:08:43', '2022-03-14 20:08:49', 52, 64),
(133, 'black', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 82, '2022-03-14 20:08:44', '2022-03-14 20:08:49', 52, 64),
(134, 'black', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 83, '2022-03-14 20:08:45', '2022-03-14 20:08:49', 52, 64),
(135, 'black', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 84, '2022-03-14 20:08:46', '2022-03-14 20:08:49', 52, 64),
(136, 'green', '0.70', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 85, '2022-03-14 20:08:48', '2022-03-14 20:08:48', 52, 64),
(137, 'black', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 86, '2022-03-14 20:09:05', '2022-03-14 20:09:05', 52, 65),
(138, 'green', '0.70', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 87, '2022-03-14 20:09:06', '2022-03-14 20:09:06', 52, 65),
(139, 'black', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 88, '2022-03-14 20:09:08', '2022-03-14 20:09:08', 52, 65),
(140, 'green', '0.70', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 89, '2022-03-14 20:09:24', '2022-03-14 20:09:24', 52, 66),
(141, 'black', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 90, '2022-03-14 20:09:25', '2022-03-14 20:09:34', 52, 66),
(142, 'black', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 91, '2022-03-14 20:09:27', '2022-03-14 20:09:34', 52, 66),
(143, 'black', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 92, '2022-03-14 20:09:28', '2022-03-14 20:09:34', 52, 66),
(144, 'black', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 93, '2022-03-14 20:09:29', '2022-03-14 20:09:34', 52, 66),
(145, 'black', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 94, '2022-03-14 20:09:31', '2022-03-14 20:09:34', 52, 66),
(146, 'green', '0.70', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 95, '2022-03-14 20:09:49', '2022-03-14 20:09:49', 52, 67),
(147, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 96, '2022-03-14 20:09:50', '2022-03-14 20:09:56', 52, 67),
(148, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 97, '2022-03-14 20:09:51', '2022-03-14 20:09:56', 52, 67),
(149, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 98, '2022-03-14 20:09:52', '2022-03-14 20:09:56', 52, 67),
(150, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 99, '2022-03-14 20:09:53', '2022-03-14 20:09:56', 52, 67),
(151, 'danger', '0.10', 'yes', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 100, '2022-03-14 20:09:54', '2022-03-14 20:09:56', 52, 67),
(152, 'green', '0.70', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 101, '2022-03-14 20:10:09', '2022-03-14 20:10:09', 52, 68),
(153, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 102, '2022-03-14 20:10:12', '2022-03-14 20:10:12', 52, 68),
(154, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 103, '2022-03-14 20:10:13', '2022-03-14 20:10:13', 52, 68),
(155, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 104, '2022-03-14 20:10:14', '2022-03-14 20:10:14', 52, 68),
(156, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 105, '2022-03-14 20:10:15', '2022-03-14 20:10:15', 52, 68),
(157, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 106, '2022-03-14 20:10:15', '2022-03-14 20:10:15', 52, 68),
(158, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 107, '2022-03-14 20:10:16', '2022-03-14 20:10:16', 52, 68),
(159, 'green', '0.70', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 108, '2022-03-14 20:10:31', '2022-03-14 20:10:31', 52, 69),
(160, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 109, '2022-03-14 20:10:32', '2022-03-14 20:10:32', 52, 69),
(161, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 110, '2022-03-14 20:10:33', '2022-03-14 20:10:33', 52, 69),
(162, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 111, '2022-03-14 20:10:34', '2022-03-14 20:10:34', 52, 69),
(163, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 112, '2022-03-14 20:10:35', '2022-03-14 20:10:35', 52, 69),
(164, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 113, '2022-03-14 20:10:36', '2022-03-14 20:10:36', 52, 69),
(165, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 114, '2022-03-14 20:10:36', '2022-03-14 20:10:36', 52, 69),
(166, 'green', '0.70', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 115, '2022-03-14 20:10:52', '2022-03-14 20:10:52', 52, 70),
(167, 'danger', '0.10', 'no', '0.05', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 116, '2022-03-14 20:10:54', '2022-03-14 20:10:54', 52, 70),
(168, 'danger', '0.02', 'no', '0.01', '54715894844996425425', '9ad59ba87dd4e8f080a8e277f375c38412102b79aa4f0308ec5d84e724ae96ed', 4, '2022-03-15 04:35:41', '2022-03-15 04:35:41', 46, 71),
(169, 'danger', '0.02', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 16, '2022-03-15 09:23:59', '2022-03-15 09:23:59', 14, 72),
(170, 'danger', '0.04', 'yes', '0.02', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 17, '2022-03-15 09:24:19', '2022-03-15 09:24:24', 14, 73),
(171, 'black', '0.02', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 18, '2022-03-15 09:24:43', '2022-03-15 09:24:43', 14, 74),
(172, 'black', '0.02', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 19, '2022-03-15 09:25:06', '2022-03-15 09:25:06', 14, 75),
(173, 'black', '0.04', 'yes', '0.02', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 20, '2022-03-15 09:25:24', '2022-03-15 09:25:30', 14, 76),
(174, 'black', '0.02', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 21, '2022-03-15 09:25:49', '2022-03-15 09:25:49', 14, 77),
(175, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 22, '2022-03-15 09:26:04', '2022-03-15 09:26:04', 14, 78),
(176, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 23, '2022-03-15 09:26:26', '2022-03-15 09:26:26', 14, 79),
(177, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 24, '2022-03-15 09:26:51', '2022-03-15 09:26:51', 14, 80),
(178, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 25, '2022-03-15 09:27:11', '2022-03-15 09:27:11', 14, 81),
(179, 'green', '0.14', 'yes', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 26, '2022-03-15 09:27:35', '2022-03-15 09:27:42', 14, 82),
(180, 'black', '0.02', 'yes', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 27, '2022-03-15 09:28:00', '2022-03-15 09:28:04', 14, 83),
(181, 'danger', '0.02', 'yes', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 28, '2022-03-15 09:28:19', '2022-03-15 09:28:26', 14, 84),
(182, 'danger', '0.10', 'yes', '0.05', '57694329236202385015', '6e0adff955cd31332529697f058d2a6c6441663507cb0f8474943a7c0dfd4a14', 1, '2022-03-15 14:28:44', '2022-03-15 14:29:03', 53, 85),
(183, 'black', '0.10', 'no', '0.05', '57694329236202385015', '6e0adff955cd31332529697f058d2a6c6441663507cb0f8474943a7c0dfd4a14', 2, '2022-03-15 14:28:57', '2022-03-15 14:28:57', 53, 85),
(184, 'black', '0.10', 'yes', '0.05', '18300770073044432902', '453bb395af927b25958051efcaea0c41445065ee2d26be8c575c68d8508b3d25', 1, '2022-03-15 14:44:03', '2022-03-15 14:44:06', 54, 86),
(185, 'green', '0.70', 'no', '0.05', '18300770073044432902', '453bb395af927b25958051efcaea0c41445065ee2d26be8c575c68d8508b3d25', 2, '2022-03-15 14:44:24', '2022-03-15 14:44:24', 54, 87),
(186, 'green', '0.70', 'no', '0.05', '18300770073044432902', '453bb395af927b25958051efcaea0c41445065ee2d26be8c575c68d8508b3d25', 3, '2022-03-15 14:44:49', '2022-03-15 14:44:49', 54, 88),
(187, 'black', '0.10', 'no', '0.05', '18300770073044432902', '453bb395af927b25958051efcaea0c41445065ee2d26be8c575c68d8508b3d25', 4, '2022-03-15 14:45:04', '2022-03-15 14:45:04', 54, 89),
(188, 'green', '0.70', 'no', '0.05', '18300770073044432902', '453bb395af927b25958051efcaea0c41445065ee2d26be8c575c68d8508b3d25', 5, '2022-03-15 14:45:27', '2022-03-15 14:45:27', 54, 90),
(189, 'green', '0.70', 'no', '0.05', '18300770073044432902', '453bb395af927b25958051efcaea0c41445065ee2d26be8c575c68d8508b3d25', 6, '2022-03-15 14:45:50', '2022-03-15 14:45:50', 54, 91),
(190, 'green', '0.70', 'no', '0.05', '18300770073044432902', '453bb395af927b25958051efcaea0c41445065ee2d26be8c575c68d8508b3d25', 7, '2022-03-15 14:46:12', '2022-03-15 14:46:12', 54, 92),
(191, 'danger', '0.02', 'yes', '0.01', '27435022288084175168', 'b338343f34853603ef2c6ca8f74a5a413bba0314e4acdc4e69f8e3eaacfc89b2', 1, '2022-03-15 16:28:36', '2022-03-15 16:28:44', 46, 93),
(192, 'black', '0.02', 'yes', '0.01', '27435022288084175168', 'b338343f34853603ef2c6ca8f74a5a413bba0314e4acdc4e69f8e3eaacfc89b2', 2, '2022-03-15 16:28:59', '2022-03-15 16:29:06', 46, 94),
(193, 'green', '0.14', 'no', '0.01', '27435022288084175168', 'b338343f34853603ef2c6ca8f74a5a413bba0314e4acdc4e69f8e3eaacfc89b2', 3, '2022-03-15 16:29:21', '2022-03-15 16:29:21', 46, 95),
(194, 'danger', '0.02', 'no', '0.01', '27435022288084175168', 'b338343f34853603ef2c6ca8f74a5a413bba0314e4acdc4e69f8e3eaacfc89b2', 4, '2022-03-15 16:34:29', '2022-03-15 16:34:29', 46, 96),
(195, 'danger', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 1, '2022-03-15 17:36:29', '2022-03-15 17:36:29', 58, 97),
(196, 'danger', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 2, '2022-03-15 17:36:58', '2022-03-15 17:36:58', 58, 98),
(197, 'green', '0.70', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 3, '2022-03-15 17:37:17', '2022-03-15 17:37:17', 58, 99),
(198, 'black', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 4, '2022-03-15 17:37:37', '2022-03-15 17:37:37', 58, 100),
(199, 'danger', '0.02', 'no', '0.01', '26844230186873066790', '338aa6001e344029d11f738aeb19de3ad436f4babb44fa2e03f9e145c86a4537', 2, '2022-03-15 20:05:55', '2022-03-15 20:05:55', 31, 101),
(200, 'danger', '0.02', 'no', '0.01', '26844230186873066790', '338aa6001e344029d11f738aeb19de3ad436f4babb44fa2e03f9e145c86a4537', 3, '2022-03-15 20:06:33', '2022-03-15 20:06:33', 31, 102),
(201, 'danger', '0.02', 'no', '0.01', '26844230186873066790', '338aa6001e344029d11f738aeb19de3ad436f4babb44fa2e03f9e145c86a4537', 4, '2022-03-15 20:06:46', '2022-03-15 20:06:46', 31, 102),
(202, 'danger', '0.02', 'yes', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 29, '2022-03-16 04:23:06', '2022-03-16 04:23:07', 14, 103),
(203, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 30, '2022-03-16 08:57:39', '2022-03-16 08:57:39', 14, 104),
(204, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 31, '2022-03-16 08:57:58', '2022-03-16 08:57:58', 14, 105),
(205, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 32, '2022-03-16 08:58:15', '2022-03-16 08:58:15', 14, 106),
(206, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 33, '2022-03-16 08:58:38', '2022-03-16 08:58:38', 14, 107),
(207, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 34, '2022-03-16 08:59:00', '2022-03-16 08:59:00', 14, 108),
(208, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 35, '2022-03-16 08:59:28', '2022-03-16 08:59:28', 14, 109),
(209, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 36, '2022-03-16 08:59:45', '2022-03-16 08:59:45', 14, 110),
(210, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 37, '2022-03-16 09:00:07', '2022-03-16 09:00:07', 14, 111),
(211, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 38, '2022-03-16 09:00:51', '2022-03-16 09:00:51', 14, 112),
(212, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 39, '2022-03-16 09:01:12', '2022-03-16 09:01:12', 14, 113),
(213, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 40, '2022-03-16 09:01:34', '2022-03-16 09:01:34', 14, 114),
(214, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 41, '2022-03-16 09:01:56', '2022-03-16 09:01:56', 14, 115),
(215, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 42, '2022-03-16 09:02:18', '2022-03-16 09:02:18', 14, 116),
(216, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 43, '2022-03-16 09:02:46', '2022-03-16 09:02:46', 14, 117),
(217, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 44, '2022-03-16 09:03:05', '2022-03-16 09:03:05', 14, 118),
(218, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 45, '2022-03-16 09:03:25', '2022-03-16 09:03:25', 14, 119),
(219, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 46, '2022-03-16 09:04:08', '2022-03-16 09:04:08', 14, 120),
(220, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 47, '2022-03-16 09:04:31', '2022-03-16 09:04:31', 14, 121),
(221, 'green', '0.14', 'yes', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 48, '2022-03-16 09:04:54', '2022-03-16 09:05:02', 14, 122),
(222, 'green', '0.14', 'no', '0.01', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 49, '2022-03-16 09:05:17', '2022-03-16 09:05:17', 14, 123),
(223, 'black', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 5, '2022-03-16 13:12:28', '2022-03-16 13:12:28', 58, 124),
(224, 'black', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 6, '2022-03-16 13:12:47', '2022-03-16 13:12:47', 58, 125),
(225, 'black', '0.10', 'yes', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 7, '2022-03-16 13:13:35', '2022-03-16 13:13:39', 58, 126),
(226, 'green', '0.70', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 8, '2022-03-16 13:14:00', '2022-03-16 13:14:00', 58, 127),
(227, 'green', '0.70', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 9, '2022-03-16 13:14:16', '2022-03-16 13:14:16', 58, 128),
(228, 'danger', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 10, '2022-03-16 13:14:44', '2022-03-16 13:14:44', 58, 129),
(229, 'danger', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 11, '2022-03-16 13:14:59', '2022-03-16 13:14:59', 58, 130),
(230, 'green', '0.70', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 12, '2022-03-16 13:15:01', '2022-03-16 13:15:01', 58, 130),
(231, 'black', '0.10', 'yes', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 13, '2022-03-16 13:15:21', '2022-03-16 13:15:29', 58, 131),
(232, 'danger', '0.10', 'yes', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 14, '2022-03-16 13:15:45', '2022-03-16 13:15:51', 58, 132),
(233, 'danger', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 15, '2022-03-16 13:16:06', '2022-03-16 13:16:06', 58, 133),
(234, 'black', '0.10', 'yes', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 16, '2022-03-16 13:18:16', '2022-03-16 13:18:25', 58, 134),
(235, 'danger', '0.10', 'yes', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 17, '2022-03-16 16:54:16', '2022-03-16 16:54:19', 58, 135),
(236, 'danger', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 18, '2022-03-16 16:54:40', '2022-03-16 16:54:40', 58, 136),
(237, 'danger', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 19, '2022-03-16 16:54:57', '2022-03-16 16:54:57', 58, 137),
(238, 'danger', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 20, '2022-03-16 16:55:20', '2022-03-16 16:55:20', 58, 138),
(239, 'danger', '0.10', 'yes', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 21, '2022-03-16 16:55:39', '2022-03-16 16:55:47', 58, 139),
(240, 'danger', '0.10', 'yes', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 22, '2022-03-16 16:59:13', '2022-03-16 16:59:27', 58, 140),
(241, 'danger', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 23, '2022-03-16 16:59:45', '2022-03-16 16:59:45', 58, 141),
(242, 'danger', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 24, '2022-03-16 17:00:02', '2022-03-16 17:00:02', 58, 142),
(243, 'danger', '0.10', 'yes', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 25, '2022-03-16 17:19:54', '2022-03-16 17:20:01', 58, 143),
(244, 'danger', '0.10', 'yes', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 26, '2022-03-16 17:22:07', '2022-03-16 17:22:13', 58, 144),
(245, 'danger', '0.10', 'yes', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 27, '2022-03-16 17:25:46', '2022-03-16 17:25:53', 58, 145),
(246, 'green', '0.70', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 28, '2022-03-16 17:25:48', '2022-03-16 17:25:48', 58, 145),
(247, 'danger', '0.10', 'yes', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 29, '2022-03-16 17:26:08', '2022-03-16 17:26:15', 58, 146),
(248, 'black', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 30, '2022-03-16 17:26:33', '2022-03-16 17:26:33', 58, 147),
(249, 'black', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 31, '2022-03-16 17:26:37', '2022-03-16 17:26:37', 58, 147),
(250, 'danger', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 32, '2022-03-16 17:26:52', '2022-03-16 17:26:52', 58, 148),
(251, 'danger', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 33, '2022-03-16 17:26:54', '2022-03-16 17:26:54', 58, 148),
(252, 'danger', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 34, '2022-03-16 17:26:55', '2022-03-16 17:26:55', 58, 148),
(253, 'black', '0.10', 'yes', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 35, '2022-03-16 17:27:18', '2022-03-16 17:27:22', 58, 149),
(254, 'black', '0.10', 'yes', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 36, '2022-03-16 17:27:19', '2022-03-16 17:27:22', 58, 149),
(255, 'black', '0.10', 'yes', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 37, '2022-03-16 17:27:20', '2022-03-16 17:27:22', 58, 149),
(256, 'green', '0.70', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 38, '2022-03-16 17:27:37', '2022-03-16 17:27:37', 58, 150),
(257, 'green', '0.70', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 39, '2022-03-16 17:28:03', '2022-03-16 17:28:03', 58, 151),
(258, 'green', '0.70', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 40, '2022-03-16 17:28:23', '2022-03-16 17:28:23', 58, 152),
(259, 'black', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 41, '2022-03-16 17:28:26', '2022-03-16 17:28:26', 58, 152),
(260, 'danger', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 42, '2022-03-16 17:28:43', '2022-03-16 17:28:43', 58, 153),
(261, 'danger', '0.10', 'yes', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 43, '2022-03-16 17:29:05', '2022-03-16 17:29:12', 58, 154),
(262, 'danger', '0.10', 'yes', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 44, '2022-03-16 17:29:29', '2022-03-16 17:29:34', 58, 155),
(263, 'black', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 45, '2022-03-16 17:29:48', '2022-03-16 17:29:48', 58, 156),
(264, 'danger', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 46, '2022-03-16 17:30:52', '2022-03-16 17:30:52', 58, 157),
(265, 'green', '0.70', 'yes', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 47, '2022-03-16 17:31:19', '2022-03-16 17:31:24', 58, 158),
(266, 'green', '0.70', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 48, '2022-03-16 17:31:43', '2022-03-16 17:31:43', 58, 159);
INSERT INTO `roulette_histories` (`id`, `selected_color`, `winning_amount`, `is_won`, `bet_amount`, `client_seed`, `server_seed`, `nonce`, `created_at`, `updated_at`, `user_id`, `roulette_id`) VALUES
(267, 'danger', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 49, '2022-03-16 17:31:46', '2022-03-16 17:31:46', 58, 159),
(268, 'danger', '0.10', 'no', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 50, '2022-03-16 17:32:01', '2022-03-16 17:32:01', 58, 160),
(269, 'danger', '0.10', 'yes', '0.05', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 51, '2022-03-16 17:32:23', '2022-03-16 17:32:30', 58, 161),
(270, 'danger', '0.10', 'no', '0.05', '08715282927882898425', '88f668ecc1038b7226e7f287e0e9d8c255ece4dd4f8b7d33de3bfc25789a7256', 1, '2022-03-30 20:03:05', '2022-03-30 20:03:05', 64, 162),
(271, 'danger', '0.10', 'no', '0.05', '08715282927882898425', '88f668ecc1038b7226e7f287e0e9d8c255ece4dd4f8b7d33de3bfc25789a7256', 2, '2022-03-30 20:03:16', '2022-03-30 20:03:16', 64, 162),
(272, 'black', '0.10', 'no', '0.05', '08715282927882898425', '88f668ecc1038b7226e7f287e0e9d8c255ece4dd4f8b7d33de3bfc25789a7256', 3, '2022-03-30 20:03:35', '2022-03-30 20:03:35', 64, 163),
(273, 'danger', '0.10', 'yes', '0.05', '08715282927882898425', '88f668ecc1038b7226e7f287e0e9d8c255ece4dd4f8b7d33de3bfc25789a7256', 4, '2022-03-30 20:23:21', '2022-03-30 20:23:38', 64, 164),
(274, 'danger', '0.10', 'no', '0.05', '08715282927882898425', '88f668ecc1038b7226e7f287e0e9d8c255ece4dd4f8b7d33de3bfc25789a7256', 5, '2022-03-30 20:23:47', '2022-03-30 20:23:47', 64, 164),
(275, 'danger', '0.10', 'no', '0.05', '08715282927882898425', '88f668ecc1038b7226e7f287e0e9d8c255ece4dd4f8b7d33de3bfc25789a7256', 6, '2022-03-30 20:24:17', '2022-03-30 20:24:17', 64, 165),
(276, 'danger', '0.10', 'yes', '0.05', '08715282927882898425', '88f668ecc1038b7226e7f287e0e9d8c255ece4dd4f8b7d33de3bfc25789a7256', 7, '2022-03-30 21:14:27', '2022-03-30 21:14:36', 64, 166);

-- --------------------------------------------------------

--
-- Table structure for table `roulette_masters`
--

CREATE TABLE `roulette_masters` (
  `id` int(11) NOT NULL,
  `game_number` bigint(20) DEFAULT NULL,
  `game_secret` varchar(255) DEFAULT NULL,
  `game_hash` varchar(255) DEFAULT NULL,
  `hash_salt` varchar(255) DEFAULT NULL,
  `round_number` varchar(255) DEFAULT NULL,
  `game_stopped_number` int(11) DEFAULT NULL,
  `admin_commission_price` decimal(10,2) DEFAULT 0.00,
  `admin_commission_dollar` decimal(10,2) DEFAULT 0.00,
  `dollar_price_in_coins` int(11) DEFAULT NULL,
  `bet_amount` decimal(10,2) DEFAULT 0.00,
  `game_status` enum('pending','completed') DEFAULT 'pending',
  `game_stopped_on` enum('danger','green','black') DEFAULT NULL,
  `is_deleted` enum('1','0') DEFAULT '0',
  `total_amt_carryforward` decimal(10,2) DEFAULT 0.00,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roulette_masters`
--

INSERT INTO `roulette_masters` (`id`, `game_number`, `game_secret`, `game_hash`, `hash_salt`, `round_number`, `game_stopped_number`, `admin_commission_price`, `admin_commission_dollar`, `dollar_price_in_coins`, `bet_amount`, `game_status`, `game_stopped_on`, `is_deleted`, `total_amt_carryforward`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, '5cb8671112744a352a7ca437c9ab5dc8d76904b09605cbdbe2c1bff811fdfbe3', '9504920155781803313452018095396547918812349043967759407528186991', '0.2355417040440908', 6, '0.12', '0.01', 12, '1.00', 'completed', 'black', '0', '0.00', '0000-00-00 00:00:00', '2022-03-12 21:10:28'),
(2, -9223372036854775808, '8435497101', '09a265fcdbd5d1b7dd4c756e0bf2d1a77c71cce9c3afa068562cbe437ac02da6', '7231757636882511458548381519948640064461949076285121110428332070', '0.8886045958154445', 14, '0.15', '0.01', 12, '1.25', 'completed', 'black', '0', '0.88', '2022-03-12 21:10:28', '2022-03-13 15:37:08'),
(3, -9223372036854775808, '3258480086', 'e00b5566a871cc56fa6c5d1893c114d4d2f1c9a6a47b2ccd0d11dee817d77440', '1940903394502377047146643950337118406515505568024631438946430272', '0.1562860082994375', 2, '0.18', '0.02', 12, '1.50', 'completed', 'black', '0', '-0.52', '2022-03-13 15:37:08', '2022-03-13 15:37:30'),
(4, -9223372036854775808, '5758678771', 'c5bb561b2154ac47e2874255943b620b06655c7ab4becc23b2ba17d92dbaaf46', '7761048293848443861458083581539277721840412977349784559725238751', '0.9740066072532678', 2, '0.18', '0.02', 12, '1.50', 'completed', 'black', '0', '-2.20', '2022-03-13 15:37:30', '2022-03-13 15:37:52'),
(5, -9223372036854775808, '4241937196', '2d50a5cca79a05f79908ad92e288a32f45f8d40311141770b12981a269b4d862', '2199686976810174861978816554986135200058749013085604321862127916', '0.6459442788095107', 14, '0.27', '0.02', 12, '2.25', 'completed', 'black', '0', '-0.88', '2022-03-13 15:37:52', '2022-03-13 15:38:14'),
(6, -9223372036854775808, '8022048120', '6d4d85b1b094565bfefd2346cf5c508998aa34ec258dcb0309d9a30dd6c88b62', '7556374684399271237861763839979535103677729303889739934525098327', '0.4809634370615057', 1, '0.12', '0.01', 12, '1.00', 'completed', 'danger', '0', '1.10', '2022-03-13 15:38:14', '2022-03-13 15:38:58'),
(7, -9223372036854775808, '4798079285', '1bee24ff1a9a09124e951f200c3d9081184385c9e2a51e01378a7786c5f3039a', '7341808222900221208371602980294239399497761028150685536437464485', '0.3535268810189378', 1, '0.12', '0.01', 12, '1.00', 'completed', 'danger', '0', '-0.02', '2022-03-13 15:38:58', '2022-03-13 15:39:42'),
(8, -9223372036854775808, '7009846431', '1a2d5412990cb38518bc6a7d97f02a214d5c98cf53bb8f7826b2a51da12173ff', '3125702158775843583228159939132234885346063264355462341263326664', '0.011646501880796523', 8, '0.12', '0.01', 12, '1.00', 'completed', 'black', '0', '-1.14', '2022-03-13 15:39:42', '2022-03-13 15:40:04'),
(9, -9223372036854775808, '8676692833', 'f5e5be6933f6fa88945cb6e734a538f38be14c6853ccb1747d9bb44b2df04cd6', '8431393748021391014269873721146511176638503710911237111950235998', '0.10521229997237147', 4, '0.12', '0.01', 12, '1.00', 'completed', 'black', '0', '-0.26', '2022-03-13 15:40:04', '2022-03-13 15:40:26'),
(10, -9223372036854775808, '7409057010', '231a3acb09981d6bc8559ad2487bdc5ab6a2e7e0604b20827e71bb0bfcb232d0', '0001114570275723268601894908165168506943117484228737901027191414', '0.4989981276896627', 7, '0.12', '0.01', 12, '1.00', 'completed', 'danger', '0', '0.62', '2022-03-13 15:40:26', '2022-03-13 15:40:48'),
(11, -9223372036854775808, '2468345585', '14157ae7ec93eb8c42b11dfcb3106cd8d30497dfdccd6202c6ceb7317d3aeea9', '1939334385792845813506862506700292532528313525563664770629704372', '0.25885227172374203', 4, '0.24', '0.02', 12, '2.00', 'completed', 'black', '0', '-0.50', '2022-03-13 15:40:48', '2022-03-13 15:41:10'),
(12, -9223372036854775808, '5081939871', 'bea009a54d6d7a50588fde68ec7ea56ab42b2bad20f3e7e1b3f13cb59ec1f12b', '9720228164551798883937273161918918034831276146557925848975439266', '0.9707518392456786', 14, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '1.26', '2022-03-13 15:41:10', '2022-03-14 10:02:02'),
(13, -9223372036854775808, '2065919211', '27c15c9901161f7c1568801827f7e49429c67ded87e1e9147245a81e5c4f5a82', '5781662972114210147303806563277437602347477780901352300256455004', '0.7967514681417989', 12, '0.00', '0.00', 1, '0.01', 'completed', 'black', '0', '1.21', '2022-03-14 10:02:02', '2022-03-14 10:10:51'),
(14, -9223372036854775808, '3667646835', '8c0d3e10f4e7f1ddf537451ee19df004aa6069b18189602872dcfc3d5934f384', '0114521899519811551193559023330137411707862385643561013153375044', '0.7862908331296554', 6, '0.00', '0.00', 1, '0.02', 'completed', 'black', '0', '1.22', '2022-03-14 10:10:51', '2022-03-14 10:11:13'),
(15, -9223372036854775808, '6924090952', '082ee068f5a024bb0e988248eae22add475f3e2d36fc00c6144575910d5e4e2a', '2686991321187771616206866279691580220232838973103187765203376729', '0.30671806847699057', 7, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '1.24', '2022-03-14 10:11:13', '2022-03-14 10:11:35'),
(16, -9223372036854775808, '4112127789', 'c3abc8b8711977b4c840c92930035925a83d8c9c70a4951fb0e429beb5ab4c9a', '9142572974978528882740351675479561168632831639054068797568545758', '0.3839165511506719', 0, '0.00', '0.00', 1, '0.02', 'completed', 'green', '0', '1.23', '2022-03-14 10:11:35', '2022-03-14 10:11:57'),
(17, -9223372036854775808, '9554825368', '8a4a6525b05cea3d0924cb1dad05e178bc9637e26e5fe5bf630ff25c357f1dd8', '3454173504223326225856949594668337889987641793741731078953756455', '0.13482816658620456', 5, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '1.25', '2022-03-14 10:11:57', '2022-03-14 10:14:32'),
(18, -9223372036854775808, '6026036367', '4883f00e05d8a3a240ece7e63295eb232c9cbaf6af0a24bbfdfb5f01b4a5a1cf', '5406850124038349356921718782228365075175720838911603910419708218', '0.5501298247055384', 7, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '1.24', '2022-03-14 10:14:32', '2022-03-14 10:15:38'),
(19, -9223372036854775808, '0580143881', 'ac46d80f2dcb3c2f28acdf3a4ebe448903d09c821b78e2148c71809e8e047767', '6867418151355269462260824913629809906913705175356728504931610089', '0.27717192934217194', 8, '0.00', '0.00', 1, '0.01', 'completed', 'black', '0', '1.23', '2022-03-14 10:15:38', '2022-03-14 10:16:22'),
(20, -9223372036854775808, '6423772876', '3e6ce3af3216bf0c87eb419634050997ae0780e7d2c2289db145c81c30bd3c7b', '6701552899648171094963938052357947598806780541670752398091635633', '0.847821607742808', 2, '0.00', '0.00', 1, '0.02', 'completed', 'black', '0', '1.22', '2022-03-14 10:16:22', '2022-03-14 10:16:44'),
(21, -9223372036854775808, '4168812820', '12f27fb3f85f1b42d6aaa7c4566c597a05c4b6ac82505b7b4572322f7ef0a0ef', '1792085922198174485104838636429130651785766817522775470970980610', '0.41719858866004644', 11, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '1.24', '2022-03-14 10:16:44', '2022-03-14 10:17:06'),
(22, -9223372036854775808, '9874061418', '1e0ceb3764e0805976d1a63af2b194018004931dedce1e111516e502dcbbdd21', '0723802905797930982129626397105084478978072894473879389565037874', '0.10677051982075048', 2, '0.00', '0.00', 1, '0.01', 'completed', 'black', '0', '1.23', '2022-03-14 10:17:06', '2022-03-14 10:17:28'),
(23, -9223372036854775808, '9501202920', '85b65f9a2cf6c30fd1eae3d41395f25e8f6cd4556cf09c014c9bf60aadc268c5', '9587217282132824061451709055779239335596739867816426047617445382', '0.08913510248413203', 9, '0.00', '0.00', 1, '0.02', 'completed', 'danger', '0', '1.22', '2022-03-14 10:17:28', '2022-03-14 10:17:50'),
(24, -9223372036854775808, '7770450122', '21cacc9808b4f9da5f8126917f099a6074e891623cc47de822fb5a65e6072bb8', '1584799312898852628210266110456017893610252251041528830954092654', '0.7876665190906722', 6, '0.00', '0.00', 1, '0.01', 'completed', 'black', '0', '1.20', '2022-03-14 10:17:50', '2022-03-14 10:18:12'),
(25, -9223372036854775808, '2959901561', 'b8f59b3ba2d21cc2e69c095754defdf1d5aa77a2e31648b3d82e64fd13c50797', '4082584208919558684325628212461054812491685970722962356681816961', '0.959746354841575', 13, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '1.21', '2022-03-14 10:18:12', '2022-03-14 10:18:34'),
(26, -9223372036854775808, '2045692153', 'c318b65e2afdcad6c576d3bc7db6962c1cdbbf5eb6c67bc167a8fbb12a1e05e8', '7837617668817333046444928355974588185724394640490076012045104981', '0.994877430956101', 0, '0.00', '0.00', 1, '0.01', 'completed', 'green', '0', '1.22', '2022-03-14 10:18:34', '2022-03-14 10:18:56'),
(27, -9223372036854775808, '4874002974', 'a2b832cc7b75b61475a93d4c463bb417fdf93aa4274c030aa87bf1f614989edc', '6923337273612890053464358914863359433443809857240113521461749820', '0.5461645569050189', 0, '0.00', '0.00', 1, '0.02', 'completed', 'green', '0', '1.09', '2022-03-14 10:18:56', '2022-03-14 10:19:18'),
(28, -9223372036854775808, '9735395662', '4600b82896f5bcb174992ead94aaa2a0306e88a382c5f3d2517d8cb1ecd9f97a', '6402851763019772441737904762704071070285786424801434041078679698', '0.47054135186148427', 9, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '1.11', '2022-03-14 10:19:18', '2022-03-14 12:03:13'),
(29, -9223372036854775808, '2924210215', '3e3be870c1a86a8bbe0ab9c2cf9f15b0f07a20af22e9d6f694dbc5ed045d08e6', '3877056274997863982285524995815643566928658257226875430597138882', '0.3287825557924602', 0, '0.00', '0.00', 1, '0.05', 'completed', 'green', '0', '1.16', '2022-03-14 12:03:13', '2022-03-14 13:41:36'),
(30, -9223372036854775808, '9140872961', '8a1ecf01354bbc5c768dcc5f3e5b9cb98097125796fd8730208da139559c55d3', '7786092045834237261488712073663207622394753121147271911832220093', '0.9721818212267628', 1, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '1.21', '2022-03-14 13:41:36', '2022-03-14 13:53:43'),
(31, -9223372036854775808, '6867567533', '3cab8b6d4c1dedb828df177963bae7d41e0270107bcf3bc8d2a25bd47be7a77b', '3889704229516219854063388618137194744666155353997650374781576028', '0.6534904159054267', 14, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '1.26', '2022-03-14 13:53:43', '2022-03-14 14:57:59'),
(32, -9223372036854775808, '7497737180', '369ea2cbad28d8e150a1560c459a302347ee16fd70fd24d654b26ea91502e7ef', '7464555596360417928057275784788083528106011149068076586808551975', '0.5324322676560336', 7, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '1.31', '2022-03-14 14:57:59', '2022-03-14 14:58:43'),
(33, -9223372036854775808, '4885183786', 'a02a02ec6e120d38091cb0f65fb7d9b849eccc114fbb4e61a21ca1bac051fd38', '0019566114019631746662636876283157221286549585193258788807903687', '0.8211604542133626', 5, '0.00', '0.00', 1, '0.10', 'completed', 'danger', '0', '1.36', '2022-03-14 14:58:43', '2022-03-14 16:51:05'),
(34, -9223372036854775808, '3750391769', '270ccde5e1ec926a459004087983a4baa2382452c15f9aa4771b809a69ed3400', '8867997466296800936270860641275790476120113347938512009331573485', '0.2940511141449469', 5, '0.00', '0.00', 1, '0.10', 'completed', 'danger', '0', '1.36', '2022-03-14 16:51:05', '2022-03-14 16:52:11'),
(35, -9223372036854775808, '1983691823', '4f8dd683a445c7f324beae3d9c1d63ebf1d0af02f8393fcbb35419ca2ded3cd2', '7525736670059711350527707657493220963395989543085659028833284004', '0.43086366383426977', 10, '0.00', '0.00', 1, '0.20', 'completed', 'black', '0', '1.26', '2022-03-14 16:52:11', '2022-03-14 16:52:33'),
(36, -9223372036854775808, '0989248248', '77fadf4bc9be955c03a81b6ab0f1f0ea1bb41b5010a66cd9f6f09286798aeea5', '7782939249794972855389666961124225479240155998288591725926947037', '0.5253126832200203', 7, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '1.06', '2022-03-14 16:52:33', '2022-03-14 17:32:13'),
(37, -9223372036854775808, '4050641134', '0bf75a8f79cc86b2d7be205c9c4f3dc1b30e59ed8433aab79bcc68dfd48f72ac', '5479402139062959653127036548220391812061104595093947454208307452', '0.7213404519531812', 11, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '1.05', '2022-03-14 17:32:13', '2022-03-14 17:32:35'),
(38, -9223372036854775808, '0203549763', '908fed208ef9c130e3bbb44eccb138aa60d90b69320c4bbd76e7ce8d8ba545c3', '1154650413610207995407155982774963659989241533018641144319904070', '0.24147736004060483', 1, '0.00', '0.00', 1, '0.06', 'completed', 'danger', '0', '1.04', '2022-03-14 17:32:35', '2022-03-14 17:34:47'),
(39, -9223372036854775808, '4131115360', '98d31fe5e22b377b6df224321be9ac6923283a39a10d7976f98197d3b0d57b27', '4501629861041352759324124435089091166434693353436544820765541574', '0.5930777242653229', 8, '0.00', '0.00', 1, '0.20', 'completed', 'black', '0', '1.10', '2022-03-14 17:34:47', '2022-03-14 17:35:09'),
(40, -9223372036854775808, '0424788837', '583b3ad58c5d2bbc2fdf4eded32d8dd180a3e20a773b120005b2c7ddfbd6e3fe', '1395900153729068189217454495297696091028786127462427290638688372', '0.5242563945541701', 13, '0.00', '0.00', 1, '0.15', 'completed', 'danger', '0', '1.30', '2022-03-14 17:35:09', '2022-03-14 17:35:31'),
(41, -9223372036854775808, '5387273951', '09e62fb4216a7dfd7374a014ad5c9ae49b69a9adaf23574a5e711fa595033a51', '6751367609458087741414246656390881581577483157308852140009537737', '0.5565451862985618', 1, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '1.45', '2022-03-14 17:35:31', '2022-03-14 20:00:33'),
(42, -9223372036854775808, '8370608397', '68f8ee36ed43e396910af179e62284785c2d07a23751b47810b861971f632ca6', '3596052286436120847247247587713360947461317175609897927271678798', '0.061490477425669265', 14, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '1.40', '2022-03-14 20:00:33', '2022-03-14 20:00:55'),
(43, -9223372036854775808, '2642968859', '8763fdd0f6cfdb7b0dbe6f41123c8d5ed1e552b641167268197413d41e18b4e6', '0236408081220213484041910777996350616243411512670292161687735474', '0.2098096374058942', 5, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '1.45', '2022-03-14 20:00:55', '2022-03-14 20:01:17'),
(44, -9223372036854775808, '4002335942', 'e627b7f6b15ebe0568dd00dc55a12a9518659c6b1f567a971e39fade0e346d21', '6349098300981200176926371205394814904569348020314111309882421620', '0.9905558225219848', 8, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '1.50', '2022-03-14 20:01:17', '2022-03-14 20:01:39'),
(45, -9223372036854775808, '4312152261', '659dbf648465d7a4e7e9382853c86e315f3516dfadad1f3e1585b93013efcdfb', '4608890274874119935054172570928633801606759625707934795852441159', '0.5927794176741972', 9, '0.00', '0.00', 1, '0.10', 'completed', 'danger', '0', '1.55', '2022-03-14 20:01:39', '2022-03-14 20:02:01'),
(46, -9223372036854775808, '3934420311', '83596c98efd58d284a20d6f8dc49c28949eebda46bb954e814cba8cbf3cac1db', '8864433560304798563785641255165125904334349000415284287264939001', '0.12835681925696352', 0, '0.00', '0.00', 1, '0.05', 'completed', 'green', '0', '1.65', '2022-03-14 20:02:02', '2022-03-14 20:02:24'),
(47, -9223372036854775808, '3262384861', '991805222d8107ec299b6707509c43511173c67caab6e7381f575ab8cf5c4c0b', '6385065796340455197474388666446138920356321439129040052174473897', '0.5451699373301764', 6, '0.00', '0.00', 1, '0.10', 'completed', 'black', '0', '1.70', '2022-03-14 20:02:24', '2022-03-14 20:02:46'),
(48, -9223372036854775808, '9642688391', 'e4345f01c2a49d85252b3c988fb3e69dcc6286d6ae80044b342e0c5080d8093e', '1143159741734888987466181751081519518911086988940896681708215370', '0.7399270602697068', 1, '0.00', '0.00', 1, '0.10', 'completed', 'danger', '0', '1.80', '2022-03-14 20:02:46', '2022-03-14 20:03:08'),
(49, -9223372036854775808, '5963329657', '4f66be8a41dba263721213b8e78e4f35fdbabc6925319a65ab4589b7cd9c5c90', '2122663260905860182523683358257033028964192679271448153261992806', '0.34801446508525724', 14, '0.00', '0.00', 1, '0.20', 'completed', 'black', '0', '1.70', '2022-03-14 20:03:08', '2022-03-14 20:03:30'),
(50, -9223372036854775808, '3832652389', '469e371aae37dcb00554b86d7dfaca01389405e1870fcff9533baa1fe43ebc2f', '9803166796815358594097051716161565309532901992787168577054276820', '0.06171724158486391', 9, '0.00', '0.00', 1, '0.15', 'completed', 'danger', '0', '1.50', '2022-03-14 20:03:30', '2022-03-14 20:03:52'),
(51, -9223372036854775808, '5201057793', 'e041c35188fd2396b112977405f0302fcc9d260fc38e779e8efd7ea40b663aff', '2294169501178814555419807896434182864426441510192793276636329802', '0.36850332987894663', 10, '0.00', '0.00', 1, '0.15', 'completed', 'black', '0', '1.35', '2022-03-14 20:03:52', '2022-03-14 20:04:14'),
(52, -9223372036854775808, '5732105100', '3caa7a4a67e0688b481c7a878880533fd98d96741e746d7bb963e4c8b4251a8a', '1288654573119402195189811309795577189969359535375545207356008024', '0.9286819105603998', 6, '0.00', '0.00', 1, '0.30', 'completed', 'black', '0', '1.50', '2022-03-14 20:04:14', '2022-03-14 20:04:36'),
(53, -9223372036854775808, '1832470451', '4d27cb8a5a6c4a46cd072496443745da6b91458d9b470e409a0b65d74b9c3414', '0581389662855296868340080892284559010451082471250558292525471146', '0.7536019179286975', 7, '0.00', '0.00', 1, '0.15', 'completed', 'danger', '0', '1.80', '2022-03-14 20:04:36', '2022-03-14 20:04:58'),
(54, -9223372036854775808, '7152999799', '7796f30571f6cce584102058b95ba351e4b4eb9522368e0803874d1755d3c357', '2949670415935591089484011149984810715137111185793457972230489874', '0.9051674069126285', 7, '0.00', '0.00', 1, '0.25', 'completed', 'danger', '0', '1.65', '2022-03-14 20:04:58', '2022-03-14 20:05:20'),
(55, -9223372036854775808, '8885837681', '1b77660259f79bd6b4a9c5af03ead43582ba5e6b0eb3ca74d95e49d9d34e8ff6', '0878293397064126579667703754487061185890466263171316918097312647', '0.011519811557836768', 10, '0.00', '0.00', 1, '0.20', 'completed', 'black', '0', '1.40', '2022-03-14 20:05:20', '2022-03-14 20:05:42'),
(56, -9223372036854775808, '3649061369', '4e7c58839795b763486814efa78d3e366b7015997883e4ab341b7fd8ab9b5a57', '4209151694665333339849205146188305722924673288487325263892465565', '0.020093980137842804', 1, '0.00', '0.00', 1, '0.15', 'completed', 'danger', '0', '1.30', '2022-03-14 20:05:42', '2022-03-14 20:06:04'),
(57, -9223372036854775808, '3594632090', '7bdcd1aef21fd9cf48b920a5d58b3c360c6f11951be3b5ecd3325774e111bac5', '4543324336618055374505020910781133611511474589645802129596341953', '0.7860381204043851', 6, '0.00', '0.00', 1, '0.25', 'completed', 'black', '0', '1.45', '2022-03-14 20:06:04', '2022-03-14 20:06:26'),
(58, -9223372036854775808, '8191654852', 'dc2f9d3443b4bb992165de40326d134fea9871bea5ba64967d094db96b78fc30', '2242810261704241295781876352023514282377907946970481524183705251', '0.8175450299172271', 11, '0.00', '0.00', 1, '0.35', 'completed', 'danger', '0', '1.30', '2022-03-14 20:06:26', '2022-03-14 20:06:48'),
(59, -9223372036854775808, '6433519466', '24256af9b0f8a7180bcd5ceab7eef97f74a158a79c23c902e1d97ac70cdb0ee1', '6241679875855904193972416744352239075176911663470841460241820116', '0.5631904326890325', 8, '0.00', '0.00', 1, '0.15', 'completed', 'black', '0', '1.05', '2022-03-14 20:06:48', '2022-03-14 20:07:10'),
(60, -9223372036854775808, '5928386824', 'df3b81696aeaf32f5233098534cb2e4b897e2caee3de98c828ef2d70cdf44427', '5804395130119778496355643009680578511018326104141165243619050743', '0.9525704554864458', 6, '0.00', '0.00', 1, '0.45', 'completed', 'black', '0', '1.20', '2022-03-14 20:07:10', '2022-03-14 20:07:32'),
(61, -9223372036854775808, '1053162411', '9aab00959bdb9bbc569932d12177d7a502f50ad87413190abcafc1382d674207', '6799850826301092678553027850706840526587097857662799668556611846', '0.10754595044666093', 9, '0.00', '0.00', 1, '0.30', 'completed', 'danger', '0', '1.65', '2022-03-14 20:07:32', '2022-03-14 20:07:54'),
(62, -9223372036854775808, '0276714480', '1322b7561e21fe59d6c41eea7d28bdc25d0522fbb6b1999809fed70a404757a0', '8485509676146846524193284535096369095976027476761230875000322537', '0.07906038904135837', 7, '0.00', '0.00', 1, '0.15', 'completed', 'danger', '0', '1.45', '2022-03-14 20:07:54', '2022-03-14 20:08:16'),
(63, -9223372036854775808, '8805628034', '971909b602b56230f4d53dcf803e1b4dac227d2b5754b09693fee4dd76f66c68', '9707382330182913207194531423939913363724507273270576715038379508', '0.7847749591285205', 7, '0.00', '0.00', 1, '0.20', 'completed', 'danger', '0', '1.40', '2022-03-14 20:08:16', '2022-03-14 20:08:38'),
(64, -9223372036854775808, '0885212867', '613a95e5257248ee7a1d9234d1eb45362aac657f55d06f36df3e965bd711a597', '0437722950247435788188242199850399091734821781128749725121276029', '0.6505536203537463', 8, '0.00', '0.00', 1, '0.30', 'completed', 'black', '0', '1.60', '2022-03-14 20:08:38', '2022-03-14 20:09:00'),
(65, -9223372036854775808, '9167968891', 'b7030682e0fb1ad317ba920e6372f8b9efbca773c9c0ab032365c43186ae218a', '9636114463438596897294077482445378026565105061592946740530031416', '0.7532923236463231', 7, '0.00', '0.00', 1, '0.15', 'completed', 'danger', '0', '1.40', '2022-03-14 20:09:00', '2022-03-14 20:09:23'),
(66, -9223372036854775808, '5273214384', 'c7efec99724c79b6baa39656563508899184448a2aebb49265f48f4c9362ed48', '4959380001264496492064317147573188476307695422220589306447393693', '0.7101693726928877', 2, '0.00', '0.00', 1, '0.30', 'completed', 'black', '0', '1.55', '2022-03-14 20:09:23', '2022-03-14 20:09:45'),
(67, -9223372036854775808, '8198557386', 'f64d936999302f6485299bd6b7d3718e2677fc9149eccb877b916f4d693c3ee2', '1324713879496497344306307129864978443340377133851683023051893059', '0.9119678660631549', 5, '0.00', '0.00', 1, '0.30', 'completed', 'danger', '0', '1.35', '2022-03-14 20:09:45', '2022-03-14 20:10:07'),
(68, -9223372036854775808, '7313897679', '9ef3677be65eaab75d00a028f335c78c8fe449de68cd34edd9d855d0bb9dd5bc', '9757346319702393027856779035280914411793766447929212118430125487', '0.3013485806150946', 12, '0.00', '0.00', 1, '0.35', 'completed', 'black', '0', '1.15', '2022-03-14 20:10:07', '2022-03-14 20:10:29'),
(69, -9223372036854775808, '4868363786', '082ab884076365ba793f68a73d276c488c8882d852681b15b5da49b7c10776cd', '4545672915605502203578303896225839994721528350544575550809909873', '0.6886445272350503', 6, '0.00', '0.00', 1, '0.35', 'completed', 'black', '0', '1.50', '2022-03-14 20:10:29', '2022-03-14 20:10:51'),
(70, -9223372036854775808, '4355178867', 'c2a9db0d78d6cc4977205ec2fa4dc56978eec7efcebda20be20678da1972d742', '9664702286613911559003396754756093626646070854031289482996686307', '0.40988085243000505', 10, '0.00', '0.00', 1, '0.10', 'completed', 'black', '0', '1.85', '2022-03-14 20:10:51', '2022-03-14 20:11:13'),
(71, -9223372036854775808, '7474154537', 'b52dd2385a97deb0f302673b61bba381cd0c0ea7901bc692261241d97d5ff6b7', '9564293837682976859025449233275338369491212879219862929740124701', '0.8471647195646939', 12, '0.00', '0.00', 1, '0.01', 'completed', 'black', '0', '1.95', '2022-03-14 20:11:13', '2022-03-15 04:36:01'),
(72, -9223372036854775808, '8706773553', '1aaddee8ead08e1e012b2c2dc1b649834799120eb5479c879afcecde2c9c46b3', '8339623871950097811388258828780960698620523298297747053479801134', '0.6975085868589856', 8, '0.00', '0.00', 1, '0.01', 'completed', 'black', '0', '1.96', '2022-03-15 04:36:01', '2022-03-15 09:24:13'),
(73, -9223372036854775808, '9526198217', '3e047ad1849f6d858c0216eb44cbcd2246932f836f4670016b3e5bfa0c5d0237', '3151462791722400380166950007679154031637223819970010530792200190', '0.16771670057010368', 7, '0.00', '0.00', 1, '0.02', 'completed', 'danger', '0', '1.97', '2022-03-15 09:24:13', '2022-03-15 09:24:35'),
(74, -9223372036854775808, '0954030208', 'f6ed2c096ceb04e53b13d154a1640461ec387fc6e75ca809ee3ca2cb05ccaf1c', '5819558710094965429722916271020966205067741415484865408613824483', '0.8504144480789007', 11, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '1.95', '2022-03-15 09:24:35', '2022-03-15 09:24:57'),
(75, -9223372036854775808, '9592459145', '1c8e4f879ba622884b094e8f8a358540de9dee3b4e5fd119371ff0837b8a190e', '7943401225423804124419323803560164570321407359993667381788984499', '0.6512220190416877', 9, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '1.96', '2022-03-15 09:24:57', '2022-03-15 09:25:19'),
(76, -9223372036854775808, '2401071669', '57ba8bfeec198322adbb46525ac0dde733c49358f47636a2e1645ea54d0b0ef4', '3485433335512906995273199895721070013064951862387100904170211024', '0.23523852805058199', 6, '0.00', '0.00', 1, '0.02', 'completed', 'black', '0', '1.97', '2022-03-15 09:25:19', '2022-03-15 09:25:41'),
(77, -9223372036854775808, '7789059648', '126ac17ff3695f9513e14c827092216e5b00930fad26ee53f7400b47746cfb32', '4163274020070031916456037695541568581068902253854052966178000801', '0.1886016882417123', 9, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '1.95', '2022-03-15 09:25:41', '2022-03-15 09:26:03'),
(78, -9223372036854775808, '6960381183', '4f5b874bb1d89ab752f711909716b8421cfeace7c7872849d27476e7d720a29a', '6400011495902756895188490553024965287973703941331681274709556040', '0.9496515824533287', 5, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '1.96', '2022-03-15 09:26:03', '2022-03-15 09:26:25'),
(79, -9223372036854775808, '1659855758', '7e352153acdc383607ec58ac882593fd6ce2502a8850ffd37b02d5774425ba3b', '5557633769891755583744965688688482968241342217584973534707461405', '0.4473592028298381', 10, '0.00', '0.00', 1, '0.01', 'completed', 'black', '0', '1.97', '2022-03-15 09:26:25', '2022-03-15 09:26:47'),
(80, -9223372036854775808, '4918806219', '7460c9df234838ae32b4eb891de26bca33d93d002341d7323ce8db5c771d0109', '2214996874140305013013763927054534859997247530217751091168800084', '0.9185539446913391', 6, '0.00', '0.00', 1, '0.01', 'completed', 'black', '0', '1.98', '2022-03-15 09:26:47', '2022-03-15 09:27:09'),
(81, -9223372036854775808, '1311118155', '6aef8c25e28200d861d4c4d7e0695a5192d35230728a94dc8f1e45e426b7d04f', '4345714306117922299012553812048592169598634983193462474481911836', '0.8619700671937711', 12, '0.00', '0.00', 1, '0.01', 'completed', 'black', '0', '1.99', '2022-03-15 09:27:09', '2022-03-15 09:27:31'),
(82, -9223372036854775808, '5773255796', 'b5d8821c56259760323e313c6714be5b5a0f9d68a4d45b8329b3b473a2811049', '8202662514910358396510534577514052163406044893322053901675227228', '0.014703293090637226', 0, '0.00', '0.00', 1, '0.01', 'completed', 'green', '0', '2.00', '2022-03-15 09:27:31', '2022-03-15 09:27:53'),
(83, -9223372036854775808, '4880692219', 'b390b3686276088c3d74d39c33239d0d847575a5c2f305d0253b24814054611a', '8049611489663067952145874142828082859326064100137006823093082650', '0.787335000722228', 6, '0.00', '0.00', 1, '0.01', 'completed', 'black', '0', '1.87', '2022-03-15 09:27:53', '2022-03-15 09:28:15'),
(84, -9223372036854775808, '1794789599', '0acae121f128db24d1a986c34b5e68d4043a6a3cf84ab4cadc0469dbeaf00abf', '6071902436108555774315382282449152334603465806280413314030713299', '0.4504765535306863', 5, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '1.86', '2022-03-15 09:28:15', '2022-03-15 09:28:37'),
(85, -9223372036854775808, '8992118033', '05bdb55be9e57efbf533757d725223fc1a3aa4b9a47a855bd64df73b3f89f42c', '0164855376436082348687712401997786722878146621560073417195811459', '0.06962332390621562', 1, '0.00', '0.00', 1, '0.10', 'completed', 'danger', '0', '1.85', '2022-03-15 09:28:37', '2022-03-15 14:29:14'),
(86, -9223372036854775808, '2867985069', '3b812063fa283a2125a4161df9fb2a498b70bd8362183a4ec981bb2cc7eb7baa', '3366601783785860388470043366729351580504980343760273505659432296', '0.8511225717862687', 4, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '1.85', '2022-03-15 14:29:14', '2022-03-15 14:44:17'),
(87, -9223372036854775808, '1535631414', 'c6a2a075859df0a26dd545d889df1079d6cbbef407ddf00a70d6198ae19b313b', '5786956407603145273706957785697238479717890172786719259707231204', '0.7259482248248614', 7, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '1.80', '2022-03-15 14:44:17', '2022-03-15 14:44:39'),
(88, -9223372036854775808, '7694561193', 'eb2a3b7716ec27bca900e3b8ac00cf0ee043faaef5af743ccd70e48ec8bce580', '1836344569147351762560132049000508683203180021846053282102230140', '0.7895408977504059', 5, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '1.85', '2022-03-15 14:44:39', '2022-03-15 14:45:01'),
(89, -9223372036854775808, '9015320154', '7101dd4bf1f8b261fb75ab066166c756df45ce24d8757a50a231bf2c9bc6d589', '4882359583048144037267526666880641682474472900377911105845190658', '0.18866101442401706', 5, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '1.90', '2022-03-15 14:45:01', '2022-03-15 14:45:23'),
(90, -9223372036854775808, '7604964414', 'f09a3bf877559500cdc21b362f41f4931f924af55542a21cde107bbe06f7fa95', '9971873286976280970236459995692860511056756285618818228561490204', '0.3548909804679441', 11, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '1.95', '2022-03-15 14:45:23', '2022-03-15 14:45:45'),
(91, -9223372036854775808, '5714637321', '164ebb4b9782893f15a9bbc9c91db5474084c75c162068af52c76d0c28aef1e7', '8386519726863341437620821414746577354500188575510449450778730334', '0.30555703243646515', 2, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '2.00', '2022-03-15 14:45:45', '2022-03-15 14:46:07'),
(92, -9223372036854775808, '1760032024', '716d90ad75e787321917525ab0c6a3524073c4210426298b2bd61d55f1a683f3', '8543697490773108890161060760882605684348116648339927983113074176', '0.34646426403657227', 14, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '2.05', '2022-03-15 14:46:07', '2022-03-15 14:46:29'),
(93, -9223372036854775808, '1285922461', '0185472a68b78c8d0dbdf7efbc52a80c5c4e742935eb550045c35727474dffea', '4140850841742697245122836350965448549249857772673724651628497878', '0.11010846996592982', 7, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '2.10', '2022-03-15 14:46:29', '2022-03-15 16:28:55'),
(94, -9223372036854775808, '5962750291', '6009b75bd1a3c4dec75f8328a5d546776ef50dd3f0ce93a2ecec234ab13498ad', '3289066629664480830470226646157954558002508500429115425608886960', '0.910923986797197', 4, '0.00', '0.00', 1, '0.01', 'completed', 'black', '0', '2.09', '2022-03-15 16:28:55', '2022-03-15 16:29:18'),
(95, -9223372036854775808, '8291322891', '64f8594311fb17e8f33a342dedbb7c95d657a8435e7b6061574c61d509642af6', '2685268227254750548739206750135259486415103012324649032784813866', '0.4141608464695443', 9, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '2.08', '2022-03-15 16:29:18', '2022-03-15 16:29:40'),
(96, -9223372036854775808, '0958075203', '0c95c5b397ba0c2e55a60d3d73c0d603f298a92bcdaa830c066b2af93eb59add', '2124590716311194304113818997076751146364675703036109980245487336', '0.30507667806087735', 12, '0.00', '0.00', 1, '0.01', 'completed', 'black', '0', '2.09', '2022-03-15 16:29:40', '2022-03-15 16:34:48'),
(97, -9223372036854775808, '1510034449', '343626d88b850132f3f39d6f313ce89fc76755862d96dc74926434dcfcb1ff4e', '0026547067689063740655616919915554170486280868847666613582568989', '0.6572820737911762', 0, '0.00', '0.00', 1, '0.05', 'completed', 'green', '0', '2.10', '2022-03-15 16:34:48', '2022-03-15 17:36:51'),
(98, -9223372036854775808, '4837344288', 'b4c161afef48354c4c0cf2653b61fb4e2a533d26d441a967d7185c89d5383b5d', '4775058482655068495125875596608269807082529284811221097458531378', '0.9593087493064822', 0, '0.00', '0.00', 1, '0.05', 'completed', 'green', '0', '2.15', '2022-03-15 17:36:51', '2022-03-15 17:37:13'),
(99, -9223372036854775808, '6450246312', 'd4fde968cba745dac189128e447d1068530fefc188f4ad9219d1ddcc17fe0805', '7010877630435876434938234090511567102495786853416494602116751844', '0.2859939457878531', 7, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '2.20', '2022-03-15 17:37:13', '2022-03-15 17:37:35'),
(100, -9223372036854775808, '9585597699', '3ae3ebf33b2b66508ab2c37291ab282ae8f378cc53de41b04e227057dc1d3415', '7583666815924163359722508085957351709658410381138706668226195555', '0.3882825935669141', 13, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '2.25', '2022-03-15 17:37:35', '2022-03-15 17:37:57'),
(101, -9223372036854775808, '4928891906', '9e7af2302eef4257c671a1ba2b2d7961cc1b09a8efc608a2796f84a79a92abb7', '8908001085488811835414125871960765744026540223231241141779184900', '0.17654468659889044', 0, '0.00', '0.00', 1, '0.01', 'completed', 'green', '0', '2.30', '2022-03-15 17:37:57', '2022-03-15 20:06:15'),
(102, -9223372036854775808, '5009053017', 'af0e2b418213fe6b87ecba6320fcddcb04030b3779f8fc194ad72dd78580d36e', '5834113737887629708805364201061188254183133634304644561097823580', '0.7571492746959787', 12, '0.00', '0.00', 1, '0.02', 'completed', 'black', '0', '2.31', '2022-03-15 20:06:15', '2022-03-15 20:06:59'),
(103, -9223372036854775808, '0442060803', '3f3651a709003497ed0562fd9a4a8a1035b3228dddc9f19917f72bb00e9a94f7', '5595878426083325752053250516395023919509062865458216152022114318', '0.41503356707241923', 5, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '2.33', '2022-03-15 20:06:59', '2022-03-16 04:23:18'),
(104, -9223372036854775808, '2642063123', '82d0bb58df9e017f4112ef8ea44d9e0c47d9f4510d70c75603e4ed1c01a0a0e8', '1396261173450793503065025481339575255245577601588245446329426292', '0.657576133763556', 13, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '2.32', '2022-03-16 04:23:18', '2022-03-16 08:57:53'),
(105, -9223372036854775808, '2246983507', 'ef0001e39be3ee0db476144322b3c44aaaff2d38192a236df1f9bdb74ba02826', '8610110674970090280025231249498684132562693382306520452297864569', '0.7190561242096487', 2, '0.00', '0.00', 1, '0.01', 'completed', 'black', '0', '2.33', '2022-03-16 08:57:53', '2022-03-16 08:58:15'),
(106, -9223372036854775808, '6682402117', '85b939daef66682f65c3301ebf66d353ca156385246a476c55b5993d10109fe5', '5509878528309886132323560180760614560221714581386669645473261634', '0.6612607888642477', 8, '0.00', '0.00', 1, '0.01', 'completed', 'black', '0', '2.34', '2022-03-16 08:58:15', '2022-03-16 08:58:37'),
(107, -9223372036854775808, '5038132745', 'fed9e110399f8c8326a7fe7a5c5bce967b91925ace1d66c11e2a642aeb8e16b0', '4459855740949734666845073696862169096295148657384035512904095649', '0.5869041904948009', 7, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '2.35', '2022-03-16 08:58:37', '2022-03-16 08:58:59'),
(108, -9223372036854775808, '3126379600', '7a52ff582780279347338d6669150b093f100940fa69421da3291f57e223e323', '6460487693841978757610416870757250864246465558913225078564043287', '0.29093978801040987', 7, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '2.36', '2022-03-16 08:58:59', '2022-03-16 08:59:21'),
(109, -9223372036854775808, '3497363654', '5f3366063272860ad8a9deaf05626046d2376cd379026dfaba0b8a56d6c3920e', '1561341713358525489773339768109492260231517714326421603693967435', '0.0175684977820596', 14, '0.00', '0.00', 1, '0.01', 'completed', 'black', '0', '2.37', '2022-03-16 08:59:21', '2022-03-16 08:59:43'),
(110, -9223372036854775808, '2324632668', 'da0382149edca8d8768ec5bf6d67063b10c5c1c38394796b2d148478188ff1d8', '2655974948026081312199764176077441889642585853099326423591310169', '0.05766628410694752', 11, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '2.38', '2022-03-16 08:59:43', '2022-03-16 09:00:05'),
(111, -9223372036854775808, '1719659487', '2c253ea4a8299139d2dd8fa26dcc8594f97161d20acc0a4f2998391858ef25e4', '3506764450131402002376396832826903226268679616957185915536351996', '0.8312947161194557', 7, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '2.39', '2022-03-16 09:00:05', '2022-03-16 09:00:27'),
(112, -9223372036854775808, '0610130312', '6a26d9de43026b7fca962c202a09bd8668b5021783be12cb9f57893c27e33929', '4395181508580538650288982351735586406752326014648089974493176027', '0.9960475856747559', 13, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '2.40', '2022-03-16 09:00:27', '2022-03-16 09:01:11'),
(113, -9223372036854775808, '7004444423', 'fefe14606fbae314c494d4a0cf2f51a4fc12a04d06305f5f85466c246de0b29c', '2775685006330750996990502500876577627346643507348964707233849780', '0.6458829136965445', 9, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '2.41', '2022-03-16 09:01:11', '2022-03-16 09:01:33'),
(114, -9223372036854775808, '2820274357', '883177046a6eb01b6c390b68b497c4afed2060083ed90b99b7d8851458b5f44d', '1958040909139576594799502790177747610794460848733899063670294029', '0.3939916066585498', 8, '0.00', '0.00', 1, '0.01', 'completed', 'black', '0', '2.42', '2022-03-16 09:01:33', '2022-03-16 09:01:55'),
(115, -9223372036854775808, '1070470166', '5ad67b7c61c5b2346deb45b73379b81a843ebf7b15d7231a66f48dba09b3277b', '6481257981309640343239023072178590568910423459835800859645867197', '0.5802707808185299', 11, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '2.43', '2022-03-16 09:01:55', '2022-03-16 09:02:17'),
(116, -9223372036854775808, '6661191495', '6fc024b7fa023324a07cccc1886830d77a798da0e3ccfae49ee4362498c504a7', '5497640840745851783623173182292273470578452041076518442274959265', '0.9264613409447493', 12, '0.00', '0.00', 1, '0.01', 'completed', 'black', '0', '2.44', '2022-03-16 09:02:17', '2022-03-16 09:02:39'),
(117, -9223372036854775808, '9097192610', 'e0dfebcce085ca95b447bf8a42f83b48720ed25ee26f0823da96dd1d9a2880f6', '7944413478360754283893410919928906438349419408969320702082338550', '0.27965824458043453', 1, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '2.45', '2022-03-16 09:02:39', '2022-03-16 09:03:01'),
(118, -9223372036854775808, '6401111960', 'da49aa5f931f2ddd0d3f5c8d44170f9e9194e687956a89c7fa68e37a323d7d22', '1453189815659964708137500206745531077507708492069575907423028133', '0.02244150931819311', 1, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '2.46', '2022-03-16 09:03:01', '2022-03-16 09:03:23'),
(119, -9223372036854775808, '7782084138', 'd12cd390594fabad094dea9e602b67c851c819fecc65d432cbbd426562af799d', '1238097559093662397335708354563711385379253210273799867708850757', '0.6517835082175574', 8, '0.00', '0.00', 1, '0.01', 'completed', 'black', '0', '2.47', '2022-03-16 09:03:23', '2022-03-16 09:03:45'),
(120, -9223372036854775808, '2438300458', '9871ae6a99970e0bcf9e83fe76100714ff0bc028ab2250ba9cc33dfc2ee46fdb', '7104570687329143763711399866498135637867052995390330994288707444', '0.2290791465290134', 5, '0.00', '0.00', 1, '0.01', 'completed', 'danger', '0', '2.48', '2022-03-16 09:03:45', '2022-03-16 09:04:29'),
(121, -9223372036854775808, '6615226305', '80c57561582a2f2a5fc5b51299cbcb30b827b16e15e23e98f76ab61d1aa44cb4', '8846451622222286009188318905052434204552260031925333531585059996', '0.576382818522265', 14, '0.00', '0.00', 1, '0.01', 'completed', 'black', '0', '2.49', '2022-03-16 09:04:29', '2022-03-16 09:04:51'),
(122, -9223372036854775808, '1352313735', 'a7f7968d72a70c5fe56f2ca3148f0c09b912dac5f580b6ad15d092d925e53eef', '3904400508390622389046728648987249098470285420194685811715961466', '0.4826284663187601', 0, '0.00', '0.00', 1, '0.01', 'completed', 'green', '0', '2.50', '2022-03-16 09:04:51', '2022-03-16 09:05:13'),
(123, -9223372036854775808, '9837752502', 'a588ac5486fb0b39f453d563c02866ec4d6c37b26e8cfc19910bcaf86a80f3c2', '6635282999287519087628740652581311218416340462878737248084171437', '0.6092092547016217', 2, '0.00', '0.00', 1, '0.01', 'completed', 'black', '0', '2.37', '2022-03-16 09:05:13', '2022-03-16 09:05:35'),
(124, -9223372036854775808, '2221454258', '755f2eabd993753f6d6535e43e0b346bbb1ddc3df5da4f6310c92a0095c2a9ea', '7788651793142816449664026429701658371549257181944977013420698662', '0.6722302388903796', 9, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '2.38', '2022-03-16 09:05:35', '2022-03-16 13:12:43'),
(125, -9223372036854775808, '6732166863', 'e478f058211b7cedff75216c96af8253b8d2c987b79a9b87b4d580ab2b03ed0d', '0841909948550997016857013063914548260034192441208745233063162342', '0.3468356653593172', 1, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '2.43', '2022-03-16 13:12:43', '2022-03-16 13:13:05'),
(126, -9223372036854775808, '2245587473', 'a4fe1d986c6d9d5c5c790c48d31cb342c70baa33b3d82dcdf2c66c9c423daa66', '9287898552798913521369834794144447582588570891510761569658792727', '0.3416013233664843', 14, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '2.48', '2022-03-16 13:13:05', '2022-03-16 13:13:50'),
(127, -9223372036854775808, '7638996321', '86cb944701e05da3a3e9539a629369f50fd82773242db561e501097923d84bef', '0884128176294859734881645831668380078843532168467895391611074291', '0.7315949962855888', 1, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '2.43', '2022-03-16 13:13:50', '2022-03-16 13:14:12'),
(128, -9223372036854775808, '9126848793', '0d8eef338cb9ead78d6e12c15e9e15a5ebfbec7ce01c752c983db9424b630719', '1087715431243175927424422811266048634955703572926416306562452680', '0.7099352666507563', 10, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '2.48', '2022-03-16 13:14:12', '2022-03-16 13:14:34'),
(129, -9223372036854775808, '2421077467', '9ae9216dc38387bb55bba3f149494e39955d7a9650df0eb3a2f67d5c6c8d03f2', '3549686563542743663864676987606763328014086236087550418526793077', '0.47424990942957157', 4, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '2.53', '2022-03-16 13:14:34', '2022-03-16 13:14:56'),
(130, -9223372036854775808, '2627634079', '2daa7067839043a355f863894b75b19bb96954f8bafe002e466a6550e8f71b48', '3134426386753296446601787306741317054471203954718449963296875466', '0.09344243103713024', 10, '0.00', '0.00', 1, '0.10', 'completed', 'black', '0', '2.58', '2022-03-16 13:14:56', '2022-03-16 13:15:18'),
(131, -9223372036854775808, '1843361690', '1241e4374f3c24a5e4232d6165c5051fd3c2d5b48119122f3bebd3a29a61101d', '0563219967579862161235993562674713561864347228530218634987962287', '0.8322932927541775', 6, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '2.68', '2022-03-16 13:15:18', '2022-03-16 13:15:40'),
(132, -9223372036854775808, '6008019860', 'd67cf86ddf5367decd54d072035e594102030143d677eefb7c192c467154d505', '1851261235797862342325701712548005869942532384275312981016947152', '0.1799286064455372', 5, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '2.63', '2022-03-16 13:15:40', '2022-03-16 13:16:02'),
(133, -9223372036854775808, '0373467714', '3e7254e44d13797030c5c7f85042a4b194f9c126731f01e98a7ad5bd20ef6885', '9398301571458264519174191991324091561225294918120215269991112201', '0.18822235429191858', 8, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '2.58', '2022-03-16 13:16:02', '2022-03-16 13:16:24'),
(134, -9223372036854775808, '6376773780', '19539d4070f17643655a6a783517696e43fe4b1ae26f7995ec1ae36ff92035aa', '4525356031215358225065850809150150666526705744690864854933358536', '0.27292871389962814', 14, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '2.63', '2022-03-16 13:16:24', '2022-03-16 13:18:36'),
(135, -9223372036854775808, '4589044816', '0e0182ba4b89b1243820d3623c6e837e97249d3ede3c34a31d81be0551a7cbd2', '5648242159510813298982256446161403110490787042338861221494845227', '0.646516951228344', 1, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '2.58', '2022-03-16 13:18:36', '2022-03-16 16:54:30'),
(136, -9223372036854775808, '7242350840', '79813dc034a5b5d84aedb3c13f021d7f28a34e5aeb4c06d367886d10c626eda4', '2558153358707266516970553545053854046472680595251002481566729100', '0.18410444569264683', 8, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '2.53', '2022-03-16 16:54:30', '2022-03-16 16:54:52'),
(137, -9223372036854775808, '3129490191', 'a43cbaca99193d528a9698a2bbe4134101fb99a34ab247d3aac97946624e7fbc', '2520247355819384341835890853996935870541005981941781674976767379', '0.5780225302099549', 12, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '2.58', '2022-03-16 16:54:52', '2022-03-16 16:55:14'),
(138, -9223372036854775808, '8162621263', '4b4ac81961edd440508f95476bdd3af8f683643ac960e808e2f36bee93c245d4', '0553506483574945262627029607263396327016268597539435957585760542', '0.3663369171099804', 14, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '2.63', '2022-03-16 16:55:14', '2022-03-16 16:55:36'),
(139, -9223372036854775808, '6052102336', 'effe46e4a0bef9fc4e6d8ef25cc53005a2a6f684f3b1673fa63126a0ba97233c', '0568279581022099843546276157631323022094163604575791312349717840', '0.32795142708428937', 11, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '2.68', '2022-03-16 16:55:36', '2022-03-16 16:55:58'),
(140, -9223372036854775808, '6137560710', '8045b9f4332473744f76476f5d3a24907d2b34366e0a893b1b8a1b18842626c5', '9453690008482695123079701501307264836015195824766254519584253549', '0.3951412471010023', 11, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '2.63', '2022-03-16 16:55:58', '2022-03-16 16:59:38'),
(141, -9223372036854775808, '6843288602', '1e0676cebbf970859a6542efef2ddd6890280175d5c19c72d941b8592d43c5b4', '8520854530424010205184359940317016506054999237423328847676638740', '0.24503822662593744', 0, '0.00', '0.00', 1, '0.05', 'completed', 'green', '0', '2.58', '2022-03-16 16:59:38', '2022-03-16 17:00:00'),
(142, -9223372036854775808, '4147138418', 'dbf8e3a39d153b613df80baae89bc3fbfa078bbedac83062aace09eb73d85e6a', '5800157704423920400303030442168004606994159185569883998104772014', '0.5722056796783974', 2, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '2.63', '2022-03-16 17:00:00', '2022-03-16 17:00:22'),
(143, -9223372036854775808, '2237276255', '76749e563aae3403a1f5aff2183d515ebb579f348de54a6fa17ed0fcc3a3432f', '1568201811683994241184957434329258824409833968661831022991510082', '0.0941952033183755', 13, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '2.68', '2022-03-16 17:00:22', '2022-03-16 17:20:12'),
(144, -9223372036854775808, '2316230418', 'bead2aae5f4963c94c9d44745b97a3e5a2de9e9d00ba8bfc787a3a97d9d59200', '9901692226327363328308364732855379174796939673753343860970434203', '0.20782017333244096', 9, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '2.63', '2022-03-16 17:20:12', '2022-03-16 17:22:24'),
(145, -9223372036854775808, '7308074735', '5053872b22c0f07aa244fe3bb5faf6b8a43c626f50c79a18726349a2d503cc1c', '5091983718427943306948747904677515649328008113095808550632498565', '0.40778092715256076', 11, '0.00', '0.00', 1, '0.10', 'completed', 'danger', '0', '2.58', '2022-03-16 17:22:24', '2022-03-16 17:26:04'),
(146, -9223372036854775808, '2308878287', '92cdeb6619ea99c79925af9a34ecf18993127c8010ed236a5db7b8fbefdafc59', '3109204411289981174384162241688568802463501718121211314122986577', '0.5105634278906033', 13, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '2.58', '2022-03-16 17:26:04', '2022-03-16 17:26:26'),
(147, -9223372036854775808, '8315633153', 'f059a4a3aa1bd72d2d882570de6e276c7ab08eca19032124424e1cb2ad846b1f', '0825403177455614280512619787459065288809867067796226505521349477', '0.17087708240873156', 11, '0.00', '0.00', 1, '0.10', 'completed', 'danger', '0', '2.53', '2022-03-16 17:26:26', '2022-03-16 17:26:49'),
(148, -9223372036854775808, '2149583044', '36922c373b288dc0b47f797a22ab5024fe085a2ebc0f0e52bc7a41354cafea92', '8361668693668975612617432112972660010848992374630974667795371369', '0.44503383378878225', 14, '0.00', '0.00', 1, '0.15', 'completed', 'black', '0', '2.63', '2022-03-16 17:26:49', '2022-03-16 17:27:11'),
(149, -9223372036854775808, '0770972745', 'b08d1ce34fbcb8802626e207c148873bc5267874bcd23c71db011adddb189f01', '3723873949614423524248491884651646607393525220928795618381060751', '0.4492853675985973', 2, '0.00', '0.00', 1, '0.15', 'completed', 'black', '0', '2.78', '2022-03-16 17:27:11', '2022-03-16 17:27:33'),
(150, -9223372036854775808, '4316066504', '15abeb93017f4a085f63e010973252b354aec686ad8fe324e9f9e556864a4187', '9263850306262188327678898920082086275668045739481704623493701925', '0.9419218304181189', 4, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '2.63', '2022-03-16 17:27:33', '2022-03-16 17:27:55'),
(151, -9223372036854775808, '7077355531', '2cf60001bcc545fa188349e46c00367b73ab414d02e53d0dae2f38ac34749e13', '3226240912100478866900707681183231235274471497978403906878276588', '0.12424436437557995', 6, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '2.68', '2022-03-16 17:27:55', '2022-03-16 17:28:17'),
(152, -9223372036854775808, '6214077880', 'ed5623ec4c4045d24403b8b5167168e5914ae87864ffb85955751ef93d871a79', '5981734462887389142081666637292247382411742695423950470421875492', '0.6413406988478729', 9, '0.00', '0.00', 1, '0.10', 'completed', 'danger', '0', '2.73', '2022-03-16 17:28:17', '2022-03-16 17:28:39'),
(153, -9223372036854775808, '2185089357', '11c8322543b136eee7ba01751ac209190f59985c06a45e82d932a8072276cf6d', '7244157306446543889594372701545094794014714379229303509066575246', '0.01530397644263859', 4, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '2.83', '2022-03-16 17:28:39', '2022-03-16 17:29:01'),
(154, -9223372036854775808, '8012039620', 'eed8fb1410496c9c23b2dd98eb9b35145b870a34049b25618b99cd9974559a57', '0326556779782966105619324778763459742843790089236274375870121208', '0.04517684403351474', 5, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '2.88', '2022-03-16 17:29:01', '2022-03-16 17:29:23'),
(155, -9223372036854775808, '5970722763', '0f6ba5b943f4b8a2e64dc69559171ab9ef18951b23dc4e80f20b8a4b3e7a0ba5', '2530018127175023640186482001633153267647272324750260808694517629', '0.8831083108142301', 7, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '2.83', '2022-03-16 17:29:23', '2022-03-16 17:29:45'),
(156, -9223372036854775808, '7053375986', '23645e6397c17440ff4dd55db5dfcc272c60d7133af3fb4df6a14fff84de3fc2', '5956255073915680466055193749648891524080629830238366421248656714', '0.09664013474881772', 13, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '2.78', '2022-03-16 17:29:45', '2022-03-16 17:30:07'),
(157, -9223372036854775808, '9341867371', '90f265cbfbef36b571ae700a24d71aca9caa45a2b13b91e0d62d9e3fdbdcc63e', '0537224852802758039892699568641354465776176315388181128322585976', '0.3016978607602594', 0, '0.00', '0.00', 1, '0.05', 'completed', 'green', '0', '2.83', '2022-03-16 17:30:07', '2022-03-16 17:31:13'),
(158, -9223372036854775808, '6910042524', 'f385375eac568dd787df996db662c628d1a09b8f1a9766e6d31b0b5bb38d6ec1', '0619260064625402465276215057243030617163607548156733066219831559', '0.315712779876975', 0, '0.00', '0.00', 1, '0.05', 'completed', 'green', '0', '2.88', '2022-03-16 17:31:13', '2022-03-16 17:31:35'),
(159, -9223372036854775808, '5348419860', '0f3f5e84543b7b70350714a3bb8b2b390f9f71394dd9f85ae172a42408409f5a', '2432550270424879087149349183444800975109778304080304825600135293', '0.8944232576735314', 4, '0.00', '0.00', 1, '0.10', 'completed', 'black', '0', '2.23', '2022-03-16 17:31:35', '2022-03-16 17:31:57'),
(160, -9223372036854775808, '3814364180', '116bf28f19c98bb7b4a0387759df812cc2d1e5ed9ca3b6b73971929722dd0ac5', '0611247954749228095689830581666543833796462690373310437066564356', '0.9253769271735905', 14, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '2.33', '2022-03-16 17:31:57', '2022-03-16 17:32:19');
INSERT INTO `roulette_masters` (`id`, `game_number`, `game_secret`, `game_hash`, `hash_salt`, `round_number`, `game_stopped_number`, `admin_commission_price`, `admin_commission_dollar`, `dollar_price_in_coins`, `bet_amount`, `game_status`, `game_stopped_on`, `is_deleted`, `total_amt_carryforward`, `created_at`, `updated_at`) VALUES
(161, -9223372036854775808, '4917908056', '2ba2a1b1d179a10bd4cbe9918f639d62cd0f4194e3a5893adefe1aef5f2c769c', '8655546745331338050655265173546043675200541908360867134294559881', '0.6494559707825782', 3, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '2.38', '2022-03-16 17:32:19', '2022-03-16 17:32:41'),
(162, -9223372036854775808, '6184377993', '84bffe21e6bc7c9040d84b0508b3dfb55eb02c8a6a283233771a08c87aed55c9', '9622490174102950671633117477072745072857891520755881385625114078', '0.9317269766765062', 10, '0.00', '0.00', 1, '0.10', 'completed', 'black', '0', '2.33', '2022-03-16 17:32:41', '2022-03-30 20:03:30'),
(163, -9223372036854775808, '4361691633', 'd251046e246f7d00177acc1fdda40ea0b764871da7226b7de02473381b1e3ed4', '4682344581277697018944949684531417913037667800115545600255230429', '0.10088310418234281', 0, '0.00', '0.00', 1, '0.05', 'completed', 'green', '0', '2.43', '2022-03-30 20:03:30', '2022-03-30 20:03:52'),
(164, -9223372036854775808, '5389204663', '2f6c8d70dd671e9bcb943cb6ee986feb90acbbf817f8dc95f376bfdd02f3d1f8', '6272659604767617104913105666485117324297316474484134646500227493', '0.09205696137701702', 3, '0.00', '0.00', 1, '0.10', 'completed', 'danger', '0', '2.48', '2022-03-30 20:03:52', '2022-03-30 20:23:49'),
(165, -9223372036854775808, '9928425043', '4e86afbff61fa5c392544c89547bc06192ba48d5b57baebf1e197e8355d360d3', '5193700643611072649035082819566845160595389016758897216364859414', '0.7648567316945751', 8, '0.00', '0.00', 1, '0.05', 'completed', 'black', '0', '2.48', '2022-03-30 20:23:49', '2022-03-30 20:24:33'),
(166, -9223372036854775808, '8386619146', 'd4613301d5b83e8341f1d69d7227777dbdd75cc0b7dddb9eba12bc1b9d7d6772', '9174960954429796226416238918932927774739264201341403431393957407', '0.40045525797738657', 1, '0.00', '0.00', 1, '0.05', 'completed', 'danger', '0', '2.53', '2022-03-30 20:24:33', '2022-03-30 21:14:47'),
(167, -9223372036854775808, '2148196954', 'df482a236e85ebcf5e06339dc5b183b67530b3537e83e8fa3e4e2eba8333936c', '8962881496742308544834101470389049474104313385439456789626400189', '0.4645424471299655', NULL, '0.00', '0.00', NULL, '0.00', 'pending', NULL, '0', '2.48', '2022-03-30 21:14:47', '2022-03-30 22:47:19');

-- --------------------------------------------------------

--
-- Table structure for table `setting_masters`
--

CREATE TABLE `setting_masters` (
  `id` int(11) NOT NULL,
  `chips` varchar(255) DEFAULT NULL,
  `max_bet` varchar(255) DEFAULT NULL,
  `min_bet` varchar(255) DEFAULT NULL,
  `roulette_admin_commission` decimal(10,2) DEFAULT NULL,
  `deposit_admin_commission` decimal(10,2) DEFAULT NULL,
  `ternandcond` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting_masters`
--

INSERT INTO `setting_masters` (`id`, `chips`, `max_bet`, `min_bet`, `roulette_admin_commission`, `deposit_admin_commission`, `ternandcond`, `created_at`, `updated_at`) VALUES
(1, '1', '0.05', '0.01', '0.00', '0.00', '1', '0000-00-00 00:00:00', '2022-03-14 09:53:29');

-- --------------------------------------------------------

--
-- Table structure for table `user_masters`
--

CREATE TABLE `user_masters` (
  `id` int(11) NOT NULL,
  `jwt_login_token` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_wallet_id` varchar(255) DEFAULT NULL,
  `main_balance` decimal(10,2) DEFAULT 0.00,
  `total_deposite` decimal(10,2) DEFAULT 0.00,
  `total_withdraw` decimal(10,2) DEFAULT 0.00,
  `total_game_deposite` decimal(10,2) DEFAULT 0.00,
  `total_win_amount` decimal(10,2) DEFAULT 0.00,
  `profile_image` varchar(255) DEFAULT 'profile-main.png',
  `password_token` varchar(255) DEFAULT NULL,
  `is_login` enum('1','0') DEFAULT NULL,
  `is_moderator` enum('1','0') DEFAULT '0',
  `user_can_chat` enum('1','0') DEFAULT '1',
  `user_ban_unban_chat` enum('1','0') DEFAULT '0',
  `type` enum('admin','user','subadmin') DEFAULT 'user',
  `status` enum('1','0') DEFAULT '1',
  `is_deleted` enum('1','0') DEFAULT '0',
  `anymos` enum('1','0') DEFAULT '0',
  `over_18_years` enum('1','0') DEFAULT '0',
  `user_rank` varchar(255) DEFAULT NULL,
  `moderator_type` enum('user','moderator') DEFAULT 'user',
  `volume_status` enum('1','0') DEFAULT '0',
  `socket_id` varchar(255) DEFAULT '',
  `client_seed` varchar(255) DEFAULT NULL,
  `server_seed` varchar(255) DEFAULT NULL,
  `nonce` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `referral_code` varchar(255) NOT NULL,
  `affiliate` varchar(255) NOT NULL,
  `affiliate_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_masters`
--

INSERT INTO `user_masters` (`id`, `jwt_login_token`, `name`, `email_id`, `password`, `user_wallet_id`, `main_balance`, `total_deposite`, `total_withdraw`, `total_game_deposite`, `total_win_amount`, `profile_image`, `password_token`, `is_login`, `is_moderator`, `user_can_chat`, `user_ban_unban_chat`, `type`, `status`, `is_deleted`, `anymos`, `over_18_years`, `user_rank`, `moderator_type`, `volume_status`, `socket_id`, `client_seed`, `server_seed`, `nonce`, `created_at`, `updated_at`, `referral_code`, `affiliate`, `affiliate_status`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoxLCJpYXQiOjE2NDcwOTQxMTQsImV4cCI6MTY3ODYzMDExNH0.UeaiJpHf9kzojLMA1d8fc7hcRSrY35aUc9bQZES8Qhc', 'BuA9S', NULL, NULL, 'EQbJ5RwpFnNL6Ff1ZJioFt5xaQ3TgyydfYNoV2m9ooCN', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '0', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'G9q8Z9eFO7RPi8BQAAAX', '09107023816610072033', 'e002816ced1f96141ee4e1c773e77311eec906b92ee81af2c9b99bcc5949cab2', 0, '2022-03-12 14:08:06', '2022-03-12 14:08:42', '', '', 0),
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoyLCJpYXQiOjE2NDcwOTQxMzYsImV4cCI6MTY3ODYzMDEzNn0.qgxQLb0cNDjLm23K2kiMKRgAYpHm4WfqEgG4o4nvP-I', 'Awdhd', NULL, NULL, 'HFZr8G1ZWiGxNqQa7mDw92pohvrfAprSfunK87atTAUU', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'SsyTyhMP4BgyLxcRAAL_', '34868149779575698447', '856a0cc12b893954a9e64579e317dd92c5a6089b133f42543e48a69a3e0fa14c', 0, '2022-03-12 14:08:56', '2022-03-12 23:27:48', '', '', 0),
(3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjozLCJpYXQiOjE2NDcyOTc1MjksImV4cCI6MTY3ODgzMzUyOX0.VreQC-Zf-_yunfT8LhyGKdDCm2-FbUEEJetk9ve_ZTs', 'oEIvz', NULL, NULL, '8Ja4hjt2Qjx1JytUrUeP6q7b16NDe82pRpsGVCEuYQ6G', '0.00', '0.15', '0.15', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'YCW-E6JToD6_1AWhAALw', '80281723972431234970', '9c3c60a5decf47bb169c7691c4aae42fe8811e001d127ba52d895751427a5cfc', 0, '2022-03-12 17:48:33', '2022-03-15 10:46:56', '', '', 0),
(4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo0LCJpYXQiOjE2NDcxMDczODgsImV4cCI6MTY3ODY0MzM4OH0.pXXZ54ZFZah63E72kIsRixSNRKVk2LU6mtL6qgIsckM', '8ArRU', NULL, NULL, 'A1ght4F69Pw8AkjMt8PV9aVaBfPX9wP3mxEc3bx2e9P1', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'GJslTdvj0bzc8Wb2AAKJ', '99554118541035882895', '906d25d9fbd27a41ef3e834115c00573a92c7ee4fd04c273557c88023b25f8d0', 0, '2022-03-12 17:49:48', '2022-03-12 22:06:33', '', '', 0),
(5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo1LCJpYXQiOjE2NDcxMjY5MjYsImV4cCI6MTY3ODY2MjkyNn0.nO2090Y5rsYyuiHBOx59itz6qyZkP6lrnc6rJiI5_xY', 'pojV0', NULL, NULL, 'Hgw9m1mq3rpzTDxCZzbPQuCpczeTPcVBNcxRo7DcuTJY', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'd9ZbtKNBYgbXnY4qAAR2', '88462541297321141662', '0d9b242ff73397349ced11a7ee61fb62c3037ff6541302b0662b93b7ead230d6', 0, '2022-03-12 18:12:40', '2022-03-13 17:32:37', '', '', 0),
(6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo2LCJpYXQiOjE2NDcxMTg4MTEsImV4cCI6MTY3ODY1NDgxMX0.yMaPqYYlqc3hAqyqk5Ab77QKL9lDBGIMsY96DpiaYvc', 'Dk4yz', NULL, NULL, 'CFBXGAjXuVMTsZrty6gwCAkRYES48G46tNq5WKtpJuhq', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'sPxFlbTzBeKINzlWAAFW', '99172756778908889725', '56741f1ba8cb0601c0972eef83d04e4287f794936a68a075bca7c73aed115577', 0, '2022-03-12 20:53:10', '2022-03-12 21:06:03', '', '', 0),
(7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo3LCJpYXQiOjE2NDcxMTg3NDEsImV4cCI6MTY3ODY1NDc0MX0.9-fg36VsEf2hu3K41ySlERFT0TSaLr8XPtalYERy3II', 'iOuQY', NULL, NULL, '9r3nGrmEed2ZrWgrmEu8NBtyUbu769GxhMQgxyejuySw', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'Z40bYwWGeQADvInSAAH7', '22940838268171357339', 'ff313531f565aeb981a2d8a481dad3e20009a2c4d781d80a756998803430fdfe', 0, '2022-03-12 20:59:01', '2022-03-12 21:28:56', '', '', 0),
(8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo4LCJpYXQiOjE2NDcxMTg3NTYsImV4cCI6MTY3ODY1NDc1Nn0.hgnP-1ysMyhboG02YkU_kYsuV3xcrm3BYO3tNBmED1I', 'pXbph', NULL, NULL, '55v1fmwagCSyo9BwVbVmrTSMdtwrQ5FNa2yRGM4oDJZg', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'zkwrYQOrdZQ8bfuwAAD0', '68462554983523908354', 'f17c3538343995db2d0f6f5c97cf360158505ded36fdffbd6bcda12373744059', 0, '2022-03-12 20:59:16', '2022-03-12 20:59:18', '', '', 0),
(9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo5LCJpYXQiOjE2NDcyNTMzNTYsImV4cCI6MTY3ODc4OTM1Nn0.bUzHD2ltA_5bcT6j0aclQIrnhL-1WtQ60BHozvA-OqQ', 'icPHF', NULL, NULL, 'ExUGqiDLanncKTHJuuUao9X53sY5qgKhTW9xc15RWuup', '0.00', '0.15', '0.20', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'pa1FcirevEP2NzlKAAFM', '03390600348703245639', '6311b10b2775adfb26ab224c1cb70ae9bcbac81fc194c023102a36cf0663aa0c', 1, '2022-03-12 21:00:53', '2022-03-14 10:30:35', '', '', 0),
(10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoxMCwiaWF0IjoxNjQ3MTE4OTcyLCJleHAiOjE2Nzg2NTQ5NzJ9.hOnYVgJVaALgu4orSXPs511PH6ND7YhZ2sQShoZUc_Q', 'sHsok', NULL, NULL, '795V2XSF8MHJZB7EmVJo1ZkYHsz8V9XjdBNHDeC5sASe', '0.00', '1.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'GgqKya9XayzXLXaWAAHp', '09341165465213215786', 'f9fdba9b35d7af02c0dbd5df38201072724bab162cc8c8e02d47c6a86f852408', 1, '2022-03-12 21:02:00', '2022-03-12 21:25:38', '', '', 0),
(11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoxMSwiaWF0IjoxNjQ3MTE5MDAxLCJleHAiOjE2Nzg2NTUwMDF9.ppZa42Q0GSRB8WeA2bDx54PGRkRpCtmRnWnrYPpqlBI', 'R3VFy', NULL, NULL, '4gnRS6FKrfpmYaRqJXfh5U5KMsmhW9DRtDvJtJhjCRGU', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', '7u9BmF-bkx7igIdVAAE8', '69621199399281426134', '9db2129f07a9d8a63ea95595c29c80645d0d3003637e44fb44ed2548642797aa', 0, '2022-03-12 21:03:10', '2022-03-12 21:03:42', '', '', 0),
(12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoxMiwiaWF0IjoxNjQ3MTE5MDU4LCJleHAiOjE2Nzg2NTUwNTh9.b175NXRgGFrMv1yz8PKXS2lm1aRoS7VgV2Bbat3d60U', 'DpX41', NULL, NULL, 'GRFe9FV8k9s59SyuGB4PAEb8BRoKebG5gC3cXyCL4PVQ', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'pIE_YeYtj8OmF3c3AARI', '71333570675686970577', '44314d32d02e5d1b343051cec15d5a65cc385a9379fd24ec2323d63d1bc971b2', 0, '2022-03-12 21:04:18', '2022-03-13 16:20:57', '', '', 0),
(13, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoxMywiaWF0IjoxNjQ3MTE5MDc5LCJleHAiOjE2Nzg2NTUwNzl9.o-MDAEC9lz4L0oAHIE5F4Tw4hgDo82EL3UOCCYSft-g', 'Harnq', NULL, NULL, 'BfuLiwV5D3c4pHX8m2YXiJSLUbQr4PwbLbWvmGBK2vU', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'FZ8vxfkWKAUmiAjLAALH', '86245665121501545177', '4bc0180c7661a08cb22f40190b8413844841da6e533019bddc1a96c236d12e60', 0, '2022-03-12 21:04:39', '2022-03-12 22:13:12', '', '', 0),
(14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoxNCwiaWF0IjoxNjQ3MTE5MTczLCJleHAiOjE2Nzg2NTUxNzN9.kLOyBbj2K7jZcEg1KTI1Oz9BVy05GqvuBqNmrDIiWxE', 'Qrs9e', NULL, NULL, '6wuh8rZi6PF2ab4rrCHXm4eFBoEtP8mnEqvyVwBZJ24v', '0.15', '0.05', '0.06', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'W2iQvdLIYpeXo9MfAACN', '84883130792042537255', '7a364e0d1f7894312c150bd04c7468f5258b2a8a8ab8fd67014052fb8c6183c1', 49, '2022-03-12 21:06:13', '2022-03-16 17:31:39', '', '', 0),
(15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoxNSwiaWF0IjoxNjQ3MjY5ODE4LCJleHAiOjE2Nzg4MDU4MTh9.JgxhGT61EraNgfLsw4EdJci4bKFzuBLf9Z__fxqfxp8', 'tmSYx', NULL, NULL, '33YsxGSpg9he2iS3qhL2rTWMheprq3r3aqmpxFefiMRW', '0.00', '0.10', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'uzJ2NRbX1_sn-h1hAAKI', '63695914441257683491', '4e1a6943cd3a3ce02ff9a61a755bee193160fa65286fcb698e3434cb0d36e2b2', 2, '2022-03-12 21:06:24', '2022-03-14 23:22:06', '', '', 0),
(16, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoxNiwiaWF0IjoxNjQ3MTE5NDExLCJleHAiOjE2Nzg2NTU0MTF9.3yMrX46P-C3ihgND6xKkfQmGlWqlqRUl0XK1i4ljkCU', 'ix3oI', NULL, NULL, '87coAiSh5hPL3F6UXMtisFNBa8fzHuHewvnw4UFW4VVv', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'Gy9j624G0Jyj1x7DAANc', '66114133275172420182', 'b5ddfe36e1e23d901b2d1c282399fef4dc1c793cc5d0f30b1ced9bcca5da54d5', 0, '2022-03-12 21:10:11', '2022-03-13 06:46:46', '', '', 0),
(17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoxNywiaWF0IjoxNjQ3MTIwMjk5LCJleHAiOjE2Nzg2NTYyOTl9.WEDGWjB_rG0oubqZBO0ZP-DJij8VMcXYCDLx0pTYc1M', 'KNC9O', NULL, NULL, 'AokjvAQMRH7XPhCGzKtY8GVjewxTABLs81s7jzfGuGp5', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'QPqvG86f1bUOSZNTAAHn', '25672089476339140786', '8a4efdd3020ba84c2b9ec5b5c2db9588eb15e0d7628baa9e1130d7f5916de7fa', 0, '2022-03-12 21:24:59', '2022-03-12 21:25:23', '', '', 0),
(18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoxOCwiaWF0IjoxNjQ3MTIwNDUwLCJleHAiOjE2Nzg2NTY0NTB9.VcCvfwsJIqqgQHwIVm0xZobTBIL-bFmbAMM0PWkENps', 'AK99A', NULL, NULL, 'EDZDqyzbxL5WuUjHowHkyGUWRQGVLpUMzTeewuVSqrhv', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'RjH4zcO6vu_caezfAAK5', '43294523925496872639', '9280924a6852657d4bc9b185a5aa910abf736a95f7fe0e787e229f2d66776058', 0, '2022-03-12 21:27:30', '2022-03-12 22:10:53', '', '', 0),
(19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoxOSwiaWF0IjoxNjQ3MTIwNDY1LCJleHAiOjE2Nzg2NTY0NjV9.jxH0KQGO00NUlIrzSoCdLfB2qwFP-gDxoK8aLIpk8ZA', 'jZXgA', NULL, NULL, 'CmzEa34yh1mWoCJAEHdMt3qMm5R8HyWfYxdJaukEEyRi', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '0', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'hYCPR5SLP2KNPmXGAAIH', '73123359378194660014', 'e0a2b17f63067410509c26d8ebb161d07f5a7589d916393892b4c8e365d4051b', 0, '2022-03-12 21:27:45', '2022-03-12 21:29:55', '', '', 0),
(20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoyMCwiaWF0IjoxNjQ3MTIwNTE3LCJleHAiOjE2Nzg2NTY1MTd9.5uxw_rB02X9kkC_BDlIpIJKyEilmvWVg8kOQbTVlSFA', 'LR9Uz', NULL, NULL, '7uDbbhSke7FhKauPKKLS5cgtzRmX12WN1xpRZ5xKsFL9', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'lLfjdrg7fyqAlNVaAAIP', '71052566277083788374', 'fb2499ee3874d66d211a2d12b156eaf83efc3408da4ad5055e14446f7158c2bd', 0, '2022-03-12 21:28:37', '2022-03-12 21:29:24', '', '', 0),
(21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoyMSwiaWF0IjoxNjQ3MTIwODI0LCJleHAiOjE2Nzg2NTY4MjR9.Y3J0weOUNEjJ3iE9w_cl3ACBBhw2UG3FtSIbN6awaVg', '5DqL4', NULL, NULL, 'kDqcV7SN46wBz5RoXBwzgCUN2nza1zx25jTXvvzma2U', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'WsYJ-gomga5wI6GgAAIj', '94884241022188471947', '9d48c95bbc2cd4d40742e615addc94fd4299f850d727fcd2d70ce6bd2e9ec598', 0, '2022-03-12 21:33:44', '2022-03-12 21:33:45', '', '', 0),
(22, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoyMiwiaWF0IjoxNjQ3MTIxMjI1LCJleHAiOjE2Nzg2NTcyMjV9.mxk84XxsZTGG0tx59Gb0uj7WntHQnr2Wu_AylLdAe2I', 'yq1AA', NULL, NULL, '2Q3mcDLuXDHNG3oAaMA4uPpemwkS3kFtBmaCxq1p1fzd', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'JCGbviVEV2hMIvdJAAI7', '82560157304674783040', 'f0586f59d241ccd2d7b5a87476007aaba640802106feb4ba8dc5210a83e463aa', 0, '2022-03-12 21:40:25', '2022-03-12 21:41:36', '', '', 0),
(23, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoyMywiaWF0IjoxNjQ3MTIxODQ3LCJleHAiOjE2Nzg2NTc4NDd9.hKDr-wYgVeYUTxyOx-Iw50Pih3jNdJT0zrAnDNr0qvM', 'Powlk', NULL, NULL, 'CwZk1oP86xGVrwGfBE3izwSNGiW2dsxrTbPMtWnszNHp', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', '-oHSZyeZUBptkoYyAAJZ', '75357668993565412746', '6b246cb907b29102f2e0b2709880371d5d6b714caac772789c27c812fe2bf10d', 0, '2022-03-12 21:50:47', '2022-03-12 21:53:28', '', '', 0),
(24, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoyNCwiaWF0IjoxNjQ3MTIyNDQwLCJleHAiOjE2Nzg2NTg0NDB9.RGQAJUnmUs6ZbuLweaMUOaNLsEmTgdmtMcURsgWWzYY', '1m0N9', NULL, NULL, '7omJChMZLLispA43EP6yVJB5FQqJK6jpeBb4e1heBVbv', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'jiPlr6v__2sw1FW3AAJ3', '82044102424259589492', 'bbfc525147da812b91563285485be80eebccc01b027d97ca7f1ef79b306d0bd3', 0, '2022-03-12 22:00:40', '2022-03-12 22:03:01', '', '', 0),
(25, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoyNSwiaWF0IjoxNjQ3MjMxODc3LCJleHAiOjE2Nzg3Njc4Nzd9.WDYCu-z51zRCYu5cftkq15Zog6It_Nu3Vz7aUs_7XzU', 'qeXa7', NULL, NULL, '9c8FT3VnP8BH13gCRGz3mnhZkiLaRgSpiXKoy9nBBA6C', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '0', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', '59BLHyC1hLUZ0bGbAAW9', '44788935163026902236', '1b77ee2f197ddba9b26b52a146c2abb681f7d0e3ba2672f49dce60b36aaaf38d', 0, '2022-03-12 22:03:28', '2022-03-14 04:25:03', '', '', 0),
(26, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoyNiwiaWF0IjoxNjQ3MTIyNjkzLCJleHAiOjE2Nzg2NTg2OTN9.exoY9rPCRiJYG8RYlSGLhu35UfMVV42Km3ae3s8OH7A', 'hBRaI', NULL, NULL, '68tL3PLY5N9kDkwzyAk6ssRJqQFjCuL3z5H46jRiJ72a', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', '0PioPiokA0bDWeQaAAMV', '40226336140287780597', '40c5ec74a2642cdb97ef5d98d4b9f9a6262a9f838f0048cfceacf31ef38bfffa', 0, '2022-03-12 22:04:53', '2022-03-13 01:19:33', '', '', 0),
(27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoyNywiaWF0IjoxNjQ3MTIyNzIxLCJleHAiOjE2Nzg2NTg3MjF9.dgWpcPyqoOj8uIX4wpbGnrTc3p7n7_CgCjjz_Y8jZzw', '95Xjl', NULL, NULL, 'Cxgj1PMG5D7vsR4Pc8ixkpT6nPg2kVHfsaaw9H7rdupP', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'cmi7VT3xRFjCT-MuAAKF', '23262026927559711342', '1110576f8d8ea191c6b7883fdd8dd6bb6c81d34a6948802522a5e9c19ad1fba2', 0, '2022-03-12 22:05:21', '2022-03-12 22:05:35', '', '', 0),
(28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoyOCwiaWF0IjoxNjQ3MTIyOTM3LCJleHAiOjE2Nzg2NTg5Mzd9.Px-Zymaf4mhMhrkUWYSTKrLK0Ac1ccBKMNg_Lrak2_w', 'UGhNQ', NULL, NULL, 'AeQpB28j2Ph9tXLbBzSYS5Gn5WcfHwhMWi4Kw2HM8kdZ', '0.05', '0.05', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'xbfuAd8gckjzJXzGAAKr', '20710883482566548713', 'e15dd47c2e6756aba36354e6d5657e4b0bcbe720cb846d2c551199492397309c', 0, '2022-03-12 22:08:57', '2022-03-12 22:09:36', '', '', 0),
(29, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoyOSwiaWF0IjoxNjQ3MTIyOTQzLCJleHAiOjE2Nzg2NTg5NDN9.0DEbmSwj2gR-fUihX9i2fnPGAIfOCpklxQ4cLnm_Dg0', 'vzA7V', NULL, NULL, '5S3cUy36MGB8Wuj3VG7dCy6UtgkfBLkDpNk8sgwkxaob', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'mJoSwWYGuTh4VZyaAAKn', '04690823904777490227', '87668377bd9b8786d2717fa14a6ec96e2da7ec301ec187d961ccc5dae9eb44e3', 0, '2022-03-12 22:09:03', '2022-03-12 22:09:16', '', '', 0),
(30, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjozMCwiaWF0IjoxNjQ3MTIzMDM3LCJleHAiOjE2Nzg2NTkwMzd9.wu4_BcMlAv11RS6rUH-Fs-k18RaKAk7GsOkTNTLtwIY', 'HzupQ', NULL, NULL, '9x4pzCR3PgZxwovUf54Xrx7JNZzHgRvWVfwLUmeWHPjs', '0.00', '0.15', '0.15', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'K5NZegdjvokzowSOAALN', '52014072978876060061', '95bf9ba81962dfaafed02a110172d74d8c9431ef15a3e72c95ee336a73a8b119', 0, '2022-03-12 22:10:37', '2022-03-12 22:16:11', '', '', 0),
(31, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjozMSwiaWF0IjoxNjQ3Mzc0NTQ0LCJleHAiOjE2Nzg5MTA1NDR9.LvWd00Ob-leBNBVZIOgdWC1dqZkhkNSP9Sc74PC1vhU', 'oI87O', NULL, NULL, 'E4ht3T9TTQYjP5E2qmh4KhXtGmWe8q1Cy2N7HbzEivqa', '0.00', '0.20', '0.12', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', '9NhfqkMnzXtNIEHiAAGk', '26844230186873066790', '338aa6001e344029d11f738aeb19de3ad436f4babb44fa2e03f9e145c86a4537', 4, '2022-03-12 22:11:59', '2022-03-16 04:45:22', '', '', 0),
(32, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjozMiwiaWF0IjoxNjQ3MTI0MjUxLCJleHAiOjE2Nzg2NjAyNTF9.AimTdc_eyUSZNaskXs6DtfBy4nDoZF1oZ66kcQqY9ms', 'ovQe0', NULL, NULL, 'B1wuoiNiXXDKPc75dSD6V1vCWbekEBLvVX9Ah4pn9mCP', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'RgR25hFTurhOtBytAALh', '04493109203261111914', 'b8a7fb8aa2db97b5d4747aa568f34a03eeeec2c776d49f0a030648c96b5aa77f', 0, '2022-03-12 22:30:51', '2022-03-12 22:30:52', '', '', 0),
(33, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjozMywiaWF0IjoxNjQ3MzgxMzcyLCJleHAiOjE2Nzg5MTczNzJ9.odb4rbu1HiNMvQvVjB3QjSpMNhU60wHWr5jGhOy2piE', 'IzHOI', NULL, NULL, '3JJVTh6za5wiVLuxFCf2qSK3GwtdaEWfsdCVv3R9ECqL', '0.00', '0.10', '0.05', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'sSRmI_JCCm3ja6l9AAAd', '56975209491272845778', '63b3f88a588a20f05a7b585ef2d9edc5e3ba3f5895488937d968f7fcbf4f4beb', 1, '2022-03-13 03:35:56', '2022-03-16 12:44:05', '', '', 0),
(34, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjozNCwiaWF0IjoxNjQ3MTQ3NzUzLCJleHAiOjE2Nzg2ODM3NTN9.bO0RBGiyKCYeUbBhH6SU8y2Y_g5Icm5SgrXLrZrRPO4', '9ogDn', NULL, NULL, '8UNcgc4yeJ74xScc2ea5Tf5kYaQMd9Qx4FeDNJmanDGp', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'UPHl4FbDjID17ytYAANS', '04622266463284238140', '6f47e81cc2ab04e8c527ee9ddebbdf4542ccb1def8b2f4593b5d76f20bbaeaef', 0, '2022-03-13 05:02:33', '2022-03-13 05:02:34', '', '', 0),
(35, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjozNSwiaWF0IjoxNjQ3NDYyMjA2LCJleHAiOjE2Nzg5OTgyMDZ9.vef2C8AdiLfooFKIr-JjrvtCy83v_QvWg9xDfSbfH-c', '8bkfl', NULL, NULL, '4srSB1USuaBgXsrrSHJdHQFzLuj2Ak2axuZRvFRXPiMG', '3.90', '6.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'jL4u3hhrNH_OlLELAAFE', '67311892467446977263', '216021804d657d238c3d9bcda93346bd13c8fdce66c5f0d0507e9c32b843bc12', 25, '2022-03-13 15:24:41', '2022-03-16 21:44:44', '', '', 0),
(36, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjozNiwiaWF0IjoxNjQ3MTkxNzE1LCJleHAiOjE2Nzg3Mjc3MTV9.KiPpo0qY7Vej7dyIwywpHQhD5QHZ9MBmXlBVHznf1DE', '0aXri', NULL, NULL, 'FB1nNR4tej4EVMw7eQ7gNqNRTi9KcPeZV3Zsrx32W13H', '0.00', '0.50', '0.50', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'BNoQX2qeIxvWxWNKAAG4', '97111926200524191284', '3ac70eb530f4876631291767d3dc7f7456e398d396b846afac47cbc87fbedbf5', 0, '2022-03-13 17:15:03', '2022-03-14 12:04:29', '', '', 0),
(37, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjozNywiaWF0IjoxNjQ3MjE1MzcwLCJleHAiOjE2Nzg3NTEzNzB9.ssyxdIHxycnrmbjkXZ4rqhsnAjGJiiZzc02UvDk7J5g', '5IaTz', NULL, NULL, 'FqZcF8HBS8DcvyHNMGBDb6YzKm7mg6oViERPELzp5VeL', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', '-sCcvii2cc8iVf2kAAUz', '65090393532982552286', '178601537980fff5bafd9535676a98ea28f4cf019dfc4601359e3a5fcc8e9879', 0, '2022-03-13 23:49:30', '2022-03-13 23:55:19', '', '', 0),
(38, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjozOCwiaWF0IjoxNjQ3MjE1MzkzLCJleHAiOjE2Nzg3NTEzOTN9.TZYTN5MQPeVurjyVu-Id0cuv2DdLflaEuE7z92Et1sk', 'QtNxh', NULL, NULL, 'HojckAGyg3SKrNXjn9uXj3pm6QL7xxAuNrsH7KQQ9wym', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 't3fbxBKq4e0uMKITAAUd', '74938707075867705561', '49ef72e9d66d67ae941b241dc761c9b62b2e6af47f289f5190ba57cd0470d297', 0, '2022-03-13 23:49:53', '2022-03-13 23:49:55', '', '', 0),
(39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjozOSwiaWF0IjoxNjQ3MjE1NDY1LCJleHAiOjE2Nzg3NTE0NjV9.gL12o8wzFr4YMAkjdZ1g1taFU4DDQe2aPNZyf5DAGi8', 'XcndX', NULL, NULL, 'FucKMfNwN3MzovPebxPBheH92RrVSnYLUmF6QH6XEEPG', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'qAtinWAG2hCkNTYnAAGA', '85580099093807572172', '1bdff7ec32d441fa1070b1cf3f20ab5c22f6d858c9de5e79863a018530551db9', 0, '2022-03-13 23:51:05', '2022-03-14 15:58:18', '', '', 0),
(40, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo0MCwiaWF0IjoxNjQ3MjI4NjMxLCJleHAiOjE2Nzg3NjQ2MzF9.xt-DWaDfxybnENzS0u6lG6Bl4rJgemInS04GOsXEnXo', 'F9iPo', NULL, NULL, '44KzqBgtXJjrYLi5e6x9ipURpPwcgv1Z28ReT8hV9W9p', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'Qddh0kMDUPBULU5KAAHI', '95360909152568580208', '6a8f8210b4d5595c064a50c60ba2b069d6bb3c0a8f7322b6fad5857265079519', 0, '2022-03-14 03:30:31', '2022-03-14 16:59:56', '', '', 0),
(41, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo0MSwiaWF0IjoxNjQ3MjI5ODgzLCJleHAiOjE2Nzg3NjU4ODN9.v3WtZcQdR40fpsqpK0dxE10phzlTwtkVd0--th6-f2c', 'pZ4Dz', NULL, NULL, 'E8RcdCBmReoPkeA5psUpaHyc7Uyn5igEakEoDTVwhtBP', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '0', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'lL3qVm5itTtXpUw2AAXZ', '91171979361954984513', 'cd90a527b9ce2f7f801b6a948ce22120a0aa8bbe2c8aebf5a2ba0cafc4a4d913', 0, '2022-03-14 03:51:23', '2022-03-14 05:31:14', '', '', 0),
(42, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo0MiwiaWF0IjoxNjQ3MjMxOTA2LCJleHAiOjE2Nzg3Njc5MDZ9.HygKbMy_W1Ws0ZsLozTVYCk4bZ5spHV65dT0rmZaaVE', 'l5NdP', NULL, NULL, 'EUub5UoZJJw3v9EM9HMZyYjHeV6LLbegHdpciAnzsM8t', '0.00', '0.05', '0.05', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'VBfqS9X0dHREqLINAAXL', '52170940839986610356', '358a7c7343be9d15f4093f99d19d230692eb09229c9364060ad34f0f299b4b30', 0, '2022-03-14 04:25:06', '2022-03-14 04:27:14', '', '', 0),
(43, NULL, 'Admin', 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, NULL, '0', '1', '0', 'admin', '1', '0', '0', '0', NULL, 'user', '0', '', NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', 0),
(46, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo0NiwiaWF0IjoxNjQ3MzYxNjkxLCJleHAiOjE2Nzg4OTc2OTF9.q0NIAWIKqvp7Yp0H21NtBo_anI-wOPvZVgaZXpYh2H0', 'CDmAj', NULL, NULL, '3reM2QrxcKJALNrZjGy9L2k6SYGejf8MLty9XhFwWrxN', '0.05', '0.05', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', '_P7CsIHeoaRgPhghAACt', '27435022288084175168', 'b338343f34853603ef2c6ca8f74a5a413bba0314e4acdc4e69f8e3eaacfc89b2', 4, '2022-03-14 08:03:17', '2022-03-15 16:37:49', '', '', 0),
(47, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo0NywiaWF0IjoxNjQ3MjU5MjI4LCJleHAiOjE2Nzg3OTUyMjh9.9Z2dZSym8ctamtMlmeY5BDeGAvkfurma4z5mUT99G8g', 'y6Tdy', NULL, NULL, 'FXTbghTQEbDSm6StynTZeQAzvFhVdXLkLoGUfiJUapWw', '0.00', '0.10', '0.05', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'vbP_ZppplvBs6J-iAAG-', '50775404916273936672', '7c9c8d531f705f7a163d9738c49b625fb2710d0373dec87e9ce5fed2d75207c1', 1, '2022-03-14 12:00:28', '2022-03-14 12:47:48', '', '', 0),
(48, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo0OCwiaWF0IjoxNjQ3MjY0NjY2LCJleHAiOjE2Nzg4MDA2NjZ9.cRgiaJEW0_Fw-LUff24mhLI2e-fjcyxN4Uz1Rhuj_1o', '9zdXF', NULL, NULL, '353PwZLrGWLUa2idMd3UGsnc2stK6B5PXLnuUpnpzQ6F', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'MB880jXwPH-oQ5whAACS', '52794300932011273643', 'b172055be1e1f3b8a018cec93d7fb62b89212f8c1f87cd43375813756e240a7e', 0, '2022-03-14 13:31:00', '2022-03-14 14:09:24', '', '', 0),
(49, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo0OSwiaWF0IjoxNjQ3MjY0NzM2LCJleHAiOjE2Nzg4MDA3MzZ9.0fjZBzcze9QG2jBGuu1rRRSl3oD2JrqchY5GH-kkplU', 'ocUzk', NULL, NULL, 'H44SHKyZoYZxSuyxt49hgw9mkKS9fF3DdMsM9pydtj8r', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'afdXI67eX_-dhHmCAAA4', '15290969252647154526', 'c2b601995749d7604d73b3ac38538f47f485bd16c1989db9e0b8b6742c19376b', 0, '2022-03-14 13:32:05', '2022-03-14 13:32:38', '', '', 0),
(50, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo1MCwiaWF0IjoxNjQ3MjY5NzU2LCJleHAiOjE2Nzg4MDU3NTZ9.dHjcGOYXdjYBNqoSowFcUawCJqXJF6IDN2yAaKZHaTw', 'kSITB', NULL, NULL, 'B7YLxDAeXVPHaibsBbR9MsEzRewHNffy7KyBMRmdrDQF', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'M2BmYC3aGj9Z9wC8AAD4', '32835867978635873318', '2259055c00a7bef1db56e1a803a58b01035b798a3d62c476544b046b5e9307ad', 0, '2022-03-14 14:50:45', '2022-03-14 15:02:44', '', '', 0),
(51, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo1MSwiaWF0IjoxNjQ3MjcxNDY0LCJleHAiOjE2Nzg4MDc0NjR9.PkRNgcRvna42td9DisjWPH8zuzSt_9RXO0wMmAA--s4', 'N1WJC', NULL, NULL, '5WUpKw87DhC1bhgWZiz7i7gX7t8tbXjGQHQkR9NzwUn2', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'PiRuz9pIjEtbxlVcAAEy', '16704967592261277565', '7f871cb0cf31a078c9438f6b2f929d813deac37b9912a1ee5dd2f184cbf7aa6f', 0, '2022-03-14 15:24:24', '2022-03-15 20:15:23', '', '', 0),
(52, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo1MiwiaWF0IjoxNjQ3Mjg3ODk3LCJleHAiOjE2Nzg4MjM4OTd9.jNMlQ0OxtxFa8Qq9e7e7WoFUcVV4m_C24HcWMLt88pU', 'N7xZj', NULL, NULL, 'CPwcLM5zRfG2CE81vDJ7kq5TkW8DyB3CiPuPunnndsMc', '0.00', '0.50', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'm4jXJR9naBZXIsfcAAEH', '47838502304587810716', '684f9eac0fa871fd625e79febc5466f1c0652b3c13f3c185401f0c42a9b89b4b', 116, '2022-03-14 19:58:10', '2022-03-15 19:36:56', '', '', 0),
(53, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo1MywiaWF0IjoxNjQ3MzU0NDc5LCJleHAiOjE2Nzg4OTA0Nzl9.Gtafu-tIZckzbB4h2KzZWmFq1eWI_aOEUf9cht0pOz8', '6DNYz', NULL, NULL, 'Yms11g3Rsi9ZDBi1aLr19vZ6P8RoHqaJvFewqvgsDTp', '0.00', '0.10', '0.10', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'q1en2pDRXJJmiOR1AAAb', '57694329236202385015', '6e0adff955cd31332529697f058d2a6c6441663507cb0f8474943a7c0dfd4a14', 2, '2022-03-15 14:27:59', '2022-03-15 14:30:10', '', '', 0),
(54, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo1NCwiaWF0IjoxNjQ3MzU1MjUwLCJleHAiOjE2Nzg4OTEyNTB9.an4fgFVnQ4R_OENLkFpnTcx02VY57gGI537z9kVy8P8', 'ugZQy', NULL, NULL, '7eEiaAySQX1o98HnQ7kUKauc8PdWa1ZDZ1fMmpCuPZwz', '0.00', '0.25', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'ZM5lDu-SzyjXU4ahAAAx', '18300770073044432902', '453bb395af927b25958051efcaea0c41445065ee2d26be8c575c68d8508b3d25', 7, '2022-03-15 14:40:50', '2022-03-15 14:46:12', '', '', 0),
(55, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo1NSwiaWF0IjoxNjQ3MzU1MjcwLCJleHAiOjE2Nzg4OTEyNzB9.rT2RM3Cut9H9N23awruE-rmibIIxq9987Cv8vkq4uwk', '6dfbm', NULL, NULL, '7m6uBVFqvkpK7gfPysZwfRDtwB34wicWzMMTmD22B3Up', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'ThPboZ4RrEBmb7l_AABV', '22552331641340421077', 'd9c36a4f2b28bfd8c2f4df8ddfce7b683c134a4be0b48e2831ec25291fafa21a', 0, '2022-03-15 14:41:10', '2022-03-15 14:51:58', '', '', 0),
(56, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo1NiwiaWF0IjoxNjQ3MzU1NDUwLCJleHAiOjE2Nzg4OTE0NTB9.9w2CU5-ImhyYJyl98JIKulRUb1mX01dsLthw7yr-EFs', 'JOGb8', NULL, NULL, 'ByNfJjhMvRnfaLox8j9LQ9RqMQHMmyBmr5WfbyUL7p9c', '0.00', '0.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', '4bcWuR1_UIOUuZdnAADu', '31822884053079509918', '647414ff02d9dbd06f292943f0c02381e0aba9547025f42721ac15b0f99440f1', 0, '2022-03-15 14:44:10', '2022-03-15 18:53:46', '', '', 0),
(57, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo1NywiaWF0IjoxNjQ3MzYwNDAxLCJleHAiOjE2Nzg4OTY0MDF9.5oZOKCBlhT4mHoTbSx8GCnXIeJyZ9SONpVisYVqs6-Q', 'NIXnl', NULL, NULL, '2upUxnTRrqnx84S53Sz9ymKCj4qBHn91qLfR1VU4s3aM', '0.05', '0.05', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'ALqVPDCxstVgvq3hAACP', '02344366440527412889', 'c99251555ad2a4483de6c0134a77bf74957feb30ea3552a60d62c80891a68016', 0, '2022-03-15 16:06:41', '2022-03-15 16:13:04', '', '', 0),
(58, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo1OCwiaWF0IjoxNjQ3NDM2MjU4LCJleHAiOjE2Nzg5NzIyNTh9.1jcjGerJFta5qq-8vkb6MyKanDNPx279E9U78gKWA7Y', 'trap4Jpgs', NULL, NULL, '3rC7ndgpyxHKkq9ctRoUQHP8rK7Fznz1WGSa4Pjik9p4', '0.00', '0.80', '0.65', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '0', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', 'idcEOD9b06Sw4ibUAAFR', '36722669277488065280', 'ce9fa51ebab8a155ad97894632bc78eac0e3f9516d3cbfac0a16eee756672119', 51, '2022-03-15 17:35:17', '2022-03-17 00:57:44', '', '', 0),
(64, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjo2NCwiaWF0IjoxNjQ4NjcwMzYxLCJleHAiOjE2ODAyMDYzNjF9.IVP8TsZMSYK9lwjZxGgEkMqz9hPmepm3IgWNFPakQPg', 'vnD1j', NULL, NULL, '3chdpWVQmvjzdNZ1EcnWnQmVDWD5yreQwtSUFp9FbpVU', '0.85', '1.00', '0.00', '0.00', '0.00', 'profile-main.png', NULL, '1', '0', '1', '0', 'user', '1', '0', '0', '0', NULL, 'user', '0', '7mXbPQ5ohJvLR8-kAAA2', '08715282927882898425', '88f668ecc1038b7226e7f287e0e9d8c255ece4dd4f8b7d33de3bfc25789a7256', 7, '2022-03-30 19:18:52', '2022-03-30 21:14:36', 'S79UR', '12345', 0);

-- --------------------------------------------------------

--
-- Table structure for table `winner_log_masters`
--

CREATE TABLE `winner_log_masters` (
  `id` int(11) NOT NULL,
  `client_seed` varchar(255) DEFAULT NULL,
  `server_seed` varchar(255) DEFAULT NULL,
  `game_hash` varchar(255) DEFAULT NULL,
  `secret_key` varchar(255) DEFAULT NULL,
  `nonce` bigint(20) DEFAULT NULL,
  `is_won` enum('pending','yes','no','tie') DEFAULT 'pending',
  `game_name` varchar(255) DEFAULT NULL,
  `winning_amount` decimal(20,8) DEFAULT 0.00000000,
  `loss_amount` decimal(20,8) DEFAULT 0.00000000,
  `game_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_masters`
--

CREATE TABLE `withdraw_masters` (
  `id` int(11) NOT NULL,
  `price` decimal(10,4) DEFAULT NULL,
  `coin` decimal(10,2) DEFAULT NULL,
  `withdraw_inventory_count` varchar(255) DEFAULT NULL,
  `admin_rates` varchar(255) DEFAULT NULL,
  `type` enum('opskin') DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `transaction_block` varchar(255) DEFAULT NULL,
  `transaction_signature` varchar(255) DEFAULT NULL,
  `user_wallet_address` varchar(255) DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `withdraw_masters`
--

INSERT INTO `withdraw_masters` (`id`, `price`, `coin`, `withdraw_inventory_count`, `admin_rates`, `type`, `transaction_date`, `transaction_block`, `transaction_signature`, `user_wallet_address`, `status`, `created_at`, `updated_at`, `user_id`) VALUES
(1, '0.0500', '0.05', NULL, NULL, NULL, '2022-03-12 18:07:29', '124891655', 'KBhhGXQtjApcqCa6bjpNrSKfZhhkG3Yrv4qy7CZqVUyecMW8GaEHdPcH7vBT459i7fkLUpk3nWcUsYALZSMEt7Y', 'Hgw9m1mq3rpzTDxCZzbPQuCpczeTPcVBNcxRo7DcuTJY', 'Approved', '2022-03-12 18:07:29', '2022-03-14 10:31:25', 3),
(2, '0.1000', '0.10', NULL, NULL, NULL, '2022-03-12 18:16:30', '124884713', '3uPoh6m6S67wFRM84XSQi3LezFF3iJ7cTeX9ePbx6rUid3TFCXwjz87GSyMh9kw187ozp45EJ11WxtSMiTbJLAsb', 'Hgw9m1mq3rpzTDxCZzbPQuCpczeTPcVBNcxRo7DcuTJY', 'Approved', '2022-03-12 18:16:30', '2022-03-14 09:23:54', 3),
(3, '0.1500', '0.15', NULL, NULL, NULL, '2022-03-12 22:15:39', '124884682', '2ZQkLWaWryapJGhK9hWQemNHqJYrPqCUGEiNxXAEL1ikU7XdYFb14UbxeQRHw3819kakMRKij9b1QdxJjw5kRTga', '9x4pzCR3PgZxwovUf54Xrx7JNZzHgRvWVfwLUmeWHPjs', 'Approved', '2022-03-12 22:15:39', '2022-03-14 09:23:40', 30),
(4, '0.0500', '0.05', NULL, NULL, NULL, '2022-03-13 03:41:56', '124884621', '5u8nqPjqiAacn8xvDrhaH8ai2V6s1vLg5b2ZQhwc8ozk4eAZbRqBSheM96gzFRXqQwx7Uf3mxKziEMmog6cPzPqi', '3JJVTh6za5wiVLuxFCf2qSK3GwtdaEWfsdCVv3R9ECqL', 'Approved', '2022-03-13 03:41:56', '2022-03-14 09:23:09', 33),
(5, '0.0500', '0.05', NULL, NULL, NULL, '2022-03-13 08:11:02', '124884539', '4x3wGLRrNkhp9pbHDvD4vMAFAjMhQhPeh1QDaxXPaVPZcYhkTvrcPBncfzuiyz48daGdYYKfzjViFnWuyLyhrKxV', 'E4ht3T9TTQYjP5E2qmh4KhXtGmWe8q1Cy2N7HbzEivqa', 'Approved', '2022-03-13 08:11:02', '2022-03-14 09:22:13', 31),
(6, NULL, '0.05', NULL, NULL, NULL, '2022-03-13 08:11:03', NULL, NULL, 'E4ht3T9TTQYjP5E2qmh4KhXtGmWe8q1Cy2N7HbzEivqa', 'Rejected', '2022-03-13 08:11:03', '2022-03-14 09:21:08', 31),
(7, NULL, '0.05', NULL, NULL, NULL, '2022-03-13 08:11:03', NULL, NULL, 'E4ht3T9TTQYjP5E2qmh4KhXtGmWe8q1Cy2N7HbzEivqa', 'Rejected', '2022-03-13 08:11:03', '2022-03-14 09:21:05', 31),
(8, NULL, '0.05', NULL, NULL, NULL, '2022-03-13 08:11:04', NULL, NULL, 'E4ht3T9TTQYjP5E2qmh4KhXtGmWe8q1Cy2N7HbzEivqa', 'Rejected', '2022-03-13 08:11:04', '2022-03-14 09:21:01', 31),
(9, NULL, '0.05', NULL, NULL, NULL, '2022-03-13 08:11:04', NULL, NULL, 'E4ht3T9TTQYjP5E2qmh4KhXtGmWe8q1Cy2N7HbzEivqa', 'Rejected', '2022-03-13 08:11:04', '2022-03-14 09:20:58', 31),
(10, NULL, '0.05', NULL, NULL, NULL, '2022-03-13 08:11:04', NULL, NULL, 'E4ht3T9TTQYjP5E2qmh4KhXtGmWe8q1Cy2N7HbzEivqa', 'Rejected', '2022-03-13 08:11:04', '2022-03-14 09:20:54', 31),
(11, '0.5000', '0.50', NULL, NULL, NULL, '2022-03-13 17:16:14', '124884509', '4vpBiCsTkKMzeynSEAjq2hftJLBnUnbSMJ65SYQpKtNp7FMYpcBtkWwGDd9TfraRooHhdkZDFZq55YNkh35g2zsU', 'FB1nNR4tej4EVMw7eQ7gNqNRTi9KcPeZV3Zsrx32W13H', 'Approved', '2022-03-13 17:16:14', '2022-03-14 09:21:57', 36),
(12, NULL, '0.50', NULL, NULL, NULL, '2022-03-13 17:16:28', NULL, NULL, 'FB1nNR4tej4EVMw7eQ7gNqNRTi9KcPeZV3Zsrx32W13H', 'Rejected', '2022-03-13 17:16:28', '2022-03-14 09:20:22', 36),
(13, '0.0500', '0.05', NULL, NULL, NULL, '2022-03-14 03:25:33', '124884301', '5ugD6E43ErLw39CnL5Soi9Kob3sPUvYu2Hr7b7QJ4AxeLW89G5o84hWbn3t8QX81kigSU1Gy3jN4wPAtSBzq8GAg', 'ExUGqiDLanncKTHJuuUao9X53sY5qgKhTW9xc15RWuup', 'Approved', '2022-03-14 03:25:33', '2022-03-14 09:19:43', 9),
(14, '0.0500', '0.05', NULL, NULL, NULL, '2022-03-14 04:26:54', '124884279', '63qb6huwiVfPy1BC4naedgQDUPc5L3hxYLoCt1f5jHBhMGpk6j7BFmyvDN1gX2cMjwB3bjpQ8Gk32RpLEEvJVKAi', 'EUub5UoZJJw3v9EM9HMZyYjHeV6LLbegHdpciAnzsM8t', 'Approved', '2022-03-14 04:26:54', '2022-03-14 09:19:31', 42),
(15, '0.1500', '0.15', NULL, NULL, NULL, '2022-03-14 10:02:15', '124889942', '2sKU4iErZFWhZefF8wrufDXpYZygJArsYaRR2eUxTiv6weYzZ5pb86hJgBwR8fPpSdmVwLWtzLp91sZWSqUjUkHh', 'ExUGqiDLanncKTHJuuUao9X53sY5qgKhTW9xc15RWuup', 'Approved', '2022-03-14 10:02:15', '2022-03-14 10:14:53', 9),
(16, '0.0600', '0.06', NULL, NULL, NULL, '2022-03-14 10:30:24', '124891670', 'JZV2z8oU6qFkeznG1xBeLAJa3iKHCQvLv7XMy7DteQaG2bHRgGoCMuyzE7fTYUuXCJGuadFss5syRZC5nHuipVg', '6wuh8rZi6PF2ab4rrCHXm4eFBoEtP8mnEqvyVwBZJ24v', 'Approved', '2022-03-14 10:30:24', '2022-03-14 10:31:34', 14),
(17, '0.0500', '0.05', NULL, NULL, NULL, '2022-03-14 12:04:09', '124905801', '29S2QHEq4cqPcziNFNAtajfjncSD6Nww1QtXsnH4FyDVhXVCy577uGtqJrgCMjVZXkBCwWh3FBMpNMasn5PohChF', 'FXTbghTQEbDSm6StynTZeQAzvFhVdXLkLoGUfiJUapWw', 'Approved', '2022-03-14 12:04:09', '2022-03-14 12:48:33', 47),
(18, NULL, '0.05', NULL, NULL, NULL, '2022-03-14 12:04:54', NULL, NULL, 'FXTbghTQEbDSm6StynTZeQAzvFhVdXLkLoGUfiJUapWw', 'Rejected', '2022-03-14 12:04:54', '2022-03-14 12:47:48', 47),
(19, NULL, '0.05', NULL, NULL, NULL, '2022-03-14 17:31:18', NULL, NULL, '3reM2QrxcKJALNrZjGy9L2k6SYGejf8MLty9XhFwWrxN', 'Rejected', '2022-03-14 17:31:18', '2022-03-14 17:31:27', 46),
(20, NULL, '0.05', NULL, NULL, NULL, '2022-03-14 17:32:47', NULL, NULL, '3reM2QrxcKJALNrZjGy9L2k6SYGejf8MLty9XhFwWrxN', 'Rejected', '2022-03-14 17:32:47', '2022-03-14 17:33:50', 46),
(21, '0.1000', '0.10', NULL, NULL, NULL, '2022-03-15 14:29:53', '125072839', '2VM7PdLTff2FaMSH2RR2wqArdUMZHYtPqTHq7UoEBiwaBxrVByDRdRj2HjeXEn4vFNu3hzkDVZg5UdKApuBBN5pp', 'Yms11g3Rsi9ZDBi1aLr19vZ6P8RoHqaJvFewqvgsDTp', 'Approved', '2022-03-15 14:29:53', '2022-03-15 15:52:18', 53),
(22, NULL, '0.05', NULL, NULL, NULL, '2022-03-15 16:36:28', NULL, NULL, '3reM2QrxcKJALNrZjGy9L2k6SYGejf8MLty9XhFwWrxN', 'Rejected', '2022-03-15 16:36:28', '2022-03-15 16:36:37', 46),
(23, NULL, '0.07', NULL, NULL, NULL, '2022-03-15 20:12:13', NULL, NULL, 'E4ht3T9TTQYjP5E2qmh4KhXtGmWe8q1Cy2N7HbzEivqa', 'Pending', '2022-03-15 20:12:13', '2022-03-15 20:12:13', 31),
(24, '0.6500', '0.65', NULL, NULL, NULL, '2022-03-16 18:26:06', '125249789', '5X3ns6sdzDdrmDw2mZiGrzjGaXGtouzPyaX7gTdNjafZ4h4xateXce59NyNdtXdSH1eTCmxpTQw1H3pHy4zCi3dY', '3rC7ndgpyxHKkq9ctRoUQHP8rK7Fznz1WGSa4Pjik9p4', 'Approved', '2022-03-16 18:26:06', '2022-03-16 19:31:21', 58),
(25, NULL, '1.00', NULL, NULL, NULL, '2022-03-16 20:36:52', NULL, NULL, 'HFZr8G1ZWiGxNqQa7mDw92pohvrfAprSfunK87atTAUU', 'Rejected', '2022-03-16 20:36:52', '2022-03-16 20:37:10', 35);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bet_histories`
--
ALTER TABLE `bet_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `chat_masters`
--
ALTER TABLE `chat_masters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cms_masters`
--
ALTER TABLE `cms_masters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_masters`
--
ALTER TABLE `currency_masters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit_masters`
--
ALTER TABLE `deposit_masters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roulette_histories`
--
ALTER TABLE `roulette_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `roulette_id` (`roulette_id`);

--
-- Indexes for table `roulette_masters`
--
ALTER TABLE `roulette_masters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting_masters`
--
ALTER TABLE `setting_masters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_masters`
--
ALTER TABLE `user_masters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `winner_log_masters`
--
ALTER TABLE `winner_log_masters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Indexes for table `withdraw_masters`
--
ALTER TABLE `withdraw_masters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bet_histories`
--
ALTER TABLE `bet_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_masters`
--
ALTER TABLE `chat_masters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `cms_masters`
--
ALTER TABLE `cms_masters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currency_masters`
--
ALTER TABLE `currency_masters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposit_masters`
--
ALTER TABLE `deposit_masters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `roulette_histories`
--
ALTER TABLE `roulette_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;

--
-- AUTO_INCREMENT for table `roulette_masters`
--
ALTER TABLE `roulette_masters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `setting_masters`
--
ALTER TABLE `setting_masters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_masters`
--
ALTER TABLE `user_masters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `winner_log_masters`
--
ALTER TABLE `winner_log_masters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_masters`
--
ALTER TABLE `withdraw_masters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bet_histories`
--
ALTER TABLE `bet_histories`
  ADD CONSTRAINT `bet_histories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_masters` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `chat_masters`
--
ALTER TABLE `chat_masters`
  ADD CONSTRAINT `chat_masters_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_masters` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `deposit_masters`
--
ALTER TABLE `deposit_masters`
  ADD CONSTRAINT `deposit_masters_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_masters` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `roulette_histories`
--
ALTER TABLE `roulette_histories`
  ADD CONSTRAINT `roulette_histories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_masters` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `roulette_histories_ibfk_2` FOREIGN KEY (`roulette_id`) REFERENCES `roulette_masters` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `winner_log_masters`
--
ALTER TABLE `winner_log_masters`
  ADD CONSTRAINT `winner_log_masters_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_masters` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `winner_log_masters_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `currency_masters` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `withdraw_masters`
--
ALTER TABLE `withdraw_masters`
  ADD CONSTRAINT `withdraw_masters_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_masters` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
