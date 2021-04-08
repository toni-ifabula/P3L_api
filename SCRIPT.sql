-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2021 at 10:37 AM
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
  `NAMA_CUSTOMER` varchar(20) DEFAULT NULL,
  `EMAIL_CUSTOMER` varchar(20) DEFAULT NULL,
  `TELEPON_CUSTOMER` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID_CUSTOMER`, `NAMA_CUSTOMER`, `EMAIL_CUSTOMER`, `TELEPON_CUSTOMER`) VALUES
(1, 'qqq', 'qqq@gmail.com', '089999999999'),
(2, 'aaa', 'aaa@gmail.com', '0822222222');

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
  `NAMA_KARYAWAN` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `JENIS_KELAMIN_KARYAWAN` varchar(20) DEFAULT NULL,
  `TELEPON_KARYAWAN` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `TANGGAL_GABUNG_KARYAWAN` date DEFAULT NULL,
  `STATUS_KARYAWAN` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`ID_KARYAWAN`, `ID_ROLE`, `NAMA_KARYAWAN`, `password`, `JENIS_KELAMIN_KARYAWAN`, `TELEPON_KARYAWAN`, `email`, `TANGGAL_GABUNG_KARYAWAN`, `STATUS_KARYAWAN`) VALUES
(1, 1, 'NanaNA', '$2b$10$./22uqVjWzteD9/FJW/stOOrsREauOBVgKh575NZ0jVLJsfuLTId6', 'PEREMPUAN', '0897654321', 'nana@gmail.com', '2020-02-20', 'Resign');

-- --------------------------------------------------------

--
-- Table structure for table `meja`
--

CREATE TABLE `meja` (
  `ID_MEJA` int(11) NOT NULL,
  `NOMOR_MEJA` decimal(3,0) DEFAULT NULL,
  `STATUS_MEJA` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meja`
--

INSERT INTO `meja` (`ID_MEJA`, `NOMOR_MEJA`, `STATUS_MEJA`) VALUES
(1, '141', 'kosong'),
(3, '145', 'isi');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `ID_MENU` int(11) NOT NULL,
  `ID_STOK` int(11) NOT NULL,
  `KATEGORI_MENU` varchar(10) DEFAULT NULL,
  `NAMA_MENU` varchar(20) DEFAULT NULL,
  `DESKRIPSI_MENU` varchar(100) DEFAULT NULL,
  `UNIT_MENU` varchar(10) DEFAULT NULL,
  `HARGA_MENU` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
('0eb2d0c771463cce319b7d51e94813b5b51c70a049344b380b44134634e7c380baf3e87fa9616749', 1, 1, 'Authentication Token', '[]', 0, '2021-04-06 03:13:33', '2021-04-06 03:13:33', '2022-04-06 10:13:33'),
('706c5c0e07f2fa689e6635dcea5ed966c6f9973538a09a0103b7edf0c8753afc4ff89bc7673e2db4', 1, 1, 'Authentication Token', '[]', 0, '2021-04-06 04:22:52', '2021-04-06 04:22:52', '2022-04-06 11:22:52'),
('c24c3e1d208024b9e40828d9cb3d0c6360b3702735eb6da8cb7a34100ca3ac354327c057e34195b1', 1, 1, 'Authentication Token', '[]', 0, '2021-04-06 05:17:05', '2021-04-06 05:17:05', '2022-04-06 12:17:05'),
('f6a15948dee0b5119fea6421949f27d2494ce90ae45c3716471ca12dc38e3d8e0b4c27f9043292bf', 1, 1, 'Authentication Token', '[]', 0, '2021-04-08 00:25:51', '2021-04-08 00:25:51', '2022-04-08 07:25:51');

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
  `STATUS_PESANAN` varchar(10) DEFAULT NULL,
  `SUBTOTAL_PESANAN` decimal(10,0) DEFAULT NULL,
  `SERVICE_PESANAN` decimal(10,0) DEFAULT NULL,
  `TAX_PESANAN` decimal(10,0) DEFAULT NULL,
  `TOTAL_PESANAN` decimal(10,0) DEFAULT NULL,
  `TOTAL_JUMLAH_PESANAN` decimal(10,0) DEFAULT NULL,
  `TOTAL_ITEM_PESANAN` decimal(10,0) DEFAULT NULL,
  `STATUS_LUNAS_PESANAN` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `ID_RESERVASI` int(11) NOT NULL,
  `ID_MEJA` int(11) NOT NULL,
  `ID_CUSTOMER` int(11) NOT NULL,
  `SESI_RESERVASI` varchar(10) DEFAULT NULL,
  `TANGGAL_RESERVASI` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `ID_ROLE` int(11) NOT NULL,
  `NAMA_ROLE` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`ID_ROLE`, `NAMA_ROLE`) VALUES
(1, 'Owner'),
(2, 'Ops Manager');

-- --------------------------------------------------------

--
-- Table structure for table `stok_bahan`
--

CREATE TABLE `stok_bahan` (
  `ID_STOK` int(11) NOT NULL,
  `NAMA_STOK` varchar(20) DEFAULT NULL,
  `UNIT_STOK` varchar(10) DEFAULT NULL,
  `HARGA_STOK` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stok_bahan`
--

INSERT INTO `stok_bahan` (`ID_STOK`, `NAMA_STOK`, `UNIT_STOK`, `HARGA_STOK`) VALUES
(1, 'qwe', 'qwe', '123');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_pesanan`
--

CREATE TABLE `transaksi_pesanan` (
  `ID_TRANSAKSI` int(11) NOT NULL,
  `ID_PESANAN` int(11) NOT NULL,
  `ID_KARYAWAN` int(11) NOT NULL,
  `NOMOR_TRANSAKSI` varchar(13) DEFAULT NULL,
  `TANGGAL_TRANSAKSI` date DEFAULT NULL,
  `WAKTU_TRANSAKSI` time DEFAULT NULL,
  `JENIS_PEMBAYARAN_TRANSAKSI` varchar(20) DEFAULT NULL,
  `NOMOR_KARTU_TRANSAKSI` decimal(20,0) DEFAULT NULL,
  `NAMA_CREDIT_TRANSAKSI` varchar(20) DEFAULT NULL,
  `KODE_VERIFIKASI_TRANSAKSI` varchar(20) DEFAULT NULL
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
  ADD PRIMARY KEY (`ID_CUSTOMER`);

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
  ADD KEY `FK_KARYAWAN_RELATIONS_ROLE` (`ID_ROLE`);

--
-- Indexes for table `meja`
--
ALTER TABLE `meja`
  ADD PRIMARY KEY (`ID_MEJA`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`ID_MENU`),
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
  MODIFY `ID_CUSTOMER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `detail_stok_bahan`
--
ALTER TABLE `detail_stok_bahan`
  MODIFY `ID_DETAIL_STOK` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `ID_KARYAWAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `meja`
--
ALTER TABLE `meja`
  MODIFY `ID_MEJA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `ID_MENU` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `ID_RESERVASI` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `ID_ROLE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stok_bahan`
--
ALTER TABLE `stok_bahan`
  MODIFY `ID_STOK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
