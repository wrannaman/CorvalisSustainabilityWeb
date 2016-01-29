-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Jan 27, 2016 at 04:46 PM
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
  `longitude` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `businesses`
--

INSERT INTO `businesses` (`id`, `name`, `address`, `city`, `state`, `phone`, `website`, `notes`, `latitude`, `longitude`) VALUES
(1, 'Albany-Corvallis ReUseIt (free items:  groups.yahoo.com)', NULL, NULL, NULL, NULL, 'Albany-Corvallis ReUseIt (free items:  groups.yahoo.com)', NULL, NULL, NULL),
(2, 'Arc Thrift Stores  (Corvallis)', '928 NW Beca Ave', 'Corvallis', 'OR', '541-929-3946', NULL, NULL, NULL, NULL),
(3, 'Arc Thrift Stores (Philomath)', '936 Main St', 'Philomath', 'OR', '541-753-8250', NULL, NULL, NULL, NULL),
(4, 'Beekman Place Antique Mall', '601 SW Western Blvd', 'Corvallis', 'OR', '541-754-9011', NULL, NULL, NULL, NULL),
(5, 'Benton County Extension / 4-H  Activities', '1849 NW 9th', 'Corvallis', 'OR', '541-766-6750', NULL, NULL, NULL, NULL),
(6, 'Benton County Master Gardeners', '1849 NW 9th St', 'Corvallis', 'OR', '541-766-6750', NULL, NULL, NULL, NULL),
(7, 'Book Bin', '215 SW 4th St	Corvallis', 'Corvallis', 'OR', '541-752-0040', NULL, NULL, NULL, NULL),
(8, 'Browser''s Bookstore', '121 NW 4th St', 'Corvallis', 'OR', '(888) 758-1121', NULL, NULL, NULL, NULL),
(9, 'Boys & Girls Club / STARS (after school programs)', '1112 NW Circle Blvd', 'Corvallis', 'OR', '541-757-1909', NULL, NULL, NULL, NULL),
(10, 'Buckingham Palace --Fri-Sun only', '600 SW 3rd St', 'Corvallis', 'OR', '541-752-7980', NULL, NULL, NULL, NULL),
(11, 'Calvary Community Outreach', '2125 NW Lester Ave', 'Corvallis', 'OR', '541-760-5941', NULL, NULL, NULL, NULL),
(12, 'CARDV (Center Against Rape/Domestic Violence)', '4786 SW Philomath Blvd', 'Corvallis', 'OR', '541-758-0219', NULL, NULL, NULL, NULL),
(13, 'Career Closet for Women (drop-off at)', '942 NW 9th, Ste.A', 'Corvallis', 'OR', '541-754-6979', NULL, NULL, NULL, NULL),
(14, 'Cat''s Meow Humane Society Thrift Shop', '411 SW 3rd St', 'Corvallis', 'OR', '541-757-0573', NULL, NULL, NULL, NULL),
(15, 'Children''s Farm Home', '4455 NE Hwy 20', 'Corvallis', 'OR', '541-757-1852', NULL, NULL, NULL, NULL),
(16, 'Chintimini Wildlife Rehabilitation Ctr', '311 Lewisburg Rd', 'Corvallis', 'OR', '541-745-5324', NULL, NULL, NULL, NULL),
(17, 'Community Outreach (homeless shelter', '865 NW Reiman', 'Corvallis', 'OR', '541-758-3000', NULL, NULL, NULL, NULL),
(18, 'Corvallis Environmental Center', '214 SW Monroe Ave', 'Corvallis', 'OR', '541-753-9211', NULL, NULL, NULL, NULL),
(19, 'Corvallis Bicycle Collective', '33900 SE Roche Ln/Hwy 34', 'Corvallis', 'OR', '541-224-6885', NULL, NULL, NULL, NULL),
(20, 'Corvallis Furniture', '720 NE Granger Ave, Bldg J', 'Corvallis', 'OR', '541-231-8103', NULL, NULL, NULL, NULL),
(21, 'Corvallis-Uzhhorod Sister Cities/The TOUCH Project', '', 'Corvallis', 'OR', '541-753-5170', 'http://www.sistercities.corvallis.or.us/uzhhorod', NULL, NULL, NULL),
(22, 'Cosmic Chameleon', '138 SW 2nd St', 'Corvallis', 'OR', '541-752-9001', NULL, NULL, NULL, NULL),
(23, 'Craigslist (corvallis.craigslist.org)', '', 'Corvallis', 'OR', '', 'corvallis.craigslist.org', NULL, NULL, NULL),
(24, 'Freecycle.org', '', 'Corvallis', 'OR', '', 'https://corvallis.craigslist.org', NULL, NULL, NULL),
(25, 'First Alternative Co-op Recycling Center', '1007 SE 3rd St', 'Corvallis', 'OR', '541-753-3115', NULL, NULL, NULL, NULL),
(26, 'First Alternative Co-op Store (South store)', '1007 SE 3rd St', 'Corvallis', 'OR', '541-753-3115', NULL, NULL, NULL, NULL),
(27, 'First Alternative Co-op Store (North store)', '2855 NW Grant Ave', 'Corvallis', 'OR', '541-452-3115', NULL, NULL, NULL, NULL),
(28, 'Furniture Exchange', '210 NW 2nd St', 'Corvallis', 'OR', '541-833-0183', NULL, NULL, NULL, NULL),
(29, 'Furniture Share (formerly Benton FS)', '155 SE Lilly Ave', 'Corvallis', 'OR', '541-754-9511', NULL, NULL, NULL, NULL),
(30, 'Home Grown Gardens', '4845 SE 3rd St', 'Corvallis', 'OR', '541-758-2137', NULL, NULL, NULL, NULL),
(31, 'Garland Nursery', '5470 NE Hwy 20', 'Corvallis', 'OR', '541-753-6601', NULL, NULL, NULL, NULL),
(32, 'Goodwill Industries', '1325 NW 9th St', 'Corvallis', 'OR', '541-752-8278', NULL, NULL, NULL, NULL),
(33, 'Habitat for Humanity ReStore', '4840 SW Philomath Blvd', 'Corvallis', 'OR', '541-752-6637', NULL, NULL, NULL, NULL),
(34, 'Happy Trails Records Tapes & CDs', '100 SW 3rd St', 'Corvallis', 'OR', '541-752-9032', NULL, NULL, NULL, NULL),
(35, 'Heartland Humane Society', '398 SW Twin Oaks Cir', 'Corvallis', 'OR', '541-757-9000', NULL, NULL, NULL, NULL),
(36, 'Home Life Inc. (for develop. Disabled)', '2068 NW Fillmore', 'Corvallis', 'OR', '541-753-9015', NULL, NULL, NULL, NULL),
(37, 'Jackson Street Youth Shelter', '555 NW Jackson St', 'Corvallis', 'OR', '541-754-2404', NULL, NULL, NULL, NULL),
(38, 'Linn Benton Food Share (lg. food donations)', '545 SW 2nd', 'Corvallis', 'OR', '541-752-1010', NULL, NULL, NULL, NULL),
(39, 'Lions Club (box inside Elks Lodge)', '1400 NW 9th St', 'Corvallis', 'OR', '541-758-0222', NULL, NULL, NULL, NULL),
(40, 'Love INC (for low income citizens)', '2330 NW Professional Dr #102', 'Corvallis', 'OR', '541-757-8111', NULL, NULL, NULL, NULL),
(41, 'Mario Pastega House (Good Sam patient family housing)', '3505 NW Samaritan Dr', 'Corvallis', 'OR', '541-768-4650', NULL, NULL, NULL, NULL),
(42, 'Mary''s River Gleaners (for low income citizens)', 'Po Box 2309', 'Corvallis', 'OR', '541-752-1010', NULL, NULL, NULL, NULL),
(43, 'Midway Farms (Hway 20 btw Corvallis & Albany)', '6980 US-20', 'Albany', 'OR', '541-740-6141', NULL, NULL, NULL, NULL),
(44, 'Neighbor to Neighbor (food pantry', '1123 Main', 'Philomath', 'OR', '541-929-6614', NULL, NULL, NULL, NULL),
(45, 'Osborn Aquatic Center', '1940 NW Highland Dr', 'Corvallis', 'OR', '541-766-7946', NULL, NULL, NULL, NULL),
(46, 'OSU Emergency Food Pantry ', '2150 SW Jefferson Way', 'Corvallis', 'OR', '541-737-3473', NULL, NULL, NULL, NULL),
(47, 'OSU Folk Club Thrift Shop', '144 NW 2nd St', 'Corvallis', 'OR', '541-752-4733', NULL, NULL, NULL, NULL),
(48, 'OSU Organic Growers Club (Crop & Soil Science Dep''t)', '', 'Corvallis', 'OR', '541-737-6810', 'http://cropandsoil.oregonstate.edu/organic_grower', NULL, NULL, NULL),
(49, 'Pak Mail (Timberhill Shopping Ctr)', '2397 NW Kings Blvd', 'Corvallis', 'OR', '541-754-8411', NULL, NULL, NULL, NULL),
(50, 'Parent Enhancement Program', '421 NW 4th St', 'Corvallis', 'OR', '541-758-8292', NULL, NULL, NULL, NULL),
(51, 'Pastors for Peace-Caravan to Cuba (Mike Beilstein)', '', 'Corvallis', 'OR', '541-754-1858', 'www.ifconews.org', NULL, NULL, NULL),
(52, 'Philomath Community Garden (Chris Shonnard)', '', 'Corvallis', 'OR', '541-929-3524', 'http://philomathcommunityservices.org', NULL, NULL, NULL),
(53, 'Philomath Community Services (food & kids stuff)', '360 S 9th', 'Philomath', 'OR', '541-929-2499', NULL, NULL, NULL, NULL),
(54, 'Play It Again Sports', '1422 NW 9th St', 'Corvallis', 'OR', '541-754-7529', NULL, NULL, NULL, NULL),
(55, 'Presbyterian Piecemakers (cotton quilts)', '114 SW 8th St', 'Corvallis', 'OR', '541-753-7516', NULL, NULL, NULL, NULL),
(56, 'Public Library Corvallis, Friends of', '645 NW Monroe Ave', 'Corvallis', 'OR', '541-766-6928', NULL, NULL, NULL, NULL),
(57, 'Quilts From Caring Hands (cotton quilts)', '1495 NW 20th St', 'Corvallis', 'OR', '541-758-8161', NULL, NULL, NULL, NULL),
(58, 'Rapid Refill Ink', '254 SW Madison Ave', 'Corvallis', 'OR', '541-758-8444', NULL, NULL, NULL, NULL),
(59, 'Replay Children''s Wear', '250 NW 1st St', 'Corvallis', 'OR', '541-753-6903', NULL, NULL, NULL, NULL),
(60, 're·volve (women''s resale boutique,)', '103 SW 2nd St', 'Corvallis', 'OR', '541-754-1154', NULL, NULL, NULL, NULL),
(61, 'Second Glance', '312 SW 3rd Street', 'Corvallis', 'OR', '541-758-9099', NULL, NULL, NULL, NULL),
(62, 'The Annex', '214 SW Jefferson', 'Corvallis', 'OR', '541-758-9099', NULL, NULL, NULL, NULL),
(63, 'The Alley', '312 SW Jefferson', 'Corvallis', 'OR', '541-753-4069', NULL, NULL, NULL, NULL),
(64, 'Senior Center of Corvallis', '2601 NW Tyler Ave', 'Corvallis', 'OR', '541-766-6959', NULL, NULL, NULL, NULL),
(65, 'South Corvallis Food Bank', '1798 SW 3rd St', 'Corvallis', 'OR', '541-753-4263', NULL, NULL, NULL, NULL),
(66, 'St. Vincent de Paul Food Bank', '501 NW 25 th Street', 'Corvallis', 'OR', '541-757-1988', NULL, NULL, NULL, NULL),
(67, 'Stone Soup  (St Mary''s Church', '501 NW 25th Street', 'Corvallis', 'OR', '541-757-1988', NULL, NULL, NULL, NULL),
(68, 'UPS Store ( Philomath)', '5060 SW Philomath Blvd', 'Corvallis', 'OR', '541-752-1830', NULL, NULL, NULL, NULL),
(69, 'UPS Stores (Corvallis)', '922 NW Circle Blvd #160', 'Corvallis', 'OR', '541-752-0056', NULL, NULL, NULL, NULL),
(70, 'Vina Moses (for low income citizens)', '968 NW Garfield Ave', 'Corvallis', 'OR', '541-753-1420', NULL, NULL, NULL, NULL),
(71, 'Spaeth Heritage House', '135 N 13th St', 'Philomath', 'OR', '541-307-0349', NULL, NULL, NULL, NULL),
(72, 'Book binding', '108 SW 3rd St', 'Corvallis', 'OR', '(541) 757-9861', 'http://www.cornerstoneassociates.com/bj-bookbinding-about-us.html', 'Rebind and restore books', NULL, NULL),
(73, 'Cell Phone Sick Bay', '252 Sw Madison Ave, Suite 110', 'Philomath', 'OR', '(541) 230-1785', 'http://www.cellsickbay.com/index.html', 'Cell phones and tablets', NULL, NULL),
(74, 'Geeks ''N'' Nerds', '950 Southeast Geary St Unit D Albany', 'Corvallis', 'OR', '97321', 'http://www.computergeeksnnerds.com/', 'repair Computers of all kinds and cell phone repair; in home repair available', NULL, NULL),
(75, 'Specialty Sewing By Leslie', '225 SW Madison Ave', 'Corvallis', 'OR', '(541) 758-4556', 'http://www.specialtysewing.com/Leslie_Seamstress/Welcome.html', 'Alterations and custom work', NULL, NULL),
(76, 'Covallis Technical', '966 NW Circle Blvd', 'Corvallis', 'OR', '(541) 704-7009', 'http://www.corvallistechnical.com', 'repair Computers and laptops', NULL, NULL),
(77, 'OSU Repair Fair', 'Oregon State University Property Services Building\r\n644 S.W. 13th St', 'Corvallis', 'OR', '541-737-5398', 'http://fa.oregonstate.edu/surplus', 'Occurs twice per quarter in the evenings Small appliances, Bicycles, Clothing, Computers (hardware and software) Electronics (small items only) Housewares (furniture, ceramics, lamps, etc.)', NULL, NULL),
(78, 'Bellevue Computers', '1865 NW 9th St', 'Corvallis', 'OR', '541-757-3487', 'http://www.bellevuepc.com/', 'repair computers and laptops', NULL, NULL),
(79, 'P.K Furniture Repair & Refinishing', '5270 Corvallis-Newport Hwy', 'Corvallis', 'OR', '541-230-1727', 'http://www.pkfurniturerefinishing.net/', 'Complete Restoration, Complete Refinishing, Modifications, Custom Color Matching, Furniture Stripping,Chair Press Caning, Repairs', NULL, NULL),
(80, 'Furniture Restoration Center', '1321 Main St', 'Philomath', 'OR', '(541) 929-6681', 'http://restorationsupplies.com', 'Restores all typers of furniture and has hardware for doing it yourself', NULL, NULL),
(81, 'Power equipment', '713 NE Circle Blvd', 'Corvallis', 'OR', '(541) 757-8075', 'https://corvallispowerequipment.stihldealer.net', 'lawn and garden equipment, chain saws  (Stihl, honda, shindiawh), hand held equipment.', NULL, NULL),
(82, 'Robnett''s', '400 SW 2nd St', 'Corvallis', 'OR', '(541) 753-5531', 'http://ww3.truevalue.com/robnetts/Home.aspx', 'Adjustment and sharpening', NULL, NULL),
(83, 'Footwise', '301 SW Madison Ave #100', 'Corvallis', 'OR', '(541) 757-0875', 'http://footwise.com/', 'resoles berkenstock', NULL, NULL),
(84, 'Robnett''s', '400 SW 2nd St', 'Corvallis', 'OR', '(541) 753-5531', 'http://ww3.truevalue.com/robnetts/Home.aspx', 'Screen repair for windows and doors', NULL, NULL),
(85, 'Sedlack', '225 SW 2nd St', 'Corvallis', 'OR', '(541) 752-1498', 'http://www.sedlaksshoes.net/', 'full resoles, elastic and velcros, sewing and patching, leather patches, zippers, half soles and heels.', NULL, NULL),
(86, 'Foam Man', '2511 NW 9th St', 'Corvallis', 'OR', '(541) 754-9378', 'http://www.thefoammancorvallis.com', 'Replacement foam cusions for chairs and couches;  upholstery', NULL, NULL);

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


  -- --------------------------------------------------------
  -- phpMyAdmin SQL Dump
  -- version 4.4.10
  -- http://www.phpmyadmin.net
  --
  -- Host: localhost:8889
  -- Generation Time: Jan 28, 2016 at 06:38 AM
  -- Server version: 5.5.42
  -- PHP Version: 5.6.10

  SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
  SET time_zone = "+00:00";

  --
  -- Database: `sustain`
  --

  -- --------------------------------------------------------

  --
  -- Table structure for table `Categories`
  --

  CREATE TABLE `Categories` (
    `id` int(11) NOT NULL,
    `name` varchar(255) CHARACTER SET utf8 NOT NULL
  ) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

  --
  -- Dumping data for table `Categories`
  --

  INSERT INTO `Categories` (`id`, `name`) VALUES
  (1, 'Household'),
  (2, 'Bedding / bath'),
  (3, 'Children’s goods'),
  (4, 'Appliances - small'),
  (5, 'Appliances - large'),
  (6, 'Building/ home improvement'),
  (7, 'Wearable items'),
  (8, 'Useable Electronics'),
  (9, 'Sporting equipment/ camping'),
  (10, 'Garden'),
  (11, 'Food'),
  (12, 'Medical supplies'),
  (13, 'Office equipment'),
  (14, 'Packing materials'),
  (15, 'Miscellaneous'),
  (16, 'Repair items');

  --
  -- Indexes for dumped tables
  --

  --
  -- Indexes for table `Categories`
  --
  ALTER TABLE `Categories`
    ADD PRIMARY KEY (`id`);

  --
  -- AUTO_INCREMENT for dumped tables
  --

  --
  -- AUTO_INCREMENT for table `Categories`
  --
  ALTER TABLE `Categories`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;













  INSERT INTO
    `sustain`.`items` (`id`, `name`)
  VALUES
  (NULL, 'Arts and crafts'),
