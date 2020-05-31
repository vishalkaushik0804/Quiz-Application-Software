-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2018 at 07:22 AM
-- Server version: 5.7.11
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbqst`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `delcat` (IN `ccod` INT)  NO SQL
delete from tbcat where catcod=ccod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delopt` (IN `ocod` INT)  NO SQL
DELETE from tbopt WHERE otpcod=ocod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delqst` (IN `qcod` INT)  NO SQL
delete from tbqst WHERE qstcod=qcod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delreg` (IN `rcod` INT)  NO SQL
DELETE from tbreg WHERE regcod=rcod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dspcat` ()  NO SQL
select * from tbcat$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dspopt` ()  NO SQL
SELECT * FROM tbopt$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dspppr` (IN `ccod` INT, IN `lvl` CHAR(1))  NO SQL
select * from tbqst where qstcatcod=ccod and qstlvl=lvl order by 
rand() limit 3$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dspqst` (IN `ccod` INT, IN `lvl` CHAR(1))  NO SQL
select qstcod,qstdsc,qstcatcod,qstlvl,qstpstdat,qstimg from tbqst,tbopt where optqstcod=qstcod and qstcatcod=ccod and qstlvl=lvl order BY
qstpstdat desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dspreg` ()  NO SQL
select * from tbreg$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dspres` (IN `regcod` INT)  NO SQL
select * from tbres where resregcod=regcod order by resdat desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `fndcat` (IN `ccod` INT)  NO SQL
select * from tbcat where catcod=ccod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `fndopt` (IN `qcod` INT)  NO SQL
select * from tbopt where optqstcod=qcod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `fndqst` (IN `qcod` INT)  NO SQL
select * from tbqst WHERE qstcod=qcod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `fndreg` (IN `rcod` INT)  NO SQL
SELECT * from tbreg WHERE regcod=rcod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inscat` (IN `cnam` VARCHAR(100))  NO SQL
insert tbcat VALUES(null,cnam)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insopt` (IN `oqstcod` INT, IN `odsc` VARCHAR(500))  NO SQL
INSERT tbopt VALUES(null,oqstcod,odsc)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insqst` (IN `qdsc` VARCHAR(500), IN `qcatcod` INT, IN `qlvl` VARCHAR(10), IN `qpstdat` DATETIME, IN `qimg` VARCHAR(50), OUT `cod` INT)  NO SQL
begin
INSERT tbqst VALUES(null,qdsc,qcatcod,qlvl,qpstdat,qimg);
select last_insert_id() into cod;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insreg` (IN `reml` VARCHAR(100), IN `rpwd` VARCHAR(100), IN `rdat` DATETIME, IN `rrol` VARCHAR(10))  NO SQL
INSERT tbreg VALUES(null,reml,rpwd,rdat,rrol)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insres` (IN `rregcod` INT, IN `rcatcod` INT, IN `rtotscr` INT, IN `rscrach` INT, IN `rdat` DATETIME)  NO SQL
INSERT tbres VALUES(null,rregcod,rcatcod,rtotscr,rscrach,rdat)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `logincheck` (IN `eml` VARCHAR(100), IN `pwd` VARCHAR(100), OUT `cod` INT, OUT `rol` CHAR(1))  NO SQL
BEGIN
declare actpwd varchar(50);
select regpwd from tbreg where regeml=eml into @actpwd;
if @actpwd is null THEN
	set cod=-1;
    set rol='N';
else
if @actpwd=pwd THEN
select regcod from tbreg where regeml=eml into cod;
select regrol from tbreg where regeml=eml into rol;
else
	set cod=-2;
    set rol='N';
end if;
end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updcat` (IN `ccod` INT, IN `cnam` VARCHAR(100))  NO SQL
UPDATE tbcat set catnam=cnam where catcod=ccod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updopt` (IN `ocod` INT, IN `oqstcod` INT, IN `odsc` VARCHAR(500))  NO SQL
UPDATE tbopt set optqstcod=oqstcod,optdsc=odsc WHERE optcod=ocod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updqst` (IN `qcod` INT, IN `qdsc` VARCHAR(500), IN `qcatcod` INT, IN `qlvl` VARCHAR(10), IN `qpstdat` DATETIME, IN `qimg` VARCHAR(50))  NO SQL
UPDATE tbqst set qstdsc=qdsc,qstcatcod=qcatcod,qstlvl=qlvl,qstpstdat=qpstdat,qstimg=qimg where qstcod=qcod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updreg` (IN `rcod` INT, IN `reml` VARCHAR(100), IN `rpwd` VARCHAR(100), IN `rdat` DATETIME, IN `rrol` VARCHAR(10))  NO SQL
UPDATE tbreg SET regeml=reml,regpwd=rpwd,regdat=rdat,regrol=rrol WHERE regcod=rcod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updres` (IN `rcod` INT, IN `rregcod` INT, IN `rcatcod` INT, IN `rtotscr` INT, IN `rscrach` INT, IN `rdat` DATETIME)  NO SQL
UPDATE tbres SET resregcod=rregcod,rescatcod=rcatcod,restotscr=rtotscr,resscrach=rscrach,resdat=rdat WHERE rescod =rcod$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbcat`
--

CREATE TABLE `tbcat` (
  `catcod` int(11) NOT NULL,
  `catnam` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbcat`
