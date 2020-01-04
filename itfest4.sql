-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2020 at 11:51 AM
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
-- Database: `itfest4`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `berkas_info` (`ID` INT(3))  BEGIN

select count(*) as jumlah, (select count(*) from tim where status_tim = 1 AND id_lomba = ID) as jumlah_lulus, (select count(*) from tim where id_lomba= ID AND status_tim is NULL ) as jumlah_new,(select count(*) from tim where id_lomba= ID AND status_tim is NULL ) as jumlah_fail from tim where id_lomba = 1 order by id_tim DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `report_lomba` (`ID` INT(3))  BEGIN
SELECT COUNT(*) AS jumlah_tim,( SELECT COUNT(*) FROM tim WHERE status_tim is NULL AND id_lomba = ID) as jumlah_blmver,( SELECT COUNT(*) FROM tim WHERE status_tim = 0 AND id_lomba = ID) as jumlah_tolak,( SELECT COUNT(*) FROM tim WHERE status_tim = 1 AND id_lomba = ID) as jumlah_suksesSeleksi ,( select COUNT(*) from peserta a join tim b on a.id_tim = b.id_tim where id_lomba = ID) as total_peserta,( SELECT COUNT(*) FROM tahap_lomba WHERE id_lomba = ID ) as jumlah_tahap,( SELECT COUNT(*) FROM tim WHERE status_pembayaran = 'Active' AND id_lomba = ID) as jumlah_bayar from tim where id_lomba = ID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `seleksi_info` (`ID` INT(3), `THP` INT(3))  BEGIN

SELECT COUNT(*) as jumlah, (select count(*)  FROM tahap_tim a inner join tahap_lomba b on a.id_tahap = b.id_tahap WHERE b.id_lomba = ID AND a.id_tahap = THP AND a.status_tim = 0) as jumlah_gagal FROM tahap_tim a inner join tahap_lomba b on a.id_tahap = b.id_tahap WHERE b.id_lomba = ID AND a.id_tahap = THP ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tahap_tim` (IN `ID` INT(3), IN `ID2` INT(3))  BEGIN
select a.id_tahap,a.id_tim,b.nama_team,b.asal_univ,a.file,a.status_tim from tahap_tim a inner join tim b on a.id_tim = b.id_tim where id_tahap = ID and b.id_tim = ID2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tahap_tim2` (IN `ID` INT, IN `STR` TEXT)  NO SQL
BEGIN

select * from tahap_tim a join tim b on a.id_tim = b.id_tim where a.id_tahap = ID AND b.nama_team LIKE CONCAT('%', STR , '%') ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tim_info` (`ID` INT(3))  BEGIN
    select * from tim a join peserta b on a.id_tim = b.id_tim where b.id_tim=ID;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bendahara`
--

