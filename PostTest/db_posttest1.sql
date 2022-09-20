-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 20, 2022 at 08:25 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_posttest1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(10) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telp` varchar(12) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `email`, `telp`, `alamat`, `username`, `password`) VALUES
(1, 'azka', 'azka@gmail.com', '0812345', 'semarang', 'azka123', 'azka123'),
(2, 'fawwaz', 'fawwaz@gmail.com', '08123455', 'purwokerto', 'fawwaz123', 'fawwaz123'),
(3, 'muaz', 'muaz@gmail.com', '0812345567', 'pakistan', 'muaz123', 'muaz123');

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` int(10) NOT NULL,
  `id_transaksi` int(10) DEFAULT NULL,
  `id_supir` int(10) DEFAULT NULL,
  `jasa_supir` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `id_transaksi`, `id_supir`, `jasa_supir`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` int(10) NOT NULL,
  `nama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `nama`) VALUES
(1, 'ayla'),
(2, 'pajero'),
(3, 'karimun');

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `id_konfirmasi` int(10) NOT NULL,
  `id_transaksi` int(10) DEFAULT NULL,
  `bukti` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `konfirmasi`
--

INSERT INTO `konfirmasi` (`id_konfirmasi`, `id_transaksi`, `bukti`) VALUES
(1, 1, 'bri.png'),
(2, 2, 'bca.png'),
(3, 3, 'bri.png');

-- --------------------------------------------------------

--
-- Table structure for table `mobil`
--

CREATE TABLE `mobil` (
  `id_mobil` int(10) NOT NULL,
  `id_jenis` int(10) DEFAULT NULL,
  `no_mobil` varchar(200) DEFAULT NULL,
  `merk` varchar(255) DEFAULT NULL,
  `nama_mobil` varchar(255) DEFAULT NULL,
  `harga` int(10) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `status` enum('Diproses''Belum diproses') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mobil`
--

INSERT INTO `mobil` (`id_mobil`, `id_jenis`, `no_mobil`, `merk`, `nama_mobil`, `harga`, `gambar`, `status`) VALUES
(1, 1, 'B 100', 'Hyundai', 'ayla', 7000000, 'ayla.png', ''),
(2, 2, 'B 200', 'Supra', 'pajero', 9000000, 'pajero.png', 'Diproses\'Belum diproses'),
(3, 3, 'B 300', 'Daihatsu', 'karimun', 1000000, 'karimun.png', '');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(10) NOT NULL,
  `no_ktp` char(16) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `no_telp` char(12) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `no_ktp`, `nama`, `email`, `no_telp`, `alamat`, `username`, `password`) VALUES
(1, '3345683', 'azka', 'azka@gmail.com', '0812345', 'semarang', 'azka123', 'azka123'),
(2, '26536734', 'fawwaz', 'fawwaz@gmail.com', '08123455', 'purwokero', 'fawwaz123', 'fawwaz123'),
(3, '24557543', 'muaz', 'muaz@gmail.com', '0812345567', 'pakistan', 'muaz123', 'muaz123');

-- --------------------------------------------------------

--
-- Table structure for table `supir`
--

CREATE TABLE `supir` (
  `id_supir` int(10) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `telp` char(16) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supir`
--

INSERT INTO `supir` (`id_supir`, `nama`, `telp`, `alamat`, `status`) VALUES
(1, 'zirjy', '081234', 'bogor', '0'),
(2, 'azka', '1832', 'semarang', '1'),
(3, 'muaz', '4283482', 'pakistan', '0');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(10) NOT NULL,
  `id_pelanggan` int(10) DEFAULT NULL,
  `id_mobil` int(10) DEFAULT NULL,
  `tgl_sewa` datetime DEFAULT NULL,
  `tgl_ambil` datetime DEFAULT NULL,
  `tgl_kembali` datetime DEFAULT NULL,
  `lama` int(10) DEFAULT NULL,
  `total_harga` int(10) DEFAULT NULL,
  `status` enum('0''1') DEFAULT NULL,
  `jaminan` varchar(255) DEFAULT NULL,
  `denda` int(10) DEFAULT NULL,
  `jatuh_tempo` datetime DEFAULT NULL,
  `konfirmasi` enum('0','1') DEFAULT NULL,
  `pembatalan` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pelanggan`, `id_mobil`, `tgl_sewa`, `tgl_ambil`, `tgl_kembali`, `lama`, `total_harga`, `status`, `jaminan`, `denda`, `jatuh_tempo`, `konfirmasi`, `pembatalan`) VALUES
(1, 1, 1, '2021-12-12 12:45:30', '2021-12-13 17:45:20', '2021-12-14 19:45:12', 4, 7000000, '', 'Rumah', 100000, NULL, '0', '1'),
(2, 2, 2, '2021-12-14 19:45:12', '2021-12-14 19:45:12', '2021-12-14 19:45:12', 7, 8000000, '0\'1', 'Motor', 200000, NULL, '1', '0'),
(3, 3, 3, '2021-12-14 19:45:12', '2021-12-14 19:45:12', '2021-12-14 19:45:12', 6, 9000000, '0\'1', 'ZIRJY', 300000, NULL, '1', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`id_konfirmasi`);

--
-- Indexes for table `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`id_mobil`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `supir`
--
ALTER TABLE `supir`
  ADD PRIMARY KEY (`id_supir`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id_jenis` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  MODIFY `id_konfirmasi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mobil`
--
ALTER TABLE `mobil`
  MODIFY `id_mobil` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supir`
--
ALTER TABLE `supir`
  MODIFY `id_supir` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `fk_detail_transaksi` FOREIGN KEY (`id_detail`) REFERENCES `transaksi` (`id_transaksi`),
  ADD CONSTRAINT `fk_detail_transaksi1` FOREIGN KEY (`id_detail`) REFERENCES `supir` (`id_supir`);

--
-- Constraints for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD CONSTRAINT `fk_konfirmasi` FOREIGN KEY (`id_konfirmasi`) REFERENCES `transaksi` (`id_transaksi`);

--
-- Constraints for table `mobil`
--
ALTER TABLE `mobil`
  ADD CONSTRAINT `id_mobil` FOREIGN KEY (`id_mobil`) REFERENCES `jenis` (`id_jenis`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_transaksi` FOREIGN KEY (`id_transaksi`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `fk_transaksi1` FOREIGN KEY (`id_transaksi`) REFERENCES `mobil` (`id_mobil`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
