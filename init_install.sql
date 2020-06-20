-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Server-Version: 5.7.28-nmm1-log
-- PHP-Version: 7.2.30-nmm1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `farben`
--

CREATE TABLE `farben` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `red` int(11) NOT NULL,
  `green` int(11) NOT NULL,
  `blue` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--

INSERT INTO `farben` (`ID`, `name`, `red`, `green`, `blue`, `active`) VALUES
(1, 'White ', 242, 243, 242, 1),
(2, 'Grey ', 161, 165, 162, 1),
(3, 'Lightyellow ', 249, 233, 153, 0),
(5, 'Brickyellow ', 215, 197, 153, 1),
(6, 'Lightgreen ', 194, 218, 184, 0),
(9, 'Lightreddishviolet ', 232, 186, 199, 0),
(12, 'Lightorangebrown ', 203, 132, 66, 0),
(18, 'Nougat ', 204, 142, 104, 0),
(21, 'Brightred ', 196, 40, 27, 1),
(22, 'Med.reddishviolet ', 196, 112, 160, 0),
(23, 'Brightblue ', 13, 105, 171, 1),
(24, 'Brightyellow ', 245, 205, 47, 1),
(25, 'Earthorange ', 98, 71, 50, 0),
(26, 'Black ', 27, 42, 52, 1),
(27, 'Darkgrey ', 109, 110, 108, 0),
(28, 'Darkgreen ', 40, 127, 70, 1),
(29, 'Mediumgreen ', 161, 196, 139, 0),
(36, 'Lig.Yellowichorange ', 243, 207, 155, 1),
(37, 'Brightgreen ', 75, 151, 74, 0),
(38, 'Darkorange ', 160, 95, 52, 0),
(39, 'Lightbluishviolet ', 193, 202, 222, 0),
(45, 'Lightblue ', 180, 210, 227, 0),
(100, 'Lightred ', 238, 196, 182, 0),
(101, 'Mediumred ', 218, 134, 121, 0),
(102, 'Mediumblue ', 110, 153, 201, 1),
(103, 'Lightgrey ', 199, 193, 183, 0),
(104, 'Brightviolet ', 107, 50, 123, 0),
(105, 'Br.yellowishorange ', 226, 155, 63, 0),
(106, 'Brightorange ', 218, 133, 64, 1),
(107, 'Brightbluishgreen ', 0, 143, 155, 0),
(108, 'Earthyellow ', 104, 92, 67, 0),
(110, 'Brightbluishviolet ', 67, 84, 147, 0),
(112, 'Mediumbluishviolet ', 104, 116, 172, 0),
(115, 'Med.yellowishgreen ', 199, 210, 60, 0),
(116, 'Med.bluishgreen ', 85, 165, 175, 0),
(118, 'Lightbluishgreen ', 183, 215, 213, 0),
(119, 'Br.yellowishgreen ', 164, 189, 70, 1),
(120, 'Lig.yellowishgreen ', 217, 228, 167, 0),
(121, 'Med.yellowishorange ', 231, 172, 88, 0),
(123, 'Br.reddishorange ', 211, 111, 76, 0),
(124, 'Brightreddishviolet ', 146, 57, 120, 1),
(125, 'Lightorange ', 234, 184, 145, 0),
(127, 'Gold ', 220, 188, 129, 0),
(128, 'Darknougat ', 174, 122, 89, 0),
(131, 'Silver ', 156, 163, 168, 0),
(135, 'Sandblue ', 116, 134, 156, 0),
(136, 'Sandviolet ', 135, 124, 144, 0),
(137, 'Mediumorange ', 224, 152, 100, 0),
(138, 'Sandyellow ', 149, 138, 115, 1),
(140, 'Earthblue ', 32, 58, 86, 1),
(141, 'Earthgreen ', 39, 70, 44, 1),
(145, 'Sandbluemetallic ', 121, 136, 161, 0),
(146, 'Sandvioletmetallic ', 149, 142, 163, 0),
(147, 'Sandyellowmetallic ', 147, 135, 103, 0),
(148, 'Darkgreymetallic ', 87, 88, 87, 0),
(149, 'Blackmetallic ', 22, 29, 50, 0),
(150, 'Lightgreymetallic ', 171, 173, 172, 0),
(151, 'Sandgreen ', 120, 144, 129, 0),
(153, 'Sandred ', 149, 121, 118, 0),
(154, 'Darkred ', 128, 8, 27, 1),
(168, 'Gunmetallic ', 117, 108, 98, 0),
(180, 'Curry ', 215, 169, 75, 0),
(200, 'Lemonmetalic ', 130, 138, 93, 0),
(190, 'FireYellow ', 249, 214, 46, 0),
(191, 'Flameyellowishorange ', 232, 171, 45, 0),
(192, 'Reddishbrown ', 105, 64, 39, 1),
(193, 'Flamereddishorange ', 207, 96, 36, 0),
(194, 'Mediumstonegrey ', 163, 162, 164, 1),
(195, 'Royalblue ', 70, 103, 164, 0),
(196, 'DarkRoyalblue ', 35, 71, 139, 0),
(198, 'Brightreddishlilac ', 142, 66, 133, 0),
(199, 'Darkstonegrey ', 99, 95, 97, 1),
(208, 'Lightstonegrey ', 229, 228, 222, 0),
(209, 'DarkCurry ', 176, 142, 68, 0),
(210, 'Fadedgreen ', 112, 149, 120, 0),
(211, 'Turquoise ', 121, 181, 181, 0),
(212, 'LightRoyalblue ', 159, 195, 233, 0),
(213, 'MediumRoyalblue ', 108, 129, 183, 0),
(216, 'Rust ', 143, 76, 42, 0),
(217, 'Brown ', 124, 92, 69, 0),
(218, 'Reddishlilac ', 150, 112, 159, 0),
(219, 'Lilac ', 107, 98, 155, 0),
(220, 'Lightlilac ', 167, 169, 206, 0),
(221, 'Brightpurple ', 205, 98, 152, 1),
(222, 'Lightpurple ', 228, 173, 200, 1),
(223, 'Lightpink ', 220, 144, 149, 0),
(224, 'Lightbrickyellow ', 240, 213, 160, 0),
(225, 'Warmyellowishorange ', 235, 184, 127, 0),
(226, 'Coolyellow ', 253, 234, 140, 1),
(232, 'Doveblue ', 125, 187, 221, 0),
(268, 'Mediumlilac ', 52, 43, 117, 1),
(40, 'Transparent ', 236, 236, 236, 0),
(41, 'Tr.Red ', 205, 84, 75, 1),
(42, 'Tr.Lgblue ', 193, 223, 240, 0),
(43, 'Tr.Blue ', 123, 182, 232, 1),
(44, 'Tr.Yellow ', 247, 241, 141, 0),
(47, 'Tr.Flu.Reddishorange ', 217, 133, 108, 0),
(48, 'Tr.Green ', 132, 182, 141, 1),
(49, 'Tr.Flu.Green ', 248, 241, 132, 0),
(50, 'Phosph.White ', 236, 232, 222, 0),
(111, 'Tr.Brown ', 191, 183, 177, 1),
(113, 'Tr.Medi.reddishviolet ', 228, 173, 200, 0),
(126, 'Tr.Brightbluishviolet ', 165, 165, 203, 0),
(133, 'Neonorange ', 213, 115, 61, 0),
(134, 'Neongreen ', 216, 221, 86, 0),
(143, 'Tr.Flu.Blue ', 207, 226, 247, 0),
(157, 'Tr.Flu.Yellow ', 255, 246, 123, 0),
(158, 'Tr.Flu.Red ', 225, 164, 194, 0),
(176, 'Redflip/flop ', 151, 105, 91, 0),
(178, 'Yellowflip/flop ', 180, 132, 85, 0),
(179, 'Silverflip/flop ', 137, 135, 136, 0),
(322, 'Md. Azure', 104, 195, 226, 1),
(324, 'Medium Lavendel', 160, 110, 185, 1),
(321, 'DarkAzur', 70, 155, 195, 1);

-- --------------------------------------------------------

--
--

CREATE TABLE `sizes` (
  `size` int(11) NOT NULL,
  `cost` decimal(5,2) NOT NULL,
  `mass` decimal(5,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
--

INSERT INTO `sizes` (`size`, `cost`, `mass`) VALUES
(1, '0.11', '0.82'),
(4, '0.23', '2.36'),
(2, '0.16', '1.25'),
(8, '0.38', '4.72'),
(6, '0.30', '3.61'),
(3, '0.19', '1.92');

--

ALTER TABLE `farben`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name` (`name`);

--

ALTER TABLE `sizes`
  ADD PRIMARY KEY (`size`);

--
-- AUTO_INCREMENT
--
ALTER TABLE `farben`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=325;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
