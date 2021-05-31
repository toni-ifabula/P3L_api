-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2021 at 06:40 PM
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
  `ID_CUSTOMER` int(255) NOT NULL,
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
  `ID_DETAIL_PESANAN` int(255) NOT NULL,
  `ID_PESANAN` int(255) NOT NULL,
  `ID_MENU` int(255) NOT NULL,
  `JUMLAH_ITEM_PESANAN` int(255) DEFAULT NULL,
  `SUBTOTAL_ITEM_PESANAN` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_pesanan`
--

INSERT INTO `detail_pesanan` (`ID_DETAIL_PESANAN`, `ID_PESANAN`, `ID_MENU`, `JUMLAH_ITEM_PESANAN`, `SUBTOTAL_ITEM_PESANAN`) VALUES
(2, 1, 10, 4, 60000),
(3, 2, 10, 5, 100000),
(4, 2, 14, 3, 12000),
(8, 2, 16, 2, 0),
(10, 1, 15, 1, 5000),
(11, 1, 11, 2, 30000),
(12, 11, 19, 2, 16000);

-- --------------------------------------------------------

--
-- Table structure for table `detail_stok_bahan`
--

CREATE TABLE `detail_stok_bahan` (
  `ID_DETAIL_STOK` int(255) NOT NULL,
  `ID_STOK` int(255) NOT NULL,
  `TANGGAL_MASUK_STOK` date DEFAULT NULL,
  `INCOMING_STOK` int(255) DEFAULT NULL,
  `REMAINING_STOK` int(255) DEFAULT NULL,
  `WASTE_STOK` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_stok_bahan`
--

