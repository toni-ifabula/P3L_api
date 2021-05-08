-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2021 at 06:18 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `180709861`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID_CUSTOMER` int(11) NOT NULL,
  `NAMA_CUSTOMER` varchar(255) DEFAULT NULL,
  `EMAIL_CUSTOMER` varchar(255) DEFAULT NULL,
  `TELEPON_CUSTOMER` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID_CUSTOMER`, `NAMA_CUSTOMER`, `EMAIL_CUSTOMER`, `TELEPON_CUSTOMER`) VALUES
(5, 'bbb', 'bbb@gmail.com', '45674567'),
(6, 'qwe', 'qwe@gmail.com', '08345673456'),
(11, 'ccc', 'ccc@gmail.com', '45674567');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `ID_PESANAN` int(11) NOT NULL,
  `ID_MENU` int(11) NOT NULL,
  `JUMLAH_ITEM_PESANAN` decimal(3,0) DEFAULT NULL,
  `SUBTOTAL_ITEM_PESANAN` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detail_stok_bahan`
--

CREATE TABLE `detail_stok_bahan` (
  `ID_DETAIL_STOK` int(11) NOT NULL,
  `ID_STOK` int(11) NOT NULL,
  `TANGGAL_MASUK_STOK` date DEFAULT NULL,
  `INCOMING_STOK` decimal(10,0) DEFAULT NULL,
  `REMAINING_STOK` decimal(10,0) DEFAULT NULL,
  `WASTE_STOK` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_stok_bahan`
--

INSERT INTO `detail_stok_bahan` (`ID_DETAIL_STOK`, `ID_STOK`, `TANGGAL_MASUK_STOK`, `INCOMING_STOK`, `REMAINING_STOK`, `WASTE_STOK`) VALUES
(3, 1, '2020-02-02', '1000', '40', '20'),
(4, 1, '2021-06-06', '666', '66', '6'),
(5, 3, '2021-04-07', '34', '23', '21'),
(6, 1, '2021-04-07', '111', '111', '12'),
(7, 3, '2021-04-03', '333', '333', '13'),
(8, 6, '2021-04-02', '4000', '4000', '40');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `ID_KARYAWAN` int(11) NOT NULL,
  `ID_ROLE` int(11) NOT NULL,
  `NAMA_KARYAWAN` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `JENIS_KELAMIN_KARYAWAN` varchar(255) DEFAULT NULL,
  `TELEPON_KARYAWAN` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `TANGGAL_GABUNG_KARYAWAN` date DEFAULT NULL,
  `STATUS_KARYAWAN` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`ID_KARYAWAN`, `ID_ROLE`, `NAMA_KARYAWAN`, `password`, `JENIS_KELAMIN_KARYAWAN`, `TELEPON_KARYAWAN`, `email`, `TANGGAL_GABUNG_KARYAWAN`, `STATUS_KARYAWAN`) VALUES
(1, 1, 'Nana', '$2b$10$./22uqVjWzteD9/FJW/stOOrsREauOBVgKh575NZ0jVLJsfuLTId6', 'Perempuan', '0897654326', 'nana@gmail.com', '2020-02-20', 'Aktif'),
(3, 5, 'budi', '$2y$10$HT4ki6kb7eQUqzDVeeNadOf8GvJ7uah.o6.ZnbuIhCj8S1GzrFXr2', 'Laki-laki', '0897654321', 'budi@gmail.com', '2020-02-20', 'Resign'),
(9, 1, 'qweee', '$2y$10$CIApJ2HqF7ZigLNJRkN/F.GSvkcn4BZ4MeQCRSF/3IP9CXVZzy9Je', 'Perempuan', '08123452123', 'qwe@gmail.com', '2021-04-08', 'Resign'),
(10, 3, 'test waiter', '$2y$10$9q/pn4Xn36u8r6/N02zw8uUkggNf/S6o3jY4e/L1B/47iIv8SleP2', 'Perempuan', '0852722625', 'testwaiter@gmail.com', '2020-02-15', 'Aktif'),
(11, 2, 'test', '$2y$10$8rpw1BIY.pXuEP9KkZesguVGLWq8ECQL0/5.bw3d6xY5sB7uc6ECi', 'Laki-laki', '4567877777', 'test@gmail.com', '2021-05-13', 'Aktif'),
(12, 5, 'toni nugraha', '$2y$10$80REKa2Yst1.zelMvaPkYecgKdDT/lMfjjJYppAL6Hji.JXtLUD4y', 'Perempuan', '0834564549', 'toniii@gmail.com', '2021-04-06', 'Resign');

