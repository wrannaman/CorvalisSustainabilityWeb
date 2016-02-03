-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Feb 03, 2016 at 04:51 AM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


CREATE TABLE `businesses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` enum('reuse','repair','both','') DEFAULT 'reuse',
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `businesses`
--

INSERT INTO `businesses` (`id`, `name`, `type`, `address`, `city`, `state`, `phone`, `website`, `notes`, `latitude`, `longitude`) VALUES
(1, 'Albany-Corvallis ReUseIt (free items:  groups.yahoo.com)', 'reuse', '', '', 'OR', '', 'https://groups.yahoo.com/neo/groups/albanycorvallisReUseIt/info', '', 44.5445, -122.108),
(2, 'Arc Thrift Stores  (Corvallis)', 'reuse', '928 NW Beca Ave', 'Corvallis', 'OR', '541-929-3946', 'http://www.arcbenton.org/', '', 44.5781, -123.261),
(3, 'Arc Thrift Stores (Philomath)', 'reuse', '936 Main St', 'Philomath', 'OR', '541-753-8250', 'http://www.arcbenton.org/', '', 44.54, -123.373),
(4, 'Beekman Place Antique Mall', 'reuse', '601 SW Western Blvd', 'Corvallis', 'OR', '541-754-9011', 'https://www.antiquemalls.com/or/corvallis/97333/16882', '', 44.5601, -123.267),
(6, 'Benton County Master Gardeners', 'reuse', '1849 NW 9th St', 'Corvallis', 'OR', '541-766-6750', 'http://extension.oregonstate.edu/benton/horticulture/mg', '', 44.5833, -123.258),
(7, 'Book Bin', 'reuse', '215 SW 4th St	Corvallis', 'Corvallis', 'OR', '541-752-0040', 'http://bookbin.com/', '', 44.4939, -123.425),
(8, 'Browsers Bookstore', 'reuse', '121 NW 4th St', 'Corvallis', 'OR', '(888) 758-1121', 'http://www.browsersbookstore.com/', NULL, 44.5774, -123.258),
(9, 'Boys & Girls Club / STARS (after school programs)', 'reuse', '1112 NW Circle Blvd', 'Corvallis', 'OR', '541-757-1909', 'http://www.bgccorvallis.org/', '', 44.589, -123.246),
(10, 'Buckingham Palace --Fri-Sun only', 'reuse', '600 SW 3rd St', 'Corvallis', 'OR', '541-752-7980', '', '', 44.5571, -123.265),
(11, 'Calvary Community Outreach', 'reuse', '2125 NW Lester Ave', 'Corvallis', 'OR', '541-760-5941', 'http://www.communityoutreachinc.org/', NULL, 44.6061, -123.275),
(12, 'CARDV (Center Against Rape/Domestic Violence)', 'reuse', '4786 SW Philomath Blvd', 'Corvallis', 'OR', '541-758-0219', 'http://cardv.org/', '', 44.5455, -123.329),
(13, 'Career Closet for Women (drop-off at)', 'reuse', '942 NW 9th, Ste.A', 'Corvallis', 'OR', '541-754-6979', 'https://sicorvallis.wordpress.com/', '', 44.4939, -123.425),
(14, 'Cats Meow Humane Society Thrift Shop', 'reuse', '411 SW 3rd St', 'Corvallis', 'OR', '541-757-0573', 'http://www.heartlandhumane.org/', '', 44.5571, -123.265),
(15, 'Childrens Farm Home', 'reuse', '4455 NE Hwy 20', 'Corvallis', 'OR', '541-757-1852', 'http://www.heartlandhumane.org/', '', 44.5537, -123.303),
(16, 'Chintimini Wildlife Rehabilitation Ctr', 'reuse', '311 Lewisburg Rd', 'Corvallis', 'OR', '541-745-5324', 'http://www.chintiminiwildlife.org/', '', 44.6291, -123.24),
(17, 'Community Outreach (homeless shelter', 'reuse', '865 NW Reiman', 'Corvallis', 'OR', '541-758-3000', 'http://www.communityoutreachinc.org/services/emergency-shelter-program/family-shelter/', '', 44.5733, -123.263),
(18, 'Corvallis Environmental Center', 'reuse', '214 SW Monroe Ave', 'Corvallis', 'OR', '541-753-9211', 'http://www.corvallisenvironmentalcenter.org/', '', 44.5685, -123.278),
(19, 'Corvallis Bicycle Collective', 'reuse', '33900 SE Roche Ln/Hwy 34', 'Corvallis', 'OR', '541-224-6885', 'http://corvallisbikes.org/', '', 44.4939, -123.425),
(20, 'Corvallis Furniture', 'reuse', '720 NE Granger Ave, Bldg J', 'Corvallis', 'OR', '541-231-8103', 'http://corvallisfurniture.com/', '', 44.6288, -123.234),
(21, 'Corvallis-Uzhhorod Sister Cities/The TOUCH Project', 'reuse', '', 'Corvallis', 'OR', '541-753-5170', 'http://www.sistercities.corvallis.or.us/uzhhorod', '', 44.4939, -123.425),
(22, 'Cosmic Chameleon', 'reuse', '138 SW 2nd St', 'Corvallis', 'OR', '541-752-9001', '', '', 44.5638, -123.26),
(23, 'Craigslist (corvallis.craigslist.org)', 'reuse', '', 'Corvallis', 'OR', '', 'corvallis.craigslist.org', '', 44.4939, -123.425),
(24, 'Freecycle.org', 'reuse', '', 'Corvallis', 'OR', '', 'https://corvallis.craigslist.org', NULL, 44.4939, -123.425),
(25, 'First Alternative Co-op Recycling Center', 'reuse', '1007 SE 3rd St', 'Corvallis', 'OR', '541-753-3115', 'http://firstalt.coop/', '', 44.5542, -123.265),
(26, 'First Alternative Co-op Store (South store)', 'reuse', '1007 SE 3rd St', 'Corvallis', 'OR', '541-753-3115', 'http://firstalt.coop/', '', 44.5542, -123.265),
(27, 'First Alternative Co-op Store (North store)', 'reuse', '2855 NW Grant Ave', 'Corvallis', 'OR', '541-452-3115', 'http://firstalt.coop/', '', 44.5789, -123.283),
(28, 'Furniture Exchange', 'reuse', '210 NW 2nd St', 'Corvallis', 'OR', '541-833-0183', 'http://www.furnitureexchange-usa.com/', '', 44.563, -123.261),
(29, 'Furniture Share (formerly Benton FS)', 'reuse', '155 SE Lilly Ave', 'Corvallis', 'OR', '541-754-9511', 'http://furnitureshare.org/', '', 44.5482, -123.265),
(30, 'Home Grown Gardens', 'reuse', '4845 SE 3rd St', 'Corvallis', 'OR', '541-758-2137', 'http://homegrowngardens77.vpweb.com/', NULL, 44.5122, -123.269),
(31, 'Garland Nursery', 'reuse', '5470 NE Hwy 20', 'Corvallis', 'OR', '541-753-6601', 'http://www.garlandnursery.com/', '', 44.5504, -123.313),
(32, 'Goodwill Industries', 'reuse', '1325 NW 9th St', 'Corvallis', 'OR', '541-752-8278', 'http://www.goodwill.org/locator/', '', 44.5833, -123.258),
(33, 'Habitat for Humanity ReStore', 'reuse', '4840 SW Philomath Blvd', 'Corvallis', 'OR', '541-752-6637', 'http://bentonhabitat.org/', '', 44.5455, -123.329),
(34, 'Happy Trails Records Tapes & CDs', 'reuse', '100 SW 3rd St', 'Corvallis', 'OR', '541-752-9032', 'http://www.corvallisbusiness.com/happytrails.html', '', 44.5571, -123.265),
(35, 'Heartland Humane Society', 'reuse', '398 SW Twin Oaks Cir', 'Corvallis', 'OR', '541-757-9000', 'http://www.heartlandhumane.org/', '', 44.5537, -123.269),
(36, 'Home Life Inc. (for develop. Disabled)', 'reuse', '2068 NW Fillmore', 'Corvallis', 'OR', '541-753-9015', 'http://homelifeinc.org/', '', 44.5753, -123.276),
(37, 'Jackson Street Youth Shelter', 'reuse', '555 NW Jackson St', 'Corvallis', 'OR', '541-754-2404', 'http://www.jsysi.org/', '', 44.8497, -123.242),
(38, 'Linn Benton Food Share (lg. food donations)', 'reuse', '545 SW 2nd', 'Corvallis', 'OR', '541-752-1010', 'http://communityservices.us/nutrition/detail/category/linn-benton-food-share/', '', 44.5737, -123.254),
(39, 'Lions Club (box inside Elks Lodge)', 'reuse', '1400 NW 9th St', 'Corvallis', 'OR', '541-758-0222', 'http://www.e-clubhouse.org/sites/midvalley/', '', 44.5833, -123.258),
(40, 'Love INC (for low income citizens)', 'reuse', '2330 NW Professional Dr #102', 'Corvallis', 'OR', '541-757-8111', 'http://www.yourloveinc.org/', '', 44.5924, -123.278),
(41, 'Mario Pastega House (Good Sam patient family housing)', 'reuse', '3505 NW Samaritan Dr', 'Corvallis', 'OR', '541-768-4650', 'http://www.samhealth.org/locations/mariopastegahouse/Pages/default.aspx', '', 44.6012, -123.25),
(42, 'Mary''s River Gleaners (for low income citizens)', 'reuse', 'Po Box 2309', 'Corvallis', 'OR', '541-752-1010', '', '', 44.4939, -123.425),
(43, 'Midway Farms (Hway 20 btw Corvallis & Albany)', 'reuse', '6980 US-20', 'Albany', 'OR', '541-740-6141', 'http://www.midwayfarmsoregon.com/', '', 44.4889, -122.537),
(44, 'Neighbor to Neighbor (food pantry', 'reuse', '1123 Main', 'Philomath', 'OR', '541-929-6614', '', '', 44.54, -123.37),
(45, 'Osborn Aquatic Center', 'reuse', '1940 NW Highland Dr', 'Corvallis', 'OR', '541-766-7946', 'http://www.corvallisoregon.gov/index.aspx?page=57', '', 44.5866, -123.263),
(46, 'OSU Emergency Food Pantry', 'reuse', '2150 SW Jefferson Way', 'Corvallis', 'OR', '541-737-3473', 'http://studentlife.oregonstate.edu/hsrc/osu-emergency-food-pantry', '', 44.5646, -123.283),
(47, 'OSU Folk Club Thrift Shop', 'reuse', '144 NW 2nd St', 'Corvallis', 'OR', '541-752-4733', '', '', 44.5636, -123.26),
(48, 'OSU Organic Growers Club (Crop & Soil Science Dep''t)', 'reuse', '', 'Corvallis', 'OR', '541-737-6810', 'http://cropandsoil.oregonstate.edu/organic_grower', '', 44.4939, -123.425),
(49, 'Pak Mail (Timberhill Shopping Ctr)', 'reuse', '2397 NW Kings Blvd', 'Corvallis', 'OR', '541-754-8411', 'http://www.pakmail.com/stores/pak-mail-corvallis/', '', 44.5691, -123.275),
(50, 'Parent Enhancement Program', 'reuse', '421 NW 4th St', 'Corvallis', 'OR', '541-758-8292', 'http://www.downtowncorvallis.org/members/directory.php?show=779', '', 44.5774, -123.258),
(51, 'Pastors for Peace-Caravan to Cuba (Mike Beilstein)', 'reuse', '', 'Corvallis', 'OR', '541-754-1858', 'www.ifconews.org', '', 44.4939, -123.425),
(52, 'Philomath Community Garden (Chris Shonnard)', 'reuse', '', 'Corvallis', 'OR', '541-929-3524', 'http://philomathcommunityservices.org', '', 44.4939, -123.425),
(53, 'Philomath Community Services (food & kids stuff)', 'reuse', '360 S 9th', 'Philomath', 'OR', '541-929-2499', 'http://philomathcommunityservices.org/', '', 44.5403, -123.366),
(54, 'Play It Again Sports', 'reuse', '1422 NW 9th St', 'Corvallis', 'OR', '541-754-7529', 'http://www.playitagainsportscorvallis.com/', '', 44.5833, -123.258),
(55, 'Presbyterian Piecemakers (cotton quilts)', 'reuse', '114 SW 8th St', 'Corvallis', 'OR', '541-753-7516', 'http://1stpres.org/', '', 44.5657, -123.266),
(56, 'Public Library Corvallis, Friends of', 'reuse', '645 NW Monroe Ave', 'Corvallis', 'OR', '541-766-6928', 'http://cbcpubliclibrary.net/', '', 44.5685, -123.278),
(57, 'Quilts From Caring Hands (cotton quilts)', 'reuse', '1495 NW 20th St', 'Corvallis', 'OR', '541-758-8161', 'http://www.quiltsfromcaringhands.com/', '', 44.54, -123.357),
(58, 'Rapid Refill Ink', 'reuse', '254 SW Madison Ave', 'Corvallis', 'OR', '541-758-8444', 'http://www.rapidinkandtoner.com/oregon/corvallis-store-0107', '', 44.5631, -123.261),
(59, 'Replay Children''s Wear', 'reuse', '250 NW 1st St', 'Corvallis', 'OR', '541-753-6903', '', '', 44.5624, -123.26),
(60, 'reï¿½volve (women''s resale boutique,)', 'reuse', '103 SW 2nd St', 'Corvallis', 'OR', '541-754-1154', 'http://www.revolveresale.com/', '', 44.564, -123.26),
(61, 'Second Glance', 'reuse', '312 SW 3rd Street', 'Corvallis', 'OR', '541-758-9099', 'http://www.glanceagain.com/', '', 44.5571, -123.265),
(62, 'The Annex', 'reuse', '214 SW Jefferson', 'Corvallis', 'OR', '541-758-9099', 'http://www.glanceagain.com/', NULL, 44.5646, -123.274),
(63, 'The Alley', 'reuse', '312 SW Jefferson', 'Corvallis', 'OR', '541-753-4069', 'http://www.glanceagain.com/2011/11/second-glance-alley/', NULL, 44.5646, -123.274),
(64, 'Senior Center of Corvallis', 'reuse', '2601 NW Tyler Ave', 'Corvallis', 'OR', '541-766-6959', 'http://www.corvallisoregon.gov/index.aspx?page=257', '', 44.5725, -123.28),
(65, 'South Corvallis Food Bank', 'reuse', '1798 SW 3rd St', 'Corvallis', 'OR', '541-753-4263', 'http://www.southcorvallisfoodbank.org/', '', 44.5571, -123.265),
(66, 'St. Vincent de Paul Food Bank', 'reuse', '501 NW 25 th Street', 'Corvallis', 'OR', '541-757-1988', NULL, NULL, 44.5727, -123.279),
(67, 'Stone Soup  (St Mary''s Church', 'reuse', '501 NW 25th Street', 'Corvallis', 'OR', '541-757-1988', 'http://www.stonesoupcorvallis.org/about.html', '', 44.5727, -123.279),
(68, 'UPS Store ( Philomath)', 'reuse', '5060 SW Philomath Blvd', 'Corvallis', 'OR', '541-752-1830', 'https://corvallis-or-5088.theupsstorelocal.com/', '', 44.5455, -123.329),
(69, 'UPS Stores (Corvallis)', 'reuse', '922 NW Circle Blvd #160', 'Corvallis', 'OR', '541-752-0056', 'https://corvallis-or-5088.theupsstorelocal.com/', '', 44.589, -123.246),
(70, 'Vina Moses (for low income citizens)', 'reuse', '968 NW Garfield Ave', 'Corvallis', 'OR', '541-753-1420', 'http://www.vinamoses.org/', '', 44.5831, -123.261),
(71, 'Spaeth Heritage House', 'reuse', '135 N 13th St', 'Philomath', 'OR', '541-307-0349', 'http://www.spaethlumber.com/main/home/main.aspx', '', 44.5411, -123.368),
(72, 'Book binding', 'repair', '108 SW 3rd St', 'Corvallis', 'OR', '(541) 757-9861', 'http://www.cornerstoneassociates.com/bj-bookbinding-about-us.html', 'Rebind and restore books', 44.5571, -123.265),
(73, 'Cell Phone Sick Bay', 'repair', '252 Sw Madison Ave, Suite 110', 'Philomath', 'OR', '(541) 230-1785', 'http://www.cellsickbay.com/index.html', 'Cell phones and tablets', 44.5631, -123.261),
(74, 'Geeks ''N'' Nerds', 'repair', '950 Southeast Geary St Unit D Albany', 'Corvallis', 'OR', '97321', 'http://www.computergeeksnnerds.com/', 'repair Computers of all kinds and cell phone repair; in home repair available', 44.4939, -123.425),
(75, 'Specialty Sewing By Leslie', 'repair', '225 SW Madison Ave', 'Corvallis', 'OR', '(541) 758-4556', 'http://www.specialtysewing.com/Leslie_Seamstress/Welcome.html', 'Alterations and custom work', 44.5634, -123.261),
(76, 'Covallis Technical', 'reuse', '966 NW Circle Blvd', 'Corvallis', 'OR', '(541) 704-7009', 'http://www.corvallistechnical.com', 'repair Computers and laptops', 44.589, -123.246),
(77, 'OSU Repair Fair', 'repair', 'Oregon State University Property Services Building644 S.W. 13th St', 'Corvallis', 'OR', '541-737-5398', 'http://fa.oregonstate.edu/surplus', 'Occurs twice per quarter in the evenings Small appliances, Bicycles, Clothing, Computers (hardware and software) Electronics (small items only) Housewares (furniture, ceramics, lamps, etc.)', 44.5636, -123.272),
(78, 'Bellevue Computers', 'reuse', '1865 NW 9th St', 'Corvallis', 'OR', '541-757-3487', 'http://www.bellevuepc.com/', 'repair computers and laptops', 44.5833, -123.258),
(79, 'P.K Furniture Repair & Refinishing', 'repair', '5270 Corvallis-Newport Hwy', 'Corvallis', 'OR', '541-230-1727', 'http://www.pkfurniturerefinishing.net/', 'Complete Restoration, Complete Refinishing, Modifications, Custom Color Matching, Furniture Stripping,Chairï¿½Press Caning, Repairs', 44.5406, -123.381),
(80, 'Furniture Restoration Center', 'repair', '1321 Main St', 'Philomath', 'OR', '(541) 929-6681', 'http://restorationsupplies.com', 'Restores all typers of furniture and has hardware for doing it yourself', 44.5403, -123.367),
(81, 'Power equipment', 'repair', '713 NE Circle Blvd', 'Corvallis', 'OR', '(541) 757-8075', 'https://corvallispowerequipment.stihldealer.net', 'lawn and garden equipment, chain saws  (Stihl, honda, shindiawh), hand held equipment.', 44.589, -123.246),
(82, 'Robnett''s', 'repair', '400 SW 2nd St', 'Corvallis', 'OR', '(541) 753-5531', 'http://ww3.truevalue.com/robnetts/Home.aspx', 'Adjustment and sharpening', 44.5611, -123.262),
(83, 'Footwise', 'repair', '301 SW Madison Ave #100', 'Corvallis', 'OR', '(541) 757-0875', 'http://footwise.com/', 'resoles berkenstock', 44.5634, -123.261),
(84, 'Robnett''s', 'repair', '400 SW 2nd St', 'Corvallis', 'OR', '(541) 753-5531', 'http://ww3.truevalue.com/robnetts/Home.aspx', 'Screen repair for windows and doors', 44.5611, -123.262),
(85, 'Sedlack', 'repair', '225 SW 2nd St', 'Corvallis', 'OR', '(541) 752-1498', 'http://www.sedlaksshoes.net/', 'full resoles, elastic and velcros, sewing and patching, leather patches, zippers, half soles and heels.', 44.5627, -123.26),
(86, 'Foam Man', 'repair', '2511 NW 9th St', 'Corvallis', 'OR', '(541) 754-9378', 'http://www.thefoammancorvallis.com', 'Replacement foam cusions for chairs and couches;  upholstery', 44.5833, -123.258);

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





    CREATE TABLE `Categories` (
      `id` int(11) NOT NULL,
      `name` varchar(255) NOT NULL
    ) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

    --
    -- Dumping data for table `Categories`
    --

    INSERT INTO `Categories` (`id`, `name`) VALUES
    (1, 'Household'),
    (2, 'Bedding / bath'),
    (3, ' Childrens goods '),
    (4, 'Appliances - small'),
    (5, 'Applicances - Large'),
    (6, 'Building Materials / Home Improvement'),
    (7, ' Wearable items '),
    (8, ' Useable Electronics '),
    (9, ' Sporting equipment/ camping '),
    (10, ' Garden '),
    (11, ' Food '),
    (12, ' Medical supplies '),
    (13, ' Office equipment '),
    (14, ' Packing materials '),
    (15, ' Miscellaneous '),
    (16, ' Repair items '),
    (17, 'Art Supplies'),
    (18, 'Books'),
    (19, 'brown paper / large shopping bags'),
    (20, 'CDs DVDs LPs video games etc.'),
    (21, 'CELL PHONES (preferably with chargers)'),
    (23, 'Clothing / Accessories'),
    (24, 'Computer Paper'),
    (25, 'Computers / Monitors'),
    (26, 'Egg Cartons'),
    (27, 'FABRIC (material batting supplies)'),
    (28, 'FIREWOOD'),
    (29, 'FOOD (unopened pre-expired)'),
    (30, 'FOOD (surplus garden produce)'),
    (31, 'FOOD CONTAINERS (clean glass/plastic w/lids)'),
    (32, 'Furniture'),
    (33, 'Garden / Landscaping'),
    (34, 'Garden Pots'),
    (35, 'office supplies'),
    (36, 'Packing Materials'),
    (37, 'Pet Supplies / Food'),
    (38, 'Printer Cartridge Refilling'),
    (39, 'School Supplies'),
    (40, 'Toiletries'),
    (41, 'Vehicles / Parts'),
    (43, 'eyeglasses');

    --
    -- Indexes for dumped tables
    --

    --
    -- Indexes for table `Categories`
    --
    ALTER TABLE `Categories`
      ADD PRIMARY KEY (`id`),
      ADD KEY `id` (`id`);

    --
    -- AUTO_INCREMENT for dumped tables
    --

    --
    -- AUTO_INCREMENT for table `Categories`
    --
    ALTER TABLE `Categories`
      MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;

      --
      -- Database: `sustain`
      --

      -- --------------------------------------------------------

      --
      -- Table structure for table `items`
      --

      CREATE TABLE `items` (
        `id` int(11) NOT NULL,
        `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
      ) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;

      --
      -- Dumping data for table `items`
      --

      INSERT INTO `items` (`id`, `name`) VALUES
      (1, 'Arts and crafts'),
      (2, 'Barbeque grills'),
      (3, 'Books'),
      (4, 'Canning jars'),
      (5, 'Cleaning supplies'),
      (6, 'Clothes hangers'),
      (7, 'Cookware'),
      (9, 'Dishes'),
      (10, 'Fabric'),
      (11, 'Food storage containers'),
      (12, 'Furniture'),
      (13, 'Luggage'),
      (14, 'Mattresses'),
      (15, 'Ornaments'),
      (16, 'Toiletries'),
      (17, 'Utensils'),
      (18, 'Blankets'),
      (19, 'Comforters'),
      (20, 'Linens'),
      (21, 'Sheets'),
      (22, 'Small rugs'),
      (23, 'Towels '),
      (25, 'Baby carriers'),
      (26, 'Baby gates'),
      (27, 'Bike trailers'),
      (29, 'Child car seats'),
      (30, 'Clothes'),
      (31, 'Crayons'),
      (32, 'Cribs'),
      (33, 'Diapers '),
      (34, 'High chairs'),
      (35, 'Maternity'),
      (36, 'Musical instruments'),
      (37, 'Nursing items'),
      (38, 'Playpens'),
      (39, 'School supplies'),
      (40, 'Strollers'),
      (41, 'Toys'),
      (42, 'Blenders'),
      (43, 'Dehumidifiers'),
      (44, 'Fans'),
      (45, 'Microwaves'),
      (46, 'Space heaters'),
      (47, 'Toasters'),
      (48, 'Vacuum cleaners'),
      (49, 'Dishwashers'),
      (50, 'Freezers'),
      (51, 'Refrigerators'),
      (52, 'Stoves'),
      (53, 'Washers/ dryers'),
      (54, 'Bricks'),
      (55, 'Carpet padding'),
      (56, 'Carpets'),
      (57, 'Ceramic tiles'),
      (58, 'Doors'),
      (59, 'Drywall'),
      (60, 'Electrical supplies'),
      (61, 'Hand tools'),
      (62, 'Hardware'),
      (63, 'Insulation'),
      (64, 'Ladders'),
      (65, 'Light fixtures'),
      (66, 'Lighting ballasts'),
      (67, 'Lumber'),
      (68, 'Motors'),
      (69, 'Paint'),
      (70, 'Pipe'),
      (71, 'Plumbing'),
      (72, 'Power tools'),
      (73, 'Reusable metal items'),
      (74, 'Roofing '),
      (75, 'Vinyl'),
      (76, 'Windows'),
      (77, 'Belts'),
      (78, 'Boots'),
      (80, 'Coats'),
      (81, 'Hats'),
      (82, 'Rainwear'),
      (83, 'Sandals'),
      (84, 'Shoes'),
      (85, 'Calculators'),
      (86, 'Cameras'),
      (87, 'Cassette players'),
      (88, 'Cd players'),
      (89, 'Cds'),
      (90, 'Cell phones'),
      (91, 'Computers '),
      (92, 'Curling irons'),
      (93, 'DVD players'),
      (94, 'Game consoles'),
      (95, 'GPS systems'),
      (96, 'Hair dryers'),
      (97, 'Monitors'),
      (98, 'MP3 players'),
      (99, 'Printers'),
      (100, 'Projectors'),
      (101, 'Receivers'),
      (102, 'Scanners'),
      (103, 'Speakers'),
      (104, 'Tablets'),
      (105, 'Telephones'),
      (106, 'TVs'),
      (107, 'Backpacks'),
      (108, 'Balls'),
      (109, 'Barbells'),
      (110, 'Bicycles'),
      (111, 'Bike tires '),
      (112, 'Camping equipment'),
      (113, 'Day packs'),
      (114, 'Dumbbells'),
      (115, 'Exercise equipment'),
      (116, 'Golf clubs'),
      (117, 'Helmets'),
      (118, 'Hiking boots'),
      (119, 'Skateboards'),
      (120, 'Skis'),
      (121, 'Small boats'),
      (122, 'Snowshoes'),
      (123, 'Sporting goods'),
      (124, 'Tennis rackets'),
      (125, 'Tents'),
      (126, 'Chain saws'),
      (127, 'Fencing'),
      (128, 'Garden pots'),
      (129, 'Garden tools'),
      (130, 'Hand clippers'),
      (131, 'Hoses'),
      (132, 'Lawn furniture'),
      (133, 'Livestock supplies'),
      (134, 'Loppers'),
      (135, 'Mowers'),
      (136, 'Seeders'),
      (137, 'Soil amendment'),
      (138, 'Sprinklers'),
      (139, 'Wheel barrows'),
      (140, 'Beverages'),
      (141, 'Surplus garden produce'),
      (142, 'Unopened canned goods'),
      (143, 'Unopened packaged food'),
      (144, 'Adult diapers'),
      (145, 'Blood pressure monitors'),
      (146, 'Canes'),
      (147, 'Crutches'),
      (148, 'Eye glasses'),
      (149, 'Glucose meters'),
      (150, 'Hearing aids'),
      (151, 'Hospital beds'),
      (152, 'Reach extenders'),
      (153, 'Shower chairs'),
      (154, 'Walkers'),
      (155, 'Wheelchairs'),
      (158, 'Fax machines'),
      (159, 'Headsets'),
      (161, 'Office furniture'),
      (162, 'Paper shredders'),
      (163, 'Printer cartridge refilling'),
      (167, 'Bubble wrap'),
      (168, 'Clean foam peanuts'),
      (169, 'Foam sheets'),
      (170, 'Egg cartons'),
      (171, 'Firewood'),
      (173, 'Paper bags'),
      (174, 'Pet supplies'),
      (175, 'Shopping  bags'),
      (176, 'Vehicles/ parts'),
      (177, 'Computer paper'),
      (179, ' cell phones'),
      (180, ' small appliances'),
      (186, 'Lamps'),
      (187, 'Lawn power equipment'),
      (188, 'Outdoor Gear'),
      (190, 'Shoes & boots'),
      (191, 'Upholstery - car'),
      (192, 'Upholstery - Furniture'),
      (193, 'Bedding / Bath');

      --
      -- Indexes for dumped tables
      --

      --
      -- Indexes for table `items`
      --
      ALTER TABLE `items`
        ADD PRIMARY KEY (`id`),
        ADD KEY `id` (`id`),
        ADD KEY `id_2` (`id`);

      --
      -- AUTO_INCREMENT for dumped tables
      --

      --
      -- AUTO_INCREMENT for table `items`
      --
      ALTER TABLE `items`
        MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=194;





--
-- Table structure for table `busMap`
--

CREATE TABLE `busMap` (
  `id` int(11) NOT NULL,
  `bus_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1547 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `busMap`
--

INSERT INTO `busMap` (`id`, `bus_id`, `cat_id`) VALUES
(1216, 1, 9),
(1217, 1, 8),
(1218, 1, 4),
(1219, 1, 5),
(1220, 1, 17),
(1221, 1, 2),
(1222, 1, 19),
(1223, 1, 6),
(1224, 1, 20),
(1225, 1, 21),
(1226, 1, 23),
(1227, 1, 24),
(1228, 1, 25),
(1229, 1, 27),
(1230, 1, 28),
(1231, 1, 29),
(1232, 1, 31),
(1233, 2, 9),
(1234, 2, 8),
(1235, 2, 4),
(1236, 2, 17),
(1237, 2, 2),
(1238, 2, 19),
(1239, 2, 20),
(1240, 2, 21),
(1241, 2, 23),
(1242, 2, 25),
(1243, 2, 27),
(1244, 3, 9),
(1245, 3, 8),
(1246, 3, 4),
(1247, 3, 17),
(1248, 3, 2),
(1249, 3, 19),
(1250, 3, 20),
(1251, 3, 21),
(1252, 3, 23),
(1253, 3, 25),
(1254, 3, 27),
(1255, 4, 32),
(1256, 4, 1),
(1260, 6, 18),
(1261, 6, 33),
(1262, 6, 34),
(1263, 7, 18),
(1264, 7, 20),
(1265, 9, 17),
(1266, 9, 19),
(1267, 9, 20),
(1268, 9, 24),
(1269, 9, 27),
(1270, 10, 9),
(1271, 10, 17),
(1272, 10, 19),
(1273, 10, 20),
(1274, 10, 27),
(1275, 10, 32),
(1276, 12, 8),
(1277, 12, 4),
(1278, 12, 20),
(1279, 12, 21),
(1280, 12, 29),
(1281, 12, 1),
(1282, 13, 23),
(1283, 14, 9),
(1284, 14, 8),
(1285, 14, 17),
(1286, 14, 2),
(1287, 14, 19),
(1288, 14, 20),
(1289, 14, 21),
(1290, 14, 23),
(1291, 14, 43),
(1292, 14, 27),
(1293, 14, 32),
(1294, 14, 1),
(1295, 15, 9),
(1296, 15, 8),
(1297, 15, 4),
(1298, 15, 17),
(1299, 15, 6),
(1300, 15, 20),
(1301, 15, 23),
(1302, 15, 32),
(1308, 16, 2),
(1309, 16, 6),
(1310, 16, 30),
(1311, 17, 17),
(1312, 17, 2),
(1313, 17, 29),
(1314, 18, 13),
(1315, 18, 17),
(1316, 18, 24),
(1317, 18, 34),
(1318, 18, 40),
(1320, 19, 9),
(1321, 20, 9),
(1322, 20, 32),
(1323, 21, 12),
(1324, 22, 3),
(1325, 22, 19),
(1326, 22, 23),
(1327, 23, 9),
(1328, 23, 8),
(1329, 23, 4),
(1330, 23, 5),
(1331, 23, 17),
(1332, 23, 2),
(1333, 23, 19),
(1334, 23, 6),
(1335, 23, 20),
(1336, 23, 21),
(1337, 23, 23),
(1338, 23, 24),
(1339, 23, 25),
(1340, 23, 27),
(1341, 23, 28),
(1342, 23, 29),
(1343, 23, 31),
(1344, 23, 32),
(1345, 23, 1),
(1346, 25, 4),
(1347, 25, 5),
(1348, 25, 34),
(1349, 25, 36),
(1362, 26, 19),
(1363, 26, 26),
(1364, 26, 43),
(1365, 26, 29),
(1366, 26, 31),
(1367, 26, 38),
(1368, 27, 19),
(1369, 27, 26),
(1370, 27, 43),
(1371, 27, 29),
(1372, 27, 31),
(1373, 27, 38),
(1374, 28, 32),
(1375, 28, 1),
(1376, 29, 8),
(1377, 29, 4),
(1378, 29, 5),
(1379, 29, 2),
(1380, 29, 32),
(1381, 29, 1),
(1382, 31, 34),
(1383, 32, 9),
(1384, 32, 8),
(1385, 32, 4),
(1386, 32, 5),
(1387, 32, 17),
(1388, 32, 2),
(1389, 32, 6),
(1390, 32, 20),
(1391, 32, 23),
(1392, 32, 25),
(1393, 32, 27),
(1394, 32, 32),
(1395, 32, 1),
(1402, 33, 12),
(1403, 33, 9),
(1404, 33, 5),
(1405, 33, 17),
(1406, 33, 19),
(1407, 33, 20),
(1408, 33, 21),
(1409, 33, 32),
(1410, 33, 33),
(1411, 33, 34),
(1412, 34, 20),
(1413, 35, 2),
(1414, 35, 37),
(1415, 36, 8),
(1416, 36, 17),
(1417, 36, 2),
(1418, 36, 20),
(1419, 36, 23),
(1420, 36, 32),
(1421, 36, 1),
(1422, 37, 9),
(1423, 37, 17),
(1424, 37, 2),
(1425, 37, 6),
(1426, 37, 20),
(1427, 38, 29),
(1428, 39, 43),
(1429, 40, 9),
(1430, 40, 8),
(1431, 40, 4),
(1432, 40, 5),
(1433, 40, 17),
(1434, 40, 2),
(1435, 40, 21),
(1436, 40, 25),
(1437, 40, 43),
(1438, 40, 27),
(1439, 40, 28),
(1440, 40, 29),
(1441, 40, 32),
(1442, 40, 1),
(1443, 41, 18),
(1444, 41, 20),
(1445, 41, 29),
(1446, 42, 9),
(1447, 42, 8),
(1448, 42, 4),
(1449, 42, 5),
(1450, 42, 17),
(1451, 42, 2),
(1452, 42, 19),
(1453, 42, 20),
(1454, 42, 21),
(1455, 42, 23),
(1456, 42, 27),
(1457, 42, 28),
(1458, 42, 29),
(1459, 42, 32),
(1460, 42, 1),
(1461, 43, 19),
(1462, 43, 26),
(1463, 44, 8),
(1464, 44, 34),
(1465, 45, 5),
(1466, 46, 30),
(1467, 46, 29),
(1468, 47, 9),
(1469, 47, 8),
(1470, 47, 4),
(1471, 47, 5),
(1472, 47, 17),
(1473, 47, 2),
(1474, 47, 6),
(1475, 47, 21),
(1476, 47, 32),
(1477, 47, 1),
(1478, 48, 33),
(1479, 49, 14),
(1480, 50, 9),
(1481, 50, 4),
(1482, 50, 2),
(1483, 50, 21),
(1484, 50, 43),
(1485, 50, 28),
(1486, 51, 12),
(1487, 51, 9),
(1488, 51, 25),
(1489, 52, 33),
(1490, 53, 3),
(1491, 53, 18),
(1492, 53, 28),
(1493, 53, 30),
(1494, 53, 29),
(1495, 54, 9),
(1496, 55, 27),
(1497, 56, 18),
(1498, 56, 20),
(1499, 57, 27),
(1500, 58, 38),
(1501, 59, 3),
(1502, 60, 19),
(1503, 60, 23),
(1504, 61, 19),
(1505, 61, 23),
(1506, 64, 12),
(1507, 64, 20),
(1508, 64, 21),
(1509, 64, 43),
(1510, 64, 30),
(1511, 65, 30),
(1512, 65, 29),
(1513, 67, 3),
(1514, 67, 4),
(1515, 67, 17),
(1516, 67, 19),
(1517, 67, 20),
(1518, 67, 23),
(1519, 68, 14),
(1520, 69, 14),
(1521, 70, 3),
(1522, 70, 9),
(1523, 70, 8),
(1524, 70, 4),
(1525, 70, 17),
(1526, 70, 2),
(1527, 70, 18),
(1528, 70, 19),
(1529, 70, 20),
(1530, 70, 23),
(1531, 70, 43),
(1532, 70, 27),
(1533, 70, 30),
(1534, 70, 29),
(1535, 70, 33),
(1536, 70, 1),
(1537, 70, 35),
(1538, 70, 37),
(1539, 70, 39),
(1540, 70, 40),
(1542, 71, 6),
(1543, 71, 32),
(1544, 71, 33),
(1545, 71, 34),
(1546, 71, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `busMap`
--
ALTER TABLE `busMap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bus_id` (`bus_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `busMap`
--
ALTER TABLE `busMap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1547;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `busMap`
--
ALTER TABLE `busMap`
  ADD CONSTRAINT `busmap_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `businesses` (`id`),
  ADD CONSTRAINT `busmap_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`);



    -- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Feb 03, 2016 at 04:52 AM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `sustain`
--

-- --------------------------------------------------------

--
-- Table structure for table `itemMap`
--

CREATE TABLE `itemMap` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=739 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `itemMap`
--

INSERT INTO `itemMap` (`id`, `category_id`, `item_id`) VALUES
(127, 3, 1),
(129, 3, 25),
(130, 3, 26),
(131, 3, 27),
(132, 3, 3),
(135, 3, 29),
(136, 3, 30),
(139, 3, 6),
(140, 3, 31),
(141, 3, 32),
(142, 3, 33),
(143, 3, 34),
(144, 3, 35),
(145, 3, 36),
(146, 3, 37),
(147, 3, 38),
(148, 3, 39),
(149, 3, 40),
(150, 3, 41),
(164, 5, 49),
(165, 5, 50),
(166, 5, 51),
(167, 5, 52),
(168, 5, 53),
(193, 7, 77),
(194, 7, 78),
(195, 7, 30),
(198, 7, 6),
(199, 7, 80),
(200, 7, 81),
(201, 7, 82),
(202, 7, 83),
(204, 7, 84),
(205, 7, 190),
(206, 8, 179),
(207, 8, 85),
(209, 8, 86),
(210, 8, 87),
(211, 8, 88),
(212, 8, 89),
(213, 8, 90),
(215, 8, 91),
(218, 8, 92),
(219, 8, 93),
(220, 8, 94),
(221, 8, 95),
(222, 8, 96),
(223, 8, 97),
(225, 8, 98),
(226, 8, 99),
(228, 8, 100),
(229, 8, 101),
(230, 8, 102),
(232, 8, 103),
(233, 8, 104),
(253, 9, 107),
(254, 9, 108),
(255, 9, 109),
(256, 9, 110),
(257, 9, 111),
(258, 9, 112),
(259, 9, 113),
(260, 9, 114),
(261, 9, 115),
(262, 9, 116),
(263, 9, 117),
(264, 9, 118),
(265, 9, 119),
(266, 9, 120),
(267, 9, 121),
(268, 9, 122),
(269, 9, 123),
(270, 9, 124),
(271, 9, 125),
(286, 10, 126),
(287, 10, 127),
(288, 10, 128),
(289, 10, 129),
(290, 10, 130),
(291, 10, 131),
(292, 10, 132),
(293, 10, 133),
(294, 10, 134),
(295, 10, 135),
(296, 10, 136),
(297, 10, 137),
(298, 10, 138),
(299, 10, 139),
(300, 11, 140),
(301, 11, 141),
(302, 11, 142),
(303, 11, 143),
(316, 12, 144),
(317, 12, 145),
(318, 12, 146),
(319, 12, 147),
(320, 12, 148),
(321, 12, 149),
(322, 12, 150),
(323, 12, 151),
(324, 12, 152),
(325, 12, 153),
(326, 12, 154),
(327, 12, 155),
(331, 13, 85),
(333, 13, 91),
(336, 13, 158),
(337, 13, 159),
(338, 13, 97),
(340, 13, 161),
(341, 13, 162),
(342, 13, 163),
(343, 13, 99),
(345, 13, 102),
(347, 13, 105),
(349, 14, 167),
(350, 14, 168),
(351, 14, 169),
(352, 15, 177),
(353, 15, 170),
(354, 15, 10),
(356, 15, 171),
(357, 15, 173),
(358, 15, 174),
(359, 15, 73),
(361, 15, 175),
(362, 15, 176),
(363, 16, 179),
(364, 16, 180),
(365, 16, 25),
(366, 16, 3),
(369, 16, 90),
(371, 16, 29),
(372, 16, 30),
(375, 16, 6),
(376, 16, 91),
(379, 16, 170),
(380, 16, 12),
(382, 16, 118),
(383, 16, 186),
(384, 16, 188),
(385, 16, 163),
(386, 16, 83),
(388, 16, 84),
(389, 16, 190),
(390, 16, 191),
(391, 16, 192),
(596, 2, 18),
(597, 2, 19),
(598, 2, 20),
(599, 2, 21),
(600, 2, 22),
(601, 2, 23),
(684, 1, 1),
(685, 1, 25),
(686, 1, 2),
(687, 1, 193),
(688, 1, 3),
(689, 1, 4),
(690, 1, 29),
(691, 1, 5),
(692, 1, 6),
(693, 1, 7),
(695, 1, 9),
(696, 1, 170),
(697, 1, 10),
(699, 1, 11),
(700, 1, 12),
(701, 1, 13),
(702, 1, 14),
(703, 1, 15),
(704, 1, 163),
(706, 1, 191),
(707, 1, 192),
(708, 1, 17),
(709, 4, 42),
(710, 4, 43),
(711, 4, 44),
(712, 4, 45),
(713, 4, 46),
(714, 4, 47),
(715, 4, 48),
(716, 6, 54),
(717, 6, 55),
(718, 6, 56),
(719, 6, 57),
(720, 6, 58),
(721, 6, 59),
(722, 6, 60),
(723, 6, 61),
(724, 6, 62),
(725, 6, 63),
(726, 6, 64),
(727, 6, 65),
(728, 6, 66),
(729, 6, 67),
(730, 6, 68),
(731, 6, 69),
(732, 6, 70),
(733, 6, 71),
(734, 6, 72),
(735, 6, 73),
(736, 6, 74),
(737, 6, 75),
(738, 6, 76);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `itemMap`
--
ALTER TABLE `itemMap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `item_id` (`item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `itemMap`
--
ALTER TABLE `itemMap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=739;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `itemMap`
--
ALTER TABLE `itemMap`
  ADD CONSTRAINT `itemmap_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `itemmap_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);


  -- phpMyAdmin SQL Dump
  -- version 4.4.10
  -- http://www.phpmyadmin.net
  --
  -- Host: localhost:8889
  -- Generation Time: Feb 03, 2016 at 04:52 AM
  -- Server version: 5.5.42
  -- PHP Version: 5.6.10

  SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
  SET time_zone = "+00:00";




    -- phpMyAdmin SQL Dump
    -- version 4.4.10
    -- http://www.phpmyadmin.net
    --
    -- Host: localhost:8889
    -- Generation Time: Feb 03, 2016 at 04:53 AM
    -- Server version: 5.5.42
    -- PHP Version: 5.6.10

    SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
    SET time_zone = "+00:00";

    --
    -- Database: `sustain`
    --

    -- --------------------------------------------------------

    --
    -- Table structure for table `users`
    --

    CREATE TABLE `users` (
      `id` int(11) NOT NULL,
      `email` varchar(255) NOT NULL,
      `password` varchar(255) NOT NULL
    ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

    --
    -- Dumping data for table `users`
    --

    INSERT INTO `users` (`id`, `email`, `password`) VALUES
    (1, 'test@gmail.com', 'alAIbWFoq8G7M');

    --
    -- Indexes for dumped tables
    --

    --
    -- Indexes for table `users`
    --
    ALTER TABLE `users`
      ADD PRIMARY KEY (`id`);

    --
    -- AUTO_INCREMENT for dumped tables
    --

    --
    -- AUTO_INCREMENT for table `users`
    --
    ALTER TABLE `users`
      MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
