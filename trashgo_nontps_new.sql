-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2022 at 04:49 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trashgo_nontps_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Id_admin` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `Jabatan` varchar(255) NOT NULL,
  `Kelamin` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `Id_akun` int(11) NOT NULL,
  `Id_admin` int(11) NOT NULL,
  `Id_Supir` int(11) NOT NULL,
  `Id_User` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `Id_kendaraan` int(11) NOT NULL,
  `Nomor_STNK` int(11) NOT NULL,
  `Plat_nomor` varchar(11) NOT NULL,
  `jalur` int(255) NOT NULL,
  `Jenis_kendaraan` varchar(11) NOT NULL,
  `Id_komplek` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `komplek`
--

CREATE TABLE `komplek` (
  `Id_komplek` int(11) NOT NULL,
  `Nama_komplek` varchar(255) NOT NULL,
  `Rt` varchar(11) NOT NULL,
  `Rw` varchar(11) NOT NULL,
  `Alamat` varchar(255) NOT NULL,
  `Id_User` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `Id_laporan` int(11) NOT NULL,
  `Data_laporan` int(11) NOT NULL,
  `Id_komplek` int(11) NOT NULL,
  `Id_kendaraan` int(11) NOT NULL,
  `Id_Supir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `Riwaayat_login` datetime NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Id_akun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `supir`
--

CREATE TABLE `supir` (
  `Id_supir` int(11) NOT NULL,
  `Jalur` varchar(255) NOT NULL,
  `Kelamin` varchar(11) NOT NULL,
  `KTP_Supir` int(16) NOT NULL,
  `Umur` int(11) NOT NULL,
  `Id_kendaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` bigint(20) NOT NULL,
  `email` longtext DEFAULT NULL,
  `password` longblob DEFAULT NULL,
  `nama_user` longtext DEFAULT NULL,
  `alamat` longtext DEFAULT NULL,
  `tempat_lahir` longtext DEFAULT NULL,
  `kelamin` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `email`, `password`, `nama_user`, `alamat`, `tempat_lahir`, `kelamin`) VALUES
(12, 'a@gmail.com', 0x243261243134244146384e5744595a64654735483167753969484a2e4f6a77583562567938752e412e4f413455512e4e724936513871447779434479, 'bagja', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Id_admin`);

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`Id_akun`);

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`Id_kendaraan`);

--
-- Indexes for table `komplek`
--
ALTER TABLE `komplek`
  ADD PRIMARY KEY (`Id_komplek`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`Id_laporan`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`Riwaayat_login`);

--
-- Indexes for table `supir`
--
ALTER TABLE `supir`
  ADD PRIMARY KEY (`Id_supir`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Id_admin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `komplek`
--
ALTER TABLE `komplek`
  MODIFY `Id_komplek` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supir`
--
ALTER TABLE `supir`
  MODIFY `Id_supir` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
