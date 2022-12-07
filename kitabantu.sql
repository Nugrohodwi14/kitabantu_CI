-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Des 2022 pada 03.11
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kitabantu`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `acara`
--

CREATE TABLE `acara` (
  `id_acara` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tempat` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` varchar(255) NOT NULL,
  `penyelenggara` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `waktu_input_data` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `acara`
--

INSERT INTO `acara` (`id_acara`, `nama`, `tempat`, `tanggal`, `waktu`, `penyelenggara`, `deskripsi`, `foto`, `id_admin`, `waktu_input_data`) VALUES
(1, 'Seminar Haha Hihi', 'Disana', '2022-12-06', '24.00 WIB', 'Dia', 'Ini deskripsi', '', 0, '2022-12-07 02:05:07'),
(2, 'Seminar Haha Hihi', 'Disana', '2022-12-06', '24.00 WIB', 'Dia', 'Ini deskripsi', '', 0, '2022-12-07 02:05:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama_lengkap` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_hp` varchar(25) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `waktu_input_data` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_lengkap`, `username`, `email`, `password`, `no_hp`, `foto`, `waktu_input_data`) VALUES
(1, 'nugi', 'nugi', 'nug@gmail.com', 'nugi', '088', 'aa', '2022-12-07 01:52:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `relawan`
--

CREATE TABLE `relawan` (
  `id_relawan` int(11) NOT NULL,
  `nama_lengkap` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tempat_lahir` varchar(200) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(25) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `waktu_input_data` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `relawan`
--

INSERT INTO `relawan` (`id_relawan`, `nama_lengkap`, `username`, `email`, `password`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `no_hp`, `foto`, `waktu_input_data`) VALUES
(1, '', 'aa', 'aa@gmail.com', '4124bc0a9335c27f086f24ba207a4912', '', '0000-00-00', '', '', '', '2022-12-07 01:54:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `relawan_acara`
--

CREATE TABLE `relawan_acara` (
  `id_relawan_acara` int(11) NOT NULL,
  `id_acara` int(11) NOT NULL,
  `id_relawan` int(11) NOT NULL,
  `waktu_relawan_input` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0,
  `id_admin` int(11) DEFAULT NULL,
  `waktu_admin_konfirmasi` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `relawan_acara`
--

INSERT INTO `relawan_acara` (`id_relawan_acara`, `id_acara`, `id_relawan`, `waktu_relawan_input`, `status`, `id_admin`, `waktu_admin_konfirmasi`) VALUES
(1, 1, 1, '2022-12-07 02:05:25', 0, NULL, '2022-12-07 02:05:25');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `acara`
--
ALTER TABLE `acara`
  ADD PRIMARY KEY (`id_acara`);

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `relawan`
--
ALTER TABLE `relawan`
  ADD PRIMARY KEY (`id_relawan`);

--
-- Indeks untuk tabel `relawan_acara`
--
ALTER TABLE `relawan_acara`
  ADD PRIMARY KEY (`id_relawan_acara`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `acara`
--
ALTER TABLE `acara`
  MODIFY `id_acara` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `relawan`
--
ALTER TABLE `relawan`
  MODIFY `id_relawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `relawan_acara`
--
ALTER TABLE `relawan_acara`
  MODIFY `id_relawan_acara` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
