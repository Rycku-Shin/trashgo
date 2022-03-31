-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Mar 2022 pada 07.23
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trashgo_nontps`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `Id_admin` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `Kelamin` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `Alamat` varchar(255) NOT NULL,
  `Id_user` int(11) NOT NULL,
  `Nama_user` varchar(255) NOT NULL,
  `Kelamin` varchar(20) NOT NULL,
  `Tempat_lahir` varchar(255) NOT NULL,
  `Tanggal_lahir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `komplek`
--

CREATE TABLE `komplek` (
  `Id_komplek` int(11) NOT NULL,
  `Nama_komplek` varchar(255) NOT NULL,
  `Rt/Rw` varchar(11) NOT NULL,
  `Alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan`
--

CREATE TABLE `laporan` (
  `Id_laporan` int(11) NOT NULL,
  `Tanggal_laporan` date NOT NULL,
  `Id_admin` int(11) NOT NULL,
  `Id_komplek` int(11) NOT NULL,
  `Id_truck` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `truck`
--

CREATE TABLE `truck` (
  `Id_Truk` int(11) NOT NULL,
  `Nama_supir` varchar(255) NOT NULL,
  `Plat_nomor` varchar(11) NOT NULL,
  `Jalur` varchar(255) NOT NULL,
  `Alamat_supir` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `Id_user` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Id_admin`);

--
-- Indeks untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`Alamat`),
  ADD KEY `Id_user` (`Id_user`);

--
-- Indeks untuk tabel `komplek`
--
ALTER TABLE `komplek`
  ADD PRIMARY KEY (`Id_komplek`),
  ADD KEY `Alamat` (`Alamat`);

--
-- Indeks untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`Id_laporan`),
  ADD KEY `Id_komplek` (`Id_komplek`),
  ADD KEY `Id_admin` (`Id_admin`),
  ADD KEY `Id_trusck` (`Id_truck`);

--
-- Indeks untuk tabel `truck`
--
ALTER TABLE `truck`
  ADD PRIMARY KEY (`Id_Truk`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `Id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5454569;

--
-- AUTO_INCREMENT untuk tabel `komplek`
--
ALTER TABLE `komplek`
  MODIFY `Id_komplek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=434244;

--
-- AUTO_INCREMENT untuk tabel `laporan`
--
ALTER TABLE `laporan`
  MODIFY `Id_laporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=887669;

--
-- AUTO_INCREMENT untuk tabel `truck`
--
ALTER TABLE `truck`
  MODIFY `Id_Truk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=687981;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD CONSTRAINT `akun_ibfk_1` FOREIGN KEY (`Id_user`) REFERENCES `user` (`Id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `komplek`
--
ALTER TABLE `komplek`
  ADD CONSTRAINT `komplek_ibfk_1` FOREIGN KEY (`Alamat`) REFERENCES `akun` (`Alamat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`Id_komplek`) REFERENCES `komplek` (`Id_komplek`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `laporan_ibfk_2` FOREIGN KEY (`Id_admin`) REFERENCES `admin` (`Id_admin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `laporan_ibfk_3` FOREIGN KEY (`Id_truck`) REFERENCES `truck` (`Id_Truk`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
