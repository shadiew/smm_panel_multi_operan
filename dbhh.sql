-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 29 Sep 2018 pada 15.21
-- Versi server: 5.7.23-log
-- Versi PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jozpedia_oper`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita`
--

CREATE TABLE `berita` (
  `id` int(11) NOT NULL,
  `isi` text NOT NULL,
  `tanggal` date NOT NULL,
  `jenis` enum('INFO','WARNING','UPDATE') NOT NULL,
  `warna` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `date` date NOT NULL,
  `content` text COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(10) NOT NULL,
  `oid` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `poid` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `user` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `service` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `link` text COLLATE utf8_swedish_ci NOT NULL,
  `quantity` int(10) NOT NULL,
  `remains` int(10) NOT NULL,
  `start_count` int(10) NOT NULL,
  `price` int(10) NOT NULL,
  `status` enum('Checking','Pending','Processing','Error','Partial','Success') COLLATE utf8_swedish_ci NOT NULL,
  `date` date NOT NULL,
  `provider` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `place_from` enum('WEB','API') COLLATE utf8_swedish_ci NOT NULL,
  `notes` text COLLATE utf8_swedish_ci NOT NULL,
  `refund` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `oid`, `poid`, `user`, `service`, `link`, `quantity`, `remains`, `start_count`, `price`, `status`, `date`, `provider`, `place_from`, `notes`, `refund`) VALUES