-- --------------------------------------------------------

--
-- Table structure for table `meja`
--

CREATE TABLE `meja` (
  `ID_MEJA` int(11) NOT NULL,
  `NOMOR_MEJA` decimal(3,0) DEFAULT NULL,
  `STATUS_MEJA` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meja`
--

INSERT INTO `meja` (`ID_MEJA`, `NOMOR_MEJA`, `STATUS_MEJA`) VALUES
(1, '141', 'Kosong'),
(3, '146', 'Isi'),
(7, '144', 'Kosong');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `ID_MENU` int(11) NOT NULL,
  `ID_STOK` int(11) NOT NULL,
  `KATEGORI_MENU` varchar(255) DEFAULT NULL,
  `NAMA_MENU` varchar(255) DEFAULT NULL,
  `DESKRIPSI_MENU` varchar(255) DEFAULT NULL,
  `UNIT_MENU` varchar(255) DEFAULT NULL,
  `HARGA_MENU` decimal(10,0) DEFAULT NULL,
  `IMAGE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`ID_MENU`, `ID_STOK`, `KATEGORI_MENU`, `NAMA_MENU`, `DESKRIPSI_MENU`, `UNIT_MENU`, `HARGA_MENU`, `IMAGE`) VALUES
(5, 3, 'Minuman', 'qwe', 'qweqweqwe', 'qwe', '123', NULL),
(6, 3, 'Makanan Side Dish', 'ccc', 'cccc', 'Plate', '2000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2021_04_05_045858_create_karyawans_table', 1),
(10, '2021_04_05_060344_create_roles_table', 1),
(11, '2021_04_05_065742_create_mejas_table', 1),
(12, '2021_04_05_071350_create_customers_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0219bbcf786ec3bdbd87088b0e954938c74af841bce869589164a3adc766bd5a8a293eff42cb06fa', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 03:59:10', '2021-04-14 03:59:10', '2022-04-14 10:59:10'),
('09d82b1da0f6d4a6d870205c6aef8b575aadeb0a9e529f20f13a0fd16f99506709d5c9a86f892684', 11, 1, 'Authentication Token', '[]', 0, '2021-04-28 22:55:08', '2021-04-28 22:55:08', '2022-04-29 05:55:08'),
('0a956431290fc5f35dce30e0ff70b508c230683b6e4c693224bdbfbd237d49bb0a6e189faf40a79b', 1, 1, 'Authentication Token', '[]', 0, '2021-04-28 22:19:39', '2021-04-28 22:19:39', '2022-04-29 05:19:39'),
('0eb2d0c771463cce319b7d51e94813b5b51c70a049344b380b44134634e7c380baf3e87fa9616749', 1, 1, 'Authentication Token', '[]', 0, '2021-04-06 03:13:33', '2021-04-06 03:13:33', '2022-04-06 10:13:33'),
('168c10174fe54e2ffc9301379cfd3562dc5eda909e3884e1c50516798b10dda5058f5375566caa4c', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 03:57:31', '2021-04-14 03:57:31', '2022-04-14 10:57:31'),
('1ad087b1e93b4ec569c0f944b85c3aab612942e85d5a4b9196546781e3b94ff41718e6b84d11f4b7', 3, 1, 'Authentication Token', '[]', 0, '2021-04-16 08:06:59', '2021-04-16 08:06:59', '2022-04-16 15:06:59'),
('1cd26f5cb10622c4df40691c683ec69830fca0d49c9e072ff9893324f8a6da11555f902214578362', 9, 1, 'Authentication Token', '[]', 0, '2021-04-27 05:11:09', '2021-04-27 05:11:09', '2022-04-27 12:11:09'),
('27c416afef9790fdd627726c06118813050d34e97d320ddee50e075ddde2a24f11acb3d822afb740', 11, 1, 'Authentication Token', '[]', 0, '2021-04-29 00:24:47', '2021-04-29 00:24:47', '2022-04-29 07:24:47'),
('355e68f5c910ef8f4548985f95cc6dd04191d5e4828ae60cadd6ce72a770b0cb13cfda84cd88720d', 11, 1, 'Authentication Token', '[]', 0, '2021-04-28 07:14:47', '2021-04-28 07:14:47', '2022-04-28 14:14:47'),
('3d848ad7cc7e77988d19ab952f29cd93edf3639aa070d86b28b7645c7d961824d2ec036ef8271cd3', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 03:57:44', '2021-04-14 03:57:44', '2022-04-14 10:57:44'),
('46b458bf5c59f3c10bb6d6595187e04a5116745f006dc88eac3bdfe15a3a9ff169df175c65908390', 11, 1, 'Authentication Token', '[]', 0, '2021-04-28 23:24:31', '2021-04-28 23:24:31', '2022-04-29 06:24:31'),
('49f9d6ba4d874bdcc5e16946af8a0d5fe2ef239a95abfdc4f9169ed4149cb18ed789e6ebd1b80e35', 11, 1, 'Authentication Token', '[]', 0, '2021-04-27 05:11:26', '2021-04-27 05:11:26', '2022-04-27 12:11:26'),
('5ba698baf923ba8e23503f30b9f2ff12551dccff7172138f9214abcbf8b36743d00b8e588aececbd', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 04:00:42', '2021-04-14 04:00:42', '2022-04-14 11:00:42'),
('5f8ebc370a9238a82fc5c1f38892ef4810df1837d3f9bf44b55b41ca7464ec0b0df16ebb052d05d1', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 01:36:56', '2021-04-14 01:36:56', '2022-04-14 08:36:56'),
('6508804477d3e2d203e0cf75a54e777edb41b7976eb9921dfcc006e3bf68d774ebaf263292405cdd', 12, 1, 'Authentication Token', '[]', 0, '2021-04-29 00:28:46', '2021-04-29 00:28:46', '2022-04-29 07:28:46'),
('6d69df7b3e3938da31321fe6e863847fd1620c21012593b35255d3795aa9306e0b7de734e2845bec', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 04:00:18', '2021-04-14 04:00:18', '2022-04-14 11:00:18'),
('706c5c0e07f2fa689e6635dcea5ed966c6f9973538a09a0103b7edf0c8753afc4ff89bc7673e2db4', 1, 1, 'Authentication Token', '[]', 0, '2021-04-06 04:22:52', '2021-04-06 04:22:52', '2022-04-06 11:22:52'),
('7894613afc3001d4967ac9f2587426c6fb1f24e9fbf0ed4e6b054b6a2fa1e77e5b1f540d97468928', 3, 1, 'Authentication Token', '[]', 0, '2021-04-27 05:10:50', '2021-04-27 05:10:50', '2022-04-27 12:10:50'),
('88b259caddbba1f2bb66dfa7e25f9e01d64727f679a6fc7d7e0c067c0df4688c4417ada143f077ef', 3, 1, 'Authentication Token', '[]', 0, '2021-04-27 05:09:45', '2021-04-27 05:09:45', '2022-04-27 12:09:45'),
('922e60afb0de4cc10b90d8fae3755c3e3f567a3b269592f32c37e60dfc95657fe7d6d7ce699cab1e', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 01:25:27', '2021-04-14 01:25:27', '2022-04-14 08:25:27'),
('938568d235f1570cb4bb81ae833775a56dcb0527cf10c017fc68c5a17ae586fae3f210fc277d8c4b', 11, 1, 'Authentication Token', '[]', 0, '2021-04-29 00:23:32', '2021-04-29 00:23:32', '2022-04-29 07:23:32'),
('939e710539ee56157c7fc9d9024f56ae189ff0c395867403e5df3b66bf2a884bc3ed65f0f29bff38', 11, 1, 'Authentication Token', '[]', 0, '2021-04-29 00:28:57', '2021-04-29 00:28:57', '2022-04-29 07:28:57'),
('97f124be40dfda444e15018a99229878248f74273127619618a9de88addae5b989698a5477afbf0e', 1, 1, 'Authentication Token', '[]', 0, '2021-04-16 06:18:20', '2021-04-16 06:18:20', '2022-04-16 13:18:20'),
('9f021e39e8909a1ed4004dc4150811f151cdb515c5ca4a90fb45900393543ddf1abf53b1128bf603', 1, 1, 'Authentication Token', '[]', 0, '2021-04-29 00:24:18', '2021-04-29 00:24:18', '2022-04-29 07:24:18'),
('ae7ea832b2e600c3be6fbbe79ba3c29d54f495019deae9c832309f184fe7b117fca11841332be118', 3, 1, 'Authentication Token', '[]', 0, '2021-04-27 05:09:51', '2021-04-27 05:09:51', '2022-04-27 12:09:51'),
('af6b23ae84f75967bf3f7e5bde5961defa48a533254f7476945de2e9e852ef0328e1ef388bf64611', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 03:59:05', '2021-04-14 03:59:05', '2022-04-14 10:59:05'),
('b4a9db600c8ff62a1ad2e488913239f7d0c2acb5fd1db9c73050659af2d73838f21913c4bca79382', 11, 1, 'Authentication Token', '[]', 0, '2021-04-28 23:23:41', '2021-04-28 23:23:41', '2022-04-29 06:23:41'),
('b929ffdd728c6889fc4b9aada0b197740aebfdf0d50617c0520bbda49e72c82997629a6b37dd1e4e', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 03:50:29', '2021-04-14 03:50:29', '2022-04-14 10:50:29'),
('bdfd2b72c5e4a21cc4f4c7e5d0416a6323b36aa6ce81028d475075fb4e60efc6b82e4597cfa65952', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 04:01:10', '2021-04-14 04:01:10', '2022-04-14 11:01:10'),
('be29a8d4362af32f40b66276e280bf838d10af92bc33bf05fee25d83c90c5444caf0b3bf5332d7f0', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 04:01:46', '2021-04-14 04:01:46', '2022-04-14 11:01:46'),
('c24b588e7252ab9a0bc68de062ed34c0c0ee72701d2398da5ef80eacf725b8f5526eba5c4c7ce72b', 11, 1, 'Authentication Token', '[]', 0, '2021-04-28 22:27:35', '2021-04-28 22:27:35', '2022-04-29 05:27:35'),
('c24c3e1d208024b9e40828d9cb3d0c6360b3702735eb6da8cb7a34100ca3ac354327c057e34195b1', 1, 1, 'Authentication Token', '[]', 0, '2021-04-06 05:17:05', '2021-04-06 05:17:05', '2022-04-06 12:17:05'),
('de8fd812d8ae9dbd5c34218b5048097782a13e4556f496151a9b33f194c39bd4e464ab75f437b65f', 11, 1, 'Authentication Token', '[]', 0, '2021-04-29 01:00:10', '2021-04-29 01:00:10', '2022-04-29 08:00:10'),
('dfbcf697808d5b6f71d2775515cb1bdc74587b14fdde495ac15e59cae290a43d4f559ef25e17c39e', 11, 1, 'Authentication Token', '[]', 0, '2021-04-28 07:18:29', '2021-04-28 07:18:29', '2022-04-28 14:18:29'),
('e7d32d6fe548ad310748c9bd692d7ea075c6aa034eddca9026c9ea6b7b75368eae1fd1bd61843140', 10, 1, 'Authentication Token', '[]', 0, '2021-04-28 22:39:08', '2021-04-28 22:39:08', '2022-04-29 05:39:08'),
('f6a15948dee0b5119fea6421949f27d2494ce90ae45c3716471ca12dc38e3d8e0b4c27f9043292bf', 1, 1, 'Authentication Token', '[]', 0, '2021-04-08 00:25:51', '2021-04-08 00:25:51', '2022-04-08 07:25:51'),
('f704c6194d0eeb0ad771f871e6c359f5c37bcf745de117fa05d22756dd788956a5272eb582f42d01', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 01:32:34', '2021-04-14 01:32:34', '2022-04-14 08:32:34'),
('fb6b2c4484f43c5cbbc4bcd6a885b58808e42efce16fa28a4b46f87dbdeb17b7b6cb7dde52a81191', 1, 1, 'Authentication Token', '[]', 0, '2021-04-21 04:11:41', '2021-04-21 04:11:41', '2022-04-21 11:11:41'),
('fcf48f48c982f08888ad40522fdf7a294fadc927f898b396fb0ff713d36612c26eec24a48b3e9680', 10, 1, 'Authentication Token', '[]', 0, '2021-04-29 00:32:59', '2021-04-29 00:32:59', '2022-04-29 07:32:59'),
('fd840753c80e45096993f2b77220eab9d08ff49c83439ebb32c0dd57e901bed5ace9e4e25ef92e93', 1, 1, 'Authentication Token', '[]', 0, '2021-04-16 08:07:09', '2021-04-16 08:07:09', '2022-04-16 15:07:09');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '8i5cTZChRDqsrv2iUmWzhrdfj5XD6B8uU2MQmKrO', NULL, 'http://localhost', 1, 0, 0, '2021-04-06 03:13:11', '2021-04-06 03:13:11'),
(2, NULL, 'Laravel Password Grant Client', 'pvkTrnzbioIHJH9hg4FZIcDtSwMxCwfJzalqVfXp', 'karyawan', 'http://localhost', 0, 1, 0, '2021-04-06 03:13:17', '2021-04-06 03:13:17');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-04-06 03:13:11', '2021-04-06 03:13:11');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `ID_PESANAN` int(11) NOT NULL,
  `ID_KARYAWAN` int(11) NOT NULL,
  `ID_RESERVASI` int(11) NOT NULL,
  `STATUS_PESANAN` varchar(255) DEFAULT NULL,
  `SUBTOTAL_PESANAN` decimal(10,0) DEFAULT NULL,
  `SERVICE_PESANAN` decimal(10,0) DEFAULT NULL,
  `TAX_PESANAN` decimal(10,0) DEFAULT NULL,
  `TOTAL_PESANAN` decimal(10,0) DEFAULT NULL,
  `TOTAL_JUMLAH_PESANAN` decimal(10,0) DEFAULT NULL,
  `TOTAL_ITEM_PESANAN` decimal(10,0) DEFAULT NULL,
  `STATUS_LUNAS_PESANAN` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `ID_RESERVASI` int(11) NOT NULL,
  `ID_MEJA` int(11) NOT NULL,
  `ID_CUSTOMER` int(11) NOT NULL,
  `SESI_RESERVASI` varchar(255) DEFAULT NULL,
  `TANGGAL_RESERVASI` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservasi`
--

INSERT INTO `reservasi` (`ID_RESERVASI`, `ID_MEJA`, `ID_CUSTOMER`, `SESI_RESERVASI`, `TANGGAL_RESERVASI`) VALUES
(7, 7, 6, 'Dinner', '2021-04-10'),
(27, 1, 5, 'Dinner', '2021-04-16'),
(28, 1, 5, 'Lunch', '2021-05-08');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `ID_ROLE` int(11) NOT NULL,
  `NAMA_ROLE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`ID_ROLE`, `NAMA_ROLE`) VALUES
(1, 'Owner'),
(2, 'Ops Manager'),
(3, 'Waiter'),
(4, 'Cashier'),
(5, 'Chef');

-- --------------------------------------------------------

--
-- Table structure for table `stok_bahan`
--

CREATE TABLE `stok_bahan` (
  `ID_STOK` int(11) NOT NULL,
  `NAMA_STOK` varchar(255) DEFAULT NULL,
  `UNIT_STOK` varchar(255) DEFAULT NULL,
  `HARGA_STOK` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stok_bahan`
--

INSERT INTO `stok_bahan` (`ID_STOK`, `NAMA_STOK`, `UNIT_STOK`, `HARGA_STOK`) VALUES
(1, 'qwe', 'gram', '123'),
(3, 'Rice', 'gram', '1000'),
(5, 'tehHH', 'ml', '10'),
(6, 'es', 'ml', '2222');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_pesanan`
--

CREATE TABLE `transaksi_pesanan` (
  `ID_TRANSAKSI` int(11) NOT NULL,
  `ID_PESANAN` int(11) NOT NULL,
  `ID_KARYAWAN` int(11) NOT NULL,
  `NOMOR_TRANSAKSI` varchar(255) DEFAULT NULL,
  `TANGGAL_TRANSAKSI` date DEFAULT NULL,
  `WAKTU_TRANSAKSI` time DEFAULT NULL,
  `JENIS_PEMBAYARAN_TRANSAKSI` varchar(255) DEFAULT NULL,
  `NOMOR_KARTU_TRANSAKSI` decimal(20,0) DEFAULT NULL,
  `NAMA_CREDIT_TRANSAKSI` varchar(255) DEFAULT NULL,
  `KODE_VERIFIKASI_TRANSAKSI` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID_CUSTOMER`),
  ADD UNIQUE KEY `NAMA_CUSTOMER` (`NAMA_CUSTOMER`);

--
-- Indexes for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD KEY `FK_DETAIL_P_RELATIONS_PESANAN` (`ID_PESANAN`),
  ADD KEY `FK_DETAIL_P_RELATIONS_MENU` (`ID_MENU`);

--
-- Indexes for table `detail_stok_bahan`
--
ALTER TABLE `detail_stok_bahan`
  ADD PRIMARY KEY (`ID_DETAIL_STOK`),
  ADD KEY `FK_DETAIL_S_RELATIONS_STOK_BAH` (`ID_STOK`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`ID_KARYAWAN`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `FK_KARYAWAN_RELATIONS_ROLE` (`ID_ROLE`);

--
-- Indexes for table `meja`
--
ALTER TABLE `meja`
  ADD PRIMARY KEY (`ID_MEJA`),
  ADD UNIQUE KEY `NOMOR_MEJA` (`NOMOR_MEJA`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`ID_MENU`),
  ADD UNIQUE KEY `NAMA_MENU` (`NAMA_MENU`),
  ADD KEY `FK_MENU_RELATIONS_STOK_BAH` (`ID_STOK`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`ID_PESANAN`),
  ADD KEY `FK_PESANAN_RELATIONS_KARYAWAN` (`ID_KARYAWAN`),
  ADD KEY `FK_PESANAN_RELATIONS_RESERVASI` (`ID_RESERVASI`);

--
-- Indexes for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`ID_RESERVASI`),
  ADD KEY `FK_RESERVASI_RELATIONS_MEJA` (`ID_MEJA`),
  ADD KEY `FK_RESERVASI_RELATIONS_CUSTOMER` (`ID_CUSTOMER`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`ID_ROLE`);

--
-- Indexes for table `stok_bahan`
--
ALTER TABLE `stok_bahan`
  ADD PRIMARY KEY (`ID_STOK`);

--
-- Indexes for table `transaksi_pesanan`
--
ALTER TABLE `transaksi_pesanan`
  ADD PRIMARY KEY (`ID_TRANSAKSI`),
  ADD KEY `FK_TRANSAKSI_REALTIONS_KARYAWAN` (`ID_KARYAWAN`),
  ADD KEY `FK_TRANSAKSI_RELATIONS_PESANAN` (`ID_PESANAN`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `ID_CUSTOMER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `detail_stok_bahan`
--
ALTER TABLE `detail_stok_bahan`
  MODIFY `ID_DETAIL_STOK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `ID_KARYAWAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `meja`
--
ALTER TABLE `meja`
  MODIFY `ID_MEJA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `ID_MENU` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `ID_PESANAN` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservasi`
--
ALTER TABLE `reservasi`
  MODIFY `ID_RESERVASI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `ID_ROLE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stok_bahan`
--
ALTER TABLE `stok_bahan`
  MODIFY `ID_STOK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transaksi_pesanan`
--
ALTER TABLE `transaksi_pesanan`
  MODIFY `ID_TRANSAKSI` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD CONSTRAINT `FK_DETAIL_P_RELATIONS_MENU` FOREIGN KEY (`ID_MENU`) REFERENCES `menu` (`ID_MENU`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_DETAIL_P_RELATIONS_PESANAN` FOREIGN KEY (`ID_PESANAN`) REFERENCES `pesanan` (`ID_PESANAN`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `detail_stok_bahan`
--
ALTER TABLE `detail_stok_bahan`
  ADD CONSTRAINT `FK_DETAIL_S_RELATIONS_STOK_BAH` FOREIGN KEY (`ID_STOK`) REFERENCES `stok_bahan` (`ID_STOK`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `FK_KARYAWAN_RELATIONS_ROLE` FOREIGN KEY (`ID_ROLE`) REFERENCES `role` (`ID_ROLE`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `FK_MENU_RELATIONS_STOK_BAH` FOREIGN KEY (`ID_STOK`) REFERENCES `stok_bahan` (`ID_STOK`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `FK_PESANAN_RELATIONS_KARYAWAN` FOREIGN KEY (`ID_KARYAWAN`) REFERENCES `karyawan` (`ID_KARYAWAN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PESANAN_RELATIONS_RESERVASI` FOREIGN KEY (`ID_RESERVASI`) REFERENCES `reservasi` (`ID_RESERVASI`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD CONSTRAINT `FK_RESERVASI_RELATIONS_CUSTOMER` FOREIGN KEY (`ID_CUSTOMER`) REFERENCES `customer` (`ID_CUSTOMER`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_RESERVASI_RELATIONS_MEJA` FOREIGN KEY (`ID_MEJA`) REFERENCES `meja` (`ID_MEJA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `transaksi_pesanan`
--
ALTER TABLE `transaksi_pesanan`
  ADD CONSTRAINT `FK_TRANSAKSI_REALTIONS_KARYAWAN` FOREIGN KEY (`ID_KARYAWAN`) REFERENCES `karyawan` (`ID_KARYAWAN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TRANSAKSI_RELATIONS_PESANAN` FOREIGN KEY (`ID_PESANAN`) REFERENCES `pesanan` (`ID_PESANAN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