(NULL,'Barbeque grills'),
(NULL,'Books'),
(NULL,'Canning jars'),
(NULL,'Cleaning supplies'),
(NULL,'Clothes hangers'),
(NULL,'Cookware'),
(NULL,'Cookware'),
(NULL,'Dishes'),
(NULL,'Fabric'),
(NULL,'Food storage containers'),
(NULL,'Furniture'),
(NULL,'Luggage'),
(NULL,'Mattresses'),
(NULL,'Ornaments'),
(NULL,'Toiletries'),
(NULL,'Utensils'),

(NULL,'Blankets'),
(NULL,'Comforters'),
(NULL,'Linens'),
(NULL,'Sheets'),
(NULL,'Small rugs'),
(NULL,'Towels '),

(NULL,'Arts and crafts '),
(NULL,'Baby carriers'),
(NULL,'Baby gates'),
(NULL,'Bike trailers'),
(NULL,'Books'),
(NULL,'Child car seats'),
(NULL,'Clothes'),
(NULL,'Crayons'),
(NULL,'Cribs'),
(NULL,'Diapers '),
(NULL,'High chairs'),
(NULL,'Maternity'),
(NULL,'Musical instruments'),
(NULL,'Nursing items'),
(NULL,'Playpens'),
(NULL,'School supplies'),
(NULL,'Strollers'),
(NULL,'Toys'),

