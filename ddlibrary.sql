-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2018 at 03:42 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ddlibrary`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `bid` int(11) NOT NULL,
  `bname` text,
  `author` text,
  `price` text,
  `stock` text,
  `category_cid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`bid`, `bname`, `author`, `price`, `stock`, `category_cid`) VALUES
(1, 'Database Management System', 'Silerchatz and Korth', '455', '4', 2),
(2, 'Operating System', 'A. G Godbhole', '355', '3', 2),
(3, 'Data Structures', 'Robert  lafore', '600', '6', 2),
(4, 'Computer Organization and Architecture', 'William Stallings', '550', '5', 1),
(5, 'Database Programming', 'Reema Thareja', '550', '0', 2),
(6, 'Java Programming', 'Balgurusamy', '420', '5', 2),
(14, 'Database Programming', 'Silerchatz and Korth', '500', '40', 2),
(16, 'C programming', 'William Stallings', '500', '40', 2),
(17, 'C++ programming', 'William Stallings', '500', '40', 2),
(18, 'null', 'null', '500', '40', 2);

--
-- Triggers `book`
--
DELIMITER $$
CREATE TRIGGER `booksort1` AFTER UPDATE ON `book` FOR EACH ROW BEGIN
  Delete from bookfrag1;
  Insert into bookfrag1
	Select * from book where author = 'Silerchatz and Korth';
  Delete from bookfrag2;
  Insert into bookfrag2
	Select * from book where author = 'William Stallings';
  END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `booksort2` AFTER INSERT ON `book` FOR EACH ROW BEGIN
  Delete from bookfrag1;
  Insert into bookfrag1
	Select * from book where author = 'Silerchatz and Korth';
  Delete from bookfrag2;
  Insert into bookfrag2
	Select * from book where author = 'William Stallings';
   Delete from bookfrag3;
  Insert into bookfrag3
	Select * from book where author = 'Robert lafore '; 
    
  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bookfrag1`
--

CREATE TABLE `bookfrag1` (
  `bid` int(11) NOT NULL,
  `bname` text,
  `author` text,
  `price` text,
  `stock` text,
  `category_cid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookfrag1`
--

INSERT INTO `bookfrag1` (`bid`, `bname`, `author`, `price`, `stock`, `category_cid`) VALUES
(1, 'Database Management System', 'Silerchatz and Korth', '455', '4', 2),
(14, 'Database Programming', 'Silerchatz and Korth', '500', '40', 2);

-- --------------------------------------------------------

--
-- Table structure for table `bookfrag2`
--

CREATE TABLE `bookfrag2` (
  `bid` int(11) NOT NULL,
  `bname` text,
  `author` text,
  `price` text,
  `stock` text,
  `category_cid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookfrag2`
--

INSERT INTO `bookfrag2` (`bid`, `bname`, `author`, `price`, `stock`, `category_cid`) VALUES
(4, 'Computer Organization and Architecture', 'William Stallings', '550', '5', 1),
(16, 'C programming', 'William Stallings', '500', '40', 2),
(17, 'C++ programming', 'William Stallings', '500', '40', 2);

-- --------------------------------------------------------

--
-- Table structure for table `bookfrag3`
--

CREATE TABLE `bookfrag3` (
  `bid` int(11) NOT NULL,
  `bname` text,
  `author` text,
  `price` text,
  `stock` text,
  `category_cid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cid` int(11) NOT NULL,
  `cname` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cid`, `cname`) VALUES
(1, 'IT'),
(2, 'Comps'),
(3, 'Electronics and Allied Branches'),
(4, 'Mechanical and Allied Branches');

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE `distributor` (
  `did` int(11) NOT NULL,
  `dname` text,
  `address` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `bid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `issue_date` text,
  `return_date` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `email` text NOT NULL,
  `bid` text NOT NULL,
  `receipt_no` text NOT NULL,
  `date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `email`, `bid`, `receipt_no`, `date`) VALUES
