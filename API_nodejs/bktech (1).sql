-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2021 at 01:14 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bktech`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `price` int(11) NOT NULL,
  `images` varchar(100) NOT NULL,
  `info` text NOT NULL,
  `exdate` varchar(10) NOT NULL,
  `categorys` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `images`, `info`, `exdate`, `categorys`) VALUES
(2, 'Fanta', 1000, 'image.jpg', 'This fanta', '10/01/2021', ''),
(3, 'name', 10, 'image.jpg', '10', '10', '10'),
(10, 'testd', 10, 'image.jpg', 'test info', '2020-02-12', 'fatanta'),
(11, 'product', 1500, 'image.jpg', 'info ', '01/01/2005', 'Cloths'),
(12, 'Computer ', 12000, 'image.jpg', 'i7', '01/01/2009', 'Electronic');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `regnumber` varchar(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `username` varchar(11) NOT NULL,
  `password` varchar(25) NOT NULL,
  `cdate` varchar(20) NOT NULL,
  `usertype` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `regnumber`, `name`, `phone`, `username`, `password`, `cdate`, `usertype`) VALUES
(1, 'BKT001', 'uwizewe', '0788672782', 'jean', 'jean', '2021-07-04', '0'),
(2, 'BKT002', 'jean', '788672785', 'nna', 'fafa', '2021-07-04', '0'),
(3, 'BKT003', 'namesd', '788976523', 'nana', 'nana', '2021-07-04', '0'),
(4, 'BKT004', 'tatataxxx', '788672786', 'jeanss', 'jeanddd', '2021-07-04', '0'),
(5, 'BKT005', 'names', '788895623', 'jeansss', 'jean', '2021-07-04', '0'),
(6, 'BKT005', 'names', '0788', 'username', 'password', '0000-00-00', '0'),
(7, 'BKT006', 'names', '07888', 'usernames', 'password', '0000-00-00', '0'),
(8, 'BKT007', 'names', '078888', 'usernamesd', 'password', '2021-07-06', '0'),
(9, 'BKT008', 'undefined', 'undefined', 'undefined', 'undefined', '2021-07-06', '0'),
(10, 'BKT009', 'jean', '0788882782', 'mama', 'pass', '2021-07-06', '0'),
(11, 'BKT0010', 'jean', '078888278', 'mamad', 'pass', '2021-07-06', '0'),
(12, 'BKT0011', 'check', '0788672745', 'check', 'check', '2021-07-06', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