--

INSERT INTO `tbcat` (`catcod`, `catnam`) VALUES
(1, 'Computer'),
(2, 'Geography'),
(5, 'Biologys');

-- --------------------------------------------------------

--
-- Table structure for table `tbopt`
--

CREATE TABLE `tbopt` (
  `optcod` int(11) NOT NULL,
  `optqstcod` int(11) NOT NULL,
  `optdsc` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbopt`
--

INSERT INTO `tbopt` (`optcod`, `optqstcod`, `optdsc`) VALUES
(1, 1, 'Metcalf\'slaw'),
(2, 2, 'Bill\'s Law'),
(3, 3, 'Moore\'s First Law'),
(4, 4, 'Program'),
(5, 5, 'Paste data'),
(6, 6, 'SHIFT + TAB'),
(7, 7, 'Ctrl + X'),
(8, 8, 'Ctrl + C '),
(9, 9, 'Ctrl + V '),
(10, 10, 'Ctrl + Z '),
(11, 11, 'Ctrl + Alt'),
(12, 12, 'Alt + F4'),
(13, 13, 'Win logo key  + L'),
(14, 14, 'F2'),
(15, 15, 'F3'),
(16, 16, 'F4'),
(17, 17, 'F10'),
(18, 18, 'Alt+F8'),
(19, 19, 'Alt + Underline Letter'),
(20, 20, 'Alt + Enter'),
(21, 21, 'F6'),
(22, 22, 'F5'),
(23, 23, 'F10'),
(24, 24, 'Window + PrtScr'),
(25, 25, 'Alt + Left Arrow'),
(26, 26, 'Alt + Right Arrow'),
(27, 27, 'Alt + Page Up'),
(28, 28, 'Alt + Page Down'),
(29, 29, 'Alt + Esc'),
(30, 30, 'Alt +Shift+ Esc'),
(31, 31, 'Shift+ F10'),
(32, 32, 'Shift+ Dlete'),
(33, 33, 'Swapping'),
(34, 34, 'Swapping'),
(35, 35, 'LODS'),
(36, 36, '137'),
(37, 37, '5 Bits'),
(38, 38, 'All Of this Above'),
(39, 39, 'sub d, a, e'),
(40, 40, 'A'),
(41, 41, 'A'),
(42, 42, 'slt $s1,$s2,$s3'),
(43, 43, '(1010)two'),
(44, 44, 'Global Variable'),
(45, 45, 'Local optimization'),
(46, 46, 'First Possition of Array'),
(47, 47, 'f = (g + h)'),
(48, 48, 'f = (g + h)'),
(49, 49, 'Activation Record '),
(50, 50, 'Activation Record '),
(51, 51, 'Activation Record '),
(52, 52, 'floating point coprocessor'),
(53, 53, 'Assembli Language Compatible'),
(54, 54, '1357 9bdfhex'),
(55, 55, 'Caller');

-- --------------------------------------------------------

--
-- Table structure for table `tbqst`
--

CREATE TABLE `tbqst` (
  `qstcod` int(11) NOT NULL,
  `qstdsc` varchar(500) NOT NULL,
  `qstcatcod` int(11) NOT NULL,
  `qstlvl` varchar(10) NOT NULL,
  `qstpstdat` datetime NOT NULL,
  `qstimg` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbqst`
--

INSERT INTO `tbqst` (`qstcod`, `qstdsc`, `qstcatcod`, `qstlvl`, `qstpstdat`, `qstimg`) VALUES
(1, ' The improvement of computer hardware theory is summarized by which law.?', 1, 'B', '2018-07-11 00:00:00', 'bb.jpg'),
(2, ' The improvement of computer hardware theory is summarized by which law.?', 1, 'B', '2018-07-11 00:00:00', 'bio.jpg'),
(3, ' The improvement of computer hardware theory is summarized by which law.?', 1, 'B', '2018-07-11 00:00:00', 'rr1.jpg'),
(4, '_______ are software which is used to do particular task.', 1, 'B', '2018-07-11 00:00:00', 'ss.jpg'),
(5, 'What happens when you press CTRL + V key?', 1, 'B', '2018-07-11 00:00:00', 'ss.jpg'),
(6, 'Press ____ to move the insertion point to the Address box', 1, 'B', '2018-07-11 00:00:00', 'ss23.png'),
(7, 'Cut the selected item', 1, 'B', '2018-07-11 00:00:00', 'ss55.jpg'),
(8, 'Copy the selected item', 1, 'B', '2018-07-11 00:00:00', 'ss66.jpg'),
(9, 'Paste the selected item', 1, 'B', '2018-07-11 00:00:00', 'ss77.jpg'),
(10, 'Undo an action', 1, 'B', '2018-07-11 00:00:00', 'ss88.jpg'),
(11, 'Switch between open apps', 1, 'B', '2018-07-11 00:00:00', 'ss99.jpg'),
(12, 'Close the active item, or exit the active app', 1, 'B', '2018-07-11 00:00:00', 'a.jpg'),
(13, 'Lock your PC', 1, 'B', '2018-07-11 00:00:00', 'b.jpg'),
(14, 'Rename the selected item', 1, 'B', '2018-07-11 00:00:00', 'c.jpg'),
(15, 'Search for a file or folder in File Explorer', 1, 'B', '2018-07-11 00:00:00', 'd.jpg'),
(16, 'Display the address bar list in File Explorer', 1, 'B', '2018-07-11 00:00:00', 'c.jpg'),
(17, 'Activate the Menu bar in the active app', 1, 'B', '2018-07-11 00:00:00', 'f.jpg'),
(18, 'Show your password on the sign-in screen? ', 1, 'B', '2018-07-11 00:00:00', 'img-1.jpg'),
(19, 'Perform the command for the letter?', 1, 'B', '2018-07-11 00:00:00', 'imgggg.jpg'),
(20, 'Display Property For Selected Item?', 1, 'B', '2018-07-11 00:00:00', 'SFRC-logo2.jpg'),
(21, 'Cycle through screen elements in a window or on the screen?', 1, 'B', '2018-07-11 00:00:00', 'ss77.jpg'),
(22, 'Refresh through active window?', 1, 'B', '2018-07-11 00:00:00', 'refresh.jpg'),
(23, 'Activate in the menu bar in active app?', 1, 'B', '2018-07-11 00:00:00', 'active.jpg'),
(24, 'Print screen key?', 1, 'B', '2018-07-11 00:00:00', 'print.jpg'),
(25, 'Go Back?', 1, 'B', '2018-07-11 00:00:00', 'go.jpeg'),
(26, 'Go Forward', 1, 'B', '2018-07-11 00:00:00', 'for.jpg'),
(27, 'Move up One Screen', 1, 'B', '2018-07-11 00:00:00', 'up.jpg'),
(28, 'Move down One Screen', 1, 'B', '2018-07-11 00:00:00', 'down.jpg'),
(29, 'Open Start', 1, 'B', '2018-07-11 00:00:00', 'esc.jpg'),
(30, 'Open Task Manager', 1, 'B', '2018-07-11 00:00:00', 'a111.jpg'),
(31, 'Display shortcut menu for selected item', 1, 'B', '2018-07-11 00:00:00', 'f10.jpg'),
(32, 'Delete the selected item without moving the recycle bin', 1, 'B', '2018-07-11 00:00:00', 'e.jpg'),
(33, 'The given lines of code temp = v[k]; v[k] = v[k+1]; v[k+1] = temp represents the function of', 1, 'I', '2018-07-11 00:00:00', 'swap.jpg'),
(34, 'The given lines of code temp = v[k]; v[k] = v[k+1]; v[k+1] = temp represents the function of', 1, 'I', '2018-07-11 00:00:00', 'swap.jpg'),
(35, 'Instruction that loads a bits, byte, word, or double word of a string into the register EAX, is', 1, 'I', '2018-07-11 00:00:00', 'lods.jpg'),
(36, 'Hexadecimal number that this binary number (0001 0011 0111)two represents is', 1, 'I', '2018-07-11 00:00:00', 'lopp.jpg'),
(37, 'In the MIPS instruction fields, the shamt field is of', 1, 'I', '2018-07-11 00:00:00', '5 bits.jpg'),
(38, 'Data movement instructions include?', 1, 'I', '2018-07-11 00:00:00', 'data.jpg'),
(39, ' In assembly language d=a-e will be instructed as?', 1, 'I', '2018-07-11 00:00:00', 'a sub.jpg'),
(40, '16bits address can load the word within the range of', 1, 'I', '2018-07-11 00:00:00', 'acpp.PNG'),
(41, '16bits address can load the word within the range of', 1, 'I', '2018-07-11 00:00:00', 'acpp.PNG'),
(42, 'If ($s2 < $s3) $s1 = 1; else $s1 = 0 in assembly language can be written as', 1, 'I', '2018-07-11 00:00:00', 'css.png'),
(43, 'The binary notation of the 5hex is equal to the', 1, 'I', '2018-07-11 00:00:00', 'p22.jpg'),
(44, 'Variable that can be accessed through out the program is known as', 1, 'I', '2018-07-11 00:00:00', 'var.jpg'),
(45, 'Optimization of the program that works within a single basic block is called?', 1, 'I', '2018-07-11 00:00:00', 'aaaa111.jpg'),
(46, 'The pointer of the stack, is always set to the?', 1, 'I', '2018-07-11 00:00:00', 'a123.png'),
(47, 'Add $t0,$s1,$s2; add $t1,$s3,$s4; sub $s0,$t0,$t1 , the given lines of code gives an expression?	', 1, 'I', '2018-07-11 00:00:00', 'fgh.png'),
(48, 'Add $t0,$s1,$s2; add $t1,$s3,$s4; sub $s0,$t0,$t1 , the given lines of code gives an expression?	', 1, 'I', '2018-07-11 00:00:00', 'fgh.png'),
(49, ' The stack\'s segment that is used to have procedure\'s saved registers, is known as?', 1, 'I', '2018-07-11 00:00:00', 'abc.jpg'),
(50, ' The stack\'s segment that is used to have procedure\'s saved registers, is known as?', 1, 'I', '2018-07-11 00:00:00', 'abc.jpg'),
(51, ' The stack\'s segment that is used to have procedure\'s saved registers, is known as?', 1, 'I', '2018-07-11 00:00:00', 'abc.jpg'),
(52, 'The Intel 8087 build in 1980 was a/an', 1, 'I', '2018-07-11 00:00:00', 'processor.jpg'),
(53, 'The architecture of Intel 8086, announced in 1978 was', 1, 'I', '2018-07-11 00:00:00', 'pre.jpg'),
(54, 'Negating the hexadecimal expression (eca8 6420)hex will give', 1, 'I', '2018-07-11 00:00:00', 'ppp.jpg'),
(55, 'The program, that instigates a procedure while execution, is known as?', 1, 'I', '2018-07-11 00:00:00', 'oooo.PNG');

-- --------------------------------------------------------

--
-- Table structure for table `tbreg`
--

CREATE TABLE `tbreg` (
  `regcod` int(11) NOT NULL,
  `regeml` varchar(100) NOT NULL,
  `regpwd` varchar(100) NOT NULL,
  `regdat` datetime NOT NULL,
  `regrol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbreg`
--

INSERT INTO `tbreg` (`regcod`, `regeml`, `regpwd`, `regdat`, `regrol`) VALUES
(1, 'admin@quizup.com', 'admin123', '2018-06-06 00:00:00', 'A'),
(2, 'cs@abc.com', 'cs123', '2018-07-10 00:00:00', 'U'),
(3, 'bini@gmail.com', 'bini123', '2018-07-13 00:00:00', 'U');

-- --------------------------------------------------------

--
-- Table structure for table `tbres`
--

CREATE TABLE `tbres` (
  `rescod` int(11) NOT NULL,
  `resregcod` int(11) NOT NULL,
  `rescatcod` int(11) NOT NULL,
  `restotscr` int(11) NOT NULL,
  `resscrach` int(11) NOT NULL,
  `resdat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbres`
--

INSERT INTO `tbres` (`rescod`, `resregcod`, `rescatcod`, `restotscr`, `resscrach`, `resdat`) VALUES
(3, 2, 1, 3, 1, '2018-07-11 00:00:00'),
(4, 2, 1, 3, 3, '2018-07-11 00:00:00'),
(5, 2, 1, 3, 2, '2018-07-11 00:00:00'),
(7, 2, 1, 3, 0, '2018-07-11 00:00:00'),
(10, 2, 1, 3, 3, '2018-07-12 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbcat`
--
ALTER TABLE `tbcat`
  ADD PRIMARY KEY (`catcod`);

--
-- Indexes for table `tbopt`
--
ALTER TABLE `tbopt`
  ADD PRIMARY KEY (`optcod`);

--
-- Indexes for table `tbqst`
--
ALTER TABLE `tbqst`
  ADD PRIMARY KEY (`qstcod`),
  ADD KEY `qstcatcod` (`qstcatcod`);

--
-- Indexes for table `tbreg`
--
ALTER TABLE `tbreg`
  ADD PRIMARY KEY (`regcod`),
  ADD UNIQUE KEY `regeml` (`regeml`);

--
-- Indexes for table `tbres`
--
ALTER TABLE `tbres`
  ADD PRIMARY KEY (`rescod`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbcat`
--
ALTER TABLE `tbcat`
  MODIFY `catcod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbopt`
--
ALTER TABLE `tbopt`
  MODIFY `optcod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `tbqst`
--
ALTER TABLE `tbqst`
  MODIFY `qstcod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `tbreg`
--
ALTER TABLE `tbreg`
  MODIFY `regcod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbres`
--
ALTER TABLE `tbres`
  MODIFY `rescod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbqst`
--
ALTER TABLE `tbqst`
  ADD CONSTRAINT `tbqst_ibfk_1` FOREIGN KEY (`qstcatcod`) REFERENCES `tbcat` (`catcod`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