(NULL,'Blenders'),
(NULL,'Dehumidifiers'),
(NULL,'Fans'),
(NULL,'Microwaves'),
(NULL,'Space heaters'),
(NULL,'Toasters'),
(NULL,'Vacuum cleaners'),

(NULL,'Dishwashers'),
(NULL,'Freezers'),
(NULL,'Refrigerators'),
(NULL,'Stoves'),
(NULL,'Washers/ dryers'),

(NULL,'Bricks'),
(NULL,'Carpet padding'),
(NULL,'Carpets'),
(NULL,'Ceramic tiles'),
(NULL,'Doors'),
(NULL,'Drywall'),
(NULL,'Electrical supplies'),
(NULL,'Hand tools'),
(NULL,'Hardware'),
(NULL,'Insulation'),
(NULL,'Ladders'),
(NULL,'Light fixtures'),
(NULL,'Lighting ballasts'),
(NULL,'Lumber'),
(NULL,'Motors'),
(NULL,'Paint'),
(NULL,'Pipe'),
(NULL,'Plumbing'),
(NULL,'Power tools'),
(NULL,'Reusable metal items'),
(NULL,'Roofing '),
(NULL,'Vinyl'),
(NULL,'Windows'),

(NULL,'Belts'),
(NULL,'Boots'),
(NULL,'Clothes'),
(NULL,'Coats'),
(NULL,'Hats'),
(NULL,'Rainwear'),
(NULL,'Sandals'),
(NULL,'Shoes'),