INSERT INTO `detail_stok_bahan` (`ID_DETAIL_STOK`, `ID_STOK`, `TANGGAL_MASUK_STOK`, `INCOMING_STOK`, `REMAINING_STOK`, `WASTE_STOK`) VALUES
(9, 7, '2021-05-01', 100, 55, 30),
(10, 7, '2021-05-02', 20, 20, 5),
(11, 7, '2021-05-20', 5001, 5001, 202),
(12, 7, '2021-05-19', 4444444, 33333, 2222222),
(13, 8, '2021-05-01', 100, 100, 30),
(14, 13, '2021-05-01', 100, 100, 30),
(15, 13, '2021-05-02', 20, 20, 5),
(16, 16, '2021-05-01', 50, 50, 8),
(17, 15, '2021-05-01', 10, 10, 4);

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
  `ID_KARYAWAN` int(255) NOT NULL,
  `ID_ROLE` int(255) NOT NULL,
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
(12, 5, 'toni nugraha', '$2y$10$80REKa2Yst1.zelMvaPkYecgKdDT/lMfjjJYppAL6Hji.JXtLUD4y', 'Perempuan', '0834564549', 'toniii@gmail.com', '2021-04-06', 'Resign'),
(13, 5, 'test chef', '$2y$10$Nww52YkMsgILNnhMzjmQn.Fbtq59zDMCqnai9rmxqo43plBChuVBC', 'Laki-laki', '08456745621', 'testchef@gmail.com', '2021-05-07', 'Aktif'),
(14, 4, 'test cashier', '$2y$10$UJCg1V9EnXXVYboS.nJn5eCnFz5HF/iLg0hn6YCzMIbhqc8D.YsfK', 'Laki-laki', '084563456745', 'testcashier@gmail.com', '2021-05-05', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `meja`
--

CREATE TABLE `meja` (
  `ID_MEJA` int(255) NOT NULL,
  `NOMOR_MEJA` int(255) DEFAULT NULL,
  `STATUS_MEJA` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meja`
--

INSERT INTO `meja` (`ID_MEJA`, `NOMOR_MEJA`, `STATUS_MEJA`) VALUES
(1, 1, 'Isi'),
(3, 2, 'Isi'),
(7, 3, 'Isi'),
(12, 4, 'Kosong'),
(13, 5, 'Isi');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `ID_MENU` int(255) NOT NULL,
  `ID_STOK` int(255) NOT NULL,
  `KATEGORI_MENU` varchar(255) DEFAULT NULL,
  `NAMA_MENU` varchar(255) DEFAULT NULL,
  `DESKRIPSI_MENU` varchar(255) DEFAULT NULL,
  `UNIT_MENU` varchar(255) DEFAULT NULL,
  `HARGA_MENU` int(255) DEFAULT NULL,
  `IMAGE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`ID_MENU`, `ID_STOK`, `KATEGORI_MENU`, `NAMA_MENU`, `DESKRIPSI_MENU`, `UNIT_MENU`, `HARGA_MENU`, `IMAGE`) VALUES
(10, 7, 'Makanan Utama', 'Beef Short Plate', 'Potongan daging sapi dari bagian otot perut, bentuknya panjang dan datar', 'Plate', 20000, 'https://images.tokopedia.net/img/cache/700/product-1/2020/3/27/696514195/696514195_6acd13ab-0b8a-449a-ac0e-d0e05ca56e54_2048_2048.jpg'),
(11, 8, 'Makanan Utama', 'Chicken Slice', 'Potongan daging dari bagian dada ayam', 'Plate', 15000, 'https://www.bigbasket.com/media/uploads/p/xxl/10001001_7-fresho-chicken-breast-boneless-antibiotic-residue-free.jpg'),
(12, 9, 'Makanan Utama', 'Squid', 'Potongan daging cumi', 'Plate', 20000, 'https://images.creativemarket.com/0.1.0/ps/8504414/600/400/m1/fpc/wm1/vri286icrftkmhy2agzivjkaih5m3htbmcd7qeikyx7w8ln70iuk8a7pg13zvlal-.jpg?1591774449&s=94f53b8b2cc016cac2d38b99e93f4c5a'),
(13, 10, 'Makanan Utama', 'Tenderloin', 'Potongan daging sapi yang paling empuk sejagad raya', 'Plate', 22000, 'https://www.alodokter.com/wp-content/uploads/2020/11/Inilah-Perbedaan-Sirloin-dan-Tenderloin.jpg'),
(14, 11, 'Makanan Utama', 'Rice', 'Satu mangkok nasi putih dihidangkan hangat', 'Bowl', 4000, 'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/DE38BC2F-473D-4AC2-9DFC-AF9E51A04568/Derivates/8C97D37C-410B-439F-B412-AC2D81AD7D1F.jpg'),
(15, 12, 'Makanan Side Dish', 'Kimchi', 'Asinan sayur hasil fermentasi yang diberi bumbu pedas', 'Plate', 5000, 'https://cdns.klimg.com/merdeka.com/i/w/news/2020/06/10/1186153/540x270/5-cara-membuat-kimchi-ala-korea-di-rumah-dengan-bahan-lokal-enak-dan-mudah.jpg'),
(16, 13, 'Makanan Side Dish', 'Saos', 'Saos signature yang melengkapi kelezatan makanan', 'Mini Bowl', 0, 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/7/26/0/NY0100_neelys-bbq-sauce_s4x3.jpg.rend.hgtvcom.616.462.suffix/1371597847826.jpeg'),
(17, 14, 'Minuman', 'Ocha', 'Minuman teh hijau segar', 'Glass', 3000, 'http://3.bp.blogspot.com/-pr5uKxZ-qeg/VOWTaivB92I/AAAAAAAABVg/wk2SG2PoiXA/s1600/20071219_281056.jpg'),
(18, 15, 'Minuman', 'Mineral Water 600 ml', 'Minuman air segar dari pegunungan ternama', 'Bottle', 6000, 'https://d2qjkwm11akmwu.cloudfront.net/products/630433_29-10-2019_13-1-49.jpg'),
(19, 16, 'Minuman', 'Orange Juice', 'Minuman jus jeruk yang didapat dari buah asli', 'Glass', 8000, 'https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/orange-juice-1296x728-feature.jpg?w=1155&h=1528');

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
('0b0ac7de55ab3baa2599cef54f2a4523b972ae5bb5f3e37b31cc296f8cb69bc192a00162acca3b9d', 11, 1, 'Authentication Token', '[]', 0, '2021-05-07 03:21:04', '2021-05-07 03:21:04', '2022-05-07 10:21:04'),
('0eb2d0c771463cce319b7d51e94813b5b51c70a049344b380b44134634e7c380baf3e87fa9616749', 1, 1, 'Authentication Token', '[]', 0, '2021-04-06 03:13:33', '2021-04-06 03:13:33', '2022-04-06 10:13:33'),
('168c10174fe54e2ffc9301379cfd3562dc5eda909e3884e1c50516798b10dda5058f5375566caa4c', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 03:57:31', '2021-04-14 03:57:31', '2022-04-14 10:57:31'),
('1ad087b1e93b4ec569c0f944b85c3aab612942e85d5a4b9196546781e3b94ff41718e6b84d11f4b7', 3, 1, 'Authentication Token', '[]', 0, '2021-04-16 08:06:59', '2021-04-16 08:06:59', '2022-04-16 15:06:59'),
('1cd26f5cb10622c4df40691c683ec69830fca0d49c9e072ff9893324f8a6da11555f902214578362', 9, 1, 'Authentication Token', '[]', 0, '2021-04-27 05:11:09', '2021-04-27 05:11:09', '2022-04-27 12:11:09'),
('1d163d239db05dc014029582fee184c26b94580a33496d863f717c5cb92b6a78a9f43a80a58fbbf5', 13, 1, 'Authentication Token', '[]', 0, '2021-05-20 02:13:54', '2021-05-20 02:13:54', '2022-05-20 09:13:54'),
('1f10aea5b2f391ed2e6cd00184105859b274c3949ae6f31084a0abfec62e3b903b082e98b8daa71e', 11, 1, 'Authentication Token', '[]', 0, '2021-05-11 04:00:48', '2021-05-11 04:00:48', '2022-05-11 11:00:48'),
('27c416afef9790fdd627726c06118813050d34e97d320ddee50e075ddde2a24f11acb3d822afb740', 11, 1, 'Authentication Token', '[]', 0, '2021-04-29 00:24:47', '2021-04-29 00:24:47', '2022-04-29 07:24:47'),
('355e68f5c910ef8f4548985f95cc6dd04191d5e4828ae60cadd6ce72a770b0cb13cfda84cd88720d', 11, 1, 'Authentication Token', '[]', 0, '2021-04-28 07:14:47', '2021-04-28 07:14:47', '2022-04-28 14:14:47'),
('36e8cb7ee27102c0fd24dc9ee34b0df40e8cdc3ec1d921706e98df6e2df5be6ea575703bbad17226', 11, 1, 'Authentication Token', '[]', 0, '2021-05-08 02:26:51', '2021-05-08 02:26:51', '2022-05-08 09:26:51'),
('3d848ad7cc7e77988d19ab952f29cd93edf3639aa070d86b28b7645c7d961824d2ec036ef8271cd3', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 03:57:44', '2021-04-14 03:57:44', '2022-04-14 10:57:44'),
('43b898269daed265889d19da7ce0d9b65a3bd8d9c16fe582e58d28af65d4e04efb0923cd59213dd3', 10, 1, 'Authentication Token', '[]', 0, '2021-05-20 02:24:38', '2021-05-20 02:24:38', '2022-05-20 09:24:38'),
('46b458bf5c59f3c10bb6d6595187e04a5116745f006dc88eac3bdfe15a3a9ff169df175c65908390', 11, 1, 'Authentication Token', '[]', 0, '2021-04-28 23:24:31', '2021-04-28 23:24:31', '2022-04-29 06:24:31'),
('49f9d6ba4d874bdcc5e16946af8a0d5fe2ef239a95abfdc4f9169ed4149cb18ed789e6ebd1b80e35', 11, 1, 'Authentication Token', '[]', 0, '2021-04-27 05:11:26', '2021-04-27 05:11:26', '2022-04-27 12:11:26'),
('4e7444ae51aa38bcb474344dfaddc41c670930de9714aed63e9e6026fa76350ee793bc793bbcabee', 10, 1, 'Authentication Token', '[]', 0, '2021-05-08 02:26:35', '2021-05-08 02:26:35', '2022-05-08 09:26:35'),
('5325a1ed30dbc12be6392094172c6d2947e7dda2c6b407eb4789c1792c2ea3ae0d34f5b5e46659a2', 11, 1, 'Authentication Token', '[]', 0, '2021-05-20 01:55:59', '2021-05-20 01:55:59', '2022-05-20 08:55:59'),
('5ba698baf923ba8e23503f30b9f2ff12551dccff7172138f9214abcbf8b36743d00b8e588aececbd', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 04:00:42', '2021-04-14 04:00:42', '2022-04-14 11:00:42'),
('5f8ebc370a9238a82fc5c1f38892ef4810df1837d3f9bf44b55b41ca7464ec0b0df16ebb052d05d1', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 01:36:56', '2021-04-14 01:36:56', '2022-04-14 08:36:56'),
('6508804477d3e2d203e0cf75a54e777edb41b7976eb9921dfcc006e3bf68d774ebaf263292405cdd', 12, 1, 'Authentication Token', '[]', 0, '2021-04-29 00:28:46', '2021-04-29 00:28:46', '2022-04-29 07:28:46'),
('6d69df7b3e3938da31321fe6e863847fd1620c21012593b35255d3795aa9306e0b7de734e2845bec', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 04:00:18', '2021-04-14 04:00:18', '2022-04-14 11:00:18'),
('706c5c0e07f2fa689e6635dcea5ed966c6f9973538a09a0103b7edf0c8753afc4ff89bc7673e2db4', 1, 1, 'Authentication Token', '[]', 0, '2021-04-06 04:22:52', '2021-04-06 04:22:52', '2022-04-06 11:22:52'),
('7894613afc3001d4967ac9f2587426c6fb1f24e9fbf0ed4e6b054b6a2fa1e77e5b1f540d97468928', 3, 1, 'Authentication Token', '[]', 0, '2021-04-27 05:10:50', '2021-04-27 05:10:50', '2022-04-27 12:10:50'),
('869a0c22fb610c998ddbb6b16bccecf03457fa6ae4f790152c3592c771a965737c95ecb43a6917e2', 13, 1, 'Authentication Token', '[]', 0, '2021-05-20 02:00:10', '2021-05-20 02:00:10', '2022-05-20 09:00:10'),
('883ef74414c521fe313eba8a2bf8133e800ff36a8dfe9be85e521f145d5c62a70f69da759adac593', 1, 1, 'Authentication Token', '[]', 0, '2021-05-20 01:59:54', '2021-05-20 01:59:54', '2022-05-20 08:59:54'),
('88b259caddbba1f2bb66dfa7e25f9e01d64727f679a6fc7d7e0c067c0df4688c4417ada143f077ef', 3, 1, 'Authentication Token', '[]', 0, '2021-04-27 05:09:45', '2021-04-27 05:09:45', '2022-04-27 12:09:45'),
('91be73b91775a21c6359a2ba812b61e4cbd0e83175f59d1ef7f24c8c1c5341a4c524b48ed30e7c48', 11, 1, 'Authentication Token', '[]', 0, '2021-05-20 01:56:19', '2021-05-20 01:56:19', '2022-05-20 08:56:19'),
('922e60afb0de4cc10b90d8fae3755c3e3f567a3b269592f32c37e60dfc95657fe7d6d7ce699cab1e', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 01:25:27', '2021-04-14 01:25:27', '2022-04-14 08:25:27'),
('938568d235f1570cb4bb81ae833775a56dcb0527cf10c017fc68c5a17ae586fae3f210fc277d8c4b', 11, 1, 'Authentication Token', '[]', 0, '2021-04-29 00:23:32', '2021-04-29 00:23:32', '2022-04-29 07:23:32'),
('939e710539ee56157c7fc9d9024f56ae189ff0c395867403e5df3b66bf2a884bc3ed65f0f29bff38', 11, 1, 'Authentication Token', '[]', 0, '2021-04-29 00:28:57', '2021-04-29 00:28:57', '2022-04-29 07:28:57'),
('97f124be40dfda444e15018a99229878248f74273127619618a9de88addae5b989698a5477afbf0e', 1, 1, 'Authentication Token', '[]', 0, '2021-04-16 06:18:20', '2021-04-16 06:18:20', '2022-04-16 13:18:20'),
('9832be86eb676e16cd2c5e8fd32fda5d0c928411a9f78115f501ed6fae748d794bafcbd0afe704ef', 11, 1, 'Authentication Token', '[]', 0, '2021-05-20 02:09:15', '2021-05-20 02:09:15', '2022-05-20 09:09:15'),
('987ecc112d1b2a7a5a6bd8699df2abfb8c84a49ce4cd6a05d7266425d3e4ef15cccc4e55c6bdecdc', 10, 1, 'Authentication Token', '[]', 0, '2021-05-20 02:06:28', '2021-05-20 02:06:28', '2022-05-20 09:06:28'),
('9f021e39e8909a1ed4004dc4150811f151cdb515c5ca4a90fb45900393543ddf1abf53b1128bf603', 1, 1, 'Authentication Token', '[]', 0, '2021-04-29 00:24:18', '2021-04-29 00:24:18', '2022-04-29 07:24:18'),
('a0bf8a93aafc953b033287bffb018d426131a4eafbad47b291e859e288106c7a878b0b586793b3c0', 11, 1, 'Authentication Token', '[]', 0, '2021-05-11 02:39:02', '2021-05-11 02:39:02', '2022-05-11 09:39:02'),
('a4a9afd76c9580e94ba0572a37ff8519d0fbe2a3f06e334059dd5a8ac9e78cc5bef648a7fa11a1f5', 11, 1, 'Authentication Token', '[]', 0, '2021-05-08 01:40:07', '2021-05-08 01:40:07', '2022-05-08 08:40:07'),
('ae7ea832b2e600c3be6fbbe79ba3c29d54f495019deae9c832309f184fe7b117fca11841332be118', 3, 1, 'Authentication Token', '[]', 0, '2021-04-27 05:09:51', '2021-04-27 05:09:51', '2022-04-27 12:09:51'),
('af6b23ae84f75967bf3f7e5bde5961defa48a533254f7476945de2e9e852ef0328e1ef388bf64611', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 03:59:05', '2021-04-14 03:59:05', '2022-04-14 10:59:05'),
('b4a9db600c8ff62a1ad2e488913239f7d0c2acb5fd1db9c73050659af2d73838f21913c4bca79382', 11, 1, 'Authentication Token', '[]', 0, '2021-04-28 23:23:41', '2021-04-28 23:23:41', '2022-04-29 06:23:41'),
('b929ffdd728c6889fc4b9aada0b197740aebfdf0d50617c0520bbda49e72c82997629a6b37dd1e4e', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 03:50:29', '2021-04-14 03:50:29', '2022-04-14 10:50:29'),
('bdfd2b72c5e4a21cc4f4c7e5d0416a6323b36aa6ce81028d475075fb4e60efc6b82e4597cfa65952', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 04:01:10', '2021-04-14 04:01:10', '2022-04-14 11:01:10'),
('be29a8d4362af32f40b66276e280bf838d10af92bc33bf05fee25d83c90c5444caf0b3bf5332d7f0', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 04:01:46', '2021-04-14 04:01:46', '2022-04-14 11:01:46'),
('c24b588e7252ab9a0bc68de062ed34c0c0ee72701d2398da5ef80eacf725b8f5526eba5c4c7ce72b', 11, 1, 'Authentication Token', '[]', 0, '2021-04-28 22:27:35', '2021-04-28 22:27:35', '2022-04-29 05:27:35'),
('c24c3e1d208024b9e40828d9cb3d0c6360b3702735eb6da8cb7a34100ca3ac354327c057e34195b1', 1, 1, 'Authentication Token', '[]', 0, '2021-04-06 05:17:05', '2021-04-06 05:17:05', '2022-04-06 12:17:05'),
('c2aba6142619e17dd31fee2151e90a66f9977702d0b1abd75763dde91151925d8062cccbb1629303', 1, 1, 'Authentication Token', '[]', 0, '2021-05-20 02:09:01', '2021-05-20 02:09:01', '2022-05-20 09:09:01'),
('c4bf6b5440e8b3be0ba29607e5382860a9fa9fdade70e36014227f578015302e56316e0fc8d4a354', 10, 1, 'Authentication Token', '[]', 0, '2021-05-20 01:55:37', '2021-05-20 01:55:37', '2022-05-20 08:55:37'),
('ce621544312d2cdebea9ce486efd2e4726e9a6b55d0c628bb4b7209743e6aa74cac3d867f311710d', 11, 1, 'Authentication Token', '[]', 0, '2021-05-18 08:20:06', '2021-05-18 08:20:06', '2022-05-18 15:20:06'),
('d1c8669a1022c71c015fb89374eb8701e9394b9e639351398552454b35dd179fe21a023d4a7c98f0', 11, 1, 'Authentication Token', '[]', 0, '2021-05-20 02:14:09', '2021-05-20 02:14:09', '2022-05-20 09:14:09'),
('d42dd44973614c321c5f908671e82e6f0881c7edc62793504fc4c16f1d8d0c4e97c6f9cd6c3381b3', 1, 1, 'Authentication Token', '[]', 0, '2021-05-20 02:24:10', '2021-05-20 02:24:10', '2022-05-20 09:24:10'),
('de8fd812d8ae9dbd5c34218b5048097782a13e4556f496151a9b33f194c39bd4e464ab75f437b65f', 11, 1, 'Authentication Token', '[]', 0, '2021-04-29 01:00:10', '2021-04-29 01:00:10', '2022-04-29 08:00:10'),
('dfbcf697808d5b6f71d2775515cb1bdc74587b14fdde495ac15e59cae290a43d4f559ef25e17c39e', 11, 1, 'Authentication Token', '[]', 0, '2021-04-28 07:18:29', '2021-04-28 07:18:29', '2022-04-28 14:18:29'),
('e7d32d6fe548ad310748c9bd692d7ea075c6aa034eddca9026c9ea6b7b75368eae1fd1bd61843140', 10, 1, 'Authentication Token', '[]', 0, '2021-04-28 22:39:08', '2021-04-28 22:39:08', '2022-04-29 05:39:08'),
('e7f911f4b50f68cbe3e02a9915b58e8cc084db3f51b9148d6d9cebb81cf096134bf34587e014de32', 11, 1, 'Authentication Token', '[]', 0, '2021-05-20 02:27:21', '2021-05-20 02:27:21', '2022-05-20 09:27:21'),
('f6a15948dee0b5119fea6421949f27d2494ce90ae45c3716471ca12dc38e3d8e0b4c27f9043292bf', 1, 1, 'Authentication Token', '[]', 0, '2021-04-08 00:25:51', '2021-04-08 00:25:51', '2022-04-08 07:25:51'),
('f704c6194d0eeb0ad771f871e6c359f5c37bcf745de117fa05d22756dd788956a5272eb582f42d01', 1, 1, 'Authentication Token', '[]', 0, '2021-04-14 01:32:34', '2021-04-14 01:32:34', '2022-04-14 08:32:34'),
('fb6b2c4484f43c5cbbc4bcd6a885b58808e42efce16fa28a4b46f87dbdeb17b7b6cb7dde52a81191', 1, 1, 'Authentication Token', '[]', 0, '2021-04-21 04:11:41', '2021-04-21 04:11:41', '2022-04-21 11:11:41'),
('fcf48f48c982f08888ad40522fdf7a294fadc927f898b396fb0ff713d36612c26eec24a48b3e9680', 10, 1, 'Authentication Token', '[]', 0, '2021-04-29 00:32:59', '2021-04-29 00:32:59', '2022-04-29 07:32:59'),
('fd840753c80e45096993f2b77220eab9d08ff49c83439ebb32c0dd57e901bed5ace9e4e25ef92e93', 1, 1, 'Authentication Token', '[]', 0, '2021-04-16 08:07:09', '2021-04-16 08:07:09', '2022-04-16 15:07:09'),
('fee681d61fa3571328fea63a47e9953c859466f9ba9367695d31f1acff49e9b1a85a4c18ebb02ce4', 11, 1, 'Authentication Token', '[]', 0, '2021-05-20 02:00:23', '2021-05-20 02:00:23', '2022-05-20 09:00:23');

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
  `ID_PESANAN` int(255) NOT NULL,
  `ID_KARYAWAN` int(255) NOT NULL,
  `ID_RESERVASI` int(255) NOT NULL,
  `STATUS_PESANAN` varchar(255) DEFAULT NULL,
  `SUBTOTAL_PESANAN` int(255) DEFAULT NULL,
  `SERVICE_PESANAN` int(255) DEFAULT NULL,
  `TAX_PESANAN` int(255) DEFAULT NULL,
  `TOTAL_PESANAN` int(255) DEFAULT NULL,
  `TOTAL_JUMLAH_PESANAN` int(255) DEFAULT NULL,
  `TOTAL_ITEM_PESANAN` int(255) DEFAULT NULL,
  `STATUS_LUNAS_PESANAN` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`ID_PESANAN`, `ID_KARYAWAN`, `ID_RESERVASI`, `STATUS_PESANAN`, `SUBTOTAL_PESANAN`, `SERVICE_PESANAN`, `TAX_PESANAN`, `TOTAL_PESANAN`, `TOTAL_JUMLAH_PESANAN`, `TOTAL_ITEM_PESANAN`, `STATUS_LUNAS_PESANAN`) VALUES
(1, 11, 41, 'Disajikan', 95000, 4750, 9500, 109250, 7, 3, 'Belum'),
(2, 9, 44, 'Dimasak', 112000, 5600, 11200, 128800, 10, 3, 'Lunas'),
(11, 9, 42, 'Dimasak', 16000, 800, 1600, 18400, 2, 1, 'Belum');

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `ID_RESERVASI` int(255) NOT NULL,
  `ID_MEJA` int(255) NOT NULL,
  `ID_CUSTOMER` int(255) NOT NULL,
  `SESI_RESERVASI` varchar(255) DEFAULT NULL,
  `TANGGAL_RESERVASI` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservasi`
--

INSERT INTO `reservasi` (`ID_RESERVASI`, `ID_MEJA`, `ID_CUSTOMER`, `SESI_RESERVASI`, `TANGGAL_RESERVASI`) VALUES
(41, 12, 11, 'Dinner', '2021-05-31'),
(42, 7, 5, 'Lunch', '2021-05-08'),
(44, 13, 6, 'Dinner', '2021-05-13');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `ID_ROLE` int(255) NOT NULL,
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
  `ID_STOK` int(255) NOT NULL,
  `NAMA_STOK` varchar(255) DEFAULT NULL,
  `UNIT_STOK` varchar(255) DEFAULT NULL,
  `SERVING_STOK` int(255) DEFAULT NULL,
  `HARGA_STOK` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stok_bahan`
--

INSERT INTO `stok_bahan` (`ID_STOK`, `NAMA_STOK`, `UNIT_STOK`, `SERVING_STOK`, `HARGA_STOK`) VALUES
(7, 'Beef Short Plate', 'gram', 50, 1000),
(8, 'Chicken Slice', 'gram', 50, 1000),
(9, 'Squid', 'gram', 25, 1000),
(10, 'Tenderloin', 'gram', 50, 1000),
(11, 'Rice', 'gram', 125, 1000),
(12, 'Kimchi', 'gram', 15, 1000),
(13, 'Saos', 'ml', 20, 1000),
(14, 'Ocha', 'ml', 200, 1000),
(15, 'Mineral Water', 'ml', 600, 1000),
(16, 'Orange Juice', 'ml', 200, 1000),
(17, 'kerbau', 'ml', 99, 30000),
(18, 'sapi daging', 'ml', 88, 4444);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `ID_TRANSAKSI` int(255) NOT NULL,
  `ID_PESANAN` int(255) NOT NULL,
  `ID_KARYAWAN` int(255) NOT NULL,
  `NOMOR_TRANSAKSI` varchar(255) DEFAULT NULL,
  `TANGGAL_TRANSAKSI` date DEFAULT NULL,
  `WAKTU_TRANSAKSI` varchar(255) DEFAULT NULL,
  `JENIS_PEMBAYARAN_TRANSAKSI` varchar(255) DEFAULT NULL,
  `NOMOR_KARTU_TRANSAKSI` int(255) DEFAULT NULL,
  `NAMA_CREDIT_TRANSAKSI` varchar(255) DEFAULT NULL,
  `KODE_VERIFIKASI_TRANSAKSI` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`ID_TRANSAKSI`, `ID_PESANAN`, `ID_KARYAWAN`, `NOMOR_TRANSAKSI`, `TANGGAL_TRANSAKSI`, `WAKTU_TRANSAKSI`, `JENIS_PEMBAYARAN_TRANSAKSI`, `NOMOR_KARTU_TRANSAKSI`, `NAMA_CREDIT_TRANSAKSI`, `KODE_VERIFIKASI_TRANSAKSI`) VALUES
(1, 1, 14, '222AAA22', '2002-02-02', '22:22', 'CREDIT', 1245432341, 'ASD', '23SAD23');

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
  ADD PRIMARY KEY (`ID_DETAIL_PESANAN`),
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
  ADD UNIQUE KEY `ID_STOK_UNIQUE` (`ID_STOK`),
  ADD UNIQUE KEY `NAMA_MENU` (`NAMA_MENU`);

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
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
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
  MODIFY `ID_CUSTOMER` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  MODIFY `ID_DETAIL_PESANAN` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `detail_stok_bahan`
--
ALTER TABLE `detail_stok_bahan`
  MODIFY `ID_DETAIL_STOK` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `ID_KARYAWAN` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `meja`
--
ALTER TABLE `meja`
  MODIFY `ID_MEJA` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `ID_MENU` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
  MODIFY `ID_PESANAN` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `reservasi`
--
ALTER TABLE `reservasi`
  MODIFY `ID_RESERVASI` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `ID_ROLE` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stok_bahan`
--
ALTER TABLE `stok_bahan`
  MODIFY `ID_STOK` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `ID_TRANSAKSI` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  ADD CONSTRAINT `FK_MENU_RELATIONS_STOK_BAH` FOREIGN KEY (`ID_STOK`) REFERENCES `stok_bahan` (`ID_STOK`);

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
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `FK_TRANSAKSI_REALTIONS_KARYAWAN` FOREIGN KEY (`ID_KARYAWAN`) REFERENCES `karyawan` (`ID_KARYAWAN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TRANSAKSI_RELATIONS_PESANAN` FOREIGN KEY (`ID_PESANAN`) REFERENCES `pesanan` (`ID_PESANAN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
