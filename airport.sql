-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Apr 2019 pada 10.46
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airport`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAirlines` ()  BEGIN
SELECT * FROM airlines;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `airlines`
--

CREATE TABLE `airlines` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo` text,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `airlines`
--

INSERT INTO `airlines` (`id`, `name`, `logo`, `description`) VALUES
(4, 'Garuda Indonesia', 'http://192.168.0.103/upload/garuda.png', 'Garuda Indonesia'),
(5, 'Lion Air', 'https://s3-ap-southeast-1.amazonaws.com/airy-marketing/pictures/logo+lion+air.jpg', 'Ini lion air'),
(6, 'Citilink', 'https://pbs.twimg.com/profile_images/378800000706293424/5456801fe0bc55ad5b30ed65b215000c_400x400.jpeg', 'Citilink');

-- --------------------------------------------------------

--
-- Struktur dari tabel `airports`
--

CREATE TABLE `airports` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  `address` text,
  `city` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `airports`
--

INSERT INTO `airports` (`id`, `name`, `code`, `address`, `city`) VALUES
(1, 'JAKARTA TC', 'JKTC', 'Jakarta', 'Jakarta'),
(3, 'Ngurah Rai', 'DPS', 'Denpasar', 'Denpasar - Bali'),
(4, 'Surabaya SUBC', 'SUBC', 'Surabaya', 'Surabaya'),
(5, 'Medan', 'MESC', 'Medan Indonesia', 'Medan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text,
  `birthdate` date DEFAULT NULL,
  `gender_id` int(11) NOT NULL DEFAULT '1',
  `phone` varchar(16) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`id`, `email`, `password`, `name`, `address`, `birthdate`, `gender_id`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'djakajaya89@gmail.comm', '$2y$10$aXIDyWukpCsBrsOxsIbixuFw57E4n8Hi.o8K77W5jMwZ99rLbZ6iS', 'Djaka Pradana', 'Pasir Wetan', '2001-11-05', 1, '082137748549', '2019-04-17 11:43:23', '0000-00-00 00:00:00'),
(4, 'test@gmail.com', '$2y$10$ffNIlFdCsHgLb7msnNiWh.KXB/NE2CBW93CwSpWnVuO4RUGqO2U9W', 'test', 'asdad', '2019-04-17', 1, '12313213', '2019-04-17 13:18:48', '2019-04-17 12:21:14'),
(6, 'test@gmail.comm', '$2y$10$aIXSarHzprLT7envoa2fG.izGi4bdDvgJG3MEyz7kOKtZI9ZYmbai', 'test', NULL, NULL, 1, NULL, '2019-04-18 03:34:22', '2019-04-18 03:34:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `genders`
--

CREATE TABLE `genders` (
  `id` int(11) NOT NULL,
  `name` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `genders`
--

INSERT INTO `genders` (`id`, `name`) VALUES
(1, 'Laki - laki'),
(2, 'Perempuan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `levels`
--

CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `levels`
--

INSERT INTO `levels` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Staff');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0184d2191e40541f3631772f2c6fec25cba8d425a1782216d8d321958eead4b3a450dd5a9600a40a', 1, 1, 'MyApp', '[]', 0, '2019-04-15 18:35:05', '2019-04-15 18:35:05', '2020-04-16 01:35:05'),
('0649be33b4300c1d0f0ed4abe4a37c4353076899873a61db21291f4fefb2faaa39b2cb776bfc7d72', 4, 1, 'MyApp', '[]', 0, '2019-04-17 12:21:14', '2019-04-17 12:21:14', '2020-04-17 19:21:14'),
('0f7e78b7a6583a55a17ae0fbfa5cbcf96fc41ff150c0e9faef07eec1ba7f66725b0395cabdeaf830', 1, 1, 'MyApp', '[]', 0, '2019-04-16 04:19:06', '2019-04-16 04:19:06', '2020-04-16 11:19:06'),
('112c40687bd1cca8c92fdf4ce17feb801b027597e7a6a7e2531418e2a5ae48e3aaa459bc67168b99', 1, 1, 'MyApp', '[]', 0, '2019-04-17 00:58:51', '2019-04-17 00:58:51', '2020-04-17 07:58:51'),
('140e96bebb6ae229255d6e096abaab62dec761adad18d9f93a83133771e2ec21714e2720bd36cc48', 1, 1, 'MyApp', '[]', 0, '2019-04-17 00:50:15', '2019-04-17 00:50:15', '2020-04-17 07:50:15'),
('1667a1c5b64e6cf7cc763b5b06d89488f18c65d3e2c244d3f4bfa978e4fccb93ea398f6296da835e', 1, 1, 'MyApp', '[]', 0, '2019-04-18 01:21:32', '2019-04-18 01:21:32', '2020-04-18 08:21:32'),
('1cc691d1c72c4eeef00aaf77e38afb14860db0e8c750e58c7465f62c701fe67a2d1f0183db791f4f', 1, 1, 'MyApp', '[]', 0, '2019-04-17 04:42:42', '2019-04-17 04:42:42', '2020-04-17 11:42:42'),
('20df0f8d33cedfacaf4ba5e2382d8efba65c819ca18c3ca676d47330890a25a620cac723e635aab2', 1, 1, 'MyApp', '[]', 0, '2019-04-16 14:25:30', '2019-04-16 14:25:30', '2020-04-16 21:25:30'),
('287405fab7b8bfdf6caeac7f12e1c0453103a7dd2073365c848ef5bc9bdf3ed3aaa44032337fb821', 2, 1, 'MyApp', '[]', 0, '2019-04-17 11:46:23', '2019-04-17 11:46:23', '2020-04-17 18:46:23'),
('2939a1457d5e968ffbcc617bd07ec8879a66bbb9ef4b2614dfdf43570370010459007729cf792e33', 1, 1, 'MyApp', '[]', 0, '2019-04-15 18:33:57', '2019-04-15 18:33:57', '2020-04-16 01:33:57'),
('2c1eb652492da18e33748ebe018480bdf65069e3adc0b097146db6bdca916e9964664744654daf6a', 1, 1, 'MyApp', '[]', 0, '2019-04-16 23:58:05', '2019-04-16 23:58:05', '2020-04-17 06:58:05'),
('2e3003ecdd54c61feb3995d0420b83883fee09886e1b07675121e4421008a6f800656cc6c3cb5a14', 1, 1, 'MyApp', '[]', 0, '2019-04-11 03:36:39', '2019-04-11 03:36:39', '2020-04-11 10:36:39'),
('2ebf78a379edd0782dafb2ab5ebf65a24aaaaf639b8ed5811c745a7fb6292031daea2128a9edb1cd', 1, 1, 'MyApp', '[]', 0, '2019-04-16 14:36:59', '2019-04-16 14:36:59', '2020-04-16 21:36:59'),
('32d4d53a27a2ecb9d2d0d0f586a92c226ec661019d7606aadc494bb7ab8d387c7029ffcb04f598fd', 1, 1, 'MyApp', '[]', 0, '2019-04-17 01:36:59', '2019-04-17 01:36:59', '2020-04-17 08:36:59'),
('3ec3786b8c1c951b9a04a1a05ebc3caedb6c9358f0afebf7114ce8dc940ced8cfd0b38abb82215ee', 1, 1, 'MyApp', '[]', 0, '2019-04-17 04:11:14', '2019-04-17 04:11:14', '2020-04-17 11:11:14'),
('473d93759c7e28a4386068a150d36eee11f8a9dca97bbd88e10ab40351bc28305a460fde5a4643e8', 1, 1, 'MyApp', '[]', 0, '2019-04-17 01:18:18', '2019-04-17 01:18:18', '2020-04-17 08:18:18'),
('4866ad7c86309bec0c9f29307ca211713b047c833195555f8f54aecf51aece0fdc321e23a0ec16b1', 1, 1, 'MyApp', '[]', 0, '2019-04-12 21:36:27', '2019-04-12 21:36:27', '2020-04-13 04:36:27'),
('4bfc01de88528e901f69e46f8836116faa542e4933f7bb4d5283ca6ffaf7a0e9508077861ce84194', 1, 1, 'MyApp', '[]', 0, '2019-04-15 18:25:08', '2019-04-15 18:25:08', '2020-04-16 01:25:08'),
('4f35505d14cabb1afadd524dc6beebc4887f0a876f364696e010962675eae943a908fb1bb886e2b5', 1, 1, 'MyApp', '[]', 0, '2019-04-17 00:03:11', '2019-04-17 00:03:11', '2020-04-17 07:03:11'),
('532759d2b57f1bf42b3fd0e47a8879d244cfd76c57c91052618dbdcfa6e37da6766094cfbedd4f8a', 1, 1, 'MyApp', '[]', 0, '2019-04-15 19:05:30', '2019-04-15 19:05:30', '2020-04-16 02:05:30'),
('53ba1f9b5f0803a85dea25dbf41473b0c6340225e0ed1c14018c0f84cc9f479c584992e7a0f1a89c', 1, 1, 'MyApp', '[]', 0, '2019-04-15 19:36:36', '2019-04-15 19:36:36', '2020-04-16 02:36:36'),
('53c07a60db5e3d40dd3a5e0fd8ddaa9a7778508e14a3d5e7238bd4d8b5998d7d408505f1f55f08c0', 1, 1, 'MyApp', '[]', 0, '2019-04-17 04:27:56', '2019-04-17 04:27:56', '2020-04-17 11:27:56'),
('5f78445e2f15cb62bfba36e31883e852c0ce20b232cfede47af9cafcd3bba94d7d5634e4066c40a3', 1, 1, 'MyApp', '[]', 0, '2019-04-17 00:26:09', '2019-04-17 00:26:09', '2020-04-17 07:26:09'),
('60d4b8de7c34ff6a41ada24e9dfe6693545a685bf55e070e0ce9d2e90895432dc462c987f9a26e85', 1, 1, 'MyApp', '[]', 0, '2019-04-17 01:20:01', '2019-04-17 01:20:01', '2020-04-17 08:20:01'),
('6446d35fbc12bf50cb26f1b16f802b247c3bda15cb561a65ff3d941345f15a35230a06d5ede09a58', 5, 1, 'MyApp', '[]', 0, '2019-04-17 13:16:59', '2019-04-17 13:16:59', '2020-04-17 20:16:59'),
('6625d9830aa09350b3be7f8c1300618e9be405f50bd065408eb6abfc65643c477afb49d57b881cec', 1, 1, 'MyApp', '[]', 0, '2019-04-17 01:46:41', '2019-04-17 01:46:41', '2020-04-17 08:46:41'),
('677669e89406378deb800816df0a453eda1e232b099135309210673cf6b807d68d2bd6fa4dac0bc3', 1, 1, 'MyApp', '[]', 0, '2019-04-17 00:22:49', '2019-04-17 00:22:49', '2020-04-17 07:22:49'),
('6eccfce89921d0d08488e11f6fe4bbce408c9daa291ed9829d1a1b9a25fdd9556a15f4a8a059782b', 1, 1, 'MyApp', '[]', 0, '2019-04-17 00:53:01', '2019-04-17 00:53:01', '2020-04-17 07:53:01'),
('7286521cf5ec227876226681ba6dd64d5ee3e987ce0aa776bb23fbc5de0efe8f9bfef3f7831205d2', 1, 1, 'MyApp', '[]', 0, '2019-04-16 16:57:22', '2019-04-16 16:57:22', '2020-04-16 23:57:22'),
('7291894b837aab54c7f259ed1a3d1326efec6264f23467070d2d8a9d2e52d1f1e5ccd7c955a65adf', 4, 1, 'MyApp', '[]', 0, '2019-04-17 16:44:46', '2019-04-17 16:44:46', '2020-04-17 23:44:46'),
('7ae0a5adbb44388d00f72452233ea2341d3b1a3000d0cac8fbaabf249e92028fffc7df96a5be3089', 1, 1, 'MyApp', '[]', 0, '2019-04-16 14:34:32', '2019-04-16 14:34:32', '2020-04-16 21:34:32'),
('80598f2c3d8289dcd94665adf36217f15e0c9c1752dbb34ff89352fa8c27569684e11db9bd3a1030', 1, 1, 'MyApp', '[]', 0, '2019-04-17 01:40:50', '2019-04-17 01:40:50', '2020-04-17 08:40:50'),
('8596b0266a4f544231800d95de04db6730d77ed19b2c11708acc3e6b00ce9317d9d45fa34c62868b', 1, 1, 'MyApp', '[]', 0, '2019-04-15 18:20:32', '2019-04-15 18:20:32', '2020-04-16 01:20:32'),
('87d1843509e561ff4381ed94b9665894fc857338790c55035f69ec5f0c9b2710834f789f55df367b', 1, 1, 'MyApp', '[]', 0, '2019-04-17 03:56:26', '2019-04-17 03:56:26', '2020-04-17 10:56:26'),
('9398d1fbc95e78616be08ecb9dda88c6438389742b0bea8ef73858e089cfe602a8f993bc7931b79a', 6, 1, 'MyApp', '[]', 0, '2019-04-18 03:34:22', '2019-04-18 03:34:22', '2020-04-18 10:34:22'),
('94f2dcd2606d537ead7f5b555181204a0ef05f39bf52c7686aa1d4d5d371a4a6c0f3af2e74c08627', 1, 1, 'MyApp', '[]', 0, '2019-04-17 00:33:34', '2019-04-17 00:33:34', '2020-04-17 07:33:34'),
('96f78bede952797972b38d9a4a16c3acc1ad0953c2507aadea1e79412aa304aac59242ea96eca440', 1, 1, 'MyApp', '[]', 0, '2019-04-17 03:52:59', '2019-04-17 03:52:59', '2020-04-17 10:52:59'),
('97268e0f87152aca79a0b91d4ae45c1bb3e854a3ed4a520f7a05cde4e774b958558d2b5cdea72185', 1, 1, 'MyApp', '[]', 0, '2019-04-15 07:15:34', '2019-04-15 07:15:34', '2020-04-15 14:15:34'),
('9a1f1f955c3c264ef5c9828a9997e2ff0790030303ad31d0d0e8bec6def04a78a9c12b4830f6ddbd', 1, 1, 'MyApp', '[]', 0, '2019-04-17 00:13:30', '2019-04-17 00:13:30', '2020-04-17 07:13:30'),
('9ffcfa215c577a3b29b396b4b70cfd536c424a5cc0574b3acd32bc7e61d30e2d8d3198958d5b6614', 1, 1, 'MyApp', '[]', 0, '2019-04-16 14:57:52', '2019-04-16 14:57:52', '2020-04-16 21:57:52'),
('a423159aacccdecf71cff6eeb2fe41a33d4baaa808504c0d6985e221afa7234bb7326763db064798', 1, 1, 'MyApp', '[]', 0, '2019-04-17 07:03:27', '2019-04-17 07:03:27', '2020-04-17 14:03:27'),
('a579a1490a8edb11fb592deb4b8f491e555689d405a3732ebd0f9b84372261e0159d99a371d80f90', 1, 1, 'MyApp', '[]', 0, '2019-04-16 14:50:24', '2019-04-16 14:50:24', '2020-04-16 21:50:24'),
('a9f108d006c4fc9ce3bdb2ac06a06837f30c8e88d5abdac3b25fdbeb6d43a8c8dd7f97f675ca34d1', 1, 1, 'MyApp', '[]', 0, '2019-04-16 14:58:38', '2019-04-16 14:58:38', '2020-04-16 21:58:38'),
('acea9c9ba7d36fae9c8f1957eb56426573e1f5c1ce8899a15d1bfe036c7015ee1064a882bb6b85cf', 1, 1, 'MyApp', '[]', 0, '2019-04-17 03:57:50', '2019-04-17 03:57:50', '2020-04-17 10:57:50'),
('ad54d27010ba01ee9c4787412780770e136b6297afef17343d57d1946fa147266163eb5610b71911', 1, 1, 'MyApp', '[]', 0, '2019-04-16 15:01:51', '2019-04-16 15:01:51', '2020-04-16 22:01:51'),
('ae3603d2507515712e32fd2d4ec332790adfa2e71e61d0dfeff7ecfcea871c8dafbf4b650be7e941', 3, 1, 'MyApp', '[]', 0, '2019-04-17 11:47:12', '2019-04-17 11:47:12', '2020-04-17 18:47:12'),
('b76a00fc96bf7087da0826ece5c03d1e0986f905a1d82873e7f50b7c8cd756a94300eb850922ce33', 1, 1, 'MyApp', '[]', 0, '2019-04-15 18:32:47', '2019-04-15 18:32:47', '2020-04-16 01:32:47'),
('b86a80a6d49288b4bc830747da64d700e211cf13bf5d0b5c04b3b14a65e964406d7a06ac6f57bdfe', 1, 1, 'MyApp', '[]', 0, '2019-04-17 01:31:27', '2019-04-17 01:31:27', '2020-04-17 08:31:27'),
('ba7d526d3a5ac3a436015548816400ea142e9cbbb4e0e665039d2acc154b37d051cb2234eb80c037', 1, 1, 'MyApp', '[]', 0, '2019-04-17 13:38:21', '2019-04-17 13:38:21', '2020-04-17 20:38:21'),
('baea4a2128ff1aab36a13173419a6b3703d36a1b60d4d1fd31cab8bb5a66be5b12824eff8061e8f6', 1, 1, 'MyApp', '[]', 0, '2019-04-12 21:14:00', '2019-04-12 21:14:00', '2020-04-13 04:14:00'),
('bf8f54c216049da81edccf570b88a9ec419a8d37f56e06e99edaabad42f8c40e60b1b1ff30b6ffdc', 1, 1, 'MyApp', '[]', 0, '2019-04-17 00:04:45', '2019-04-17 00:04:45', '2020-04-17 07:04:45'),
('c6bf9166000d619f1d35f85251f451856b048278f51c822345661dee64e4802276db7153b2d425fd', 1, 1, 'MyApp', '[]', 0, '2019-04-15 18:18:15', '2019-04-15 18:18:15', '2020-04-16 01:18:15'),
('c756adb841822bf4128b27e93cd8922b47c8ecf1dd18d6bcfccf8e453513330c76f76a0f637d797d', 1, 1, 'MyApp', '[]', 0, '2019-04-15 07:20:39', '2019-04-15 07:20:39', '2020-04-15 14:20:39'),
('cbbde3e838ac8df87e3ea849e1472fdd6c8aafa8adc5afa11e8cb7ef9936a586c7cb1791c929bac6', 1, 1, 'MyApp', '[]', 0, '2019-04-12 21:36:16', '2019-04-12 21:36:16', '2020-04-13 04:36:16'),
('d523ca799dc5119abe252b0cbe58b8e299122e62eff5de4c74f541a9196cb96fed1994bb71a1099d', 1, 1, 'MyApp', '[]', 0, '2019-04-17 00:16:21', '2019-04-17 00:16:21', '2020-04-17 07:16:21'),
('d9b213c072592aafaf8d9245777d8df0584fa8b18c837956567c401c9282a8cb9253698a9020367d', 1, 1, 'MyApp', '[]', 0, '2019-04-19 08:44:56', '2019-04-19 08:44:56', '2020-04-19 15:44:56'),
('dc70556a0f6870fd5240a7491e325b9c1ed2d105911c7229b01eea273d16a193ff7e3c96b68ef1d9', 1, 1, 'MyApp', '[]', 0, '2019-04-17 04:41:24', '2019-04-17 04:41:24', '2020-04-17 11:41:24'),
('dd632c4cd0356b244c9184316b969abc8e26567ef4037828b29f21f8778cae10b2f319785e231b6e', 1, 1, 'MyApp', '[]', 0, '2019-04-15 19:02:13', '2019-04-15 19:02:13', '2020-04-16 02:02:13'),
('dda153544a969b691a0d9ef533019c424cd5c4d68e13195654d1f9d33995849637db3898ce98ca4a', 1, 1, 'MyApp', '[]', 0, '2019-04-17 00:37:24', '2019-04-17 00:37:24', '2020-04-17 07:37:24'),
('e083a5d0e10a7f38f513c14747118ae0e3e34ea01c8163a20aa7545cce230368ad8f76f74f7b3bbf', 1, 1, 'MyApp', '[]', 0, '2019-04-15 07:17:13', '2019-04-15 07:17:13', '2020-04-15 14:17:13'),
('e2582c2427fa3deef3a7f3a7315763adcd1c8001a614fe77f1c3682c60c7389e4df791d259d0502e', 1, 1, 'MyApp', '[]', 0, '2019-04-17 00:40:30', '2019-04-17 00:40:30', '2020-04-17 07:40:30'),
('e9ba66f115cea24f8e360a57e9435a5298d2628062081f8225f7ba86b839acf4d4cb400d635a0556', 1, 1, 'MyApp', '[]', 0, '2019-04-16 17:02:56', '2019-04-16 17:02:56', '2020-04-17 00:02:56'),
('f4277d1c98be3a2da163cb5c4640cbe8e9ba8d2b2ac17fa4ab6a0bb772965d3436a965daed75d799', 4, 1, 'MyApp', '[]', 0, '2019-04-18 00:53:50', '2019-04-18 00:53:50', '2020-04-18 07:53:50'),
('fa4a60bc4a189681f45a48a41191ee59a287dac6d87b0aed711b5810f36f3e933d9f33f5fe038f46', 1, 1, 'MyApp', '[]', 0, '2019-04-15 18:21:32', '2019-04-15 18:21:32', '2020-04-16 01:21:32'),
('febdbd0b39c053bee9f9f16875ff0ead255bb8df0736ed2a0662015cf13bbb2dd02b8a9f8e3e5a46', 1, 1, 'MyApp', '[]', 0, '2019-04-15 18:34:16', '2019-04-15 18:34:16', '2020-04-16 01:34:16'),
('febe4e61bfa8cc6416cca8b301a21cbdbfffec9d12cf14e728f98c52a4efec21d1844cc3a76443f2', 1, 1, 'MyApp', '[]', 0, '2019-04-17 01:45:13', '2019-04-17 01:45:13', '2020-04-17 08:45:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'Z7owyjY8qT1N5fDIGxDKARooFhhv9RrCwP0PzAkt', 'http://localhost', 1, 0, 0, '2019-04-11 03:36:12', '2019-04-11 03:36:12'),
(2, NULL, 'Laravel Password Grant Client', 'frlcQyy8jBqd6yOvNd5UwbPNRmOHmpCOY18rebQK', 'http://localhost', 0, 1, 0, '2019-04-11 03:36:12', '2019-04-11 03:36:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-04-11 03:36:12', '2019-04-11 03:36:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `planes`
--

CREATE TABLE `planes` (
  `id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `seat_row` int(11) NOT NULL,
  `seat_column` int(11) NOT NULL,
  `airline_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `planes`
--

INSERT INTO `planes` (`id`, `code`, `seat_row`, `seat_column`, `airline_id`) VALUES
(1, 'GI-531', 7, 4, 4),
(2, 'LA-531', 7, 4, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `res_code` varchar(32) NOT NULL,
  `res_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `res_loc` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `seat_code` varchar(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `checkin_at` datetime NOT NULL,
  `depart_at` datetime NOT NULL,
  `cost` double NOT NULL,
  `status_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `payment_proof` text,
  `try_count` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `reservations`
--

INSERT INTO `reservations` (`id`, `res_code`, `res_date`, `res_loc`, `customer_id`, `seat_code`, `route_id`, `destination_id`, `checkin_at`, `depart_at`, `cost`, `status_id`, `staff_id`, `name`, `gender_id`, `payment_proof`, `try_count`, `created_at`, `updated_at`) VALUES
(1, 'D00000000001', '2019-04-13 19:00:56', 'Jakarta', 1, 'A1', 1, 3, '2019-04-19 21:00:00', '2019-04-19 23:00:00', 100000, 2, 2, 'Djaka Pradana Jaya Priambudi', 1, 'http://192.168.0.103/upload/1555490592.png', 0, '2019-04-13 19:18:13', '2019-04-17 16:50:23'),
(12, 'D177233599', '2019-04-17 11:13:52', 'Jakarta', 4, 'A3', 1, 3, '2019-04-19 21:00:00', '2019-04-19 21:00:00', 400000, 1, NULL, 'asdadad', 1, 'http://192.168.0.103/upload/1555550559.jpg', 0, '2019-04-17 11:13:52', '2019-04-18 01:22:39'),
(17, 'D175157085', '2019-04-17 17:48:34', 'Jakarta', 4, 'E19', 1, 3, '2019-04-19 21:00:00', '2019-04-19 21:00:00', 400000, 3, 1, 'gaafsdbfghjck', 1, NULL, 0, '2019-04-17 17:48:34', '2019-04-17 11:35:58'),
(18, 'D172602529', '2019-04-17 20:19:28', 'Jakarta', 4, 'C10', 1, 3, '2019-04-19 21:00:00', '2019-04-19 21:00:00', 400000, 2, 2, 'Hi', 1, 'http://192.168.0.103/upload/1555519571.jpg', 0, '2019-04-17 20:19:28', '2019-04-17 16:51:59'),
(19, 'D171253505', '2019-04-18 07:55:52', 'Jakarta', 4, 'C11', 1, 3, '2019-04-19 21:00:00', '2019-04-19 21:00:00', 400000, 1, NULL, 'Hii', 1, 'http://192.168.0.103/upload/1555549709.jpg', 0, '2019-04-18 07:55:52', '2019-04-18 01:08:29'),
(20, 'D178321970', '2019-04-18 08:09:23', 'Jakarta', 4, 'B7', 1, 3, '2019-04-19 21:00:00', '2019-04-19 21:00:00', 400000, 3, 1, 'Hii', 1, NULL, 0, '2019-04-18 08:09:23', '2019-04-18 01:16:41'),
(21, 'D173923102', '2019-04-18 08:09:24', 'Jakarta', 4, 'B8', 1, 3, '2019-04-19 21:00:00', '2019-04-19 21:00:00', 400000, 3, 1, 'Hiii', 0, NULL, 0, '2019-04-18 08:09:24', '2019-04-18 01:18:17'),
(22, 'D172384673', '2019-04-18 08:19:35', 'Jakarta', 4, 'D14', 1, 3, '2019-04-19 21:00:00', '2019-04-19 21:00:00', 400000, 3, 1, 'Babnana', 1, NULL, 0, '2019-04-18 08:19:35', '2019-04-18 01:19:43'),
(23, 'D172608175', '2019-04-18 08:20:43', 'Jakarta', 4, 'B6', 1, 3, '2019-04-19 21:00:00', '2019-04-19 21:00:00', 400000, 3, 1, 'Jajakka', 1, NULL, 0, '2019-04-18 08:20:43', '2019-04-18 01:21:01'),
(24, 'D171085748', '2019-04-18 08:20:43', 'Jakarta', 4, 'B8', 1, 3, '2019-04-19 21:00:00', '2019-04-19 21:00:00', 400000, 3, 1, 'Hahhaja', 2, NULL, 0, '2019-04-18 08:20:43', '2019-04-18 01:21:04'),
(25, 'D172352308', '2019-04-18 08:20:43', 'Jakarta', 4, 'D16', 1, 3, '2019-04-19 21:00:00', '2019-04-19 21:00:00', 400000, 3, 1, 'Bahaba', 0, NULL, 0, '2019-04-18 08:20:43', '2019-04-18 01:21:06'),
(26, 'D175951108', '2019-04-18 08:20:43', 'Jakarta', 4, 'E17', 1, 3, '2019-04-19 21:00:00', '2019-04-19 21:00:00', 400000, 3, 1, 'Hahahha', 0, NULL, 0, '2019-04-18 08:20:43', '2019-04-18 01:21:07'),
(30, 'D177731119', '2019-04-18 09:45:52', 'Jakarta', 1, 'D14', 1, 3, '2019-04-19 21:00:00', '2019-04-19 21:00:00', 400000, 3, 1, 'Djaka', 1, 'http://192.168.0.103/upload/1555557528.jpg', 0, '2019-04-18 09:45:52', '2019-04-18 03:18:57'),
(31, 'D171759882', '2019-04-18 09:47:17', 'Jakarta', 1, 'D14', 1, 3, '2019-04-19 21:00:00', '2019-04-19 21:00:00', 400000, 2, 1, 'Djaka', 1, NULL, 0, '2019-04-18 09:47:17', '2019-04-18 02:47:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `routes`
--

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `airport_from_id` int(11) NOT NULL,
  `airport_to_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `plane_id` int(11) NOT NULL,
  `depart_at` datetime NOT NULL,
  `arrived_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `routes`
--

INSERT INTO `routes` (`id`, `airport_from_id`, `airport_to_id`, `price`, `plane_id`, `depart_at`, `arrived_at`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 400000, 1, '2019-04-19 21:00:00', '2019-04-20 04:00:00', '2019-04-15 18:09:45', '0000-00-00 00:00:00'),
(2, 3, 1, 500000, 2, '2019-04-19 07:11:54', '2019-04-19 10:11:59', '2019-04-15 18:12:10', '2019-04-15 18:12:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `statuses`
--

CREATE TABLE `statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `statuses`
--

INSERT INTO `statuses` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Sukses'),
(3, 'Gagal'),
(4, 'Banned');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_id` int(11) NOT NULL DEFAULT '2',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `level_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Djaka Pradana Jaya Priambudii', 'djakajaya89@gmail.com', NULL, '$2y$10$yr/vq5EpiAkqbMlxmGaFwOn9VxMTG3W2FPcEg52LpfE58rQhDogNe', 1, NULL, '2019-04-11 03:35:18', '2019-04-17 16:36:29');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `airlines`
--
ALTER TABLE `airlines`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indeks untuk tabel `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`code`),
  ADD KEY `airlines_id` (`airline_id`);

--
-- Indeks untuk tabel `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_code` (`res_code`,`customer_id`,`seat_code`,`route_id`,`depart_at`),
  ADD KEY `route_id` (`route_id`),
  ADD KEY `user_id` (`customer_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indeks untuk tabel `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `airport_from` (`airport_from_id`,`airport_to_id`,`plane_id`),
  ADD KEY `airport_to` (`airport_to_id`);

--
-- Indeks untuk tabel `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `level_id` (`level_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `airlines`
--
ALTER TABLE `airlines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `airports`
--
ALTER TABLE `airports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `genders`
--
ALTER TABLE `genders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `planes`
--
ALTER TABLE `planes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `planes`
--
ALTER TABLE `planes`
  ADD CONSTRAINT `planes_ibfk_1` FOREIGN KEY (`airline_id`) REFERENCES `airlines` (`id`);

--
-- Ketidakleluasaan untuk tabel `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `reservations_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Ketidakleluasaan untuk tabel `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`airport_from_id`) REFERENCES `airports` (`id`),
  ADD CONSTRAINT `routes_ibfk_2` FOREIGN KEY (`airport_to_id`) REFERENCES `airports` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