CREATE TABLE `bendahara` (
  `id_bendahara` int(11) NOT NULL,
  `nama_bendahara` varchar(100) NOT NULL,
  `tgl_pembayaran` varchar(100) NOT NULL,
  `nominal_pembayaran` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `bendahara`
--
DELIMITER $$
CREATE TRIGGER `log_delete_bendahara` BEFORE DELETE ON `bendahara` FOR EACH ROW INSERT INTO log_bendahara VALUES('', old.id_bendahara,'Data Berhasil Di hapus :',now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_ins_bendahara` BEFORE INSERT ON `bendahara` FOR EACH ROW INSERT into log_bendahara VALUES('',new.id_bendahara,'Data Ditambahkan',now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_update_bendahara` BEFORE UPDATE ON `bendahara` FOR EACH ROW insert into log_bendahara VALUES('',old.id_bendahara,'Data Diupdate',now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `data_tim`
-- (See below for the actual view)
--
CREATE TABLE `data_tim` (
`id_tim` int(11)
,`nama_team` varchar(100)
,`nama_peserta` varchar(100)
,`nama_lomba` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `data_tim_ketua`
-- (See below for the actual view)
--
CREATE TABLE `data_tim_ketua` (
`nama_team` varchar(100)
,`email` text
,`status_tim` int(11)
,`nama_peserta` varchar(100)
,`status_pembayaran` enum('Active','Non-Active')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `jumlah_all`
-- (See below for the actual view)
--
CREATE TABLE `jumlah_all` (
`jumlah_tim` bigint(21)
,`jumlah_blmver` bigint(21)
,`jumlah_tolak` bigint(21)
,`jumlah_suksesSeleksi` bigint(21)
,`total_peserta` bigint(21)
,`jumlah_tahap` bigint(21)
,`jumlah_bayar` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `jumlah_tim_lomba`
-- (See below for the actual view)
--
CREATE TABLE `jumlah_tim_lomba` (
`id_lomba` int(11)
,`nama_lomba` varchar(100)
,`jumlah_tim` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `log_bendahara`
--

CREATE TABLE `log_bendahara` (
  `id_bendahara` int(11) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `waktu` text NOT NULL,
  `ip_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_bendahara`
--

INSERT INTO `log_bendahara` (`id_bendahara`, `keterangan`, `waktu`, `ip_address`) VALUES
(0, 'Data Berhasil Di hapus :', '2019-11-09', ''),
(0, 'Data Ditambahkan', '2019-11-09', ''),
(0, 'Data Ditambahkan', '2019-11-09', ''),
(0, 'Data Berhasil Di hapus :', '2019-11-09', ''),
(0, 'Data Berhasil Di hapus :', '2019-11-09', '');

-- --------------------------------------------------------

--
-- Table structure for table `log_panitia`
--

CREATE TABLE `log_panitia` (
  `id_panitia` int(11) NOT NULL,
  `keterangan` varchar(500) NOT NULL,
  `waktu` text NOT NULL,
  `ip_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_panitia`
--

INSERT INTO `log_panitia` (`id_panitia`, `keterangan`, `waktu`, `ip_address`) VALUES
(1, 'Login Admin', '0000-00-00', '::1'),
(2, 'Login Panitia', '0000-00-00', '::1'),
(2, 'Login Panitia', '1574299217', '::1'),
(2, 'Login Panitia', '1574342339', '::1'),
(2, 'Login Panitia', '1574342340', '::1'),
(2, 'Login Panitia', '1574345119', '192.168.43.1'),
(2, 'Login Panitia', '1574398199', '::1'),
(2, 'Login Panitia', '1574436938', '::1'),
(2, 'Login Panitia', '1574477503', '::1'),
(2, 'Login Panitia', '1574484306', '10.202.11.122'),
(2, 'Login Panitia', '1574662473', '::1'),
(2, 'Login Panitia', '1574662616', '::1'),
(2, 'Login Panitia', '1574660563', '::1'),
(2, 'Login Panitia', '1574660565', '::1'),
(2, 'Login Panitia', '1574660836', '::1'),
(2, 'Login Panitia', '1574660917', '::1'),
(2, 'Login Panitia', '1574662014', '::1'),
(2, 'Login Panitia', '1574662167', '::1'),
(2, 'Login Panitia', '1574662212', '::1'),
(1, 'Login Admin', '1574662337', '::1'),
(2, 'Login Panitia', '1574663380', '::1'),
(2, 'Login Panitia', '1574665444', '::1'),
(1, 'Login Admin', '1574720946', '::1'),
(1, 'Login Admin', '1574724657', '::1'),
(2, 'Login Panitia', '1574724792', '::1'),
(1, 'Login Admin', '1574720509', '::1'),
(2, 'Login Panitia', '1574720774', '::1'),
(1, 'Login Admin', '1574721185', '::1'),
(2, 'Login Panitia', '1574721215', '::1'),
(1, 'Login Admin', '1574728864', '::1'),
(2, 'Login Panitia', '1574738442', '::1'),
(1, 'Login Admin', '1574738513', '::1'),
(1, 'Login Admin', '1574741610', '::1'),
(1, 'Login Admin', '1574741647', '::1'),
(3, 'Login Admin', '1574741666', '::1'),
(3, 'Login Panitia', '1574741687', '::1'),
(3, 'Login Panitia', '1574741783', '::1'),
(1, 'Login Admin', '1574741972', '::1'),
(2, 'Login Panitia', '1574742031', '::1'),
(1, 'Login Admin', '1574782641', '::1'),
(2, 'Login Panitia', '1574785279', '::1'),
(1, 'Login Admin', '1574819060', '::1'),
(2, 'Login Panitia', '1574819947', '::1'),
(1, 'Login Admin', '1574820222', '::1'),
(1, 'Login Bendahara', '2020-01-04 11:50:03', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `log_tim`
--

CREATE TABLE `log_tim` (
  `id _tim` int(11) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `waktu` text NOT NULL,
  `ip_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lomba`
--

CREATE TABLE `lomba` (
  `id_lomba` int(11) NOT NULL,
  `nama_lomba` varchar(100) NOT NULL,
  `deskripsi` varchar(500) NOT NULL,
  `url_logo` varchar(255) NOT NULL,
  `rule` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lomba`
--

INSERT INTO `lomba` (`id_lomba`, `nama_lomba`, `deskripsi`, `url_logo`, `rule`) VALUES
(1, 'programming', 'itfestusu2020', '2b86d7f2e0e0dd7c43bd3d79b735e0a6.png', '2bd585f1509ed5a5a62cdf9b98789d15.pdf'),
(5, 'test', 'test', '02bef83e0c918524fb8b0ddf88e97fb6.png', '235c865b8b7ae22006fb43fa19e853d9.pdf'),
(6, 'awdad', 'dawdawd', '55c9c3f91dcfbb44fe9b4559333babee.png', 'feeb3b8fd02a0e405ff085dcfe4d796b.pdf'),
(7, 'mmm', 'mmmm', '2f3df8131bde9224f9ed831082cae7b8.png', '9339e51ed95c3dd0f70726a35dc492d4.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `id_peserta` int(11) NOT NULL,
  `id_tim` int(11) NOT NULL,
  `nama_peserta` varchar(100) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `url_berkas` text NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peserta`
--

INSERT INTO `peserta` (`id_peserta`, `id_tim`, `nama_peserta`, `no_hp`, `jenis_kelamin`, `url_berkas`, `email`) VALUES
(1, 4, 'Wylie', '1-781-173-3185', 'Wanita', 'userdatademo.pdf', ''),
(2, 10, 'Vance', '1-779-483-6236', 'Pria', 'userdatademo.pdf', ''),
(3, 6, 'Zahir', '1-871-293-0628', 'Pria', 'userdatademo.pdf', ''),
(4, 9, 'Kermit', '1-506-620-6228', 'Pria', 'userdatademo.pdf', ''),
(5, 10, 'Macaulay', '1-968-472-3569', 'Pria', 'userdatademo.pdf', ''),
(6, 5, 'Kyle', '1-251-362-0555', 'Wanita', 'userdatademo.pdf', ''),
(7, 10, 'Isaiah', '1-998-930-4732', 'Wanita', 'userdatademo.pdf', ''),
(8, 3, 'Harrison', '1-149-402-5541', 'Wanita', 'userdatademo.pdf', ''),
(9, 6, 'Scott', '1-285-421-4709', 'Wanita', 'userdatademo.pdf', ''),
(10, 6, 'Zeus', '1-890-592-8974', 'Wanita', 'userdatademo.pdf', ''),
(11, 1, 'Grant', '1-587-279-3297', 'Wanita', 'userdatademo.pdf', ''),
(12, 9, 'Jesse', '1-836-356-7035', 'Pria', 'userdatademo.pdf', ''),
(13, 9, 'Carter', '1-939-944-3247', 'Pria', 'userdatademo.pdf', ''),
(14, 6, 'Merrill', '1-762-336-4918', 'Wanita', 'userdatademo.pdf', ''),
(15, 2, 'Hammett', '1-174-996-8135', 'Pria', 'userdatademo.pdf', ''),
(16, 9, 'Talon', '1-885-350-2292', 'Wanita', 'userdatademo.pdf', ''),
(17, 6, 'Stuart', '1-575-516-0938', 'Wanita', 'userdatademo.pdf', ''),
(18, 5, 'Zachary', '1-709-555-7085', 'Wanita', 'userdatademo.pdf', ''),
(19, 1, 'Price', '1-839-680-8364', 'Pria', 'userdatademo.pdf', ''),
(20, 8, 'Chandler', '1-966-990-2608', 'Wanita', 'userdatademo.pdf', ''),
(21, 4, 'Declan', '1-457-464-9630', 'Pria', 'userdatademo.pdf', ''),
(22, 9, 'Kenyon', '1-222-432-6526', 'Wanita', 'userdatademo.pdf', ''),
(23, 8, 'Colby', '1-853-964-4657', 'Wanita', 'userdatademo.pdf', ''),
(24, 3, 'Andrew', '1-360-486-9414', 'Wanita', 'userdatademo.pdf', ''),
(25, 10, 'Nehru', '1-647-450-2269', 'Wanita', 'userdatademo.pdf', ''),
(26, 3, 'Hall', '1-428-549-1587', 'Pria', 'userdatademo.pdf', ''),
(27, 8, 'Acton', '1-996-473-0409', 'Wanita', 'userdatademo.pdf', ''),
(28, 8, 'Plato', '1-893-659-7497', 'Wanita', 'userdatademo.pdf', ''),
(29, 3, 'Austin', '1-998-947-6464', 'Pria', 'userdatademo.pdf', ''),
(30, 5, 'Wyatt', '1-978-118-8558', 'Wanita', 'userdatademo.pdf', ''),
(31, 2, 'Zeph', '1-981-512-1468', 'Wanita', 'userdatademo.pdf', ''),
(32, 2, 'Louis', '1-277-848-7087', 'Wanita', 'userdatademo.pdf', ''),
(33, 8, 'Gage', '1-341-433-9628', 'Pria', 'userdatademo.pdf', ''),
(34, 2, 'Walter', '1-535-958-4500', 'Pria', 'userdatademo.pdf', ''),
(35, 5, 'Lawrence', '1-472-929-8782', 'Wanita', 'userdatademo.pdf', ''),
(36, 7, 'Graham', '1-725-698-7666', 'Pria', 'userdatademo.pdf', ''),
(37, 8, 'Stuart', '1-587-474-4535', 'Pria', 'userdatademo.pdf', ''),
(38, 9, 'Vernon', '1-298-229-4060', 'Pria', 'userdatademo.pdf', ''),
(39, 4, 'Stuart', '1-848-834-7438', 'Wanita', 'userdatademo.pdf', ''),
(40, 8, 'Moses', '1-742-612-5565', 'Pria', 'userdatademo.pdf', ''),
(41, 1, 'Craig', '1-634-589-5705', 'Wanita', 'userdatademo.pdf', ''),
(42, 10, 'Uriel', '1-676-603-9971', 'Wanita', 'userdatademo.pdf', ''),
(43, 10, 'Theodore', '1-648-133-9006', 'Wanita', 'userdatademo.pdf', ''),
(44, 10, 'Benedict', '1-639-995-5861', 'Wanita', 'userdatademo.pdf', ''),
(45, 7, 'Yardley', '1-154-491-3316', 'Pria', 'userdatademo.pdf', ''),
(46, 6, 'Galvin', '1-331-689-3045', 'Wanita', 'userdatademo.pdf', ''),
(47, 9, 'Francis', '1-281-626-2441', 'Wanita', 'userdatademo.pdf', ''),
(48, 2, 'Emmanuel', '1-200-508-0625', 'Wanita', 'userdatademo.pdf', ''),
(49, 9, 'Ezra', '1-185-802-2003', 'Pria', 'userdatademo.pdf', ''),
(50, 7, 'Malik', '1-963-285-5179', 'Pria', 'userdatademo.pdf', ''),
(51, 5, 'Patrick', '1-893-819-3377', 'Pria', 'userdatademo.pdf', ''),
(52, 9, 'Tucker', '1-844-353-2013', 'Pria', 'userdatademo.pdf', ''),
(53, 7, 'Daquan', '1-797-471-5722', 'Wanita', 'userdatademo.pdf', ''),
(54, 3, 'Marshall', '1-352-907-1908', 'Wanita', 'userdatademo.pdf', ''),
(55, 4, 'Brody', '1-233-642-5682', 'Wanita', 'userdatademo.pdf', ''),
(56, 2, 'Zeus', '1-202-585-1379', 'Wanita', 'userdatademo.pdf', ''),
(57, 6, 'Carl', '1-135-591-0551', 'Pria', 'userdatademo.pdf', ''),
(58, 2, 'Vaughan', '1-302-439-5365', 'Wanita', 'userdatademo.pdf', ''),
(59, 10, 'Yardley', '1-240-565-7298', 'Wanita', 'userdatademo.pdf', ''),
(60, 6, 'Griffin', '1-243-101-8119', 'Wanita', 'userdatademo.pdf', ''),
(61, 3, 'John', '1-855-629-8268', 'Wanita', 'userdatademo.pdf', ''),
(62, 3, 'Ivor', '1-669-438-7607', 'Pria', 'userdatademo.pdf', ''),
(63, 5, 'Neil', '1-663-221-8870', 'Wanita', 'userdatademo.pdf', ''),
(64, 9, 'Malachi', '1-701-514-9257', 'Wanita', 'userdatademo.pdf', ''),
(65, 9, 'Buckminster', '1-290-381-7331', 'Pria', 'userdatademo.pdf', ''),
(66, 1, 'Tanner', '1-936-341-9403', 'Pria', 'userdatademo.pdf', ''),
(67, 2, 'Lane', '1-554-154-0406', 'Pria', 'userdatademo.pdf', ''),
(68, 6, 'Isaiah', '1-763-336-5673', 'Wanita', 'userdatademo.pdf', ''),
(69, 10, 'Kaseem', '1-279-983-8057', 'Wanita', 'userdatademo.pdf', ''),
(70, 10, 'Malachi', '1-756-515-8215', 'Pria', 'userdatademo.pdf', ''),
(71, 2, 'Sean', '1-609-125-7279', 'Wanita', 'userdatademo.pdf', ''),
(72, 10, 'Xander', '1-537-766-0471', 'Pria', 'userdatademo.pdf', ''),
(73, 5, 'Jeremy', '1-779-202-1818', 'Pria', 'userdatademo.pdf', ''),
(74, 8, 'Grady', '1-905-788-1105', 'Wanita', 'userdatademo.pdf', ''),
(75, 7, 'Wallace', '1-224-526-4258', 'Pria', 'userdatademo.pdf', ''),
(76, 9, 'Patrick', '1-227-839-2690', 'Pria', 'userdatademo.pdf', ''),
(77, 7, 'Deacon', '1-251-747-0863', 'Pria', 'userdatademo.pdf', ''),
(78, 8, 'Rigel', '1-715-976-5573', 'Wanita', 'userdatademo.pdf', ''),
(79, 6, 'Zeus', '1-570-604-8195', 'Pria', 'userdatademo.pdf', ''),
(80, 3, 'Leo', '1-365-213-2901', 'Wanita', 'userdatademo.pdf', ''),
(81, 2, 'Josiah', '1-131-792-1934', 'Pria', 'userdatademo.pdf', ''),
(82, 10, 'Jesse', '1-342-688-9149', 'Wanita', 'userdatademo.pdf', ''),
(83, 3, 'Austin', '1-680-783-1274', 'Pria', 'userdatademo.pdf', ''),
(84, 2, 'Adrian', '1-972-917-9063', 'Wanita', 'userdatademo.pdf', ''),
(85, 9, 'Christopher', '1-628-629-4731', 'Wanita', 'userdatademo.pdf', ''),
(86, 2, 'Driscoll', '1-552-761-2923', 'Pria', 'userdatademo.pdf', ''),
(87, 3, 'Evan', '1-442-409-0931', 'Pria', 'userdatademo.pdf', ''),
(88, 1, 'Baker', '1-322-377-9543', 'Pria', 'userdatademo.pdf', ''),
(89, 10, 'Burke', '1-845-996-9996', 'Pria', 'userdatademo.pdf', ''),
(90, 1, 'Silas', '1-533-225-3587', 'Pria', 'userdatademo.pdf', ''),
(91, 9, 'Chadwick', '1-233-229-5584', 'Wanita', 'userdatademo.pdf', ''),
(92, 4, 'Caldwell', '1-932-431-9145', 'Wanita', 'userdatademo.pdf', ''),
(93, 3, 'Ishmael', '1-995-947-8686', 'Pria', 'userdatademo.pdf', ''),
(94, 5, 'Fritz', '1-707-571-1798', 'Pria', 'userdatademo.pdf', ''),
(95, 5, 'Erich', '1-473-974-4248', 'Pria', 'userdatademo.pdf', ''),
(96, 8, 'Garth', '1-902-539-6656', 'Pria', 'userdatademo.pdf', ''),
(97, 5, 'Tiger', '1-366-148-9701', 'Wanita', 'userdatademo.pdf', ''),
(98, 5, 'Raymond', '1-882-203-3125', 'Wanita', 'userdatademo.pdf', ''),
(99, 3, 'Chancellor', '1-789-451-8009', 'Wanita', 'userdatademo.pdf', ''),
(100, 8, 'Todd', '1-902-864-3812', 'Wanita', 'userdatademo.pdf', '');

-- --------------------------------------------------------

--
-- Table structure for table `tahap_lomba`
--

CREATE TABLE `tahap_lomba` (
  `id_tahap` int(11) NOT NULL,
  `id_lomba` int(11) NOT NULL,
  `deskripsi_tahap` text NOT NULL,
  `file_tahap` text NOT NULL,
  `deadline` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tahap_lomba`
--

INSERT INTO `tahap_lomba` (`id_tahap`, `id_lomba`, `deskripsi_tahap`, `file_tahap`, `deadline`) VALUES
(10, 1, 'Esay', 'd5e01a8631861e900d98479a76e4a7ac.pdf', '2019-11-27'),
(11, 1, 'awdad', 'd79d7c40258bc53e714649d857fb7c7b.pdf', '2019-11-12');

-- --------------------------------------------------------

--
-- Table structure for table `tahap_tim`
--

CREATE TABLE `tahap_tim` (
  `id_tahap` int(11) NOT NULL,
  `id_tim` int(11) DEFAULT NULL,
  `status_tim` int(11) DEFAULT NULL,
  `file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tahap_tim`
--

INSERT INTO `tahap_tim` (`id_tahap`, `id_tim`, `status_tim`, `file`) VALUES
(10, 1, 0, 'ww');

-- --------------------------------------------------------

--
-- Table structure for table `tim`
--

CREATE TABLE `tim` (
  `id_tim` int(11) NOT NULL,
  `nama_team` varchar(100) NOT NULL,
  `asal_univ` varchar(100) NOT NULL,
  `username_tim` varchar(100) NOT NULL,
  `password_tim` text,
  `Id_lomba` int(11) NOT NULL,
  `id_ketua` int(100) DEFAULT NULL,
  `url_buktipembayaran` varchar(255) DEFAULT 'buktidemo.pdf',
  `status_tim` int(11) DEFAULT NULL,
  `status_pembayaran` enum('Active','Non-Active') NOT NULL DEFAULT 'Non-Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tim`
--

INSERT INTO `tim` (`id_tim`, `nama_team`, `asal_univ`, `username_tim`, `password_tim`, `Id_lomba`, `id_ketua`, `url_buktipembayaran`, `status_tim`, `status_pembayaran`) VALUES
(1, 'team#1', 'univ#1', 'demoteam1', NULL, 1, 11, 'buktidemo.pdf', 0, 'Active'),
(2, 'team#2', 'univ#2', 'demoteam2', NULL, 1, NULL, 'buktidemo.pdf', 0, 'Non-Active'),
(3, 'team#3', 'univ#3', 'demoteam3', NULL, 1, NULL, 'buktidemo.pdf', 0, 'Active'),
(4, 'team#4', 'univ#4', 'demoteam4', NULL, 1, NULL, 'buktidemo.pdf', 0, 'Active'),
(5, 'team#5', 'univ#5', 'demoteam5', NULL, 1, NULL, 'buktidemo.pdf', 0, 'Active'),
(6, 'team#6', 'univ#6', 'demoteam6', NULL, 1, NULL, 'buktidemo.pdf', 0, 'Active'),
(7, 'team#7', 'univ#7', 'demoteam7', NULL, 1, NULL, 'buktidemo.pdf', 1, 'Active'),
(8, 'team#8', 'univ#8', 'demoteam8', NULL, 1, NULL, 'buktidemo.pdf', 1, 'Active'),
(9, 'team#9', 'univ#9', 'demoteam9', NULL, 1, NULL, 'buktidemo.pdf', 1, 'Active'),
(10, 'team#10', 'univ#10', 'demoteam10', NULL, 1, NULL, 'buktidemo.pdf', NULL, 'Active'),
(11, 'team#10', 'univ#10', 'demoteam10', NULL, 5, NULL, 'buktidemo.pdf', NULL, 'Active');

-- --------------------------------------------------------

--
-- Stand-in structure for view `tim_peserta`
-- (See below for the actual view)
--
CREATE TABLE `tim_peserta` (
`nama_team` varchar(100)
,`asal_univ` varchar(100)
,`username_tim` varchar(100)
,`password_tim` text
,`id_lomba` int(11)
,`id_ketua` int(100)
,`url_buktipembayaran` varchar(255)
,`status_tim` int(11)
,`status_pembayaran` enum('Active','Non-Active')
,`id_peserta` int(11)
,`id_tim` int(11)
,`nama_peserta` varchar(100)
,`no_hp` varchar(15)
,`jenis_kelamin` varchar(20)
,`url_berkas` text
,`email` text
);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `nama` varchar(100) NOT NULL,
  `status_akun` enum('Active','Non-Active') NOT NULL DEFAULT 'Non-Active',
  `id_lomba` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama`, `status_akun`, `id_lomba`) VALUES
(1, 'itfestusu2020', '$2y$10$YLhK1k5uvKgSJMnHMdA6O.MeSTTNK1vafJgoAt4m32JX/Ox.ea15C', '', 'Active', 0),
(2, 'programming', '$2y$10$c4dah//YSwAj6AafXIvFY.iHuTO8GzTg1UAQdecIjHHCh.B6uI3UC', '', 'Non-Active', 1),
(3, 'w', '$2y$10$zZBAw3r6buv/QbpCu.Hl.OTOMC67Re45cHrlWSGdCvpcljtTdARx2', '', 'Non-Active', 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_lomba`
-- (See below for the actual view)
--
CREATE TABLE `user_lomba` (
`id_user` int(11)
,`username` varchar(100)
,`password` text
,`nama` varchar(100)
,`status_akun` enum('Active','Non-Active')
,`id_lomba` int(11)
,`nama_lomba` varchar(100)
,`deskripsi` varchar(500)
,`url_logo` varchar(255)
,`rule` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_panitia`
-- (See below for the actual view)
--
CREATE TABLE `user_panitia` (
`id_user` int(11)
,`username` varchar(100)
,`password` text
,`nama` varchar(100)
,`status_akun` enum('Active','Non-Active')
,`id_lomba` int(11)
,`deskripsi` varchar(500)
);

-- --------------------------------------------------------

--
-- Structure for view `data_tim`
--
DROP TABLE IF EXISTS `data_tim`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `data_tim`  AS  select `tim`.`id_tim` AS `id_tim`,`tim`.`nama_team` AS `nama_team`,`peserta`.`nama_peserta` AS `nama_peserta`,`lomba`.`nama_lomba` AS `nama_lomba` from ((`tim` join `peserta`) join `lomba` on(((`tim`.`Id_lomba` = `lomba`.`id_lomba`) and (`tim`.`id_tim` = `peserta`.`id_tim`)))) ;

-- --------------------------------------------------------

--
-- Structure for view `data_tim_ketua`
--
DROP TABLE IF EXISTS `data_tim_ketua`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `data_tim_ketua`  AS  select `a`.`nama_team` AS `nama_team`,`b`.`email` AS `email`,`a`.`status_tim` AS `status_tim`,`b`.`nama_peserta` AS `nama_peserta`,`a`.`status_pembayaran` AS `status_pembayaran` from (`tim` `a` join `peserta` `b` on((`a`.`id_ketua` = `b`.`id_peserta`))) ;

-- --------------------------------------------------------

--
-- Structure for view `jumlah_all`
--
DROP TABLE IF EXISTS `jumlah_all`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `jumlah_all`  AS  select count(0) AS `jumlah_tim`,(select count(0) from `tim` where isnull(`tim`.`status_tim`)) AS `jumlah_blmver`,(select count(0) from `tim` where (`tim`.`status_tim` = 0)) AS `jumlah_tolak`,(select count(0) from `tim` where (`tim`.`status_tim` = 1)) AS `jumlah_suksesSeleksi`,(select count(0) from (`peserta` `a` join `tim` `b` on((`a`.`id_tim` = `b`.`id_tim`)))) AS `total_peserta`,(select count(0) from `tahap_lomba`) AS `jumlah_tahap`,(select count(0) from `tim` where (`tim`.`status_pembayaran` = 'Active')) AS `jumlah_bayar` from `tim` ;

-- --------------------------------------------------------

--
-- Structure for view `jumlah_tim_lomba`
--
DROP TABLE IF EXISTS `jumlah_tim_lomba`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `jumlah_tim_lomba`  AS  select `a`.`id_lomba` AS `id_lomba`,`a`.`nama_lomba` AS `nama_lomba`,(select count(0) from `tim` where (`tim`.`Id_lomba` = `a`.`id_lomba`)) AS `jumlah_tim` from (`lomba` `a` join `tim` `b` on((`a`.`id_lomba` = `b`.`Id_lomba`))) group by `a`.`id_lomba` ;

-- --------------------------------------------------------

--
-- Structure for view `tim_peserta`
--
DROP TABLE IF EXISTS `tim_peserta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tim_peserta`  AS  select `t`.`nama_team` AS `nama_team`,`t`.`asal_univ` AS `asal_univ`,`t`.`username_tim` AS `username_tim`,`t`.`password_tim` AS `password_tim`,`t`.`Id_lomba` AS `id_lomba`,`t`.`id_ketua` AS `id_ketua`,`t`.`url_buktipembayaran` AS `url_buktipembayaran`,`t`.`status_tim` AS `status_tim`,`t`.`status_pembayaran` AS `status_pembayaran`,`p`.`id_peserta` AS `id_peserta`,`p`.`id_tim` AS `id_tim`,`p`.`nama_peserta` AS `nama_peserta`,`p`.`no_hp` AS `no_hp`,`p`.`jenis_kelamin` AS `jenis_kelamin`,`p`.`url_berkas` AS `url_berkas`,`p`.`email` AS `email` from (`tim` `t` join `peserta` `p` on((`t`.`id_tim` = `p`.`id_tim`))) ;

-- --------------------------------------------------------

--
-- Structure for view `user_lomba`
--
DROP TABLE IF EXISTS `user_lomba`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_lomba`  AS  select `u`.`id_user` AS `id_user`,`u`.`username` AS `username`,`u`.`password` AS `password`,`u`.`nama` AS `nama`,`u`.`status_akun` AS `status_akun`,`u`.`id_lomba` AS `id_lomba`,`l`.`nama_lomba` AS `nama_lomba`,`l`.`deskripsi` AS `deskripsi`,`l`.`url_logo` AS `url_logo`,`l`.`rule` AS `rule` from (`user` `u` join `lomba` `l` on((`u`.`id_lomba` = `l`.`id_lomba`))) ;

-- --------------------------------------------------------

--
-- Structure for view `user_panitia`
--
DROP TABLE IF EXISTS `user_panitia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_panitia`  AS  select `u`.`id_user` AS `id_user`,`u`.`username` AS `username`,`u`.`password` AS `password`,`u`.`nama` AS `nama`,`u`.`status_akun` AS `status_akun`,`u`.`id_lomba` AS `id_lomba`,`p`.`deskripsi` AS `deskripsi` from (`user` `u` join `lomba` `p` on((`u`.`id_lomba` = `p`.`id_lomba`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bendahara`
--
ALTER TABLE `bendahara`
  ADD PRIMARY KEY (`id_bendahara`);

--
-- Indexes for table `lomba`
--
ALTER TABLE `lomba`
  ADD PRIMARY KEY (`id_lomba`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`id_peserta`),
  ADD KEY `id_tim` (`id_tim`);

--
-- Indexes for table `tahap_lomba`
--
ALTER TABLE `tahap_lomba`
  ADD PRIMARY KEY (`id_tahap`),
  ADD KEY `id_lomba` (`id_lomba`);

--
-- Indexes for table `tahap_tim`
--
ALTER TABLE `tahap_tim`
  ADD KEY `id_tahap` (`id_tahap`),
  ADD KEY `id_tim` (`id_tim`);

--
-- Indexes for table `tim`
--
ALTER TABLE `tim`
  ADD PRIMARY KEY (`id_tim`),
  ADD UNIQUE KEY `id_ketua` (`id_ketua`),
  ADD KEY `Id_lomba` (`Id_lomba`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_lomba` (`id_lomba`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lomba`
--
ALTER TABLE `lomba`
  MODIFY `id_lomba` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `peserta`
--
ALTER TABLE `peserta`
  MODIFY `id_peserta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `tahap_lomba`
--
ALTER TABLE `tahap_lomba`
  MODIFY `id_tahap` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tim`
--
ALTER TABLE `tim`
  MODIFY `id_tim` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tahap_tim`
--
ALTER TABLE `tahap_tim`
  ADD CONSTRAINT `id_tahap01` FOREIGN KEY (`id_tahap`) REFERENCES `tahap_lomba` (`id_tahap`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
