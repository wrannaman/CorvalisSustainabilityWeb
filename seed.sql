-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Jan 27, 2016 at 06:44 AM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `sustain`
--

-- --------------------------------------------------------

--
-- Table structure for table `businesses`
--

CREATE TABLE `businesses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `latitude` int(11) DEFAULT NULL,
  `longitude` int(11) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `businesses`
--

INSERT INTO `businesses` (`id`, `name`, `address`, `city`, `state`, `phone`, `website`, `notes`, `latitude`, `longitude`, `link`) VALUES
(1, 'Albany-Corvallis ReUseIt (free items:  groups.yahoo.com)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Albany-Corvallis ReUseIt (free items:  groups.yahoo.com)'),
(2, 'Arc Thrift Stores  (Corvallis)', '928 NW Beca Ave', 'Corvallis', 'OR', '541-929-3946', NULL, NULL, NULL, NULL, NULL),
(3, 'Arc Thrift Stores (Philomath)', '936 Main St', 'Philomath', 'OR', '541-753-8250', NULL, NULL, NULL, NULL, NULL),
(4, 'Beekman Place Antique Mall', '601 SW Western Blvd', 'Corvallis', 'OR', '541-754-9011', NULL, NULL, NULL, NULL, NULL),
(5, 'Benton County Extension / 4-H  Activities', '1849 NW 9th', 'Corvallis', 'OR', '541-766-6750', NULL, NULL, NULL, NULL, NULL),
(6, 'Benton County Master Gardeners', '1849 NW 9th St', 'Corvallis', 'OR', '541-766-6750', NULL, NULL, NULL, NULL, NULL),
(7, 'Book Bin', '215 SW 4th St	Corvallis', 'Corvallis', 'OR', '541-752-0040', NULL, NULL, NULL, NULL, NULL),
(8, 'Browser''s Bookstore', '121 NW 4th St', 'Corvallis', 'OR', '(888) 758-1121', NULL, NULL, NULL, NULL, NULL),
(9, 'Boys & Girls Club / STARS (after school programs)', '1112 NW Circle Blvd', 'Corvallis', 'OR', '541-757-1909', NULL, NULL, NULL, NULL, NULL),
(10, 'Buckingham Palace --Fri-Sun only', '600 SW 3rd St', 'Corvallis', 'OR', '541-752-7980', NULL, NULL, NULL, NULL, NULL),
(11, 'Calvary Community Outreach', '2125 NW Lester Ave', 'Corvallis', 'OR', '541-760-5941', NULL, NULL, NULL, NULL, NULL),
(12, 'CARDV (Center Against Rape/Domestic Violence)', '4786 SW Philomath Blvd', 'Corvallis', 'OR', '541-758-0219', NULL, NULL, NULL, NULL, NULL),
(13, 'Career Closet for Women (drop-off at)', '942 NW 9th, Ste.A', 'Corvallis', 'OR', '541-754-6979', NULL, NULL, NULL, NULL, NULL),
(14, 'Cat''s Meow Humane Society Thrift Shop', '411 SW 3rd St', 'Corvallis', 'OR', '541-757-0573', NULL, NULL, NULL, NULL, NULL),
(15, 'Children''s Farm Home', '4455 NE Hwy 20', 'Corvallis', 'OR', '541-757-1852', NULL, NULL, NULL, NULL, NULL),
(16, 'Chintimini Wildlife Rehabilitation Ctr', '311 Lewisburg Rd', 'Corvallis', 'OR', '541-745-5324', NULL, NULL, NULL, NULL, NULL),
(17, 'Community Outreach (homeless shelter', '865 NW Reiman', 'Corvallis', 'OR', '541-758-3000', NULL, NULL, NULL, NULL, NULL),
(18, 'Corvallis Environmental Center', '214 SW Monroe Ave', 'Corvallis', 'OR', '541-753-9211', NULL, NULL, NULL, NULL, NULL),
(19, 'Corvallis Bicycle Collective', '33900 SE Roche Ln/Hwy 34', 'Corvallis', 'OR', '541-224-6885', NULL, NULL, NULL, NULL, NULL),
(20, 'Corvallis Furniture', '720 NE Granger Ave, Bldg J', 'Corvallis', 'OR', '541-231-8103', NULL, NULL, NULL, NULL, NULL),
(21, 'Corvallis-Uzhhorod Sister Cities/The TOUCH Project', '', 'Corvallis', 'OR', '541-753-5170', NULL, NULL, NULL, NULL, 'http://www.sistercities.corvallis.or.us/uzhhorod'),
(22, 'Cosmic Chameleon', '138 SW 2nd St', 'Corvallis', 'OR', '541-752-9001', NULL, NULL, NULL, NULL, NULL),
(23, 'Craigslist (corvallis.craigslist.org)', '', 'Corvallis', 'OR', '', NULL, NULL, NULL, NULL, 'corvallis.craigslist.org'),
(24, 'Freecycle.org', '', 'Corvallis', 'OR', '', NULL, NULL, NULL, NULL, 'https://corvallis.craigslist.org'),
(25, 'First Alternative Co-op Recycling Center', '1007 SE 3rd St', 'Corvallis', 'OR', '541-753-3115', NULL, NULL, NULL, NULL, NULL),
(26, 'First Alternative Co-op Store (South store)', '1007 SE 3rd St', 'Corvallis', 'OR', '541-753-3115', NULL, NULL, NULL, NULL, NULL),
(27, 'First Alternative Co-op Store (North store)', '2855 NW Grant Ave', 'Corvallis', 'OR', '541-452-3115', NULL, NULL, NULL, NULL, NULL),
(28, 'Furniture Exchange', '210 NW 2nd St', 'Corvallis', 'OR', '541-833-0183', NULL, NULL, NULL, NULL, NULL),
(29, 'Furniture Share (formerly Benton FS)', '155 SE Lilly Ave', 'Corvallis', 'OR', '541-754-9511', NULL, NULL, NULL, NULL, NULL),
(30, 'Home Grown Gardens', '4845 SE 3rd St', 'Corvallis', 'OR', '541-758-2137', NULL, NULL, NULL, NULL, NULL),
(31, 'Garland Nursery', '5470 NE Hwy 20', 'Corvallis', 'OR', '541-753-6601', NULL, NULL, NULL, NULL, NULL),
(32, 'Goodwill Industries', '1325 NW 9th St', 'Corvallis', 'OR', '541-752-8278', NULL, NULL, NULL, NULL, NULL),
(33, 'Habitat for Humanity ReStore', '4840 SW Philomath Blvd', 'Corvallis', 'OR', '541-752-6637', NULL, NULL, NULL, NULL, NULL),
(34, 'Happy Trails Records Tapes & CDs', '100 SW 3rd St', 'Corvallis', 'OR', '541-752-9032', NULL, NULL, NULL, NULL, NULL),
(35, 'Heartland Humane Society', '398 SW Twin Oaks Cir', 'Corvallis', 'OR', '541-757-9000', NULL, NULL, NULL, NULL, NULL),
(36, 'Home Life Inc. (for develop. Disabled)', '2068 NW Fillmore', 'Corvallis', 'OR', '541-753-9015', NULL, NULL, NULL, NULL, NULL),
(37, 'Jackson Street Youth Shelter', '555 NW Jackson St', 'Corvallis', 'OR', '541-754-2404', NULL, NULL, NULL, NULL, NULL),
(38, 'Linn Benton Food Share (lg. food donations)', '545 SW 2nd', 'Corvallis', 'OR', '541-752-1010', NULL, NULL, NULL, NULL, NULL),
(39, 'Lions Club (box inside Elks Lodge)', '1400 NW 9th St', 'Corvallis', 'OR', '541-758-0222', NULL, NULL, NULL, NULL, NULL),
(40, 'Love INC (for low income citizens)', '2330 NW Professional Dr #102', 'Corvallis', 'OR', '541-757-8111', NULL, NULL, NULL, NULL, NULL),
(41, 'Mario Pastega House (Good Sam patient family housing)', '3505 NW Samaritan Dr', 'Corvallis', 'OR', '541-768-4650', NULL, NULL, NULL, NULL, NULL),
(42, 'Mary''s River Gleaners (for low income citizens)', 'Po Box 2309', 'Corvallis', 'OR', '541-752-1010', NULL, NULL, NULL, NULL, NULL),
(43, 'Midway Farms (Hway 20 btw Corvallis & Albany)', '6980 US-20', 'Albany', 'OR', '541-740-6141', NULL, NULL, NULL, NULL, NULL),
(44, 'Neighbor to Neighbor (food pantry', '1123 Main', 'Philomath', 'OR', '541-929-6614', NULL, NULL, NULL, NULL, NULL),
(45, 'Osborn Aquatic Center', '1940 NW Highland Dr', 'Corvallis', 'OR', '541-766-7946', NULL, NULL, NULL, NULL, NULL),
(46, 'OSU Emergency Food Pantry ', '2150 SW Jefferson Way', 'Corvallis', 'OR', '541-737-3473', NULL, NULL, NULL, NULL, NULL),
(47, 'OSU Folk Club Thrift Shop', '144 NW 2nd St', 'Corvallis', 'OR', '541-752-4733', NULL, NULL, NULL, NULL, NULL),
(48, 'OSU Organic Growers Club (Crop & Soil Science Dep''t)', '', 'Corvallis', 'OR', '541-737-6810', NULL, NULL, NULL, NULL, 'http://cropandsoil.oregonstate.edu/organic_grower'),
(49, 'Pak Mail (Timberhill Shopping Ctr)', '2397 NW Kings Blvd', 'Corvallis', 'OR', '541-754-8411', NULL, NULL, NULL, NULL, NULL),
(50, 'Parent Enhancement Program', '421 NW 4th St', 'Corvallis', 'OR', '541-758-8292', NULL, NULL, NULL, NULL, NULL),
(51, 'Pastors for Peace-Caravan to Cuba (Mike Beilstein)', '', 'Corvallis', 'OR', '541-754-1858', NULL, NULL, NULL, NULL, 'www.ifconews.org'),
(52, 'Philomath Community Garden (Chris Shonnard)', '', 'Corvallis', 'OR', '541-929-3524', NULL, NULL, NULL, NULL, 'http://philomathcommunityservices.org'),
(53, 'Philomath Community Services (food & kids stuff)', '360 S 9th', 'Philomath', 'OR', '541-929-2499', NULL, NULL, NULL, NULL, NULL),
(54, 'Play It Again Sports', '1422 NW 9th St', 'Corvallis', 'OR', '541-754-7529', NULL, NULL, NULL, NULL, NULL),
(55, 'Presbyterian Piecemakers (cotton quilts)', '114 SW 8th St', 'Corvallis', 'OR', '541-753-7516', NULL, NULL, NULL, NULL, NULL),
(56, 'Public Library Corvallis, Friends of', '645 NW Monroe Ave', 'Corvallis', 'OR', '541-766-6928', NULL, NULL, NULL, NULL, NULL),
(57, 'Quilts From Caring Hands (cotton quilts)', '1495 NW 20th St', 'Corvallis', 'OR', '541-758-8161', NULL, NULL, NULL, NULL, NULL),
(58, 'Rapid Refill Ink', '254 SW Madison Ave', 'Corvallis', 'OR', '541-758-8444', NULL, NULL, NULL, NULL, NULL),
(59, 'Replay Children''s Wear', '250 NW 1st St', 'Corvallis', 'OR', '541-753-6903', NULL, NULL, NULL, NULL, NULL),
(60, 're·volve (women''s resale boutique,)', '103 SW 2nd St', 'Corvallis', 'OR', '541-754-1154', NULL, NULL, NULL, NULL, NULL),
(61, 'Second Glance', '312 SW 3rd Street', 'Corvallis', 'OR', '541-758-9099', NULL, NULL, NULL, NULL, NULL),
(62, 'The Annex', '214 SW Jefferson', 'Corvallis', 'OR', '541-758-9099', NULL, NULL, NULL, NULL, NULL),
(63, 'The Alley', '312 SW Jefferson', 'Corvallis', 'OR', '541-753-4069', NULL, NULL, NULL, NULL, NULL),
(64, 'Senior Center of Corvallis', '2601 NW Tyler Ave', 'Corvallis', 'OR', '541-766-6959', NULL, NULL, NULL, NULL, NULL),
(65, 'South Corvallis Food Bank', '1798 SW 3rd St', 'Corvallis', 'OR', '541-753-4263', NULL, NULL, NULL, NULL, NULL),
(66, 'St. Vincent de Paul Food Bank', '501 NW 25 th Street', 'Corvallis', 'OR', '541-757-1988', NULL, NULL, NULL, NULL, NULL),
(67, 'Stone Soup  (St Mary''s Church', '501 NW 25th Street', 'Corvallis', 'OR', '541-757-1988', NULL, NULL, NULL, NULL, NULL),
(68, 'UPS Store ( Philomath)', '5060 SW Philomath Blvd', 'Corvallis', 'OR', '541-752-1830', NULL, NULL, NULL, NULL, NULL),
(69, 'UPS Stores (Corvallis)', '922 NW Circle Blvd #160', 'Corvallis', 'OR', '541-752-0056', NULL, NULL, NULL, NULL, NULL),
(70, 'Vina Moses (for low income citizens)', '968 NW Garfield Ave', 'Corvallis', 'OR', '541-753-1420', NULL, NULL, NULL, NULL, NULL),
(71, 'Spaeth Heritage House', '135 N 13th St', 'Philomath', 'OR', '541-307-0349', NULL, NULL, NULL, NULL, NULL),
(72, 'Book binding', '108 SW 3rd St', 'Corvallis', 'OR', '(541) 757-9861', 'http://www.cornerstoneassociates.com/bj-bookbinding-about-us.html', 'Rebind and restore books', NULL, NULL, NULL),
(73, 'Cell Phone Sick Bay', '252 Sw Madison Ave, Suite 110', 'Philomath', 'OR', '(541) 230-1785', 'http://www.cellsickbay.com/index.html', 'Cell phones and tablets', NULL, NULL, NULL),
(74, 'Geeks ''N'' Nerds', '950 Southeast Geary St Unit D Albany', 'Corvallis', 'OR', '97321', 'http://www.computergeeksnnerds.com/', 'repair Computers of all kinds and cell phone repair; in home repair available', NULL, NULL, NULL),
(75, 'Specialty Sewing By Leslie', '225 SW Madison Ave', 'Corvallis', 'OR', '(541) 758-4556', 'http://www.specialtysewing.com/Leslie_Seamstress/Welcome.html', 'Alterations and custom work', NULL, NULL, NULL),
(76, 'Covallis Technical', '966 NW Circle Blvd', 'Corvallis', 'OR', '(541) 704-7009', 'http://www.corvallistechnical.com', 'repair Computers and laptops', NULL, NULL, NULL),
(77, 'OSU Repair Fair', 'Oregon State University Property Services Building\r\n644 S.W. 13th St', 'Corvallis', 'OR', '541-737-5398', 'http://fa.oregonstate.edu/surplus', 'Occurs twice per quarter in the evenings Small appliances, Bicycles, Clothing, Computers (hardware and software) Electronics (small items only) Housewares (furniture, ceramics, lamps, etc.)', NULL, NULL, NULL),
(78, 'Bellevue Computers', '1865 NW 9th St', 'Corvallis', 'OR', '541-757-3487', 'http://www.bellevuepc.com/', 'repair computers and laptops', NULL, NULL, NULL),
(79, 'P.K Furniture Repair & Refinishing', '5270 Corvallis-Newport Hwy', 'Corvallis', 'OR', '541-230-1727', 'http://www.pkfurniturerefinishing.net/', 'Complete Restoration, Complete Refinishing, Modifications, Custom Color Matching, Furniture Stripping,Chair Press Caning, Repairs', NULL, NULL, NULL),
(80, 'Furniture Restoration Center', '1321 Main St', 'Philomath', 'OR', '(541) 929-6681', 'http://restorationsupplies.com', 'Restores all typers of furniture and has hardware for doing it yourself', NULL, NULL, NULL),
(81, 'Power equipment', '713 NE Circle Blvd', 'Corvallis', 'OR', '(541) 757-8075', 'https://corvallispowerequipment.stihldealer.net', 'lawn and garden equipment, chain saws  (Stihl, honda, shindiawh), hand held equipment.', NULL, NULL, NULL),
(82, 'Robnett''s', '400 SW 2nd St', 'Corvallis', 'OR', '(541) 753-5531', 'http://ww3.truevalue.com/robnetts/Home.aspx', 'Adjustment and sharpening', NULL, NULL, NULL),
(83, 'Footwise', '301 SW Madison Ave #100', 'Corvallis', 'OR', '(541) 757-0875', 'http://footwise.com/', 'resoles berkenstock', NULL, NULL, NULL),
(84, 'Robnett''s', '400 SW 2nd St', 'Corvallis', 'OR', '(541) 753-5531', 'http://ww3.truevalue.com/robnetts/Home.aspx', 'Screen repair for windows and doors', NULL, NULL, NULL),
(85, 'Sedlack', '225 SW 2nd St', 'Corvallis', 'OR', '(541) 752-1498', 'http://www.sedlaksshoes.net/', 'full resoles, elastic and velcros, sewing and patching, leather patches, zippers, half soles and heels.', NULL, NULL, NULL),
(86, 'Foam Man', '2511 NW 9th St', 'Corvallis', 'OR', '(541) 754-9378', 'http://www.thefoammancorvallis.com', 'Replacement foam cusions for chairs and couches;  upholstery', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `businesses`
--
ALTER TABLE `businesses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `businesses`
--
ALTER TABLE `businesses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=87;
