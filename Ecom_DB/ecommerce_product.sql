-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2021 at 05:03 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_product`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcedureCategory` ()  BEGIN
SELECT c_name FROM category;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcedureGetProduct` ()  BEGIN 
SELECT item_name FROM iteminfo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `prodSearch` (IN `name` VARCHAR(10))  BEGIN
 SELECT iteminfo.item_name,
 testdb.price,testdb.rating,testdb.Product_url,websites.site FROM iteminfo 
 JOIN testdb ON testdb.item_id = iteminfo.item_id
 JOIN websites ON websites.websiteID = testdb.websiteID
 WHERE iteminfo.item_name LIKE name
ORDER BY rating DESC,price;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SubNameSearch` (`subName` VARCHAR(10))  BEGIN
SELECT iteminfo.item_name,
        testdb.price,testdb.rating,testdb.Product_url,websites.site FROM iteminfo 
        JOIN testdb ON testdb.item_id = iteminfo.item_id
        JOIN websites ON websites.websiteID = testdb.websiteID
        WHERE iteminfo.item_name LIKE "%SubName%"
       ORDER BY price, rating DESC LIMIT 0,3;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(255) NOT NULL,
  `email` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `email`, `message`) VALUES
(15, 'ghgh', 'hghghhg'),
(16, 'gggg', 'ggg'),
(17, 'vbgf', 'fgfgfgf'),
(18, 'fgfgfgg', 'grt'),
(19, 'fgfgfg', 'kl;k'),
(20, 'kik', 'juku'),
(21, '', ''),
(22, 'dssds', 'sddsds');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`) VALUES
(1, 'Xiaomi Cc9'),
(2, 'Hitachi AC'),
(3, 'Sony Smart Tv'),
(4, 'Redmi Note10'),
(5, 'Samsung A50'),
(6, 'Konka AC'),
(7, 'Walton 4k Smart Tv'),
(8, 'Vision Room Heater'),
(9, 'Walton Washing Machine'),
(10, 'Realme X2');

-- --------------------------------------------------------

--
-- Table structure for table `product_info`
--

CREATE TABLE `product_info` (
  `id` int(11) NOT NULL,
  `website_name` varchar(50) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `review` int(10) NOT NULL,
  `rating` int(11) NOT NULL,
  `Product_url` varchar(150) NOT NULL,
  `product_image_url` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_info`
--

