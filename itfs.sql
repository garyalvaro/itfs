-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2020 at 05:12 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itfs`
--

-- --------------------------------------------------------

--
-- Table structure for table `seminar`
--

CREATE TABLE `seminar` (
  `kode_seminar` varchar(20) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `identitas` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `path_bukti` varchar(255) DEFAULT NULL,
  `status_pembayaran` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seminar`
--

INSERT INTO `seminar` (`kode_seminar`, `nama`, `email`, `telepon`, `identitas`, `tgl_lahir`, `path_bukti`, `status_pembayaran`) VALUES
('ITF-KQGS-0101230016', 'Naldo', 'naldo@gmail.com', '08941223563', '123145125121', '2020-01-21', 'http://localhost/itfs/assets/seminar_assets/foto_bukti/ITF-KQGS-0101230016.jpg', '0'),
('ITF-MOJY-0101193814', 'Andi Law', 'andilaw@gmail.com', '0811515511515', '1231451251', '2020-01-01', 'http://localhost/itfs/assets/seminar_assets/foto_bukti/ITF-MOJY-0101193814.jpg', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `seminar`
--
ALTER TABLE `seminar`
  ADD PRIMARY KEY (`kode_seminar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