(1, '6417108', '19', 'admin', 'Instagram Likes JOZ 1', 'hshs', 100, 0, 0, 247, 'Pending', '2018-09-25', 'JOZPEDIA', 'WEB', '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_pulsa`
--

CREATE TABLE `orders_pulsa` (
  `id` int(10) NOT NULL,
  `oid` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `user` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `service` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `price` double NOT NULL,
  `phone` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `status` enum('Pending','Processing','Error','Success') COLLATE utf8_swedish_ci NOT NULL,
  `date` date NOT NULL,
  `place_from` varchar(50) COLLATE utf8_swedish_ci NOT NULL DEFAULT 'WEB'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `provider`
--

CREATE TABLE `provider` (
  `id` int(10) NOT NULL,
  `code` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `link` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `api_key` varchar(100) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `provider`
--

INSERT INTO `provider` (`id`, `code`, `link`, `api_key`) VALUES
(1, 'MANUAL', 'http://anjay.com', 'T6oc8q393xP4KAR00mq9'),
(2, 'JOZPEDIA', 'http://www.jozpedia-smm.com/api/json.php', '2Yd4vtNnQxrUwSph1zelLR5MC3IauZ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `services`
--

CREATE TABLE `services` (
  `id` int(10) NOT NULL,
  `sid` int(10) NOT NULL,
  `category` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `service` text COLLATE utf8_swedish_ci NOT NULL,
  `note` text COLLATE utf8_swedish_ci NOT NULL,
  `min` int(10) NOT NULL,
  `max` int(10) NOT NULL,
  `price` double NOT NULL,
  `status` enum('Active','Not active') COLLATE utf8_swedish_ci NOT NULL,
  `pid` int(10) NOT NULL,
  `provider` varchar(50) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `services`
--

INSERT INTO `services` (`id`, `sid`, `category`, `service`, `note`, `min`, `max`, `price`, `status`, `pid`, `provider`) VALUES
(2, 2, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers JOZ  1', 'irv 1 new', 100, 5000, 9822.3529411765, 'Active', 2, 'JOZPEDIA'),
(3, 3, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers JOZ 2', '- 0 - 30 mins Start- Speed 5K- No refill - No refund', 300, 15000, 11000, 'Active', 3, 'JOZPEDIA'),
(4, 4, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers JOZ 3 [REAL]', 'âš¡ï¸ SUPER INSTANT âš¡ï¸ Instagram Followers[45K] [REAL] [NO REFUND - NO REFILL]', 200, 10000, 12764.705882353, 'Active', 4, 'JOZPEDIA'),
(5, 5, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers JOZ 4', 'Username OnlyNo Refill / No Refund0-1 Hour Start!Super Instant DeliveryMinimum 100', 200, 5000, 13470.588235294, 'Active', 5, 'JOZPEDIA'),
(7, 7, 'Instagram Likes', 'Instagram Likes JOZ 1', 'New & INSTANT', 100, 5000, 2470.5882352941, 'Active', 7, 'JOZPEDIA'),
(8, 8, 'Instagram Likes', 'Instagram Likes JOZ 2 [5K] [INSTANT]', '[5K] [INSTANT]', 100, 5000, 3117.6470588235, 'Active', 8, 'JOZPEDIA'),
(9, 9, 'Instagram Likes', 'Instagram Likes JOZ 3 âš¡ï¸ SUPER INSTANT', 'âš¡ï¸ SUPER INSTANT âš¡ï¸ Instagram Likes [9K] [INSTANT] [MIN 100]', 100, 9000, 3352.9411764706, 'Active', 9, 'JOZPEDIA'),
(10, 10, 'Instagram Views', 'Instagram Views JOZ 1 [999K] [REAL - INSTANT]', '[*Link Only], REAL Online, Super FAST', 100, 999000, 1822.3529411765, 'Active', 10, 'JOZPEDIA'),
(11, 11, 'Instagram Auto Comments / Impressions / Saves', 'Instagram Auto View', 'USERNAME ONLY (Normal Speed)', 20, 1000000, 3352.9411764706, 'Active', 11, 'JOZPEDIA'),
(12, 12, 'Youtube Likes / Comments / Favs...', ' Youtube Shares', '(INSTANT - 1500 / Day Speed)', 500, 150000, 42176.470588235, 'Active', 12, 'JOZPEDIA'),
(13, 13, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers JOZ 8 HQ  (30Days Refill)', '[MAKS.50K] - [HQ] - [30 Days Refill]', 100, 7000, 25117.647058824, 'Active', 13, 'JOZPEDIA'),
(14, 14, 'SoundCloud', 'SoundCloud Followers R1', '[FAST]', 20, 1000000, 41000, 'Active', 14, 'JOZPEDIA'),
(15, 15, 'SoundCloud', ' SoundCloud Plays', '(SUPER FAST) (S1) [MULTIPLE OF 100] 	Quantity = MULTIPLE OF 100 ONLY !', 20, 10000000, 2764.7058823529, 'Active', 15, 'JOZPEDIA'),
(16, 16, 'Pinterest', 'Pinterest Followers', '(UNLIMITED) [INSTANT]', 20, 1000000000, 50411.764705882, 'Active', 16, 'JOZPEDIA'),
(17, 17, 'Pinterest', 'Pinterest RePins', '(UNLIMITED) [INSTANT]', 20, 1000000, 50411.764705882, 'Active', 17, 'JOZPEDIA'),
(18, 18, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers JOZ 10 [NON DROP] - [60 DAYS REFILL]', '[20K] - [INSTANT] - [NON DROP] - [60 DAYS REFILL]', 50, 20000, 41588.235294118, 'Active', 18, 'JOZPEDIA'),
(19, 19, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers JOZ 11 HOT [INSTANT] (NO REFILL NO REFUND)', '(USERNAME ONLY) [10K] (NO REFILL NO REFUND)', 100, 6000, 9235.2941176471, 'Active', 19, 'JOZPEDIA'),
(20, 20, 'Instagram Likes', 'Instagram Likes JOZ 4 [.50K] [REAL - INSTANT]', '[50K] [REAL - INSTANT]', 20, 50000, 4529.4117647059, 'Active', 20, 'JOZPEDIA'),
(21, 21, 'Instagram Likes', 'Instagram Likes JOZPEDIA 1 [ New & Best Server ]', '[*Link Only], REAL HQ, Super FAST', 100, 15000, 3117.6470588235, 'Active', 21, 'JOZPEDIA'),
(22, 22, 'Telegram', ' Telegram Channel Members', 'MAX 25K', 100, 25000, 124529.41176471, 'Active', 22, 'JOZPEDIA'),
(23, 23, 'Telegram', 'Telegram Post Views', '[ Last 5 post ]', 100, 5000, 82176.470588235, 'Active', 23, 'JOZPEDIA'),
(24, 24, 'Google', 'Google Followers', 'USERNAME OR LINK', 100, 7000, 132764.70588235, 'Active', 24, 'JOZPEDIA'),
(25, 25, 'Google', 'Google Website +1', 'LINK', 50, 5000, 306882.35294118, 'Active', 25, 'JOZPEDIA'),
(26, 26, 'Google', 'Google Post +1', 'LINK', 20, 2000, 148058.82352941, 'Active', 26, 'JOZPEDIA'),
(27, 27, 'Google', 'Google Reshares', 'Google Reshares', 20, 2000, 159823.52941176, 'Active', 27, 'JOZPEDIA'),
(28, 28, 'Instagram Auto Likes', '80 Auto Likes + Views - 7 Days', ' 	Please Enter Your IG Username Only !', 1, 1, 41177470.588235, 'Active', 28, 'JOZPEDIA'),
(29, 29, 'Instagram Auto Likes', ' 	150 Auto Likes + Views - 7 Days', 'USERNAME ', 1, 1, 82353941.176471, 'Active', 29, 'JOZPEDIA'),
(30, 30, 'Instagram Auto Likes', ' 	1500 Auto Likes + Views - 7 Days', 'USERNAME', 1, 1, 369412764.70588, 'Active', 30, 'JOZPEDIA'),
(31, 31, 'Instagram Auto Likes', ' 	80 Auto Likes + Views - 30 Days', 'USERNAME', 1, 1, 164706882.35294, 'Active', 31, 'JOZPEDIA'),
(32, 32, 'Instagram Views', 'Instagram Views  [300k Per Day]', '[300k Per Day] - [INSTANT] - [Super FAST]', 100, 999000, 3235.2941176471, 'Active', 32, 'JOZPEDIA'),
(33, 33, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers ARAB - IRAN - INSTANT NON DROP', '[20K] [ARAB - IRAN - INSTANT] [NON DROP - 30 DAYS REFILL]', 50, 20000, 42176.470588235, 'Active', 33, 'JOZPEDIA'),
(34, 34, 'Instagram Story / Impressions / Saves', 'Instagram Story Views UNLIMITED (USERNAME ONLY) (S1)', 'Instagram Story Views UNLIMITED (USERNAME ONLY) (S1)', 50, 10000000, 17470.588235294, 'Active', 34, 'JOZPEDIA'),
(35, 35, 'Instagram Story / Impressions / Saves', 'Instagram Story Views [20k] (USERNAME ONLY) (S2)', 'Instagram Story Views [20k] (USERNAME ONLY) (S2)', 100, 20000, 12176.470588235, 'Active', 35, 'JOZPEDIA'),
(36, 36, 'Instagram Story / Impressions / Saves', 'Instagram Impressions [20k] [INSTANT] (S1)', 'Instagram Impressions [20k] [INSTANT] (S1)', 500, 20000, 2176.4705882353, 'Active', 36, 'JOZPEDIA'),
(37, 37, 'Instagram Story / Impressions / Saves', 'Instagram Saves [UNLIMITED] [20k/Day - INSTANT]', 'Instagram Saves [UNLIMITED] [20k/Day - INSTANT]', 20, 30000, 6411.7647058824, 'Active', 37, 'JOZPEDIA'),
(38, 38, 'Instagram Likes', 'Instagram Likes [70K] [BRAZIL - INSTANT]', 'Instagram Likes [70K] [BRAZIL - INSTANT]', 20, 70000, 6882.3529411765, 'Active', 38, 'JOZPEDIA'),
(39, 39, 'Instagram Likes', 'Instagram Likes [35K] [RUSSIA - INSTANT - HQ]', 'Instagram Likes [35K] [RUSSIA - INSTANT - HQ]', 20, 35000, 6882.3529411765, 'Active', 39, 'JOZPEDIA'),
(40, 40, 'Instagram Likes', 'Instagram Likes [3k] [JAPAN - HQ - INSTANT]', 'Instagram Likes [3k] [JAPAN - HQ - INSTANT]', 20, 3000, 6882.3529411765, 'Active', 40, 'JOZPEDIA'),
(41, 41, 'Instagram Auto Comments / Impressions / Saves', 'Instagram Auto Likes (USA - MAX 30K)', '	Instagram Auto Likes (USA - MAX 30K)', 20, 30000, 8058.8235294118, 'Active', 41, 'JOZPEDIA'),
(42, 42, 'Instagram Auto Comments / Impressions / Saves', 'Instagram Auto Likes (CHINA - MAX 30K)', 'Instagram Auto Likes (CHINA - MAX 30K)', 10, 30000, 9235.2941176471, 'Active', 42, 'JOZPEDIA'),
(43, 43, 'Instagram Auto Comments / Impressions / Saves', 'Instagram Auto Likes + Impressions (30k Max)', 'Instagram Auto Likes + Impressions (30k Max)', 50, 30000, 8058.8235294118, 'Active', 43, 'JOZPEDIA'),
(44, 44, 'Instagram Auto Comments / Impressions / Saves', '	Instagram Auto Views (Fast Speed)', '	Instagram Auto Views (Fast Speed)', 100, 60000, 4529.4117647059, 'Active', 44, 'JOZPEDIA'),
(45, 45, 'Instagram Auto Comments / Impressions / Saves', '	Instagram Auto Impressions (MAX UNLIMITED)', '	Instagram Auto Impressions (MAX UNLIMITED)', 20, 1000000, 56294.117647059, 'Active', 45, 'JOZPEDIA'),
(46, 46, 'Facebook Video Views / Live Stream', 'Facebook Live Stream Views [30 Mins Watch]', 'Facebook Live Stream Views [30 Mins Watch]', 100, 1000, 377470.58823529, 'Active', 46, 'JOZPEDIA'),
(47, 47, 'Twitter Views / Impressions / Live / Comments', 'Twitter Views (INSTANT)', 'Twitter Views (INSTANT)', 100, 1000000, 29235.294117647, 'Active', 47, 'JOZPEDIA'),
(48, 48, 'Twitter Views / Impressions / Live / Comments', 'Twitter Impressions (INSTANT)', 'Twitter Impressions (INSTANT)', 100, 1000000, 29235.294117647, 'Active', 48, 'JOZPEDIA'),
(49, 49, 'Instagram Likes', 'Instagram Likes + Impressions [30K] [REAL - INSTANT]', 'Instagram Likes + Impressions [30K] [REAL - INSTANT]', 100, 30000, 6176.4705882353, 'Active', 49, 'JOZPEDIA'),
(50, 50, 'Instagram Auto Likes - 7 Days Subscription', '80 Auto Likes + Views - 7 Days', '80 Auto Likes + Views - 7 Days', 1, 1, 41177470.588235, 'Active', 50, 'JOZPEDIA'),
(51, 51, 'Instagram Auto Likes - 7 Days Subscription', '150 Auto Likes + Views - 7 Days', '150 Auto Likes + Views - 7 Days', 1, 1, 81765705.882353, 'Active', 51, 'JOZPEDIA'),
(52, 52, 'Instagram Auto Likes - 7 Days Subscription', '300 Auto Likes + Views - 7 Days', 'Please Enter Your IG Username Only !', 1, 1, 121177470.58824, 'Active', 52, 'JOZPEDIA'),
(53, 53, 'Instagram Auto Likes - 7 Days Subscription', '1500 Auto Likes + Views - 7 Days', 'Please Enter Your IG Username Only !', 1, 1, 362353941.17647, 'Active', 53, 'JOZPEDIA'),
(54, 54, 'Instagram Auto Likes - 7 Days Subscription', '	80 Auto Likes + Views - 30 Days', 'USERNAME ONLY', 1, 1, 150589235.29412, 'Active', 54, 'JOZPEDIA'),
(55, 55, 'Instagram Auto Likes - 7 Days Subscription', '150 Auto Likes + Views - 30 Days', 'USERNAME ONLY', 1, 1, 262353941.17647, 'Active', 55, 'JOZPEDIA'),
(56, 56, 'Instagram Auto Likes - 7 Days Subscription', '300 Auto Likes + Views - 30 Days', 'USERNAME ONLY', 1, 1, 362353941.17647, 'Active', 56, 'JOZPEDIA'),
(57, 57, 'Instagram Followers No Refill/Not Guaranteed', 'MURAH HOT FAST INTAGRAM SERVER VIP 2  [10k]', '- 0 - 2h start- No Refill - No refund', 100, 10000, 9823.5294117647, 'Active', 57, 'JOZPEDIA'),
(58, 58, 'Instagram Likes', 'Instagram Likes VIP .', '- Instant - Non drop - High Quality - Real', 50, 4000, 1823.5294117647, 'Active', 58, 'JOZPEDIA'),
(59, 59, 'Instagram Likes', 'Instagram Likes VIP 2', '[ MAX 5K ] - INSTANT', 100, 7000, 1941.1764705882, 'Active', 59, 'JOZPEDIA'),
(60, 60, 'Instagram Likes', 'Instagram Likes VIP 3 [7K] [REAL]', 'TERMURAH DI INDONESIA-RealSuper Instant Delivery!', 50, 7000, 1517.6470588235, 'Active', 60, 'JOZPEDIA'),
(61, 61, 'Instagram Views', 'NEW CHEAP Instagram Views [800K] [REAL]', 'NEW CHEAP Instagram Views [800K] [REAL]', 50, 800000, 1529.4117647059, 'Active', 61, 'JOZPEDIA'),
(62, 62, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes [15K] âš¡', 'Put Link Of Facebook Profile/Page Post\r\n0-1 Hour Start!\r\n15K/Day\r\nMinimum 100', 100, 15000, 11058.823529412, 'Active', 62, 'JOZPEDIA'),
(63, 63, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes [15K] S2', 'Put Link Of Facebook Profile/Page Post\r\n0-1 Hour Start!\r\n15K/Day\r\nMinimum 100', 100, 15000, 11058.823529412, 'Active', 63, 'JOZPEDIA'),
(64, 64, 'Instagram Views', 'Instagram Views [30K] [REAL] CHEAP', 'Real Views!\r\nMin 10\r\nMax 30K\r\nInstant Start !\r\nSpeed 30K / Day !', 10, 30000, 1317.6470588235, 'Active', 64, 'JOZPEDIA'),
(65, 65, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers JPP2 MAX 5K - INSTANT 5 MIN START', '( Very Less Drop )', 100, 5000, 12764.705882353, 'Active', 65, 'JOZPEDIA'),
(66, 66, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers JPP MAX 7K - 1 MÄ°N START', '(Minimum Drop)', 100, 7000, 17117.647058824, 'Active', 66, 'JOZPEDIA'),
(67, 67, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers JPP 3 - [ Min 200 - Max 30K ] INSTNT', '1-24 jam', 100, 30000, 12764.705882353, 'Active', 67, 'JOZPEDIA'),
(68, 68, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers JPP 4 [Max 7K - 1 MÄ°N START Minimum Drop]', '[Max 7K - 1 MÄ°N START Minimum Drop]', 100, 7000, 21117.647058824, 'Active', 68, 'JOZPEDIA'),
(69, 69, 'Instagram Followers No Refill/Not Guaranteed', 'Ä°nstagram Followers JPP 5 - ( Max 25k - UltraFast ) ( Working Less Drop )', '( Max 25k - UltraFast ) ( Working Less Drop )', 100, 25000, 21117.647058824, 'Active', 69, 'JOZPEDIA'),
(70, 70, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Ä°nstagram Followers JPP 6 [ 30 Days Refill ] [ 10k/day ] [ Max - 55k ] INSTANT', '10K PERHARI MAX 55K INSTANT', 100, 10000, 26588.235294118, 'Active', 70, 'JOZPEDIA'),
(71, 71, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Ä°nstagram Followers JPP 7 (Fast) (30 Days Refill ) | (MIN 1000 - Max - 10k)', '(Fast) (15 Days Refill ) | (MIN 300 - Max - 10k)', 1000, 10000, 27470.588235294, 'Active', 71, 'JOZPEDIA'),
(72, 72, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Ä°nstagram Followers JPP 8 Real & Active (Fast) (Max - 25k) (30 days refill)', 'Real & Active (Fast) (Max - 25k) (30 days refill)', 100, 25000, 31588.235294118, 'Active', 72, 'JOZPEDIA'),
(73, 73, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Ä°nstagram Followers JPP 9  NONDROP FAST', 'Real Refill (30 Days Maximum) 0-1 start Followers', 100, 10000, 27470.588235294, 'Active', 73, 'JOZPEDIA'),
(74, 74, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers JPP 10 MAX 10K||5 MENIT START', 'Waktu Mulai 5 menit sampai 6 jam Drop Followers  tidak terlalu banyak kita Privat DB', 100, 10000, 11058.823529412, 'Active', 74, 'JOZPEDIA'),
(75, 75, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia JPP 1 FAST', '1X24 JAM REAL indonesia PERSUBMIT 2K jangan lebih setelah 2k submit lagi', 100, 5000, 53941.176470588, 'Active', 75, 'JOZPEDIA'),
(76, 76, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Semarang', '50% target 50% random ,20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM', 100, 1000, 42176.470588235, 'Active', 76, 'JOZPEDIA'),
(77, 77, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Magelang', '50% target 50% random ,20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM', 50, 1000, 42176.470588235, 'Active', 77, 'JOZPEDIA'),
(78, 78, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Sukabumi', '50% target 50% random ,20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM', 50, 1000, 42176.470588235, 'Active', 78, 'JOZPEDIA'),
(79, 79, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Bandung', '50% target 50% random ,20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM', 50, 2000, 48058.823529412, 'Active', 79, 'JOZPEDIA'),
(80, 80, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Bekasi', '50% target 50% random ,20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM', 50, 1000, 44529.411764706, 'Active', 80, 'JOZPEDIA'),
(81, 81, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Bali', '50% target 50% random ,20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM', 50, 1000, 51588.235294118, 'Active', 81, 'JOZPEDIA'),
(82, 82, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Jakarta', '50% target 50% random ,20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM', 50, 2000, 49235.294117647, 'Active', 82, 'JOZPEDIA'),
(83, 83, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Cirebon', '50% target 50% random ,20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM', 50, 1000, 44529.411764706, 'Active', 83, 'JOZPEDIA'),
(84, 84, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Lampung', '50% target 50% random ,20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM', 50, 1000, 46882.352941176, 'Active', 84, 'JOZPEDIA'),
(85, 85, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Palembang', '50% target 50% random ,20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM', 100, 1000, 48058.823529412, 'Active', 85, 'JOZPEDIA'),
(86, 86, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Aceh', '50% target 50% random ,20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM', 50, 1000, 48058.823529412, 'Active', 86, 'JOZPEDIA'),
(87, 87, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Surabaya', '50% target 50% random ,20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM', 50, 1000, 46882.352941176, 'Active', 87, 'JOZPEDIA'),
(88, 88, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Bogor', '50% target 50% random ,20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM', 50, 1000, 48058.823529412, 'Active', 88, 'JOZPEDIA'),
(89, 89, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Cimahi', '50% target 50% random ,20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM', 50, 999, 46882.352941176, 'Active', 89, 'JOZPEDIA'),
(90, 90, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Tangerang', '50% target 50% random ,20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM', 100, 1000, 48058.823529412, 'Active', 90, 'JOZPEDIA'),
(91, 91, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Purbalingga', '50% target 50% random ,20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM', 100, 1000, 45705.882352941, 'Active', 91, 'JOZPEDIA'),
(92, 92, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Sulawesi', '50% target 50% random ,20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM', 50, 1000, 48058.823529412, 'Active', 92, 'JOZPEDIA'),
(93, 93, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Kalimantan', '50% target 50% random ,20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM', 100, 1000, 46882.352941176, 'Active', 93, 'JOZPEDIA'),
(94, 94, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Makasar', '50% target 50% random ,20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM', 100, 1000, 49235.294117647, 'Active', 94, 'JOZPEDIA'),
(95, 95, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Solo', '50% target 50% random ,20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM', 150, 1000, 44529.411764706, 'Active', 95, 'JOZPEDIA'),
(96, 96, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia AKTIP SPECIAL MAX 15K FOLLOWERS INDONESIA', '20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM,PERSUBMIT 2K FOLLOWERS', 50, 5000, 56294.117647059, 'Active', 96, 'JOZPEDIA'),
(97, 97, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers JPP 11 FASTSERVICE', 'FAST ERVICE', 500, 50000, 16941.176470588, 'Active', 97, 'JOZPEDIA'),
(98, 98, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers JPP 12  ( Min 200 | MAX 5K ) ( 0-6 hours start )', '( Min 200 | MAX 5K ) ( 0-6 hours start )', 200, 50000, 12411.764705882, 'Active', 98, 'JOZPEDIA'),
(99, 99, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers JPP 13  ( 0-6 hours Start ) Min 500 -MAX 5K', '( 0-6 hours Start ) Min 500 -MAX 5K', 500, 5000, 11470.588235294, 'Active', 99, 'JOZPEDIA'),
(100, 100, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers JPP 14 5 Mint Delivery Max 2K - No refill, No refund', '5 Mint Delivery Max 2K - No refill, No refund', 200, 2000, 17470.588235294, 'Active', 100, 'JOZPEDIA'),
(101, 101, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers VIP 2  MAX 10K NONDROP', 'Real Refill (30 Days Maximum) 0-12 Hours Start! Minimum 100', 100, 10000, 27470.588235294, 'Active', 101, 'JOZPEDIA'),
(102, 103, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers VIP 4 MAX 4k', 'no refund no refill', 200, 4000, 9235.2941176471, 'Active', 103, 'JOZPEDIA'),
(103, 104, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Dani Aktip FAST [MAX 2K CHEAP IN THE MARKET]', '20% Masuk Hitungan Detik Sisa Folowers masuk paling lama 1X24 JAM, PER USERNAME MAX 2K FOLLOWERS INDONESIA', 100, 2000, 38645.882352941, 'Active', 104, 'JOZPEDIA'),
(104, 105, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers VVIIPP 1 - [ Min 100 - Max 6K ]', '- SUPER FAST DELIVERY ( 5 - 10 Mins ) - Min 100 - Max 10K - NO REFILL - NO REFUND', 100, 5000, 10411.764705882, 'Active', 105, 'JOZPEDIA'),
(105, 106, 'Instagram Views', 'Instagram Views Cheapest In Market Murahnya Gila [MAX10K]', '( Cheapest in the Market )', 50, 10000, 1114.1176470588, 'Active', 106, 'JOZPEDIA'),
(106, 107, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers Privat S2 instant Work Norefund No refill CUMA DI JOZPEDIA', 'Instagram Followers Privat S1 instant Work Norefund No refill CUMA DI IRVANKEDE', 200, 4500, 11694.117647059, 'Active', 107, 'JOZPEDIA'),
(107, 108, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers Privat S3 instant Work Norefund No refill CUMA DI JOZPEDIA', 'Instagram Followers Privat S1 instant Work Norefund No refill CUMA DI IRVANKEDE', 100, 4500, 8764.7058823529, 'Active', 108, 'JOZPEDIA'),
(108, 109, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers VVIIPP 2 [6K]', 'Cheapest In Market', 100, 6000, 6764.7058823529, 'Active', 109, 'JOZPEDIA'),
(109, 110, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers VVIIPP 3 [3K]', 'Complete In 6-12 Hour, Partial / Cancel issues', 100, 3000, 7000, 'Active', 110, 'JOZPEDIA'),
(110, 111, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers VVIIPP 5 [5K] [NO REFILL NO REFUND] [1MENIT START]', 'MAX 5K NO REFILL NO REFUND', 200, 5000, 9117.6470588235, 'Active', 111, 'JOZPEDIA'),
(111, 112, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers VVIIPP 7 INSTAN', 'FAST DELIVERY NO REFILL NO REFUND', 100, 4000, 8176.4705882353, 'Active', 112, 'JOZPEDIA'),
(112, 113, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers VVIIPP 9 30 DAYS REFILL SUPER FAST [10K]', '- Instant - Speed 5k/Day - 30 days refill', 100, 10000, 18647.058823529, 'Active', 113, 'JOZPEDIA'),
(113, 114, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers VVIIPP 10 30 DAYS REFILL FAST [10K]', '30 DAYS REFILL FAST', 100, 10000, 26411.764705882, 'Active', 114, 'JOZPEDIA'),
(114, 115, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers Khusus JOZPEDIA S2 NO REFILL NO REFUND [2,5K] CHEAP', 'Norefund No refill start 1 jam Harga Berbanding Lurus Dengan Kualitas', 100, 2500, 5705.8823529412, 'Active', 115, 'JOZPEDIA'),
(115, 116, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers VVIIPP 13 [NoRefund No Refill - Max 5k ] [ 0 - 1Hrs Complete ]', '[NO REFUND NO REFILL- Max 5k ] [ 0 - 1Hrs Complete ]', 300, 5000, 13941.176470588, 'Active', 116, 'JOZPEDIA'),
(116, 117, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook - Post Likes Real S1 ( Instant, Real, Superfast, Fanpage & Profile post, Max 5k )', '- 100% Real users - Min = 25 likes - max = 50k likes - Instant start - Mixed likes - Accept All Post - Life time Guarantee of likes', 25, 1000, 6882.3529411765, 'Active', 117, 'JOZPEDIA'),
(117, 118, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook - Post Likes S2 ( Instant, Real, Ultra fast, Fanpage & Profile post, Max 3k )', '- 100% Real users - Min = 25 likes - max = 50k likes - Instant start - Mixed likes - Accept All Post - Life time Guarantee of likes', 100, 5000, 7941.1764705882, 'Active', 118, 'JOZPEDIA'),
(118, 119, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Khusus Jozpedia S4 SUPER FAST [10K] [MIN 300]', 'NO REFILL NO REFUND', 300, 10000, 7000, 'Active', 119, 'JOZPEDIA'),
(119, 120, 'Instagram Auto Comments / Impressions / Saves', 'Instagram Impressions [1M]', 'Real Instant Delivery! Minimum 100', 100, 1000000, 3470.5882352941, 'Active', 120, 'JOZPEDIA'),
(120, 121, 'Instagram Story / Impressions / Saves', 'Instagram Story Views [30K]', 'No Refill / No Refund 0-1 Hour Start! 10K/Day Minimum 50', 100, 30000, 16882.352941176, 'Active', 121, 'JOZPEDIA'),
(121, 122, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes [1K] [EMOTICONS] [HAHA]', 'INSTANT', 10, 1000, 11000, 'Active', 122, 'JOZPEDIA'),
(122, 123, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes [1K] [EMOTICONS] [WOW]', 'INSTANT', 10, 1000, 11000, 'Active', 123, 'JOZPEDIA'),
(123, 124, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes [1K] [EMOTICONS] [SAD]', 'INSTANT', 10, 1000, 11000, 'Active', 124, 'JOZPEDIA'),
(124, 125, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes [1K] [EMOTICONS] [ANGRY]', 'INSTANT', 100, 1000, 11000, 'Active', 125, 'JOZPEDIA'),
(125, 126, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers Media 5 SUPER FAST 5-10 MENIT 10K', 'NO REFILL NO REFUND', 100, 10000, 12058.823529412, 'Active', 126, 'JOZPEDIA'),
(126, 127, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Real Aktip Murah S1 [TERMURAH]', 'CHEAP START 5 JAM - 24 JAM - 48 JAM - HARGA BERBANDING LURUS DENGAN KECEPATN DAN KUALITAS - MAX PERAKUN/PERUSERNAME CUMA 1K UNTUK LAYANAN INI - TERMURAH DI INDONESIA', 50, 1000, 29235.294117647, 'Active', 127, 'JOZPEDIA'),
(127, 128, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers Refill 2 [4k] [30 Days Refill]', '1,5-2K/ DAYS', 100, 4000, 18882.352941176, 'Active', 128, 'JOZPEDIA'),
(128, 129, 'Instagram Story / Impressions / Saves', 'Instagram Last Story S1 - Only Username - No Refund', 'Instagram Last Story - Only Username - No Refund', 500, 10000, 4117.6470588235, 'Active', 129, 'JOZPEDIA'),
(129, 130, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [10K] [INSTANT DELIVERY', 'No Refill / No Refund 0-1 Hour Start! Super Instant Delivery Minimum 100 Maximum = 10k Daily !', 100, 10000, 9470.5882352941, 'Active', 130, 'JOZPEDIA'),
(130, 131, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [4K] [NO REFUND NO REFILL]', '0-1 JAM START NO REFUND NO REFILL', 100, 4000, 5705.8823529412, 'Active', 131, 'JOZPEDIA'),
(131, 132, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [1.5K] [START 1AM] [NOREFILL NO REFUND]', 'Instagram Followers [1.5K] [START 1AM] [NOREFILL NO REFUND]', 100, 1500, 5352.9411764706, 'Active', 132, 'JOZPEDIA'),
(132, 133, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [5K] - INSTANT 5 MIN START ( Very Less Drop )', 'no refund no refill', 100, 5000, 12764.705882353, 'Active', 133, 'JOZPEDIA'),
(133, 134, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [10K] NO REFUND NO REFILL', 'START 0-12 JAM', 200, 10000, 9000, 'Active', 134, 'JOZPEDIA'),
(134, 135, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Hitungan Detik [6K]', 'INSTANT', 50, 6000, 42176.470588235, 'Active', 135, 'JOZPEDIA'),
(135, 136, 'Instagram Likes', 'Instagram Likes [15K] [INSTANT]', 'Real Super Instant Delivery! Minimum 100', 100, 15000, 3352.9411764706, 'Active', 136, 'JOZPEDIA'),
(136, 137, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers REFILL ISNTANT {30 Days Refill- 2 hour Start] MAX 10k', '{30 Days Refill- 2 hour Start] MAX 10k', 100, 10000, 28058.823529412, 'Active', 137, 'JOZPEDIA'),
(137, 138, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Instant Cheap[3K] [HITUNGAN DETIK]', 'JIKA LAMBAT LAYAAN INI MENGALAMI OVERLOAD', 50, 2000, 36882.352941176, 'Active', 138, 'JOZPEDIA'),
(138, 139, 'Instagram Likes', 'Instagram Likes INDONESIA INSTAN S6 (Hitungan Detik) MAX 7K BACA NOTE', 'Submit jangan pake link seperti ini https://www.instagram.com/p/BkNSDjMAqi0/ Pake link  https://www.instagram.com/p/BkNSDjMAqi0/?utm_source=ig_share_sheet&igshid=1wodc812v31tk Cara mandapatkan link seprti ini perbarui dulu aplikasi instagram !!!!', 25, 7000, 5588.2352941176, 'Active', 139, 'JOZPEDIA'),
(139, 140, 'Instagram Likes', 'Instagram Likes Min 50 MAX 15K [ Recommended ] FAST INSTANT', 'Instagram Fast Instant Likes Min 50 MAX 15K [ Recommended ]', 50, 15000, 1529.4117647059, 'Active', 140, 'JOZPEDIA'),
(140, 141, 'Instagram Likes', 'Instagram Likes [15K] [INSTANT START 1 MENIT]', 'INSTANT', 20, 15000, 1705.8823529412, 'Active', 141, 'JOZPEDIA'),
(141, 142, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers 2K SUPER FAST', 'LOW QUALTY KADANG MASUK GK SESUAI SAMA SUBMIT KADANG DROP CEPET AKUN BOT SEMUA NO REFUND NO REFILL YA GUYS', 100, 4000, 4529.4117647059, 'Active', 142, 'JOZPEDIA'),
(142, 143, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers MAX 30K Instant Porses', 'NO REFILL NO REFUND', 100, 10000, 11588.235294118, 'Active', 143, 'JOZPEDIA'),
(143, 144, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ 6K ] Super Fast Cheap', 'NO REFILL NO REFUND', 200, 6000, 3941.1764705882, 'Active', 144, 'JOZPEDIA'),
(144, 145, 'Instagram Views', 'Instagram Views Cheapest In Market ( Min 50 Max 10M )', 'START 0-6 JAM', 50, 100000000, 1058.8235294118, 'Active', 145, 'JOZPEDIA'),
(145, 146, 'Instagram TV', 'Instagram TV Likes - Instant Start', 'INSTANT', 500, 3000, 3235.2941176471, 'Active', 146, 'JOZPEDIA'),
(146, 147, 'Facebook Followers / Friends / Group Members', 'Facebook Followers [50K] [REFILL30 DAYS]', 'For Facebook Profiles And Not Pages Real Refill (30 Days Maximum) 0-6 Hour Start! 500 - 2K/Day Minimum 100', 100, 50000, 24411.764705882, 'Active', 147, 'JOZPEDIA'),
(147, 148, 'Facebook Followers / Friends / Group Members', 'Facebook Group Members [500K]', 'Group Must Be Public ! You Need to Accept the First 5 Members First ! No Refill / No Refund ! Min = 500 Max = 500k 0 to 12 Hours Start ! 500 to 2k / Day Speed !', 500, 500000, 26529.411764706, 'Active', 148, 'JOZPEDIA'),
(148, 149, 'Instagram TV', 'Instagram TV Views [ULTRA FAST] ( Min 100 | Max 1 Million )', 'IGTV Random Comments ! Full TV Video Link Needed ! INSTANT Start ! Min = 100! Example URL- https://www.instagram.com/tv/BkSp-6VF5fg/', 100, 100000000, 1311.7647058823, 'Active', 149, 'JOZPEDIA'),
(149, 150, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Emoticons Love Instant Start', 'INSTANT', 50, 4000, 6882.3529411765, 'Active', 150, 'JOZPEDIA'),
(150, 151, 'Instagram TV', 'IGTV Random Comments [1M]', 'IGTV Random Comments ! Full TV Video Link Needed ! INSTANT Start ! Min = 10!', 10, 10000000, 38647.058823529, 'Active', 151, 'JOZPEDIA'),
(151, 152, 'Instagram TV', 'IGTV Random Emoji Comments [1M]', 'IGTV Random Emoji Comments ! Full TV Video Link Needed ! INSTANT Start ! Min = 10! â™› Instagram Auto Likes', 10, 10000000, 38647.058823529, 'Active', 152, 'JOZPEDIA'),
(152, 153, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers Max 5K - Refill 15 days', 'INSTANT', 100, 5000, 22176.470588235, 'Active', 153, 'JOZPEDIA'),
(153, 154, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [ 30 Days Refill ] [ 10k/day ] [ Max - 55k ] INSTANT', 'INSTANT', 100, 10000, 24058.823529412, 'Active', 154, 'JOZPEDIA'),
(154, 155, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers (Super Fast) (15 Days Refill ) | (MIN 1000 - Max - 10k)', 'INSTANT', 1000, 100000, 26294.117647059, 'Active', 155, 'JOZPEDIA'),
(155, 156, 'Instagram Views', 'Instagram Views [300K] [SUPER FAST]', 'INSTANT START ! VERY FAST ! 300K / Hour !', 100, 300000, 1070.5882352941, 'Active', 156, 'JOZPEDIA'),
(156, 157, 'Instagram Views', 'Instagram Views [3M] [SUPER FAST]', '300k to 500k Per Hour ! Very Fast ! Instant !', 100, 30000000, 1088.2352941176, 'Active', 157, 'JOZPEDIA'),
(157, 158, 'Instagram Views', 'Instagram Views + Impressions [FAST] [1M]', 'INSTANT 300K to 500K / Hour Speed ! FAST !', 100, 100000000, 1117.6470588235, 'Active', 158, 'JOZPEDIA'),
(158, 159, 'Instagram Views', 'Instagram Views + Impressions [TRENDING HITS] [1M]', 'INSTANT', 100, 10000000, 1176.4705882353, 'Active', 159, 'JOZPEDIA'),
(159, 160, 'Facebook Page Likes', 'Real Facebook Page Likes - [ Non drop ] [ 5k-10k/day ] [ Max - 100k ] INSTANT', 'REAL LIKES INSTANT START LIFE TIME GUARANTEED NON DROP MIN 100 MAX 100K', 100, 100000, 93941.176470588, 'Active', 160, 'JOZPEDIA'),
(160, 161, 'Youtube Views', 'Youtube - Views JP 4 [ 100k-300k/day ] ( AUTO REFILL ) [ Life Time Guaranteed ] INSTANT', 'Best Service! - Life Time Guaranteed - 100k-300k/day - 3-5mins Retention - Auto refill ( System Check in every 12hrs ) -> Usually refill will be done within 24hrs, but we need maximum time of 96hrs. - 60-80% Retention', 1000, 10000000, 5000, 'Active', 161, 'JOZPEDIA'),
(161, 162, 'Youtube Views', 'Youtube - Views JP 5 [ 1M-1.5M/DAY ] ( AUTO REFILL ) [ Life Time Guaranteed ] INSTANT', '- Life Time Guaranteed - 1Million to 1.5Million Per day - Auto refill ( System Check in every 12hrs ) -> Usually refill will be done within 24hrs, but we need maximum time of 96hrs. - 60-80% Retention', 5000, 1000000000, 8647.0588235294, 'Active', 162, 'JOZPEDIA'),
(162, 163, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers JP-1 [ Superfast ] [ Real ] [ Max 5k ] INSTANT-4hrs', 'INSTANT-4HRS Real Followers 10,000 Per day Min 100 Max 10,000', 300, 5000, 7882.3529411765, 'Active', 163, 'JOZPEDIA'),
(163, 164, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers JP-2  ( Max - 10k ) ( SUPERFAST, NO REFILL ) INSTANT', 'Super fast real followers. Data is renewed everyday. You can send followers even you used the max 10K for your profile.', 100, 10000, 8647.0588235294, 'Active', 164, 'JOZPEDIA'),
(164, 165, 'Instagram Likes', 'Instagram Likes Fast Instant Min 50 MAX 15K', 'INSTANT', 50, 15000, 1505.8823529412, 'Active', 165, 'JOZPEDIA'),
(165, 166, 'Instagram Likes', 'Instagram Likes ( Min 20 - Max 15k )( Super Fast ) Complete in less then 1 min', 'INSTANT', 20, 15000, 1647.0588235294, 'Active', 166, 'JOZPEDIA'),
(166, 167, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers Super Fast [Max 15k]', 'Ultra Fast and Less Drop No Refill / No Refund 0-1 Hour Start! Super Instant Delivery Minimum 150', 100, 6000, 6882.3529411765, 'Active', 167, 'JOZPEDIA'),
(167, 168, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ 6K ] 0-3Hours', 'No Refill / No Refund', 100, 6000, 4411.7647058824, 'Active', 168, 'JOZPEDIA'),
(168, 169, 'Instagram Story / Impressions / Saves', 'Instagram Story Views [5K] - All Story', 'Instagram Story Views [5K] - All Story', 100, 5000, 2529.4117647059, 'Active', 169, 'JOZPEDIA'),
(169, 170, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ Superfast ] [ Real ] [ Max 5k ] INSTANT', 'NO REFIL NO REFINDD', 100, 5000, 7176.4705882353, 'Active', 170, 'JOZPEDIA'),
(170, 171, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers (BEST IN MARKET) {MAX 80K) 30 Days Refil', '30 days refill', 100, 80000, 22647.058823529, 'Active', 171, 'JOZPEDIA'),
(171, 172, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Langsung Masuk[4K],', 'INSTANT', 100, 4000, 38647.058823529, 'Active', 172, 'JOZPEDIA'),
(172, 173, 'Instagram Views', 'Instagram Views [1M] FAST MURAH', 'Instant Start 200k / hour speed Lifetime non drop guarantee 50 Minimum order 100,00,000 Maximum ord', 50, 100000000, 1027.0588235294, 'Active', 173, 'JOZPEDIA'),
(173, 174, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers 5K SuperFast Hanya di JOZ', 'NO REFIL NO REFUND', 100, 5000, 4941.1764705882, 'Active', 174, 'JOZPEDIA'),
(174, 175, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers (30 Days Refill ) MAX 30K TOMBOL REFILL', 'daily speed 7-10K Refill - Within 24-48 hours Drop - 5% Drop', 100, 30000, 20764.705882353, 'Active', 175, 'JOZPEDIA'),
(175, 176, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers - 30 Days Refill [ Min 100 - Max 10k ] [ SUPER FAST]', '- Instant - Speed 5k/Day - 30 days refill', 100, 10000, 18647.058823529, 'Active', 176, 'JOZPEDIA'),
(176, 177, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers Max 10K - 1 Mint START [Less Drop]', 'NO REFIL NO REFINDD', 100, 10000, 8529.4117647059, 'Active', 177, 'JOZPEDIA'),
(177, 178, 'Instagram TV', 'Instagram TV Views- Cheapest In Market [1M] 10K/DAY', 'Instagram TV Views- Cheapest In Market [1M] 10K/DAY', 100, 100000000, 1176.4705882353, 'Active', 178, 'JOZPEDIA'),
(178, 179, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers KDRT 1  ( Max - 5k ) ( NO REFILL ) INSTANT-6hrs', 'Instagram Followers ( Max - 5k ) ( NO REFILL ) INSTANT-6hrs', 100, 5000, 4588.2352941176, 'Active', 179, 'JOZPEDIA'),
(179, 180, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers KDRT 2 ( Max - 5k ) ( NO REFILL ) INSTANT-6hrs', ' 	No Refill / No Refund\r\n0-6 Hour Start\r\nSuperfast Speed\r\nMinimum 100\r\nMaximum 20,000 ', 100, 5000, 5470.5882352941, 'Active', 180, 'JOZPEDIA'),
(180, 181, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers KDRT 3 ( Max - 6k ) ( NO REFILL ) INSTANT', ' 	INSTANT-6HRS\r\nReal Followers\r\n6,000 Per day\r\nMin 100\r\nMax 6,000', 100, 6000, 5941.1764705882, 'Active', 181, 'JOZPEDIA'),
(181, 182, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers KDRT 4 [ Superfast ] [ Real ] [ Max 10k ] INSTANT-4hrs', ' 	INSTANT-4HRS\r\nReal Followers\r\n10,000 Per day\r\nMin 100\r\nMax 10,000', 100, 10000, 7941.1764705882, 'Active', 182, 'JOZPEDIA'),
(182, 183, 'Instagram Followers Indonesia', 'Instagram Followers Manado', 'ISNTANT HITUNGAN DETIK', 50, 2000, 44529.411764706, 'Active', 183, 'JOZPEDIA'),
(183, 184, 'Instagram Likes Indonesia', 'Instagram Likes Indonesia Instant NEW DB MAX 10K', 'INSTNT INPUT 5K 2KALI', 100, 5000, 5117.6470588235, 'Active', 184, 'JOZPEDIA'),
(184, 186, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers ( Max - 5k ) ( NO REFILL ) INSTANT-6hrs', 'INSTANT ', 100, 5000, 4528.2352941176, 'Active', 186, 'JOZPEDIA'),
(185, 187, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia [NEW][MAX 12K] INSTANT S2', 'INPUT 5K 2 KALI  !!! INSTANT', 100, 5000, 45705.882352941, 'Active', 187, 'JOZPEDIA'),
(186, 188, 'Instagram Followers Indonesia', 'Instagram Followers Aktip Maluku', 'Instagram Followers Aktip Maluku', 50, 1300, 45705.882352941, 'Active', 188, 'JOZPEDIA'),
(187, 189, 'Instagram Followers Indonesia', 'Instagram Followers Aktip Nusa Tenggara Barat', 'Instagram Followers Aktip  Nusa Tenggara Barat', 100, 1500, 48058.823529412, 'Active', 189, 'JOZPEDIA'),
(188, 190, 'Instagram Followers Indonesia', 'Instagram Followers Aktip Cilegon', 'fast', 100, 2000, 48058.823529412, 'Active', 190, 'JOZPEDIA'),
(189, 191, 'Instagram Followers Indonesia', ' 	Instagram Followers Aktip  Serang ', 'intant', 100, 3500, 46882.352941176, 'Active', 191, 'JOZPEDIA'),
(190, 192, 'Instagram Followers Indonesia', 'Instagram Followers Aktip Jambi', 'instant', 100, 5000, 48058.823529412, 'Active', 192, 'JOZPEDIA'),
(191, 193, 'Instagram Followers Indonesia', 'Instagram Followers Banjar Indonesia', 'Instagram Followers Banjar Indonesia', 100, 2000, 46882.352941176, 'Active', 193, 'JOZPEDIA'),
(192, 194, 'Instagram Followers Indonesia', 'Instagram Followers Pekalongan Indonesia', 'Instagram Followers Pekalongan Indonesia', 100, 3000, 48058.823529412, 'Active', 194, 'JOZPEDIA'),
(193, 195, 'Instagram Followers Indonesia', ' 	Instagram Followers Purwokerto Indonesia', ' 	Instagram Followers Purwokerto Indonesia', 100, 1800, 44529.411764706, 'Active', 195, 'JOZPEDIA'),
(194, 196, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - [NoRefill Norefund - Max 10k ] INSTANT', 'START 0-12 JAM ', 100, 10000, 6176.4705882353, 'Active', 196, 'JOZPEDIA'),
(195, 197, 'Instagram Likes', 'Instagram Likes [ Max 30k ] INSTANT (Recommended )', 'Instagram Likes [ Max 30k ] INSTANT (Recommended )', 100, 30000, 1694.1176470588, 'Active', 197, 'JOZPEDIA'),
(196, 198, 'Instagram Comments', 'Instagram Custom Comments Indonesia', 'Instant, Komentar perbaris', 5, 1000, 10411.764705882, 'Active', 198, 'JOZPEDIA'),
(197, 199, 'Instagram Story / Impressions / Saves', 'VIew Story Indonesia', 'INPUT USERNAME FAST ', 100, 2001, 8058.8235294118, 'Active', 199, 'JOZPEDIA'),
(198, 200, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [CHEAP] MAX 2K ', 'NO REFILL NO REFUNDD', 100, 2000, 3823.5294117647, 'Active', 200, 'JOZPEDIA'),
(199, 201, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - [ Norefill Norefund- Max 3K ] INSTANT', 'Instagram Followers ', 100, 3000, 8647.0588235294, 'Active', 201, 'JOZPEDIA'),
(200, 202, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers - [ 30days refill - Max 10k ] [ SUPER FAST ] INSTANT', ' 	- Instant\r\n- Speed 5k/Day\r\n- 30 days refill', 100, 10000, 20058.823529412, 'Active', 202, 'JOZPEDIA'),
(201, 203, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [30K] [REFILL 30 DAYS]  1-5% DROP ', 'REFILL BUTTON !\r\n1 - 6 Hours Start !\r\n5 to 10K per Day!\r\nR30 = Refill For 30 Days !\r\n24 to 48 Hours For Refill !\r\nMin = 300 !\r\n5 - 10% Drop Ratio ! ', 100, 30000, 23470.588235294, 'Active', 203, 'JOZPEDIA'),
(202, 204, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers KW 1 MAX 15K INSTANT', 'NO REFILL NO REFUND ', 100, 15000, 6882.3529411765, 'Active', 204, 'JOZPEDIA'),
(203, 205, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [45K] [INSTANT] PERDAY 500-2K', 'NO REFILL NO REFUND ', 100, 45000, 8235.2941176471, 'Active', 205, 'JOZPEDIA'),
(204, 206, 'Instagram Likes', 'Instagram Likes - [ ULTRAFAST ] [ Max - 10k ] [ 10 Seconds Start ]', 'BEST- Instagram Likes - [ ULTRAFAST ] [ Max - 10k ] [ 10 Seconds Start ]', 100, 10000, 1823.5294117647, 'Active', 206, 'JOZPEDIA'),
(205, 207, 'Instagram Views', 'Instagram Views [400K] [SLOW]', 'SLOW !!!', 100, 400000, 1042.3529411765, 'Active', 207, 'JOZPEDIA'),
(206, 208, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ 6K ] INSTANT', '0-3 JAM START ', 100, 6000, 4647.0588235294, 'Active', 208, 'JOZPEDIA'),
(207, 209, 'Instagram Followers No Refill/Not Guaranteed', 'INSTAGRAM FOLLOWERS MAX 6K - INSTANT START [Recommended]', 'INSTAGRAM FOLLOWERS MAX 6K - INSTANT START [Recommended]', 100, 6000, 7117.6470588235, 'Active', 209, 'JOZPEDIA'),
(208, 210, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia INSTANT MAX 15K ', 'input 5K 3 KALI \r\nSETELAH ORDERAN PERTAAMA SUKSES\r\nHITUNGAN DETIK \r\nCEPAT MASUK ', 100, 5000, 46882.352941176, 'Active', 210, 'JOZPEDIA'),
(209, 211, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ Max - 15k ] [ No refill ] INSTANT- FASTEST', ' 	Instant-6hrs\r\nFastest\r\nMin 100\r\nNo refill Guaranted', 100, 15000, 4823.5294117647, 'Active', 211, 'JOZPEDIA'),
(210, 212, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - [ Norefill Norefund- Max 3K ]FASTEST', ' 	Instant-6hrs\\r\\nFastest\\r\\nMin 100\\r\\nNo refill Guaranted', 100, 3000, 4470.5882352941, 'Active', 212, 'JOZPEDIA'),
(211, 213, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram FOLLOWERS baby S1 TERMURAH  FASTEST', ' 	Usually works instant -1 Hour\r\n\r\nDrop 10-20%', 100, 2000, 3588.2352941176, 'Active', 213, 'JOZPEDIA'),
(212, 214, 'Website Traffic', 'Website Traffic [1M] ', ' 	No Adfly / Linkshrink / Etc...\r\nYou Can Use Goo.gl To See The Traffic\r\n12 Hours Start!\r\n10K/Day\r\nMinimum 1000 ', 1000, 100000000, 3823.5294117647, 'Active', 214, 'JOZPEDIA'),
(213, 215, 'Website Traffic', 'Website Traffic [10M] [WW]', ' 	Instant Start !\r\n0 to 1 Hour !\r\nDaily Speed = 5k-10k\r\n100% Real People !!\r\nGoogle Analytics Supported\r\nAdSense Safe\r\nMin = 100', 100, 100000000, 11823.529411765, 'Active', 215, 'JOZPEDIA'),
(214, 216, 'Website Traffic', 'Website Traffic From Facebook [10M] [WW]', ' 	Traffic From Facebook !\r\nInstant Start !\r\n0 to 1 Hour !\r\nDaily Speed = 5k-10k\r\n100% Real People !!\r\nGoogle Analytics Supported\r\nAdSense Safe\r\nMin = 100', 100, 1000000000, 11823.529411765, 'Active', 216, 'JOZPEDIA'),
(215, 217, 'Website Traffic', 'Website Traffic From Instagram [10M] [WW] ', ' 	Traffic From Instagram !\r\nInstant Start !\r\n0 to 1 Hour !\r\nDaily Speed = 5k-10k\r\n100% Real People !!\r\nGoogle Analytics Supported\r\nAdSense Safe\r\nMin = 100', 100, 1000000000, 11823.529411765, 'Active', 217, 'JOZPEDIA'),
(216, 219, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers MAX 30K 10-15K/DAY ', 'Daily Speed 10-15k\r\nStart 0-1 Hour', 100, 30000, 6764.7058823529, 'Active', 219, 'JOZPEDIA'),
(217, 220, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [15K] [BEST IN THE MARKET] [REAL] [AUTO RREFILL30 DAYS]', ' 	BEST IN THE MARKET !\r\nSUPER INSTANT !\r\nAUTO REFILL 30 DAYS !\r\n15K Per Day Speed !\r\nMin = 20\r\nMax = 15k', 20, 15000, 30058.823529412, 'Active', 220, 'JOZPEDIA'),
(218, 221, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers Baby 2 CHEAP', 'NO REFILL NO REFUND \r\nDROP 20%\r\n', 200, 2000, 3352.9411764706, 'Active', 221, 'JOZPEDIA'),
(219, 222, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers Baby 6 { No Refill} [MAX5K]', ' 	NO REFILL - NO REFUND IN ANY CASE\r\n\r\nORDER Start 0-6 Hour.\r\n\r\nNo Refund for even if less followers delivered then quantity.', 100, 5000, 3529.4117647059, 'Active', 222, 'JOZPEDIA'),
(220, 223, 'Instagram Likes Indonesia', 'Like Indonesia Server Sementara MAX 800 IG UPDATE BOSKU ', 'FAST INTANT', 50, 800, 2764.7058823529, 'Active', 223, 'JOZPEDIA'),
(221, 224, 'Instagram Live Video', 'Comment Live Indonesia', 'input username \r\nsaat live baru input', 5, 700, 11470.588235294, 'Active', 224, 'JOZPEDIA'),
(222, 225, 'Instagram Live Video', 'Like Live Indonesia', 'SUBMIT SSAAT LIVE , INPUT USERNAMEE', 5, 700, 11588.235294118, 'Active', 225, 'JOZPEDIA'),
(223, 227, 'Instagram Story / Impressions / Saves', 'Instagram Cheapest Story Views - All story', 'new ', 100, 10000, 1211.7647058823, 'Active', 227, 'JOZPEDIA'),
(224, 228, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers MAX 5 {Promo - No Refill} NO KOMPLEN ', 'NO REFILL NO REFUND APAPUN MASLAHNYA \r\nORDER Start 0-6h (Sometimes Starts Instant)\r\n\r\nNo Refund for even if less followers delivered then quantity.\r\n\r\nCheap Service can partial \r\nHARGA BERBANDING DENGAN KUALITAS ', 100, 5000, 3470.5882352941, 'Active', 228, 'JOZPEDIA'),
(225, 229, 'Facebook Page Likes', 'Facebook Page Likes [HQ] [Non Drop, 30 Days Auto Refill, Super Fast] - INSTANT', 'Facebook Page Likes [HQ] [Non Drop, 30 Days Auto Refill, Super Fast] - INSTANT', 100, 100000, 98647.058823529, 'Active', 229, 'JOZPEDIA'),
(226, 230, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers Promo Termurah SEDUNIA 2 ', 'no refill no refund \\r\\nno komplen ', 1000, 1000, 2411.7647058824, 'Active', 230, 'JOZPEDIA'),
(227, 231, 'Youtube Views', 'Youtube Views [ 50K-500k/day ] [ 30 days REFILL ] INSTANT', 'Youtube - Views [ 50K-500k/day ] [ 30 days REFILL ] INSTANT', 100, 2147483647, 2882.3529411765, 'Active', 231, 'JOZPEDIA'),
(228, 233, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ Max - 10K ] [ No refill ] INSTANT Special Service', 'START 0-1JAM \r\nNO REFILL NO REFUND ', 500, 10000, 4647.0588235294, 'Active', 233, 'JOZPEDIA'),
(229, 234, 'Instagram Views', 'Instagram Views {Speed 100K - Instant Start}', 'instant', 1000, 100000000, 1054.1176470588, 'Active', 234, 'JOZPEDIA'),
(230, 235, 'Instagram Live Video', 'Instagram - Live Video Likes ( INSTANT )', ' 	Instagram - Live Video Likes ( INSTANT )', 200, 100000, 11470.588235294, 'Active', 235, 'JOZPEDIA'),
(231, 236, 'Instagram Live Video', ' 	Instagram - Live Video Custom Comments ( INSTANT )', ' 	Instagram - Live Video Custom Comments ( INSTANT )', 5, 400, 212764.70588235, 'Active', 236, 'JOZPEDIA'),
(232, 237, 'Instagram Likes / Likes + Impressions', 'Instagram Likes + Impressions [50K] REAL ', ' Instagram Likes + Impressions ', 50, 50000, 4294.1176470588, 'Active', 237, 'JOZPEDIA'),
(233, 238, 'Instagram Likes / Likes + Impressions', 'Instagram Impressions [1M] REAL', 'Instagram Impressions [1M] ', 100, 10000000, 2529.4117647059, 'Active', 238, 'JOZPEDIA'),
(234, 239, 'Instagram Likes / Likes + Impressions', 'Instagram Impressions [100K] ', ' 	Instagram Impressions [100K] ', 10, 1000000, 5176.4705882353, 'Active', 239, 'JOZPEDIA'),
(235, 240, 'Facebook Video Views / Live Stream', 'Facebook Video Views (10K-20K) Instant Start', 'Facebook Video Views (10K-20K) Instant Start', 1000, 100000000, 5529.4117647059, 'Active', 240, 'JOZPEDIA'),
(236, 241, 'Twitter Likes', 'Twitter Likes / Favorite ( Worldwide )', ' 	Twitter Likes / Favorite ( Worldwide )', 50, 1000000000, 75117.647058824, 'Active', 241, 'JOZPEDIA'),
(237, 242, 'Instagram TV', ' 	Instagram - TV Random Comments [ Instant ]', ' 	INSTANT SUPERFAST\r\nReal Users\r\nMinimum 5\r\nExample URL- https://www.instagram.com/tv/BkSp-6VF5AB/', 10, 1000000, 42352.941176471, 'Active', 242, 'JOZPEDIA'),
(238, 243, 'Instagram TV', 'Instagram - TV Random Emoji [ Instant ]', ' 	INSTANT SUPERFAST\r\nReal Users\r\nMinimum 5\r\nExample URL- https://www.instagram.com/tv/BkSp-6VF5AB/', 10, 1000000000, 42352.941176471, 'Active', 243, 'JOZPEDIA'),
(239, 244, 'Instagram TV', 'Instagram TV Custom MALE Comments [ Instant-1HRS ]', ' 	Instagram TV Custom MALE Comments [ Instant-1HRS ]', 20, 100, 374529.41176471, 'Active', 244, 'JOZPEDIA'),
(240, 245, 'Instagram TV', 'Instagram TV Random MALE Comments [ Instant-1HRS ]', 'Instagram TV Random MALE Comments [ Instant-1HRS ]', 10, 100, 301588.23529412, 'Active', 245, 'JOZPEDIA'),
(241, 246, 'Instagram TV', 'Instagram TV Random FEMALE Comments [ Instant-1HRS ]', 'Instagram TV Random FEMALE Comments [ Instant-1HRS ]', 10, 150, 301588.23529412, 'Active', 246, 'JOZPEDIA'),
(242, 247, 'Instagram TV', ' 	Instagram TV Custom FEMALE Comments [ Instant-1HRS ]', ' 	Instagram TV Custom FEMALE Comments [ Instant-1HRS ]', 20, 150, 374529.41176471, 'Active', 247, 'JOZPEDIA'),
(243, 248, 'Instagram TV', 'Instagram - TV Likes S2 [ Instant ]', '  	Instagram - TV Likes S2 [ Instant ]', 400, 2500, 6235.2941176471, 'Active', 248, 'JOZPEDIA'),
(244, 249, 'Instagram Story / Impressions / Saves', 'Instagram Story Views [15K] [ALL POSTS]', 'Instant Start\r\n30k / Day Speed !\r\nMin 100', 100, 15000, 1200, 'Active', 249, 'JOZPEDIA'),
(245, 250, 'Instagram Story / Impressions / Saves', 'Instagram Story Views ALL story', 'ALL STORIES !\r\nUSERNAME ONLY !\r\nINSTANT START !\r\nFAST DELIVERY !\r\nMin = 100\r\nMax = 15k', 100, 15000, 4882.3529411765, 'Active', 250, 'JOZPEDIA');
INSERT INTO `services` (`id`, `sid`, `category`, `service`, `note`, `min`, `max`, `price`, `status`, `pid`, `provider`) VALUES
(246, 251, 'Instagram Story / Impressions / Saves', 'Instagram Impressions [10M] [EXPLORE - HOME - LOCATION - PROFILE] ', ' 	Impressions showing from ALL in the statistics (Explore, Home, Location ,Etc..)!\r\nInstant Start!\r\nFast Delivery!\r\nMinimum 100\r\nMaximum 10M', 100, 2147483647, 2588.2352941176, 'Active', 251, 'JOZPEDIA'),
(247, 252, 'Instagram Story / Impressions / Saves', 'Instagram Story Views [MALE] [30K] ', ' 	Username Only\r\nViews from MALE users\r\n0-1 Hour Start!\r\n50K/Day\r\nMinimum 20', 20, 30000, 9411.7647058824, 'Active', 252, 'JOZPEDIA'),
(248, 253, 'Instagram Story / Impressions / Saves', 'Instagram Story Views [FEMALE] [30K] ', ' 	Username Only\r\nViews from FEMALE users\r\n0-1 Hour Start!\r\n50K/Day\r\nMinimum 20', 20, 30000, 9411.7647058824, 'Active', 253, 'JOZPEDIA'),
(249, 254, 'Instagram Story / Impressions / Saves', 'Ä°nstagram Saves 15K', 'Put Photo Link', 100, 15000, 1217.6470588235, 'Active', 254, 'JOZPEDIA'),
(250, 255, 'Youtube Likes / Comments / Favs...', 'YouTube Custom Comments ( Worldwide ) 0-10 Mints Start', ' 	YouTube Custom Comments ( Worldwide ) 0-10 Mints Start', 25, 50000, 100882.35294118, 'Active', 255, 'JOZPEDIA'),
(251, 256, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers ( Min 20 : Max 50K ) ( 30 Days Refill )', 'Instagram Followers ( Min 20 : Max 50K ) ( 30 Days Refill )', 25, 50000, 30588.235294118, 'Active', 256, 'JOZPEDIA'),
(252, 257, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [1K] [NO REFILL] ', '- Quality = Low / Medium !\\\\\\\\r\\\\\\\\n- Start Time = 0 to 6 Hours Start !\\\\\\\\r\\\\\\\\n- Speed = 3K-5K Per Day !\\\\\\\\r\\\\\\\\n- Refill = No Refill / Refund !\\\\\\\\r\\\\\\\\n- Min = 100 !\\\\\\\\r\\\\\\\\n- Max = 1K !\\\\\\\\r\\\\\\\\n- Specs = Orders May Partial Refund', 1000, 1000, 2529.4117647059, 'Active', 257, 'JOZPEDIA'),
(253, 258, 'Instagram TV', 'Instagram TV Views {6M} ', 'Instagram TV Views {6M} ', 1000, 600000000, 2111.7647058824, 'Active', 258, 'JOZPEDIA'),
(254, 259, 'Instagram TV', ' 	Instagram TV Views {2M}', ' 	Instagram TV Views {2M}', 2000, 2147483647, 1941.1764705882, 'Active', 259, 'JOZPEDIA'),
(255, 260, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes S2 [5K]', 'Facebook Post Likes 5k', 100, 5000, 2294.1176470588, 'Active', 260, 'JOZPEDIA'),
(256, 261, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers - [ 15 Days Refill ] [ 5k/day ]', 'Instagram Followers - [ 15 Days Refill ] [ 5k/day ]', 300, 5000, 9588.2352941176, 'Active', 261, 'JOZPEDIA'),
(257, 262, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers Max [100K] - INSTANT ALWAYS', 'FAST\r\nNO REFILL NO REFUND ', 100, 100000, 15588.235294118, 'Active', 262, 'JOZPEDIA'),
(258, 263, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ULTRAFAST - 1H START] ', 'NO REFILL NO REFUND ', 100, 2000, 3469.4117647059, 'Active', 263, 'JOZPEDIA'),
(259, 264, 'Instagram Followers No Refill/Not Guaranteed', 'Inatagram Followers Max 80K- Instant Start', 'NO REFILL NO REFUND', 200, 80000, 10647.058823529, 'Active', 264, 'JOZPEDIA'),
(260, 265, 'Instagram Likes', 'Instagram Likes [INSTANT] [ Max -5k ] INSTANT', 'SUPER FAST', 50, 5000, 1529.4117647059, 'Active', 265, 'JOZPEDIA'),
(261, 267, 'Youtube Likes / Comments / Favs...', 'Youtube - Likes [ Ultrafast ] [ Max 400k ] SUPER INSTANT', 'Likes can be Overdelivered!\r\nReal\r\nLife Time Refill Guarantee\r\n25,000-100,000 Per day\r\nMinimum 10', 100, 400000, 171588.23529412, 'Active', 267, 'JOZPEDIA'),
(262, 268, 'Twitter Views / Impressions / Live / Comments', 'Twitter Video Views [ 100k/day ] INSTANT', 'INPUT LINK', 100, 2147483647, 27588.235294118, 'Active', 268, 'JOZPEDIA'),
(263, 269, 'Twitter Views / Impressions / Live / Comments', 'Twitter Live Views [ 500 Max ] [ 15 Mins Time View ] INSTANT 2 ', 'Twitter Live Views [ 500 Max ] [ 15 Mins Time View ] INSTANT', 20, 500, 129235.29411765, 'Active', 269, 'JOZPEDIA'),
(264, 270, 'Twitter Views / Impressions / Live / Comments', 'Twitter Impression [ 100k/day ] INTANT FAST', 'Twitter Impression [ 100k/day ] INTANT FAST', 100, 2147483647, 27588.235294118, 'Active', 270, 'JOZPEDIA'),
(265, 271, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - [ Max - 60k ] [ NO PARTIAL ] SUPER INSTANT', ' 	SUPER INSTANT\r\nHIGH QUALITY\r\nNO REFILL\r\nSPEED - UPTO 40K/DAY\r\nMIN - 50\r\nMAX - 50K', 50, 60000, 12764.705882353, 'Active', 271, 'JOZPEDIA'),
(266, 272, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers - [ Max - 5k ] [ 15 Days Refill ] INSTANT FAST', ' 	Refill (15 Days Maximum)\r\n0-6 Hours Start!\r\n1k - 5K/Day\r\nMinimum 100', 100, 5000, 11705.882352941, 'Active', 272, 'JOZPEDIA'),
(267, 273, 'Instagram Likes', 'Instagram Likes [ Superfast ] [ Real ] [ Max -5k ] INSTANT !', ' 	Best & Cheapest Service!\r\nReal\r\nSuper Instant Delivery!\r\nMinimum 50', 50, 5000, 1458.8235294118, 'Active', 273, 'JOZPEDIA'),
(268, 274, 'Facebook Page Likes', 'Facebook Page Likes - [ Max - 500k ] [ 10k-20k/day ] INSTANT ', 'REFILL,CANCEL BUTTON ENABLED!\r\nINSTANT-1HRS\r\n30 Days Refill\r\nReal Likes\r\n10,000-20,000 Per day\r\nMinimum 100\r\nMaximum 500k', 100, 2147483647, 104529.41176471, 'Active', 274, 'JOZPEDIA'),
(269, 275, 'Twitter Retweets', 'Twitter Retweets [ HQ ] [ Worldwide ] [ No Refill ] INSTANT', 'Twitter Retweets -[ HQ ] [ Worldwide ] [ No Refill ] INSTANT', 10, 200000, 171588.23529412, 'Active', 275, 'JOZPEDIA'),
(270, 276, 'Twitter Poll Votes', 'Twitter Poll Votes [100M] !', 'Link Example: www....com?vote=ButtonNumber\r\n0-1 Hour Start!\r\n1K - 5K/Day\r\nMinimum 100', 100, 1000000000, 64882.352941176, 'Active', 276, 'JOZPEDIA'),
(271, 277, 'Twitter Poll Votes', 'Twitter Poll Votes [10M] !', 'Link Example: www....com?vote=ButtonNumber\r\n0-1 Hour Start!\r\n100K/Day\r\nMinimum 100', 100, 2147483647, 18176.470588235, 'Active', 277, 'JOZPEDIA'),
(272, 279, 'Youtube Views', ' Youtube Views [ 10k-50k/day ] [ HR ] [ No Refill Guarantee ] INSTANT', ' Youtube - Views [ 10k-50k/day ] [ HR ] [ No Refill Guarantee ] INSTANT', 500, 3000000, 16882.352941176, 'Active', 279, 'JOZPEDIA'),
(273, 280, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ Max - 12k ] [ No refill ] INSTANT', ' 	Instant-6hrs\r\nFastest\r\nMin 100\r\nNo refill Guaranted', 100, 12000, 4882.3529411765, 'Active', 280, 'JOZPEDIA'),
(274, 281, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [30K] [REFILL 20DAYS]', ' 	- Quality = Normal !\r\n- Start Time = Up to 12 Hours !\r\n- Speed = Up to 4k Per Day !\r\n- Refill = 20 Days !\r\n- Min = 200 !\r\n- Max = 30K !\r\n- Specs = Refill Starts after 24 to 48 Hours from request !', 100, 30000, 9529.4117647059, 'Active', 281, 'JOZPEDIA'),
(275, 283, 'Facebook Page Likes', 'Facebook Page Likes [1K] [NO REFILL] ', 'No refill / no refund\r\nMin: 100\r\nstart time: 1-36 hours\r\n10-20% drop\r\nspeed / day: 1k once started', 100, 1000, 25470.588235294, 'Active', 283, 'JOZPEDIA'),
(276, 284, 'Facebook Page Likes', 'Facebook Page Likes [20K] ', ' 	- Quality = REAL !\r\n- Start Time = Up to 48 Hours !\r\n- Speed = Up to 20k Per Day !\r\n- Refill = No Refill / Refund !\r\n- Min = 500 !\r\n- Max = 20K !\r\n- Specs =', 500, 20000, 30647.058823529, 'Active', 284, 'JOZPEDIA'),
(277, 286, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers Max 7K - Very Less Drop', 'NO REFILL NO REFUND ', 100, 7000, 5235.2941176471, 'Active', 286, 'JOZPEDIA'),
(278, 287, 'Facebook Page Likes', 'Facebook Page Like Min 100 Max 5000{0-3H Start}{15 days refill}', ' 	- Min 500 - Max 5000 - Refill 30 days - Any order takes less 24 ( if overload will complete 72 h max ) - Real and Active People 100% Most Of Them Arab !\r\n\r\nNo Cancellation In between 72 Hours!', 200, 5000, 48647.058823529, 'Active', 287, 'JOZPEDIA'),
(279, 288, 'Instagram Likes', 'Instagram Likes [1 Million ] [Real] [ 100k/Day - Instant]', 'Instagram Likes [1 Million ] [Real] [ 100k/Day - Instant]', 100, 10000000, 2470.5882352941, 'Active', 288, 'JOZPEDIA'),
(280, 289, 'Instagram Likes', 'Instagram Female Likes - 5K', 'Instagram Female Likes - 5k', 10, 5000, 3470.5882352941, 'Active', 289, 'JOZPEDIA'),
(281, 290, 'Instagram Likes', 'Instagram Male Likes - 2K', 'Instagram Male Likes - 2k', 100, 2000, 3470.5882352941, 'Active', 290, 'JOZPEDIA'),
(282, 291, 'Twitter Followers', 'Twitter Followers [5K] [MIX] [7 DAYS REFILL]', 'Username Only\r\nMixed Quality\r\n7 Days AUTO Refill !\r\n0-1 Hour Start!\r\n1K -5K/Day\r\nMinimum 20', 20, 5000, 85705.882352941, 'Active', 291, 'JOZPEDIA'),
(283, 292, 'Youtube Likes / Comments / Favs...', 'Youtube Likes [ Max 5K ] [ Speed 50 - 100/DAYS ] - NON DROP ', 'SLOW PROSES KARENA SEHARI HANYA BISA 50-100 LIKE YA \r\nSTART 12-24 JAM \r\nNON DROP ', 10, 5000, 65117.647058824, 'Active', 292, 'JOZPEDIA'),
(284, 293, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Photo Likes 5K Instant Start ', 'Facebook Photo Likes 5K Instant Start', 100, 5000, 3352.9411764706, 'Active', 293, 'JOZPEDIA'),
(285, 294, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - [ Max 5K ] [ Super FAST ] - No Partial!', ' 	- No Refill / No Refund\r\n- 6 Hour Start\r\n- Superfast Speed\r\n- Minimum 100', 100, 5000, 15000, 'Active', 294, 'JOZPEDIA'),
(286, 295, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [No refill Norefund] - Max 10K Min 500', 'START 0-6JM ', 500, 10000, 4294.1176470588, 'Active', 295, 'JOZPEDIA'),
(287, 296, 'Instagram Views', 'Instagram Views MAX 2K  Rp 10', 'Instagram Views Rp 5', 500, 2000, 1011.7647058824, 'Active', 296, 'JOZPEDIA'),
(288, 297, 'Youtube Views', 'Youtube Views Lifetime Guarantee ( Recommended Service ) ( CEK NOTE )', ' 	Best Service!\r\n- Life Time Guaranteed\r\n- 100k-300k/day\r\n- 4-6 Mins Retention\r\n- Worldwide Views\r\nOperating system : Android Views\r\n\r\nNote: If you see order mark as completed, But views not appear, Just click on the LIKE button, Views will be appear within 30 SECONDS.', 100, 10000000, 16941.176470588, 'Active', 297, 'JOZPEDIA'),
(289, 298, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes [1K] REAL', ' 	0-1 Hour Start !\r\nMix Quality Accs !\r\nFast Speed !\r\nMin = 100 !', 100, 1000, 4176.4705882353, 'Active', 298, 'JOZPEDIA'),
(290, 299, 'Youtube Views', 'Youtube - Views [HR ] [ Life Time Guaranteed ] [ 100k-200k/day ] INSTANT', ' 	Instant Start\r\n100k-200k/day speed\r\nLifetime refill guarantee\r\n70-90% Watch Time\r\nWindows desktop watch page & embedded views\r\n100 Minimum order', 100, 2147483647, 15882.352941176, 'Active', 299, 'JOZPEDIA'),
(291, 300, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers Wanita [5K] 80-90% FOLLOWERS WANITA', ' 	80-90% FEMALE\r\nNO REFILL NO REFUND\r\n0-2 HOUR START', 350, 5000, 9529.4117647059, 'Active', 300, 'JOZPEDIA'),
(292, 303, 'SoundCloud', 'SoundCloud Likes [1M] ', ' 	Real\r\n0-1 Hour Start!\r\n1K - 10K/Day\r\nMinimum 20', 20, 10000000, 35705.882352941, 'Active', 303, 'JOZPEDIA'),
(293, 304, 'Pinterest', 'Pinterest RePins [10M] ,', ' 	Real\r\n0-1 Hour Start!\r\n1K - 10K/Day\r\nMinimum 20', 20, 2147483647, 54176.470588235, 'Active', 304, 'JOZPEDIA'),
(294, 305, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [25K]] [[Refill 20days]]', 'Refill (20 Days Maximum)\r\n0-24 Hours Start!\r\n2k - 3K/Day\r\nMinimum 100', 100, 25000, 16411.764705882, 'Active', 305, 'JOZPEDIA'),
(295, 306, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [10K] [REFILL 30 DAYS ] [NON DROP] [EXCLUSIVE] ', 'Exclusive Service!\r\nRefill (30 Days Maximum)\r\n0 to 8 Hours Start !\r\nHigh Speed Delivery!\r\nMax = 10K\r\nSuper High Quality!\r\nRefill Button !\r\nMinimum 200', 200, 10000, 26294.117647059, 'Active', 306, 'JOZPEDIA'),
(296, 307, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [10K] [RREFILL30 DAYS ] AKTIP', ' 	Real\r\nRefill (30 Days Maximum)\r\n0-3 Hours Start!\r\nMinimum 100', 100, 10000, 25588.235294118, 'Active', 307, 'JOZPEDIA'),
(297, 308, 'Youtube Likes / Comments / Favs...', 'Youtube - Comments [RANDOM] [100] [FEMALE] [USA] INSTANT', ' 	- Instant-1hrs Start time\r\n- Only FEMALE Profile from USA\r\n- High Quality Niche Related Random Comments\r\n- 100/day\r\n- No refill\r\n- Minimum 10 and Maximum 100', 10, 100, 648058.82352941, 'Active', 308, 'JOZPEDIA'),
(298, 309, 'Youtube Likes / Comments / Favs...', 'Youtube - Comments [CUSTOM] [100] [FEMALE] [USA] NSTANT-1hrs', ' 	- Instant-1hrs Start Time\r\n- Only FEMALE Profile From USA\r\n- High Quality Custom Comments\r\n- 100/day\r\n- No refill\r\n- Minimum 10 and Maximum 100', 10, 100, 959823.52941176, 'Active', 309, 'JOZPEDIA'),
(299, 311, 'Instagram Story / Impressions / Saves', 'Instagram - Story Views [MALE] [ Max - 30k ] INSTANT', ' 	Username Only\r\nViews from MALE users\r\n0-1 Hour Start!\r\n50K/Day\r\nMinimum 20', 20, 30000, 6352.9411764706, 'Active', 311, 'JOZPEDIA'),
(300, 312, 'Instagram Story / Impressions / Saves', 'Instagram - Story Views [FEMALE] [ Max - 30k ] INSTANT', ' 	Username Only\r\nViews from FEMALE users\r\n0-1 Hour Start!\r\n50K/Day\r\nMinimum 20', 20, 30000, 6352.9411764706, 'Active', 312, 'JOZPEDIA'),
(301, 313, 'Instagram Story / Impressions / Saves', 'Instagram - Story Views [LAST STORY ONLY] [ Max - 30k ] INSTANT', ' 	Views On The Last Story Posted Only!\r\nUsername Only\r\n0-1 Hour Start!\r\nUltra Fast!\r\nMinimum 20', 20, 30000, 3588.2352941176, 'Active', 313, 'JOZPEDIA'),
(302, 314, 'Instagram Story / Impressions / Saves', 'Instagram - Highlights Views [ Max - 20k ] INSTANT', ' 	Get Instagram Highlights Views on ALL your HIGHLIGHTS!\r\nAdd Username Only!\r\nMin 20, Max 20k ', 20, 20000, 41470.588235294, 'Active', 314, 'JOZPEDIA'),
(303, 315, 'Instagram Story / Impressions / Saves', 'Instagram Photo ( Impression + Location + Explore + Home+ Profile ) INSTANT', 'Its good for ranking!\r\nMin 100\r\nMaximum 1 million!', 100, 1000000, 5294.1176470588, 'Active', 315, 'JOZPEDIA'),
(304, 316, 'Instagram Story / Impressions / Saves', 'Instagram - Story Views [ Superfast ] INSTANT', 'INSTANT START\r\nRELIABLE SERVICE\r\nFOR ALL STORY\r\n50K/DAY\r\nMIN 100, MAX 100K', 100, 100000, 2058.8235294118, 'Active', 316, 'JOZPEDIA'),
(305, 317, 'Youtube Views', 'Youtube Views [ HR ] [ 100k-200k/day ] INSTANT', 'Instant Start\r\n100k-200k/day speed\r\nLifetime refill guarantee\r\n70-90% Watch Time\r\nWindows desktop watch page & embedded views\r\n100 Minimum order', 100, 2147483647, 15764.705882353, 'Active', 317, 'JOZPEDIA'),
(306, 323, 'Twitter Followers', 'Twitter Followers [ Max - 5k ] [ Mixed Quality ] [ 7 days AUTO REFILL ] INSTANT', ' 	Mixed Quality\r\n7 Days AUTO Refill\r\n0-1 Hour Start!\r\n1K -5K/Day\r\nMinimum 20', 20, 5000, 77470.588235294, 'Active', 323, 'JOZPEDIA'),
(307, 324, 'Youtube Views', 'Youtube - Views [ 20k-30k/day ] [ No Refill ] INSTANT !', '- No refill Guarantee ( If order today drop after Next few hours still no refill )\r\n- Views can drop in any ratio ( if drop )\r\n- 2-4 mins Retention', 1000, 10000, 13411.764705882, 'Active', 324, 'JOZPEDIA'),
(308, 325, 'Youtube Views', 'Youtube Views Lifetime Guarantee ( Recommended Service ) ( Min 100 and Max 1 Million )', ' 	Best Service!\r\n- Life Time Guaranteed\r\n- 100k-300k/day\r\n- 4-6 Mins Retention\r\n- Worldwide Views\r\nOperating system : Android Views\r\n\r\nNote: If you see order mark as completed, But views not appear, Just click on the LIKE button, Views will be appear within 30 SECONDS.', 100, 500000000, 13470.588235294, 'Active', 325, 'JOZPEDIA'),
(309, 326, 'Instagram Story / Impressions / Saves', 'Instagram Cheapest Story Views - All story Username only', 'username inly ', 500, 15000, 1176.4705882353, 'Active', 326, 'JOZPEDIA'),
(310, 327, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers Max 15K - Very Less Drop', 'no refill no refund \r\n0-2 H start { Service has 2-5% Drop as of now }\r\n', 250, 15000, 5058.8235294118, 'Active', 327, 'JOZPEDIA'),
(311, 328, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [20K] [REFILL 60 DAYS] [BEST IN THE MARKET]', ' 	FASTEST 60 DAYS REFILL SERVICE !\r\nSUPER INSTANT !\r\n60 Days Refill !\r\nREFILL BUTTON !\r\n20K Per Day Speed !\r\nMin = 10\r\nMax = 20k', 100, 20000, 33941.176470588, 'Active', 328, 'JOZPEDIA'),
(312, 329, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [10K] [REFILL 30 DAYS] [SUPER FAST]', ' 	Exclusive Service!\r\nRefill (30 Days Maximum)\r\nSUPER INSTANT START !\r\nHigh Speed Delivery!\r\nMax = 10K\r\nSuper High Quality!\r\nRefill Button !\r\nMinimum 100', 100, 10000, 25941.176470588, 'Active', 329, 'JOZPEDIA'),
(313, 330, 'Instagram Likes', 'Instagram Likes 5k - Fast - Cheap', 'fast', 100, 5000, 1364.7058823529, 'Active', 330, 'JOZPEDIA'),
(314, 331, 'Youtube Views', 'Youtube - View [ HR ] [ No Refill Guarantee ] INSTANT [50-100K speed]', '80-100% retention\r\nInstant Start\r\nNo refill / No refund', 500, 100000000, 12411.764705882, 'Active', 331, 'JOZPEDIA'),
(315, 332, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia [LAKI LAKI] [ HITUNGAN DETIK ]', 'USERNAME ONLY \r\nJANGAN PAKE LINK ATAU @ \r\n', 10, 2500, 48058.823529412, 'Active', 332, 'JOZPEDIA'),
(316, 333, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia [PEREMPUAN] [ HITUNGAN DETIK ]', 'USERNAME ONLY \r\nTANPA @', 100, 2500, 48058.823529412, 'Active', 333, 'JOZPEDIA'),
(317, 334, 'Facebook Page Likes', 'Facebook Page Likes ( Max 3k ) (30 days refill) ( 1k Per day Speed ) (Instant)', ' 	instant start\r\n30 days refill\r\nmin 200 max 1000', 200, 3000, 73705.882352941, 'Active', 334, 'JOZPEDIA'),
(318, 335, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [25K] [20 days refill]', 'Starts 4-6 hours\r\nSpeed 3-5k/Day\r\nRefill - 24 to 48 hours after you raise ticket.', 250, 25000, 10411.764705882, 'Active', 335, 'JOZPEDIA'),
(319, 336, 'Instagram Likes', 'Instagram Likes 5K - Fast INSTANT Cheap', 'instant', 100, 5000, 1329.4117647059, 'Active', 336, 'JOZPEDIA'),
(320, 337, 'Instagram Likes', 'Instagram Female Likes - 7k', 'Instagram Female Likes - 7k', 20, 7000, 3470.5882352941, 'Active', 337, 'JOZPEDIA'),
(321, 338, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes [5K] ', ' 	Cheapest in The Market !\r\nPut Link Of Facebook Profile/Page Post\r\nHQ Accs\r\n0-1 Hour Start!\r\n5K/Day\r\nMinimum 100', 100, 5000, 3352.9411764706, 'Active', 338, 'JOZPEDIA'),
(322, 339, 'Youtube Views', 'Youtube Views S2 [ Normal Views Cek note] [ FULL RETENTION ] [ Life Time Guaranteed ]', 'INSTANT-1HRS\r\n150k-300k/day speed\r\nLifetime refill guarantee\r\n80-95% Watch Time!\r\nReferrer Twitter, Facebook!\r\nWindows desktop watch page & embedded views\r\n100 Minimum order', 100, 1000000, 13411.764705882, 'Active', 339, 'JOZPEDIA'),
(323, 340, 'Youtube Views', ' Youtube - Views [ Life Time Guaranteed ] [ 100-250k/day ] INSTAN', 'Instant Start\r\n100k-250k/day speed\r\nLifetime refill guarantee\r\n70-90% Watch Time\r\nWindows desktop watch page & embedded views\r\n500 Minimum order\r\nBest service!', 100, 10000000, 13411.764705882, 'Active', 340, 'JOZPEDIA'),
(324, 341, 'Instagram Live Video', 'Instagram Live Video Views [10K]', ' 	Username Only\r\nNo Refill / No Refund\r\nViews On Live Video\r\nFast Delivery\r\nMinimum 200\r\nIF you ask for Refund, You need to send a screenshot\r\nas a proof with the # of views and Time in the screenshot !', 25, 100000, 83941.176470588, 'Active', 341, 'JOZPEDIA'),
(325, 342, 'Instagram Live Video', 'Instagram Live Video Views [3K] [ALWAYS WORKING] ', 'Instagram Live Video Views [3K] [ALWAYS WORKING] ', 10, 3000, 115117.64705882, 'Active', 342, 'JOZPEDIA'),
(326, 343, 'Instagram Likes Indonesia', 'Instagram Likes Komentar [BACA NOTE]', 'Like dahulu komentar yang ditargetkan, isi input Target dengan username yang membuat komentar, isi input Link Post dengan link post target. ,, \r\nProses 1-10 menit ', 10, 700, 9235.2941176471, 'Active', 343, 'JOZPEDIA'),
(327, 344, 'Instagram Likes', 'Instagram LIKES ( Fast ) Min 100 | Max 10000 ( Super Fast )', 'Instagram LIKES ( Fast ) Min 100 | Max 10000 ( Super Fast )', 100, 10000, 1341.1764705882, 'Active', 344, 'JOZPEDIA'),
(328, 345, 'Youtube Views', 'Youtube - Views [ HR ] [ NO REFILL ] [ 100K-300k/day ] INSTANT', ' 	Instant Start\r\n80% Retention\r\nWorldwide Views\r\nWindows desktop watch page & embedded views\r\n\r\nNote: If you see order mark as completed, But views not appear, click on the LIKE button, Views will appear within 30 SECONDS.', 100, 2147483647, 8411.7647058824, 'Active', 345, 'JOZPEDIA'),
(329, 346, 'Youtube Views', 'Youtube - Views [ HR ] [ AUTO REFILL ] [ Life Time Guaranteed ] [ 100k-300k/day ] INSTANT 	', 'Instant Start\r\n70-90% Retention\r\nWorldwide Views\r\nOver-Delivery Guaranteed\r\nSocial Referrer Views\r\nWindows desktop watch page & embedded views\r\n\r\nNote: If you see order mark as completed, But views not appear, click on the LIKE button, Views will appear within 30 SECONDS.', 100, 10000000, 9352.9411764706, 'Active', 346, 'JOZPEDIA'),
(330, 347, 'Instagram Followers [Refill] [Guaranteed] [NonDrop', 'Instagram Followers [5K] [REFILL30 DAYS ]', ' 	0 to 6 Hours Start !\r\n30 Days Refill !\r\nNo Refill If Your Old Followers Drop !\r\nMin = 50 !\r\nMax = 5k ! \r\nTIDAK REFILL UNTUK FOLLOWERS LAMA ', 100, 5000, 9352.9411764706, 'Active', 347, 'JOZPEDIA'),
(331, 348, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [40K] [NO PARTIAL] [SUPER INSTANT] ', '- Quality = SUPER HIGH !\r\n- Start Time = SUPER INSTANT !\r\n- Speed = Up to 40k Per Day !\r\n- Refill = No Refill / Refund !\r\n- Min = 50 !\r\n- Max = 40K !\r\n- Specs = NO PARTIAL - ALWAYS WORKING !', 50, 40000, 12411.764705882, 'Active', 348, 'JOZPEDIA'),
(332, 349, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [EXCLUSIVE] [2K] [LQ]', ' 	- Quality = Low !\r\n- Start Time = Up to 24 Hours !\r\n- Speed = Up to 2k Per Day !\r\n- Refill = No Refill / Refund !\r\n- Min = 150 !\r\n- Max = 3K !\r\n- Specs = Might Have Partial Issues !', 150, 2000, 3000, 'Active', 349, 'JOZPEDIA'),
(333, 350, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [5K] [LOW QUALTY]', ' 	Username Only\r\nLow Quality\r\nNo Refill / No Refund\r\n0-1 Hour Start!\r\nMinimum 100', 100, 5000, 3823.5294117647, 'Active', 350, 'JOZPEDIA'),
(334, 351, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia NEW DB [HITUNGAN DETIK]', 'submit langsung masuk', 50, 5000, 44529.411764706, 'Active', 351, 'JOZPEDIA'),
(335, 352, 'Youtube Views', 'Youtube - Views [ 300-500k/day ] [ HR ] [ No refill ] INSTANT', 'Best Service!\r\n- No Refill Guarantee\r\n- 300k-500k/day\r\n- 60-80% Retention\r\n- Min 100, Max Unlimited!\r\n\r\nNote: If you see order mark as completed, But views not appear, click on the LIKE button, Views will appear within 30 SECONDS.', 100, 10000000, 6235.2941176471, 'Active', 352, 'JOZPEDIA'),
(336, 353, 'Facebook Followers / Friends / Group Members', 'Facebook Followers [5K] [REFILL30 DAYS ]', 'For Facebook Profiles And Not Pages\r\nReal\r\nRefill (30 Days Maximum)\r\n0-1 Hour Start!\r\n5K/Day\r\nMinimum 100', 100, 5000, 13588.235294118, 'Active', 353, 'JOZPEDIA'),
(337, 354, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [10K] [RECOMMENDED] [SUPER INSTANT]', 'SUPER INSTANT COMPLETION\r\nTOP SELLING\r\nUsername Only\r\nHQ\r\nNo Refill / No Refund\r\nMinimum 100', 100, 10000, 7235.2941176471, 'Active', 354, 'JOZPEDIA'),
(338, 357, 'Youtube Views', 'Youtube - Views [ 30k-50k/day ] [ No Refill Guarantee ] {Cheapest}', 'NO REFILL NO REFUND  ', 200, 2147483647, 6000, 'Active', 357, 'JOZPEDIA'),
(339, 358, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ Max 5K ]  [0-3 JAM] NO REFILL NO REFUND ', 'NO FILL NO REFUND ', 100, 5000, 4176.4705882353, 'Active', 358, 'JOZPEDIA'),
(340, 359, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ MAX 5K ] [NO REFILL NO REFUND ] 0-6 JAM', 'NO REFUND NO REFUND ', 100, 5000, 3705.8823529412, 'Active', 359, 'JOZPEDIA'),
(341, 360, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers High Quallty SUPER FAST [Max10] [NOREFILL NO REFUND]', 'NO REFIND NO REFUND ', 100, 10000, 6705.8823529412, 'Active', 360, 'JOZPEDIA'),
(342, 27887, 'Twitter Retweets', 'Kontol,panel taik', 'Panel busuk', 1587, 75877, 568, 'Active', 45, 'JOZPEDIA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `service_cat`
--

CREATE TABLE `service_cat` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `service_cat`
--

INSERT INTO `service_cat` (`id`, `name`, `code`) VALUES
(1, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia'),
(2, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers No Refill/Not Guaranteed'),
(3, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]'),
(4, 'Instagram Likes', 'Instagram Likes'),
(5, 'Instagram Views', 'Instagram Views'),
(6, 'Instagram Auto Comments / Impressions / Saves', 'Instagram Auto Comments / Impressions / Saves'),
(7, 'Youtube Likes / Comments / Favs...', 'Youtube Likes / Comments / Favs...'),
(8, 'SoundCloud', 'SoundCloud'),
(9, 'Pinterest', 'Pinterest'),
(10, 'Telegram', 'Telegram'),
(11, 'Google', 'Google'),
(12, 'Instagram Auto Likes', 'Instagram Auto Likes'),
(13, 'Instagram Story / Impressions / Saves', 'Instagram Story / Impressions / Saves'),
(14, 'Facebook Video Views / Live Stream', 'Facebook Video Views / Live Stream'),
(15, 'Twitter Views / Impressions / Live / Comments', 'Twitter Views / Impressions / Live / Comments'),
(16, 'Instagram Auto Likes - 7 Days Subscription', 'Instagram Auto Likes - 7 Days Subscription'),
(17, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes / Comments / Shares / Events'),
(18, 'Instagram TV', 'Instagram TV'),
(19, 'Facebook Followers / Friends / Group Members', 'Facebook Followers / Friends / Group Members'),
(20, 'Facebook Page Likes', 'Facebook Page Likes'),
(21, 'Youtube Views', 'Youtube Views'),
(22, 'Instagram Likes Indonesia', 'Instagram Likes Indonesia'),
(23, 'Instagram Comments', 'Instagram Comments'),
(24, 'Website Traffic', 'Website Traffic'),
(25, 'Instagram Live Video', 'Instagram Live Video'),
(26, 'Instagram Likes / Likes + Impressions', 'Instagram Likes / Likes + Impressions'),
(27, 'Twitter Likes', 'Twitter Likes'),
(28, 'Twitter Retweets', 'Twitter Retweets'),
(29, 'Twitter Poll Votes', 'Twitter Poll Votes'),
(30, 'Twitter Followers', 'Twitter Followers');

-- --------------------------------------------------------

--
-- Struktur dari tabel `staff`
--

CREATE TABLE `staff` (
  `id` int(10) NOT NULL,
  `name` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `contact` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `level` enum('Admin','Reseller') COLLATE utf8_swedish_ci NOT NULL,
  `pict` text COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transfer_balance`
--

CREATE TABLE `transfer_balance` (
  `id` int(10) NOT NULL,
  `sender` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `receiver` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `quantity` double NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `balance` double NOT NULL,
  `level` enum('Member','Agen','Reseller','Admin','Developers') COLLATE utf8_swedish_ci NOT NULL,
  `registered` date NOT NULL,
  `status` enum('Active','Suspended') COLLATE utf8_swedish_ci NOT NULL,
  `api_key` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `uplink` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `balance`, `level`, `registered`, `status`, `api_key`, `uplink`, `email`) VALUES
(3, 'demo', 'demo', 100, 'Developers', '2018-09-25', 'Active', '5Z0OTiaD7C8rNlVF8dSe', 'admin', 'demo@oper.com');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `service_cat`
--
ALTER TABLE `service_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transfer_balance`
--
ALTER TABLE `transfer_balance`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `provider`
--
ALTER TABLE `provider`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- AUTO_INCREMENT untuk tabel `service_cat`
--
ALTER TABLE `service_cat`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `transfer_balance`
--
ALTER TABLE `transfer_balance`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