INSERT INTO `product_info` (`id`, `website_name`, `product_id`, `price`, `review`, `rating`, `Product_url`, `product_image_url`) VALUES
(1, 'gsmarena.com', 1, 32500, 5, 5, 'https://www.gsmarena.com/xiaomi_mi_cc9-9749.php', 'https://fdn2.gsmarena.com/vv/bigpic/xiaomi-mi-cc9-.jpg'),
(2, 'mobiledokan.com', 1, 32000, 7, 4, 'https://www.mobiledokan.com/xiaomi/xiaomi-mi-cc9/', 'https://www.mobiledokan.com/wp-content/uploads/2019/09/Xiaomi-Mi-CC9.jpg'),
(3, 'gizmochina.com', 1, 32399, 6, 5, 'https://www.gizmochina.com/product/xiaomi-mi-cc9/', 'https://www.gizmochina.com/wp-content/uploads/2019/06/xiaomi-mi-cc9-1-500x500.jpg'),
(4, '91mobiles.com', 1, 32500, 9, 5, 'https://www.91mobiles.com/xiaomi-mi-cc9-price-in-india', 'https://www.91-img.com/pictures/134822-v2-xiaomi-mi-cc9-mobile-phone-thumb-1.jpg?tr=q-60'),
(5, 'gizmochina.com', 1, 32500, 7, 5, 'https://www.gsmarena.com/xiaomi_mi_cc9-9749.php', 'https://www.gizmochina.com/wp-content/uploads/2019/06/xiaomi-mi-cc9-1-500x500.jpg'),
(6, 'gizmochina.com', 1, 31500, 4, 4, 'https://www.gizmochina.com/product/xiaomi-mi-cc9/', 'https://www.gizmochina.com/wp-content/uploads/2019/06/xiaomi-mi-cc9-1-500x500.jpg'),
(7, 'gizmochina.com', 1, 32500, 8, 4, 'https://www.gizmochina.com/product/xiaomi-mi-cc9/', 'https://www.gizmochina.com/wp-content/uploads/2019/06/xiaomi-mi-cc9-1-500x500.jpg'),
(8, 'gadgets.ndtv.com', 1, 31999, 3, 5, 'https://gadgets.ndtv.com/xiaomi-mi-cc9-price-in-india-13158', 'https://i.gadgets360cdn.com/products/large/micc9-db1-444x800-1562127793.jpg?downsize=*:180&output-quality=80&output-format=webp'),
(9, 'gizmochina.com', 1, 31750, 7, 4, 'https://www.gizmochina.com/product/xiaomi-mi-cc9/', 'https://www.gizmochina.com/wp-content/uploads/2019/06/xiaomi-mi-cc9-1-500x500.jpg'),
(10, 'gizmochina.com', 1, 31000, 4, 5, 'https://www.gizmochina.com/product/xiaomi-mi-cc9/', 'https://www.gizmochina.com/wp-content/uploads/2019/06/xiaomi-mi-cc9-1-500x500.jpg'),
(11, 'bestelectronicsltd.com', 2, 31500, 8, 4, 'https://www.bestelectronicsltd.com/home-appliances/air-conditioner/hitachi-split-air-conditioner-ras-f13cf', 'https://www.bestelectronicsltd.com/wp-content/uploads/2016/04/RAS-F13CF-1.jpg'),
(12, 'gizmochina.com', 1, 32000, 4, 4, 'https://www.gizmochina.com/product/xiaomi-mi-cc9/', 'https://www.gizmochina.com/wp-content/uploads/2019/06/xiaomi-mi-cc9-1-500x500.jpg'),
(13, 'gizmochina.com', 1, 32541, 7, 4, 'https://www.gizmochina.com/product/xiaomi-mi-cc9/', 'https://www.gizmochina.com/wp-content/uploads/2019/06/xiaomi-mi-cc9-1-500x500.jpg'),
(14, 'gizmochina.com', 1, 36215, 6, 5, 'https://www.gizmochina.com/product/xiaomi-mi-cc9/', 'https://www.gizmochina.com/wp-content/uploads/2019/06/xiaomi-mi-cc9-1-500x500.jpg'),
(15, 'gizmochina.com', 1, 32156, 8, 4, 'https://www.gizmochina.com/product/xiaomi-mi-cc9/', 'https://www.gizmochina.com/wp-content/uploads/2019/06/xiaomi-mi-cc9-1-500x500.jpg'),
(16, 'gizmochina.com', 1, 32548, 4, 5, 'https://www.gizmochina.com/product/xiaomi-mi-cc9/', 'https://www.gizmochina.com/wp-content/uploads/2019/06/xiaomi-mi-cc9-1-500x500.jpg'),
(17, 'gizmochina.com', 1, 35255, 3, 4, 'https://www.gizmochina.com/product/xiaomi-mi-cc9/', 'https://www.gizmochina.com/wp-content/uploads/2019/06/xiaomi-mi-cc9-1-500x500.jpg'),
(18, 'gizmochina.com', 1, 32100, 14, 4, 'https://www.gizmochina.com/product/xiaomi-mi-cc9/', 'https://www.gizmochina.com/wp-content/uploads/2019/06/xiaomi-mi-cc9-1-500x500.jpg'),
(19, 'bestelectronicsltd.com', 3, 56500, 14, 4, 'https://www.kablewala.com.bd/electronics/home-appliances/tv-led-online-bangladesh/sony-bravia-43-inch-43x7500f-4k-smart-android-led-tv/', 'https://www.kablewala.com.bd/images/thumbnails/500/350/detailed/104/047.jpg'),
(20, 'daraz.com.bd', 3, 58745, 17, 4, 'https://www.daraz.com.bd/products/sony-4k-smart-led-tv-43x7000g-i131972507-s1052604041.html?spm=a2a0', 'https://static-01.daraz.com.bd/p/d3ed6c33cce4f958d92bab4f568ca819.png_200x200q80.jpg_.webp'),
(21, 'sony-asia.com', 3, 56894, 24, 4, 'https://www.sony-asia.com/electronics/televisions/a9g-series', 'https://www.sony-asia.com/image/7bedba2f19ee9130c0997a90cc2b976c?fmt=pjpeg&wid=165&bgcolor=FFFFFF&bgc=FFFFFF'),
(22, 'startech.com.bd', 3, 57412, 26, 5, 'https://www.startech.com.bd/sony-kd-x8000g-55-android-tv', 'https://www.startech.com.bd/image/cache/catalog/television/sony/55-kd-x8000g/kd-800g-55-500x500.jpg'),
(23, 'clickbd.com', 3, 59874, 14, 5, 'https://www.clickbd.com/bangladesh/2479543-48-w652d-sony-smart-tv-full-hd-led-tv.html', 'https://static.clickbd.com/global/classified/item_img/2479543_0_original.jpg'),
(24, 'ajkerdeal.com', 3, 51423, 36, 4, 'https://ajkerdeal.com/product/1098339/sony-bravia-40w652d-full-hd-smart-tv', 'https://static.ajkerdeal.com/images/deals/551151102151015/1.jpg'),
(25, 'othoba.com', 3, 51236, 26, 5, 'https://www.othoba.com/sony-bravia-w800f-43-full-hd-smart-led-tv', 'https://www.othoba.com/Themes/Othoba/Content/images/othoba-loader-432.png'),
(26, 'sony-asia.com', 3, 57894, 12, 4, 'https://www.sony-asia.com/electronics/televisions/x90j-series', 'https://www.sony-asia.com/image/79f8e14a8cbf19eb2eae7065820c8855?fmt=pjpeg&wid=165&bgcolor=FFFFFF&bgc=FFFFFF'),
(27, 'gizmochina.com', 4, 26700, 16, 4, 'https://www.gizmochina.com/product/xiaomi-mi-note-10/', 'https://www.gizmochina.com/wp-content/uploads/2019/10/Xiaomi-Mi-Note-10-500x500.jpg'),
(28, 'gsmarena.com.bd', 4, 25000, 17, 4, 'https://www.gsmarena.com/xiaomi_redmi_note_10-10247.php', 'https://fdn2.gsmarena.com/vv/bigpic/xiaomi-redmi-note-9.jpg'),
(29, 'gizmochina.com', 4, 24000, 19, 4, 'https://www.gizmochina.com/product/xiaomi-mi-note-10/', 'https://www.gizmochina.com/wp-content/uploads/2019/10/Xiaomi-Mi-Note-10-500x500.jpg'),
(30, 'gizmochina.com', 4, 25466, 14, 4, 'https://www.gizmochina.com/product/xiaomi-mi-note-10/', 'https://www.gizmochina.com/wp-content/uploads/2019/10/Xiaomi-Mi-Note-10-500x500.jpg'),
(31, 'gizmochina.com', 4, 25711, 18, 4, 'https://www.gizmochina.com/product/xiaomi-mi-note-10/', 'https://www.gizmochina.com/wp-content/uploads/2019/10/Xiaomi-Mi-Note-10-500x500.jpg'),
(32, 'gsmarena.com.bd', 4, 24689, 14, 5, 'https://www.gsmarena.com/xiaomi_redmi_note_10-10247.php', 'https://fdn2.gsmarena.com/vv/bigpic/xiaomi-redmi-note-9.jpg'),
(33, 'gizmochina.com', 4, 25000, 16, 5, 'https://www.gizmochina.com/product/xiaomi-mi-note-10/', 'https://www.gizmochina.com/wp-content/uploads/2019/10/Xiaomi-Mi-Note-10-500x500.jpg'),
(34, 'gizmochina.com', 4, 24565, 13, 5, 'https://www.gizmochina.com/product/xiaomi-mi-note-10/', 'https://www.gizmochina.com/wp-content/uploads/2019/10/Xiaomi-Mi-Note-10-500x500.jpg'),
(35, 'gsmarena.com.bd', 5, 26500, 19, 5, 'https://www.gsmarena.com.bd/samsung-galaxy-a50/', 'https://www.gsmarena.com.bd/images/products/samsung-galaxy-a50.jpg'),
(36, 'mobiledokan.com', 5, 25000, 14, 4, 'https://www.mobiledokan.com/samsung/samsung-galaxy-a50/', 'https://www.mobiledokan.com/wp-content/uploads/2019/03/Samsung-Galaxy-A50-Black.jpg'),
(37, 'othoba.com', 5, 24000, 19, 4, 'https://www.othoba.com/samsung-galaxy-a50-4gb-64gb-white-843598', 'https://images.othoba.com/images/thumbs/0259108_samsung-galaxy-a50-4gb-64gb.jpeg'),
(38, 'mobiledokan.com', 5, 24750, 14, 4, 'https://www.mobiledokan.com/samsung/samsung-galaxy-a50/', 'https://www.mobiledokan.com/wp-content/uploads/2019/03/Samsung-Galaxy-A50-Black.jpg'),
(39, 'clickbd.com', 5, 29000, 15, 4, 'https://www.clickbd.com/bangladesh/2641125-samsung-a50s-official-set-and-brand-new.html', 'https://static.clickbd.com/global/classified/item_img/2641125_4_original.jpg'),
(40, 'gsmarena.com', 5, 23758, 12, 5, 'https://www.gsmarena.com.bd/samsung-galaxy-a50/', 'https://www.gsmarena.com.bd/images/products/samsung-galaxy-a50.jpg'),
(41, 'mobiledokan.com', 5, 24000, 14, 4, 'https://www.mobiledokan.com/samsung/samsung-galaxy-a50/', 'https://www.mobiledokan.com/wp-content/uploads/2019/03/Samsung-Galaxy-A50-Black.jpg'),
(42, 'kablewala.com', 5, 27000, 19, 5, 'https://www.kablewala.com.bd/mobile-accessories/smartphones/samsung-mobile-online-bangladesh/samsung-galaxy-a50-4-64-gb/', 'https://www.kablewala.com.bd/images/thumbnails/500/350/detailed/45/Samsung_Galaxy_A50.jpg'),
(43, 'acmartbd.com', 6, 38500, 12, 4, 'https://acmartbd.com/product/konka-1-ton-air-conditioner-ka12afo/', 'https://acmartbd.com/wp-content/uploads/2017/07/Konka_Air_conditioner.jpg'),
(44, 'evaly.com.bd', 6, 37000, 14, 4, 'https://evaly.com.bd/products/ka-18-afo-konka-split-type-air-conditioner-15-ton', 'https://s3-ap-southeast-1.amazonaws.com/media.evaly.com.bd/media/2019-05-18_052339.293068Thumbnail_1.png'),
(45, 'acmartbd.com', 6, 38541, 14, 4, 'https://acmartbd.com/product/konka-1-ton-air-conditioner-ka12afo/', 'https://acmartbd.com/wp-content/uploads/2017/07/Konka_Air_conditioner.jpg'),
(46, 'evaly.com.bd', 6, 36215, 12, 5, 'https://evaly.com.bd/products/ka-18-afo-konka-split-type-air-conditioner-15-ton', 'https://acmartbd.com/wp-content/uploads/2017/07/Konka_Air_conditioner.jpg'),
(47, 'acmartbd.com', 6, 37156, 14, 4, 'https://acmartbd.com/product/konka-1-ton-air-conditioner-ka12afo/', 'https://s3-ap-southeast-1.amazonaws.com/media.evaly.com.bd/media/2019-05-18_052339.293068Thumbnail_1.png'),
(48, 'evaly.com.bd', 6, 35548, 14, 5, 'https://evaly.com.bd/products/ka-18-afo-konka-split-type-air-conditioner-15-ton', 'https://acmartbd.com/wp-content/uploads/2017/07/Konka_Air_conditioner.jpg'),
(49, 'acmartbd.com', 6, 37255, 18, 4, 'https://acmartbd.com/product/konka-1-ton-air-conditioner-ka12afo/', 'https://acmartbd.com/wp-content/uploads/2017/07/Konka_Air_conditioner.jpg'),
(50, 'evaly.com.bd', 6, 232100, 13, 4, 'https://evaly.com.bd/products/ka-18-afo-konka-split-type-air-conditioner-15-ton', 'https://acmartbd.com/wp-content/uploads/2017/07/Konka_Air_conditioner.jpg'),
(51, 'waltonbd.com', 7, 47500, 14, 4, 'https://waltonbd.com/4k-ultra-hd-tv/we55ru', 'https://waltonbd.com/image/catalog/tv/smart-tv/WE55RU%20IMPROVISED/f%201.jpg'),
(52, 'waltonbd.com', 7, 45745, 19, 4, 'https://waltonbd.com/4k-ultra-hd-tv/we55ru', 'https://waltonbd.com/image/catalog/tv/smart-tv/WE55RU%20IMPROVISED/f%201.jpg'),
(53, 'waltonbd.com', 7, 46894, 21, 4, 'https://waltonbd.com/4k-ultra-hd-tv/we55ru', 'https://waltonbd.com/image/catalog/tv/smart-tv/WE55RU%20IMPROVISED/f%201.jpg'),
(54, 'daraz.com.bd', 7, 47412, 26, 5, 'https://www.daraz.com.bd/products/wd4-mt55-vc100-1397m-4k-smart-i164478068-s1097232743.html?spm=a2a0e.searchlist.list.1.154c36c2X86C1D&search=1', 'https://static-01.daraz.com.bd/p/061085d63ae166fbb1efe255041e9513.jpg_200x200q80.jpg_.webp'),
(55, 'waltonbd.com', 7, 49874, 21, 5, 'https://waltonbd.com/4k-ultra-hd-tv/we55ru', 'https://waltonbd.com/image/catalog/tv/smart-tv/WE55RU%20IMPROVISED/f%201.jpg'),
(56, 'getsview.com', 7, 41423, 17, 4, 'https://www.getsview.com/walton-55-4k-smart-android-tv-price-bangladesh/', 'https://www.getsview.com/wp-content/uploads/2017/08/Walton-55-inch-Smart-TV-Price-in-Bangladesh.jpg.webp'),
(57, 'waltonbd.com', 7, 45236, 19, 5, 'https://waltonbd.com/4k-ultra-hd-tv/we55ru', 'https://waltonbd.com/image/catalog/tv/smart-tv/WE55RU%20IMPROVISED/f%201.jpg'),
(58, 'getsview.com', 7, 45894, 14, 4, 'https://www.getsview.com/walton-55-4k-smart-android-tv-price-bangladesh/', 'https://www.getsview.com/wp-content/uploads/2017/08/Walton-55-inch-Smart-TV-Price-in-Bangladesh.jpg.webp'),
(59, 'chaldal.com', 8, 1500, 14, 4, 'https://chaldal.com/vision-room-heater-white-1-pcs', 'https://cdn.chaldal.net/_mpimage/vision-room-heater-white-1-pcs?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D71134&q=low&'),
(60, 'vision.com', 8, 1400, 23, 4, 'https://www.vision.com.bd/p/vision-room-comforter---easy-white', 'https://www.vision.com.bd/storage/uploads/fullsize/2018-11/vision-room-heater---easy-white.jpg'),
(61, 'othoba.com', 8, 1500, 27, 4, 'https://www.othoba.com/vision-room-comforter-easy-yellow', 'https://images.othoba.com/images/thumbs/0269591_vision-room-comforter-easy-yellow.jpeg'),
(62, 'daraz.com', 8, 1400, 24, 4, 'https://www.daraz.com.bd/products/vision-room-comforter-easy-i125398457-s1045551670.html?spm=a2a0e.searchlist.list.1.6a05610dgvldfy&search=1', 'https://static-01.daraz.com.bd/p/260875896ab0a5ffeb8ef5b02e37c668.png_200x200q80.jpg_.webp'),
(63, 'clickbd.com', 8, 1500, 29, 5, 'https://www.clickbd.com/bangladesh/2154190-vision-room-heater.html', 'https://static.clickbd.com/global/classified/item_img/2154190_0_original.jpg'),
(64, 'techie.com', 8, 1500, 18, 5, 'https://techie.com.bd/room-heater/vision-room-heater/', 'https://techie.com.bd/wp-content/uploads/2019/08/VISION-Room-Heater-white.jpg'),
(65, 'familyneeds.net', 8, 1500, 24, 4, 'https://www.familyneeds.net/product/vision-room-heater-easy/', 'https://www.familyneeds.net/images/products/vision-room-heater-easy1602303761.jpg'),
(66, 'evaly.com', 8, 1400, 29, 5, 'https://evaly.com.bd/products/vision-room-heater-easy-white-4e2f7bee8', 'https://s3-ap-southeast-1.amazonaws.com/media.evaly.com.bd/media/images/d4f12259725b-0032275_vision-room-heater-easy.jpeg'),
(67, 'daraz.com', 9, 32500, 24, 4, 'https://www.daraz.com.bd/products/walton-full-auto-washing-machine-i165820934-s1099314796.html?spm=a2a0e.searchlistcategory.list.1.1fbe7170SEziAO&sear', 'https://static-01.daraz.com.bd/p/4be9e1c092de58ae92eb1cf26dfc4cf1.jpg_200x200q80.jpg_.webp'),
(68, 'waltonbd.com', 9, 31745, 14, 5, 'https://eplaza.waltonbd.com/index.php?route=product/product&path=72&product_id=4928', 'https://waltonbd.com/image/catalog/Washing%20machine/wwm-tqm150/150.jpg'),
(69, 'familyneeds.net', 9, 31894, 12, 5, 'https://www.familyneeds.net/product/walton-washing-machine-wwm-tqp125/', 'https://www.familyneeds.net/images/products/walton-washing-machine-wwm-tqp1251610518125.jpg'),
(70, 'priceforbd.com', 9, 30412, 11, 4, 'https://priceforbd.com/walton-washing-machine-price-in-bangladesh/', 'https://priceforbd.com/walton-washing-machine-price-in-bangladesh/'),
(71, 'homedepot.com.bd', 9, 34874, 12, 5, 'https://www.homedepot.com.bd/walton-wwm-m80-washing-machine/', 'https://www.homedepot.com.bd/images/products/walton-wwm-m80-washing-machine.jpg'),
(72, 'bikroy.com', 9, 32423, 22, 4, 'https://bikroy.com/en/ad/walton-washing-machine-wwm-q60-for-sale-dhaka-division-1?utm_source=bdnews24.com', 'https://i.bikroy-st.com/01cc2bdb-3e3b-46df-84a1-7196e1b95ef5/620/466/fitted.jpg'),
(73, 'trendy-tracker.com', 9, 31236, 9, 4, 'https://www.trendy-tracker.com/walton-wwm-swp60-washing-machine.html', 'https://www.trendy-tracker.com/pub/media/catalog/product/cache/f18382125bc50d0072bc032afa10ae1a/w/a/walton-wwm-swp60-washing-machine.jpg'),
(74, 'householdz.com', 9, 36894, 7, 4, 'https://www.householdz.com/walton-washing-machine-wwm-q70/', 'https://www.householdz.com/images/products/walton-washing-machine-wwm-q70.jpg'),
(75, 'gsmarena.com', 10, 26700, 4, 4, 'https://www.gsmarena.com/realme_x2-9879.php', 'https://fdn2.gsmarena.com/vv/bigpic/realme-xt-730g.jpg'),
(76, 'gadgets.ndtv.com', 10, 27000, 12, 5, 'https://gadgets.ndtv.com/realme-x2-price-in-india-91148', 'https://i.gadgets360cdn.com/products/large/vivo-u10-380x800-1569303208.jpg?downsize=*:180&output-quality=80&output-format=webp'),
(77, 'gadgetsnow.com', 10, 25000, 16, 4, 'https://www.gadgetsnow.com/mobile-phones/Realme-X2', 'https://i.gadgets360cdn.com/products/large/vivo-u10-380x800-1569303208.jpg?downsize=*:180&output-quality=80&output-format=webp'),
(78, 'gizmochina.com', 10, 26000, 24, 4, 'https://www.gizmochina.com/product/realme-x2/', 'https://www.gizmochina.com/wp-content/uploads/2019/09/Realme-X2-2-600x600.jpg'),
(79, 'realme.com', 10, 25711, 21, 4, 'https://www.realme.com/in/realme-x2/specs', 'https://static.realme.net/v2/realme-x2/images/realme_x2_in/specs_/green-daab56730e.jpg'),
(80, '91mobiles.com', 10, 27689, 22, 5, 'https://www.91mobiles.com/realme-x2-price-in-india', 'https://www.91-img.com/pictures/135943-v4-realme-x2-mobile-phone-thumb-1.jpg?tr=q-60'),
(81, 'mobiledokan.com', 10, 26500, 31, 4, 'https://www.mobiledokan.com/realme/realme-x2/', 'https://www.mobiledokan.com/wp-content/uploads/2019/09/Realme-X2.jpg'),
(82, 'flipkart.com', 10, 26865, 24, 5, 'https://www.flipkart.com/realme-x2-pearl-green-128-gb/p/itm75023903eb431', 'https://rukminim1.flixcart.com/image/416/416/k41mp3k0/mobile/f/6/g/realme-x2-rmx1992-original-imafnfe8k8yutker.jpeg?q=70');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_info`
--
ALTER TABLE `product_info`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_info`
--
ALTER TABLE `product_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