(NULL,'Calculators'),
(NULL,'Cameras'),
(NULL,'Cassette players'),
(NULL,'Cd players'),
(NULL,'Cds'),
(NULL,'Cell phones'),
(NULL,'Computers '),
(NULL,'Curling irons'),
(NULL,'DVD players'),
(NULL,'Game consoles'),
(NULL,'GPS systems'),
(NULL,'Hair dryers'),
(NULL,'Monitors'),
(NULL,'MP3 players'),
(NULL,'Printers'),
(NULL,'Projectors'),
(NULL,'Receivers'),
(NULL,'Scanners'),
(NULL,'Speakers'),
(NULL,'Tablets'),
(NULL,'Telephones'),
(NULL,'TVs'),

(NULL,'Backpacks'),
(NULL,'Balls'),
(NULL,'Barbells'),
(NULL,'Bicycles'),
(NULL,'Bike tires '),
(NULL,'Camping equipment'),
(NULL,'Day packs'),
(NULL,'Dumbbells'),
(NULL,'Exercise equipment'),
(NULL,'Golf clubs'),
(NULL,'Helmets'),
(NULL,'Hiking boots'),
(NULL,'Skateboards'),
(NULL,'Skis'),
(NULL,'Small boats'),
(NULL,'Snowshoes'),
(NULL,'Sporting goods'),
(NULL,'Tennis rackets'),
(NULL,'Tents'),
(NULL,'Chain saws'),
(NULL,'Fencing'),
(NULL,'Garden pots'),
(NULL,'Garden tools'),
(NULL,'Hand clippers'),
(NULL,'Hoses'),
(NULL,'Lawn furniture'),
(NULL,'Livestock supplies'),
(NULL,'Loppers'),
(NULL,'Mowers'),
(NULL,'Seeders'),
(NULL,'Soil amendment'),
(NULL,'Sprinklers'),
(NULL,'Wheel barrows'),
(NULL,'Beverages'),
(NULL,'Surplus garden produce'),
(NULL,'Unopened canned goods'),
(NULL,'Unopened packaged food'),
(NULL,'Adult diapers'),
(NULL,'Blood pressure monitors'),
(NULL,'Canes'),
(NULL,'Crutches'),
(NULL,'Eye glasses'),
(NULL,'Glucose meters'),
(NULL,'Hearing aids'),
(NULL,'Hospital beds'),
(NULL,'Reach extenders'),
(NULL,'Shower chairs'),
(NULL,'Walkers'),
(NULL,'Wheelchairs'),
(NULL,'Calculators'),
(NULL,'Computers '),
(NULL,'Fax machines'),
(NULL,'Headsets'),
(NULL,'Monitors'),
(NULL,'Office furniture'),
(NULL,'Paper shredders'),
(NULL,'Printer cartridge refilling'),
(NULL,'Printers'),
(NULL,'Scanners'),
(NULL,'Telephones'),
(NULL,'Bubble wrap'),
(NULL,'Clean foam peanuts'),
(NULL,'Foam sheets'),
(NULL,'Egg cartons'),
(NULL,'Firewood'),
(NULL,'Fabric'),
(NULL,'Paper bags'),
(NULL,'Pet supplies'),
(NULL,'Shopping  bags'),
(NULL,'Vehicles/ parts'),
(NULL,'Computer paper'),
(NULL,'Reusable metal items'),
(NULL,' Cell phones'),
(NULL,' small appliances'),
(NULL,'Books'),
(NULL,'Cell phones'),
(NULL,'Clothes'),
(NULL,'Computers'),
(NULL,'Furniture'),
(NULL,'Lamps'),
(NULL,'Lawn power equipment'),
(NULL,'Outdoor Gear'),
(NULL,'Sandals'),
(NULL,'Shoes, boots'),
(NULL,'Upholstery, car'),
(NULL,'Upholstery, Furniture');