(3, 'geoff@gmail.com', '3', '6754', 'Wed Oct 11 01:09:50 IST 2017');

-- --------------------------------------------------------

--
-- Table structure for table `provides`
--

CREATE TABLE `provides` (
  `did` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `date` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `uname` text,
  `email` text,
  `password` text,
  `balance` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `uname`, `email`, `password`, `balance`) VALUES
(1, 'geoff squire', 'geoff@gmail.com', '1234', '500'),
(2, 'Satish', 'satish@gmail.com', '1234', '250'),
(3, 'Emma Jones', 'emma@gmail.com', '1234', '50'),
(4, 'Keith Dsouza', 'keith@gmail.com', '1234', '2500'),
(6, 'abc', 'abc@gmail.com', '1234', '2333'),
(7, 'abc', 'asasa@gmail.com', '1234', '2133'),
(8, 'qaz', 'qaz@gmail.com', 'qaz', '12'),
(9, 'shweta', 'shweta@gmail.com', '12345', '10'),
(10, 'aryan', 'aryan@gmail.com', '1234', '45');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `usersort` AFTER INSERT ON `user` FOR EACH ROW BEGIN
  Delete from userfrag1;
  Insert into userfrag1
	Select * from user where balance < 100;
  Delete from userfrag2;
  Insert into userfrag2
	Select * from user where balance > 1000;
  END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `usersort1` AFTER UPDATE ON `user` FOR EACH ROW BEGIN
  Delete from userfrag1;
  Insert into userfrag1
	Select * from user where balance < 100;
  Delete from userfrag2;
  Insert into userfrag2
	Select * from user where balance > 1000;
  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `userfrag1`
--

CREATE TABLE `userfrag1` (
  `uid` int(11) NOT NULL,
  `uname` text,
  `email` text,
  `password` text,
  `balance` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userfrag1`
--

INSERT INTO `userfrag1` (`uid`, `uname`, `email`, `password`, `balance`) VALUES
(3, 'Emma Jones', 'emma@gmail.com', '1234', '50'),
(8, 'qaz', 'qaz@gmail.com', 'qaz', '12'),
(9, 'shweta', 'shweta@gmail.com', '12345', '10'),
(10, 'aryan', 'aryan@gmail.com', '1234', '45');

-- --------------------------------------------------------

--
-- Table structure for table `userfrag2`
--

CREATE TABLE `userfrag2` (
  `uid` int(11) NOT NULL,
  `uname` text,
  `email` text,
  `password` text,
  `balance` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userfrag2`
--

INSERT INTO `userfrag2` (`uid`, `uname`, `email`, `password`, `balance`) VALUES
(4, 'Keith Dsouza', 'keith@gmail.com', '1234', '2500'),
(6, 'abc', 'abc@gmail.com', '1234', '2333'),
(7, 'abc', 'asasa@gmail.com', '1234', '2133');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `fk_book_category_idx` (`category_cid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`bid`,`uid`),
  ADD KEY `fk_book_has_user_user1_idx` (`uid`),
  ADD KEY `fk_book_has_user_book1_idx` (`bid`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provides`
--
ALTER TABLE `provides`
  ADD PRIMARY KEY (`did`,`bid`),
  ADD KEY `fk_distributor_has_book_book1_idx` (`bid`),
  ADD KEY `fk_distributor_has_book_distributor1_idx` (`did`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `distributor`
--
ALTER TABLE `distributor`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_book_category` FOREIGN KEY (`category_cid`) REFERENCES `category` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `issues`
--
ALTER TABLE `issues`
  ADD CONSTRAINT `fk_book_has_user_book1` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_book_has_user_user1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `provides`
--
ALTER TABLE `provides`
  ADD CONSTRAINT `fk_distributor_has_book_book1` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_distributor_has_book_distributor1` FOREIGN KEY (`did`) REFERENCES `distributor` (`did`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
