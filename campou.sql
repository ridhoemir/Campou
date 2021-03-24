-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2020 at 03:32 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `campou`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `username_cust` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`username_cust`, `password`, `Email`, `foto`) VALUES
('faishal', '$2y$10$JVfSh1xdV6P8m1Em99vx2.2Y43j6K0KIZPvdLp2VXeRc1aEXqTdT6', 'mhmd.faishal12@gmail.com', '1606269690_762b55d2e7f649a7113a.png');

-- --------------------------------------------------------

--
-- Table structure for table `detail_penyewaan`
--

CREATE TABLE `detail_penyewaan` (
  `nomor_penyewaan` varchar(4) NOT NULL,
  `username_cust` varchar(100) DEFAULT NULL,
  `Nama` varchar(30) NOT NULL,
  `Nomor_Telepon` char(12) NOT NULL,
  `Nama_Lapangan` varchar(30) NOT NULL,
  `IdLapangan` varchar(4) NOT NULL,
  `tgl_main` date NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `total_harga` int(11) NOT NULL,
  `durasi` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_penyewaan`
--

INSERT INTO `detail_penyewaan` (`nomor_penyewaan`, `username_cust`, `Nama`, `Nomor_Telepon`, `Nama_Lapangan`, `IdLapangan`, `tgl_main`, `jam_mulai`, `jam_selesai`, `total_harga`, `durasi`) VALUES
('5742', 'faishal', 'Aku Anak Baik', '0876582854', 'Lapangan Futsal', 'LP1', '2020-11-30', '13:00:00', '14:00:00', 65000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `kode_jadwal` varchar(4) NOT NULL,
  `jam` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`kode_jadwal`, `jam`) VALUES
('jd1', '24'),
('jd2', '24');

-- --------------------------------------------------------

--
-- Table structure for table `lapangan`
--

CREATE TABLE `lapangan` (
  `IdLapangan` varchar(4) NOT NULL,
  `Nama_Lapangan` varchar(25) NOT NULL,
  `kode_tarif` varchar(4) NOT NULL,
  `kode_jadwal` varchar(4) NOT NULL,
  `Nomor_Lapangan` varchar(5) NOT NULL,
  `foto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lapangan`
--

INSERT INTO `lapangan` (`IdLapangan`, `Nama_Lapangan`, `kode_tarif`, `kode_jadwal`, `Nomor_Lapangan`, `foto`) VALUES
('LP1', 'Lapangan Futsal', 'trf1', 'jd1', '01', 'futsal1.jpg'),
('LP2', 'Lapangan Basket', 'trf2', 'jd2', '01', 'basket1.jpg'),
('LP3', 'Lapangan Voly', 'trf1', 'jd1', '01', 'voly1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `penyedia`
--

CREATE TABLE `penyedia` (
  `IdPenyedia` varchar(100) NOT NULL,
  `Nama_Penyedia` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `Nomor_Telepon` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penyedia`
--

INSERT INTO `penyedia` (`IdPenyedia`, `Nama_Penyedia`, `email`, `foto`, `password`, `Nomor_Telepon`) VALUES
('0001', 'Faishal', 'alexander@gmail.com', '16.jpg', '$2y$10$KZfm0mcZI757ZT/TOcENW.mkRLSlb3AgnAUZwJEE3nEFht83xUkDi', '087361826218'),
('0002', 'Join', 'join@gmail.com', '20.jpg', '$2y$10$Om8lR4et4.CQmtpEhk.pquB7xE0LZeWIBdhLlNwRgY.FKoV0G1LlC', '08646732612'),
('0020', 'Ridho', 'ridho@gmail.com', '44.jpg', '$2y$10$asN.Oi4WcAjVVYLQUm8yae9O3WX.A9qIGb5rN1.vlludn27qM1jDC', '087632532732');

-- --------------------------------------------------------

--
-- Table structure for table `tarif`
--

CREATE TABLE `tarif` (
  `kode_tarif` varchar(4) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tarif`
--

INSERT INTO `tarif` (`kode_tarif`, `harga`) VALUES
('trf1', 65000),
('trf2', 125000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`username_cust`);

--
-- Indexes for table `detail_penyewaan`
--
ALTER TABLE `detail_penyewaan`
  ADD PRIMARY KEY (`nomor_penyewaan`),
  ADD KEY `IdLapangan` (`IdLapangan`),
  ADD KEY `username_cust` (`username_cust`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`kode_jadwal`);

--
-- Indexes for table `lapangan`
--
ALTER TABLE `lapangan`
  ADD PRIMARY KEY (`IdLapangan`),
  ADD KEY `kode_jadwal` (`kode_jadwal`),
  ADD KEY `kode_tarif` (`kode_tarif`);

--
-- Indexes for table `penyedia`
--
ALTER TABLE `penyedia`
  ADD PRIMARY KEY (`IdPenyedia`);

--
-- Indexes for table `tarif`
--
ALTER TABLE `tarif`
  ADD PRIMARY KEY (`kode_tarif`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_penyewaan`
--
ALTER TABLE `detail_penyewaan`
  ADD CONSTRAINT `IdLapangan` FOREIGN KEY (`IdLapangan`) REFERENCES `lapangan` (`IdLapangan`),
  ADD CONSTRAINT `username_cust` FOREIGN KEY (`username_cust`) REFERENCES `customer` (`username_cust`);

--
-- Constraints for table `lapangan`
--
ALTER TABLE `lapangan`
  ADD CONSTRAINT `kode_jadwal` FOREIGN KEY (`kode_jadwal`) REFERENCES `jadwal` (`kode_jadwal`),
  ADD CONSTRAINT `kode_tarif` FOREIGN KEY (`kode_tarif`) REFERENCES `tarif` (`kode_tarif`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
