-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2014 at 02:23 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `goup`
--
CREATE DATABASE IF NOT EXISTS `goup` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `goup`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` varchar(6) NOT NULL,
  `category_name` varchar(140) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
('AAS', 'Administration and Support'),
('AC', 'Asian Center'),
('AIT', 'Asian Institute of Tourism'),
('ARKI', 'College of Architecture'),
('ASP', 'Archaeolohgical Studies Program'),
('CAL', 'College of Arts and Letters'),
('CBA', 'College of Business Administration/ Cesar E.A. Virata School of Business'),
('CFA', 'College of Fine Arts'),
('CHE', 'College of Home Economics'),
('CHK', 'College of Human Kinetics'),
('CMC', 'College of Mass Communication'),
('COM', 'Community Services'),
('CS', 'College of Science'),
('CSSP', 'College of Social Sciences and Philosophy'),
('CSWCD', 'College of Social Work and Community Development'),
('DEPP', 'UP Diliman Extension Program in Pampanga'),
('DRM', 'Dormitories'),
('EDUC', 'College of Education'),
('ENGG', 'College of Engineering'),
('FSH', 'Faculty and Staff Housing'),
('IIS', 'Institute of Islamic Studies'),
('ISSI', 'Institute of Small Scale Industries'),
('JPS', 'Jeepney Stops'),
('LAW', 'College of Law'),
('LIB', 'Libraries'),
('MUS', 'College of Music'),
('NCPAG', 'National College of Public Administration and Governance'),
('NONE', 'None'),
('RGF', 'Resource Generation Facilities'),
('RST', 'Restaurants'),
('SE', 'School of Economics'),
('SLIS', 'School of Library and Information Studies'),
('SLR', 'School of Labor and Industrial Relations'),
('SS', 'School of Statistics'),
('STP', 'Science and Technology Park'),
('SURP', 'School of Urban and Regional Planning'),
('TMC', 'Technology Management Center'),
('UTH', 'UP Theater Complex');

-- --------------------------------------------------------

--
-- Table structure for table `myplace`
--

CREATE TABLE IF NOT EXISTS `myplace` (
  `user_id` varchar(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`place_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE IF NOT EXISTS `place` (
  `place_id` int(11) NOT NULL AUTO_INCREMENT,
  `place_name` varchar(300) NOT NULL,
  `place_lat` decimal(20,10) NOT NULL,
  `place_long` decimal(20,10) NOT NULL,
  `place_category` varchar(6) NOT NULL DEFAULT 'NONE',
  `place_alternate_name` varchar(200) NOT NULL,
  PRIMARY KEY (`place_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=221 ;

--
-- Dumping data for table `place`
--

INSERT INTO `place` (`place_id`, `place_name`, `place_lat`, `place_long`, `place_category`, `place_alternate_name`) VALUES
(1, 'Accounting, Budget, and Cash Office Building', '14.6599750000', '121.0702210000', 'AAS', ''),
(2, 'Administration', '14.6548830000', '121.0650660000', 'AAS', 'Quezon Hall'),
(3, 'Alumni Center', '14.6579920000', '121.0659230000', 'AAS', 'Fonacier Hall'),
(4, 'Ang Bahay ng Alumni', '14.6580600000', '121.0666580000', 'AAS', ''),
(5, 'Balay International', '14.6605870000', '121.0732300000', 'AAS', '							'),
(6, 'Benton Hall', '14.6535910000', '121.0708480000', 'AAS', ''),
(7, 'Business Concessions Office', '14.6528490000', '121.0595670000', 'AAS', 'BCO				'),
(8, 'Campus Landscaping Office', '14.6597930000', '121.0539380000', 'AAS', '					'),
(9, 'Campus Maintenance Office', '14.6528490000', '121.0595670000', 'AAS', 'CMO					'),
(10, 'Center of Ethnomusicology', '14.6565960000', '121.0653490000', 'AAS', ''),
(11, 'Center for International Studies', '14.6535910000', '121.0708480000', 'AAS', ''),
(12, 'CSSP Faculty Center', '14.6530050000', '121.0712500000', 'AAS', 'Solidor Hall'),
(13, 'Department of Military Science and Tactics', '14.6581630000', '121.0642440000', 'AAS', 'DMST		'),
(14, 'Diliman Accounting Office', '14.6564350000', '121.0617390000', 'AAS', 'DAO'),
(15, 'Diliman Budget Office', '14.6565550000', '121.0711480000', 'AAS', 'DBO'),
(16, 'Diliman Cash Office', '14.6564350000', '121.0617390000', 'AAS', ''),
(17, 'Diliman Information Office', '14.6564660000', '121.0659290000', 'AAS', 'DIO'),
(18, 'Diliman Interactive Learning Center', '14.6573280000', '121.0705050000', 'AAS', 'DILC'),
(19, 'Diliman Learning Resource Center', '14.6516550000', '121.0704780000', 'AAS', 'DLRC'),
(20, 'Diliman Legal Office', '14.6548830000', '121.0650660000', 'AAS', 'DLO'),
(21, 'Faculty Center', '14.6532850000', '121.0679830000', 'AAS', 'Bulwagang Rizal FC'),
(22, 'Gender Office', '14.6535910000', '121.0708480000', 'AAS', ''),
(23, 'Housing Office', '14.6528490000', '121.0595670000', 'AAS', ''),
(24, 'Human Resources Development Office', '14.6548830000', '121.0650660000', 'AAS', 'HRDO'),
(25, 'Office for Initiatives in Culture and the Arts', '14.6567100000', '121.0660710000', 'AAS', 'OICA'),
(26, 'Office of Admissions', '14.6515520000', '121.0664050000', 'AAS', 'OAdms'),
(27, 'Office of Anti-Sexual Harassment', '14.6535910000', '121.0708480000', 'AAS', 'OASH'),
(28, 'Office of Community Relations', '14.6528490000', '121.0595670000', 'AAS', 'OCR'),
(29, 'Office of Counseling and Guidance', '14.6542300000', '121.0734260000', 'AAS', 'OCG'),
(30, 'Office of Extension Coordination', '14.6573280000', '121.0705050000', 'AAS', 'OEC'),
(31, 'Office of Scholarships and Student Services', '14.6542300000', '121.0734260000', 'AAS', 'OSSS'),
(32, 'Office of Student Activities', '14.6542300000', '121.0734260000', 'AAS', 'OSA'),
(33, 'Office of Student Housing', '14.6587860000', '121.0688790000', 'AAS', 'OSH'),
(34, 'Office of the Campus Architect', '14.6527190000', '121.0639980000', 'AAS', 'OCA'),
(35, 'Office of the Chancellor', '14.6548830000', '121.0650660000', 'AAS', 'OC'),
(36, 'Office of the Chief Security Officer', '14.6572760000', '121.0616850000', 'AAS', 'OCSO'),
(37, 'Office of the Director of Instruction', '14.6573280000', '121.0705050000', 'AAS', 'ODI'),
(38, 'Office of the University Registrar', '14.6515520000', '121.0664050000', 'AAS', 'OUR'),
(39, 'Office of the Vice Chancellor for Academic Affairs', '14.6573280000', '121.0705050000', 'AAS', 'OVCAA'),
(40, 'Office of the Vice Chancellor for Administration', '14.6548830000', '121.0650660000', 'AAS', 'OVCA'),
(41, 'Office of the Vice Chancellor for Community Affairs', '14.6548830000', '121.0650660000', 'AAS', 'OVCCA'),
(42, 'Office of the Vice Chancellor for Research and Development', '14.6519040000', '121.0585310000', 'AAS', 'OVCRD'),
(43, 'Office of the Vice Chancellor for Student Affairs', '14.6548830000', '121.0650660000', 'AAS', 'OVCSA'),
(44, 'Sentro ng Wikang Filipino', '14.6569330000', '121.0628660000', 'AAS', 'SWF'),
(45, 'Student Disciplinary Tribunal', '14.6542300000', '121.0734260000', 'AAS', 'SDT'),
(46, 'Supply and Property Management Office', '14.6523300000', '121.0632200000', 'AAS', 'SPMO'),
(47, 'University Center for Women''s Studies', '14.6571460000', '121.0645020000', 'AAS', ''),
(48, 'University Computer Center', '14.6573360000', '121.0701800000', 'AAS', 'CC'),
(49, 'University Food Service', '14.6542300000', '121.0734260000', 'AAS', ''),
(50, 'University Press', '14.6523920000', '121.0647380000', 'AAS', ''),
(51, 'UP Diliman Police', '14.6520130000', '121.0654570000', 'AAS', 'UPDP'),
(52, 'UP DOST Core Group', '14.6518890000', '121.0705420000', 'AAS', ''),
(53, 'UP Vanguard', '14.6588070000', '121.0642060000', 'AAS', ''),
(54, 'Utilities Management Team', '14.6573360000', '121.0701800000', 'AAS', ''),
(55, 'Vidal A. Tan Hall', '14.6520450000', '121.0681600000', 'AAS', ''),
(56, 'UP Diliman Information Technology Development Center', '14.6520450000', '121.0681600000', 'AAS', ''),
(57, 'Albert Hall', '14.6526000000', '121.0629510000', 'ASP', ''),
(58, 'Villadolid Hall', '14.6526100000', '121.0637770000', 'ASP', ''),
(59, 'College of Architecture Building 1', '14.6509470000', '121.0654030000', 'ARKI', ''),
(60, 'Juguilon Hall', '14.6515180000', '121.0649470000', 'ARKI', 'College of Architecture Building 2'),
(61, 'CAL Building', '14.6526100000', '121.0673830000', 'CAL', 'CAL'),
(62, 'CAL Dean''s Office', '14.6532850000', '121.0679830000', 'CAL', ''),
(63, 'Institute of Creative Writing', '14.6532850000', '121.0679830000', 'CAL', ''),
(64, 'Lim Museum', '14.6528230000', '121.0667820000', 'CAL', ''),
(65, 'Vargas Museum', '14.6532590000', '121.0667870000', 'CAL', ''),
(66, 'Romulo Hall', '14.6571100000', '121.0729350000', 'AC', ''),
(67, 'GT-Toyota Asian Cultural Center', '14.6571830000', '121.0738840000', 'AC', ''),
(68, 'Asian Institute of Tourism Building', '14.6606750000', '121.0611480000', 'AIT', 'AIT'),
(69, 'College of Business Administration Building', '14.6552570000', '121.0734330000', 'CBA', 'CBA VSB Virata School'),
(70, 'Philippine Center for Economic Development Building', '14.6562690000', '121.0731360000', 'SE', 'Econ'),
(71, 'Encarnacion Hall', '14.6558280000', '121.0734800000', 'SE', ''),
(72, 'Benitez Hall', '14.6535210000', '121.0721330000', 'EDUC', ''),
(73, 'UPIS K-2', '14.6523460000', '121.0721410000', 'EDUC', ''),
(74, 'UPIS Elementary Building', '14.6528260000', '121.0721120000', 'EDUC', ''),
(75, 'UPIS Old Building', '14.6522760000', '121.0750490000', 'EDUC', ''),
(76, 'UPIS New Building', '14.6530770000', '121.0734930000', 'EDUC', ''),
(77, 'National Institute for Science and Mathematics Education Development', '14.6517640000', '121.0677240000', 'EDUC', 'NISMED'),
(78, 'Science Teachers Training Center', '14.6509750000', '121.0670400000', 'EDUC', ''),
(79, 'Department of Computer Science', '14.6486300000', '121.0685300000', 'ENGG', 'AECH DCS'),
(80, 'Department of Geodetic Engineering', '14.6564560000', '121.0697110000', 'ENGG', ''),
(81, 'Department of Industrial Engineering and Operations Research', '14.6564560000', '121.0697110000', 'ENGG', ''),
(82, 'Department of Mechanical Engineering', '14.6564560000', '121.0697110000', 'ENGG', ''),
(83, 'Department of Mining, Metallurgical, and Materials Engineering', '14.6480720000', '121.0678820000', 'ENGG', 'Triple M Building'),
(84, 'Electrical and Electronics Engineering Institute', '14.6495640000', '121.0682520000', 'ENGG', 'EEE Triple E Building'),
(85, 'Environmental and Energy Engineering Program Building', '14.6491230000', '121.0654140000', 'ENGG', ''),
(86, 'German Yia Hall', '14.6571770000', '121.0710820000', 'ENGG', ''),
(87, 'IE / ME Building', '14.6571770000', '121.0710820000', 'ENGG', ''),
(88, 'Institute of Chemical Engineering', '14.6481110000', '121.0668380000', 'ENGG', ''),
(89, 'Institute of Civil Engineering', '14.6480170000', '121.0651460000', 'ENGG', ''),
(90, 'Melchor Hall', '14.6564560000', '121.0697110000', 'ENGG', 'MH'),
(91, 'National Center for Transportation Studies', '14.6569460000', '121.0701460000', 'ENGG', 'NCTS'),
(92, 'National Engineering Center', '14.6565550000', '121.0711480000', 'ENGG', 'Juinio Hall NEC'),
(93, 'National Hydraulics Research Center', '14.6567650000', '121.0690270000', 'ENGG', 'NHRC'),
(94, 'UP Alumni Engineers Centennial Hall', '14.6486300000', '121.0685300000', 'ENGG', 'AECH DCS'),
(95, 'Bartlett Hall', '14.6525190000', '121.0615920000', 'CFA', ''),
(96, 'Corredor', '14.6523010000', '121.0617070000', 'CFA', ''),
(97, 'Enriquez Hall', '14.6520160000', '121.0611520000', 'CFA', ''),
(98, 'Tolentino Hall', '14.6520550000', '21.0616220000', 'CFA', ''),
(99, 'Alonso Hall', '14.6520190000', '121.0734120000', 'CHE', ''),
(100, 'Gusali 2', '14.6518550000', '121.0729480000', 'CHE', ''),
(101, 'Home Management House', '14.6469740000', '121.0680110000', 'CHE', ''),
(102, 'Child Development Center', '14.6522030000', '121.0737880000', 'CHE', ''),
(103, 'Craft and Design Laboratory', '14.6522240000', '121.0718940000', 'CHE', ''),
(104, 'Archery Range', '14.6582260000', '121.0612780000', 'CHK', ''),
(105, 'CHK Gym Annex', '14.6596270000', '121.0629250000', 'CHK', 'Ylanan Hall Annex CHK Covered Court New Gym'),
(106, 'Tennis Court 2', '14.6599180000', '121.0688900000', 'CHK', ''),
(107, 'Track Oval', '14.6593100000', '121.0663630000', 'CHK', ''),
(108, 'Track Oval Grandstand', '14.6592900000', '121.0658480000', 'CHK', ''),
(109, 'University Swimming Pool', '14.6591080000', '121.0719690000', 'CHK', ''),
(110, 'University Gymnasium', '14.6592480000', '121.0627960000', 'CHK', 'Gym Ylanan Hall'),
(111, 'Romulo Hall', '14.6571100000', '121.0729350000', 'IIS', ''),
(112, 'Bonifacio Hall', '14.6572760000', '121.0616850000', 'SLR', 'SOLAIR'),
(113, 'Bocobo Hall', '14.6569750000', '121.0720980000', 'LAW', 'Law Center'),
(114, 'Law Forum', '14.6566430000', '121.0724300000', 'LAW', ''),
(115, 'Espiritu Hall', '14.6567670000', '121.0721190000', 'LAW', ''),
(116, 'Malcolm Hall', '14.6564660000', '121.0721030000', 'LAW', ''),
(117, 'Gonzales Hall', '14.6547430000', '121.0710250000', 'SLIS', 'SLIS'),
(118, 'DZUP', '14.6565230000', '121.0637620000', 'CMC', ''),
(119, 'DZUP Tower', '14.6510480000', '121.0639610000', 'CMC', ''),
(120, 'Media Center', '14.6565230000', '121.0637620000', 'CMC', ''),
(121, 'Plaridel Hall', '14.6566010000', '121.0644850000', 'CMC', ''),
(122, 'Plaridel Hall Annex', '14.6568870000', '121.0644850000', 'CMC', ''),
(123, 'University Film Institute', '14.6567030000', '121.0670660000', 'CMC', 'FI UPFI'),
(124, 'Abelardo Hall', '14.6564980000', '121.0654140000', 'MUS', 'College of Music'),
(125, 'Abelardo Hall Annex', '14.6564980000', '121.0654140000', 'MUS', 'College of Music Annex'),
(126, 'Dance Studio', '14.6572500000', '121.0646520000', 'MUS', ''),
(127, 'NCPAG Building', '14.6563390000', '121.0604120000', 'NCPAG', 'NCPAG'),
(128, 'Computational Science Research Center', '14.6497250000', '121.0711810000', 'CS', 'CSRC'),
(129, 'College of Science Administration', '14.6497710000', '121.0706660000', 'CS', 'CS Admin'),
(130, 'Institute of Biology', '14.6507630000', '121.0707410000', 'CS', 'IB'),
(131, 'Institute of Chemistry Research Building', '14.6508610000', '121.0730960000', 'CS', 'IC'),
(132, 'Institute of Chemistry Teaching Building', '14.6501040000', '121.0731550000', 'CS', 'IC'),
(133, 'Institute of Environmental Science and Meteorology', '14.6483910000', '121.0700700000', 'CS', 'IESM'),
(134, 'Institute of Mathematics Annex', '0.0000000000', '0.0000000000', 'CS', 'MBAN Math Building Annex'),
(135, 'Institute of Mathematics', '14.6485210000', '121.0714110000', 'CS', 'MB Math Building'),
(136, 'Marine Science Institute', '14.6506070000', '121.0690880000', 'CS', 'MSI'),
(137, 'National Institute of Geological Sciences', '14.6481990000', '121.0694960000', 'CS', 'NIGS'),
(138, 'National Institute of Molecular Biology and Biotechnology', '14.6507110000', '121.0714760000', 'CS', 'NIMBB'),
(139, 'National Institute of Physics', '14.6490140000', '121.0730740000', 'CS', 'NIP'),
(140, 'National Science Complex Amphitheater', '14.6497820000', '121.0719370000', 'CS', 'NSCA'),
(141, 'Natural Sciences Research Institute', '14.6520710000', '121.0689810000', 'CS', 'NSRI Miranda Hall'),
(142, 'Zoology Building', '14.6527870000', '121.0710250000', 'CS', 'ZB'),
(143, 'Virata Hall', '14.6564350000', '121.0617450000', 'ISSI', 'ISSI'),
(144, 'Palma Hall', '14.6535030000', '121.0698130000', 'CSSP', 'PH AS'),
(145, 'Palma Hall Annex', '14.6534670000', '121.0713040000', 'CSSP', 'PHAN'),
(146, 'Tandang Sora Hall', '14.6571100000', '121.0638800000', 'CSWCD', ''),
(147, 'School of Statistics Building', '14.6579920000', '121.0710460000', 'SS', 'Stat SS'),
(148, 'School of Urban and Regional Planning Building', '14.6569330000', '121.0628660000', 'SURP', 'SURP'),
(149, 'Technology Management Center', '14.6471400000', '121.0718670000', 'TMC', ''),
(150, 'UPDEPP Office in UPD', '14.6584830000', '121.0672410000', 'DEPP', 'DEPP'),
(151, 'Andres Bonifacio Centennial Carillon Tower and Plaza', '14.6566140000', '121.0665350000', 'UTH', ''),
(152, 'Bulwagan ng Dangal', '14.6544680000', '121.0709990000', 'UTH', ''),
(153, 'Director''s Office', '14.6567700000', '121.0661010000', 'UTH', ''),
(154, 'Oblation Plaza', '14.6548630000', '121.0648430000', 'UTH', 'Oble'),
(155, 'University Amphitheater', '14.6548580000', '121.0656210000', 'UTH', ''),
(156, 'University Theater', '14.6567700000', '121.0661010000', 'UTH', ''),
(157, 'UP Lagoon Beta Theatrum', '14.6548420000', '121.0672220000', 'UTH', ''),
(158, 'Washington Sycip Garden of Native Trees', '14.6570740000', '121.0665590000', 'UTH', ''),
(159, 'Advanced Science and Technology Institute', '14.6471400000', '121.0718670000', 'STP', ''),
(160, 'Energy Research and Development Center', '14.6610360000', '121.0572500000', 'STP', 'ERDC'),
(161, 'Philippine Atomic Energy Commission', '14.6603090000', '121.0560560000', 'STP', ''),
(162, 'Philippine Social Science Center', '14.6611270000', '121.0627100000', 'STP', 'PSSC'),
(163, 'SEAMEO-Innotech', '14.6605090000', '121.0591850000', 'STP', ''),
(164, 'UP-Ayala Foundation Technology Business Incubator', '14.6477840000', '121.0733640000', 'STP', ''),
(165, 'UP-Ayala Technohub', '14.6574780000', '121.0561060000', 'STP', ''),
(166, 'Citimall and L''Paseo', '14.6534820000', '121.0534470000', 'RGH', ''),
(167, 'Commission on Higher Education', '14.6535080000', '121.0580540000', 'RGH', 'CHEd'),
(168, 'Development Bank of the Philippines', '14.6545820000', '121.0532850000', 'RGH', 'DBP'),
(169, 'Landbank of the Philippines', '14.6532100000', '121.0682980000', 'RGH', 'LBP'),
(170, 'National Computer Center', '14.6526540000', '121.0583490000', 'RGH', 'CC'),
(171, 'Petron Gas Station', '14.6547640000', '121.0537950000', 'RGH', 'University Vicars'),
(172, 'Shell Gas Station', '14.6568270000', '121.0584540000', 'RGH', ''),
(173, 'Philippine Institute of Volcanology and Seismology', '14.6519040000', '121.0585310000', 'RGH', 'PHIVOLCS'),
(174, 'Philippine National Bank', '14.6598840000', '121.0702740000', 'RGH', 'PNB'),
(175, 'Philippine National Red Cross Building', '14.6514790000', '121.0587040000', 'RGH', ''),
(176, 'University Town Center', '14.6494760000', '121.0754180000', 'RGH', ''),
(177, 'UP Wet and Dry Market', '14.6542140000', '121.0528820000', 'RGH', ''),
(178, 'Automated Guideway Transit System Experimental Track', '14.6544680000', '121.0587140000', 'OP', 'AGT'),
(179, 'Arboretum', '14.6604780000', '121.0514490000', 'OP', ''),
(180, 'Bahay Kalinaw', '14.6599410000', '121.0729730000', 'OP', 'Ikeda Hall'),
(181, 'Balay Tsanselor', '14.6460730000', '121.0690380000', 'OP', ''),
(182, 'Camp Karingal', '14.6460730000', '121.0690380000', 'OP', 'INP Headquarters'),
(183, 'CASAA Food Center', '14.6531660000', '121.0708700000', 'RES O', ''),
(184, 'Commission on Human Rights', '14.6571880000', '121.0602960000', 'OP', 'CHR'),
(185, 'Equine Stud Farm', '14.6483910000', '121.0611010000', 'OP', ''),
(186, 'Executive House', '14.6494080000', '121.0672640000', 'OP', ''),
(187, 'PAGASA Observatory', '14.6510580000', '121.0723450000', 'OP', ''),
(188, 'Procurement Service', '14.6573020000', '121.0683320000', 'OP', ''),
(189, 'Sewage Treatment Plant', '14.6597930000', '121.0514060000', 'OP', ''),
(190, 'State Auditing and Accounting Building', '14.6571880000', '121.0602960000', 'OP', ''),
(191, 'Sunken Garden', '14.6550130000', '121.0718460000', 'OP', 'General Antonio Luna Parade Grounds'),
(192, 'Sunken Garden Grandstand', '14.6550130000', '121.0728270000', 'OP', ''),
(193, 'Tennis Court 1', '14.6563630000', '121.0678170000', 'OP', ''),
(194, 'University Hotel', '14.6610910000', '121.0728270000', 'OP', ''),
(195, 'All UP Workers Union', '14.6595670000', '121.0686940000', 'COM', ''),
(196, 'Catholic Parish Office', '14.6585370000', '121.0710920000', 'COM', ''),
(197, 'Church of the Risen Lord', '14.6595130000', '121.0720850000', 'COM', 'Parish'),
(198, 'Credit Union', '14.6480720000', '121.0644730000', 'COM', ''),
(199, 'Kalinga Day Care Center', '14.6601120000', '121.0716910000', 'COM', ''),
(200, 'Parish of the Holy Sacrifice', '14.6589130000', '121.0710920000', 'COM', ''),
(201, 'PAUW Day Care Center', '14.6502440000', '121.0659960000', 'COM', ''),
(202, 'PAUW Annex', '14.6598810000', '121.0736270000', 'COM', ''),
(203, 'Post Office', '14.6595020000', '121.0683990000', 'COM', ''),
(204, 'Provident Fund', '14.6592790000', '121.0682360000', 'COM', ''),
(205, 'Shopping Center', '14.6595130000', '121.0699470000', 'RES C', 'SC'),
(206, 'UP Consumers'' Cooperative Main Grocery', '14.6596060000', '121.0691930000', 'COM', ''),
(207, 'UP Consumers'' Cooperative Grocery', '14.6480720000', '121.0644730000', 'COM', ''),
(208, 'Acacia Residence Hall', '14.6589060000', '121.0701780000', 'DRM', 'Law Centennial Dorm'),
(209, 'Concordia Albarracin Hall', '14.6475160000', '121.0625600000', 'DRM', 'Dorm'),
(210, 'Ilang-ilang Residence Hall', '14.6594400000', '121.0735520000', 'DRM', 'Dorm'),
(211, 'International Center', '14.6582260000', '121.0731600000', 'DRM', 'Dorm'),
(212, 'Ipil Residence Hall', '14.6579660000', '121.0700520000', 'DRM', 'Dorm'),
(213, 'Kalayaan Residence Hall', '14.6588040000', '121.0690590000', 'DRM', 'Kalay Dorm'),
(214, 'Kamagong Residence Hall', '14.6484450000', '121.0626030000', 'DRM', 'Dorm'),
(215, 'Kamia Residence Hall', '14.6518890000', '121.0705420000', 'DRM', 'Dorm'),
(216, 'Molave Residence Hall', '14.6579380000', '121.0676990000', 'DRM', 'Dorm'),
(217, 'Sampaguita Residence Hall', '14.6521330000', '121.0712400000', 'DRM', 'Sampa Dorm'),
(218, 'Sanggumay Residence Hall', '14.6585190000', '121.0678630000', 'DRM', 'Dorm'),
(219, 'UP Centennial Residence Hall', '14.6476560000', '121.0625280000', 'DRM', 'Cente Dorm'),
(220, 'Yakal Residence Hall', '14.6577640000', '121.0692010000', 'DRM', 'Dorm');

-- --------------------------------------------------------

--
-- Table structure for table `routeikot`
--

CREATE TABLE IF NOT EXISTS `routeikot` (
  `route_index` int(11) NOT NULL,
  `place_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `routeikot`
--

INSERT INTO `routeikot` (`route_index`, `place_id`) VALUES
(1, 69);

-- --------------------------------------------------------

--
-- Table structure for table `routekatipunan`
--

CREATE TABLE IF NOT EXISTS `routekatipunan` (
  `route_index` int(11) NOT NULL,
  `place_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `routekatipunan`
--

INSERT INTO `routekatipunan` (`route_index`, `place_id`) VALUES
(1, 67);

-- --------------------------------------------------------

--
-- Table structure for table `routephilcoa`
--

CREATE TABLE IF NOT EXISTS `routephilcoa` (
  `route_index` int(11) NOT NULL,
  `place_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `routephilcoa`
--

INSERT INTO `routephilcoa` (`route_index`, `place_id`) VALUES
(1, 154);

-- --------------------------------------------------------

--
-- Table structure for table `routetoki`
--

CREATE TABLE IF NOT EXISTS `routetoki` (
  `route_index` int(11) NOT NULL,
  `place_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `routetoki`
--

INSERT INTO `routetoki` (`route_index`, `place_id`) VALUES
(1, 69);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