-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Jan 29, 2016 at 06:38 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `itemMap`
--

INSERT INTO `itemMap` (`id`, `category_id`, `item_id`) VALUES
(98, 1, 1),
(99, 1, 24),
(100, 1, 2),
(101, 1, 3),
(102, 1, 28),
(103, 1, 181),
(104, 1, 4),
(105, 1, 5),
(106, 1, 6),
(107, 1, 7),
(108, 1, 8),
(109, 1, 9),
(110, 1, 10),
(111, 1, 172),
(112, 1, 11),
(113, 1, 12),
(114, 1, 185),
(115, 1, 13),
(116, 1, 14),
(117, 1, 15),
(118, 1, 16),
(119, 1, 192),
(120, 1, 17),
(121, 2, 18),
(122, 2, 19),
(123, 2, 20),
(124, 2, 21),
(125, 2, 22),
(126, 2, 23),
(127, 3, 1),
(128, 3, 24),
(129, 3, 25),
(130, 3, 26),
(131, 3, 27),
(132, 3, 3),
(133, 3, 28),
(134, 3, 181),
(135, 3, 29),
(136, 3, 30),
(137, 3, 79),
(138, 3, 183),
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
(151, 4, 42),
(152, 4, 43),
(153, 4, 44),
(154, 4, 45),
(155, 4, 46),
(156, 4, 47),
(157, 4, 48),
(164, 5, 49),
(165, 5, 50),
(166, 5, 51),
(167, 5, 52),
(168, 5, 53),
(169, 6, 54),
(170, 6, 55),
(171, 6, 56),
(172, 6, 57),
(173, 6, 58),
(174, 6, 59),
(175, 6, 60),
(176, 6, 61),
(177, 6, 62),
(178, 6, 63),
(179, 6, 64),
(180, 6, 65),
(181, 6, 66),
(182, 6, 67),
(183, 6, 68),
(184, 6, 69),
(185, 6, 70),
(186, 6, 71),
(187, 6, 72),
(188, 6, 73),
(189, 6, 178),
(190, 6, 74),
(191, 6, 75),
(192, 6, 76),
(193, 7, 77),
(194, 7, 78),
(195, 7, 30),
(196, 7, 79),
(197, 7, 183),
(198, 7, 6),
(199, 7, 80),
(200, 7, 81),
(201, 7, 82),
(202, 7, 83),
(203, 7, 189),
(204, 7, 84),
(205, 7, 190),
(206, 8, 179),
(207, 8, 85),
(208, 8, 156),
(209, 8, 86),
(210, 8, 87),
(211, 8, 88),
(212, 8, 89),
(213, 8, 90),
(214, 8, 182),
(215, 8, 91),
(216, 8, 157),
(217, 8, 184),
(218, 8, 92),
(219, 8, 93),
(220, 8, 94),
(221, 8, 95),
(222, 8, 96),
(223, 8, 97),
(224, 8, 160),
(225, 8, 98),
(226, 8, 99),
(227, 8, 164),
(228, 8, 100),
(229, 8, 101),
(230, 8, 102),
(231, 8, 165),
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
(332, 13, 156),
(333, 13, 91),
(334, 13, 157),
(335, 13, 184),
(336, 13, 158),
(337, 13, 159),
(338, 13, 97),
(339, 13, 160),
(340, 13, 161),
(341, 13, 162),
(342, 13, 163),
(343, 13, 99),
(344, 13, 164),
(345, 13, 102),
(346, 13, 165),
(347, 13, 105),
(348, 13, 166),
(349, 14, 167),
(350, 14, 168),
(351, 14, 169),
(352, 15, 177),
(353, 15, 170),
(354, 15, 10),
(355, 15, 172),
(356, 15, 171),
(357, 15, 173),
(358, 15, 174),
(359, 15, 73),
(360, 15, 178),
(361, 15, 175),
(362, 15, 176),
(363, 16, 179),
(364, 16, 180),
(365, 16, 25),
(366, 16, 3),
(367, 16, 28),
(368, 16, 181),
(369, 16, 90),
(370, 16, 182),
(371, 16, 29),
(372, 16, 30),
(373, 16, 79),
(374, 16, 183),
(375, 16, 6),
(376, 16, 91),
(377, 16, 157),
(378, 16, 184),
(379, 16, 170),
(380, 16, 12),
(381, 16, 185),
(382, 16, 118),
(383, 16, 186),
(384, 16, 188),
(385, 16, 163),
(386, 16, 83),
(387, 16, 189),
(388, 16, 84),
(389, 16, 190),
(390, 16, 191),
(391, 16, 192);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=392;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `itemMap`
--
ALTER TABLE `itemMap`
  ADD CONSTRAINT `itemmap_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `itemmap_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);
