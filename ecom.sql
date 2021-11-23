-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2021 at 11:56 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `role`, `email`, `mobile`, `status`) VALUES
(1, 'admin', 'admin', 0, '', '', 1),
(6, 'vendor', 'vendor', 1, '0110gheh@gmail.com', '09070127268', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(1, 'VEGETABLES', 1),
(6, 'FRUITS', 1),
(7, 'LEGUMES', 1),
(8, 'GRAINS', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `comment`, `added_on`) VALUES
(1, 'dev', '0110gheh@gmail.com', '', 'zzzzzzzzzzzz', '2021-11-24 05:02:11');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_master`
--

CREATE TABLE `coupon_master` (
  `id` int(11) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `coupon_value` int(11) NOT NULL,
  `coupon_type` varchar(10) NOT NULL,
  `cart_min_value` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupon_master`
--

INSERT INTO `coupon_master` (`id`, `coupon_code`, `coupon_value`, `coupon_type`, `cart_min_value`, `status`) VALUES
(2, 'First60', 20, 'Percentage', 1000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `length` float NOT NULL,
  `breadth` float NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `txnid` varchar(20) NOT NULL,
  `mihpayid` varchar(20) NOT NULL,
  `ship_order_id` int(11) NOT NULL,
  `ship_shipment_id` int(11) NOT NULL,
  `payu_status` varchar(10) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `coupon_value` varchar(50) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `length`, `breadth`, `height`, `weight`, `txnid`, `mihpayid`, `ship_order_id`, `ship_shipment_id`, `payu_status`, `coupon_id`, `coupon_value`, `coupon_code`, `added_on`) VALUES
(1, 1, 'delhi', 'delhi', 110076, 'COD', 110, 'pending', 1, 0, 0, 0, 0, 'a0a7dfccb449d8fef1fc', '', 0, 0, '', 0, '', '', '2020-05-29 09:55:15'),
(2, 1, 'Delhi', 'Delhi', 110076, 'COD', 250, 'pending', 1, 0, 0, 0, 0, '2f51ccbc668e912fa9c2', '', 0, 0, '', 0, '', '', '2020-05-29 09:59:03'),
(3, 2, 'P4', 'Daraga', 401, 'COD', 20, 'pending', 1, 0, 0, 0, 0, 'db3d3fc8ecd9a0c6a9b8', '', 0, 0, '', 0, '', '', '2021-11-23 09:45:08'),
(4, 2, 'P4', 'Daraga', 401, 'COD', 20, 'pending', 1, 0, 0, 0, 0, 'f7f175888be4485d2a40', '', 0, 0, '', 0, '', '', '2021-11-23 10:25:45'),
(5, 2, 'P4', 'Daraga', 401, 'COD', 20, 'pending', 1, 0, 0, 0, 0, '4b569705631c1172aa3d', '', 0, 0, '', 0, '', '', '2021-11-23 11:29:38'),
(6, 2, 'P4', 'Daraga', 401, 'COD', 345, 'pending', 1, 0, 0, 0, 0, '7c6b545d2d2f67794d5e', '', 0, 0, '', 0, '', '', '2021-11-23 11:47:54');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`) VALUES
(1, 1, 12, 1, 100),
(2, 1, 10, 1, 10),
(3, 2, 13, 1, 150),
(4, 2, 12, 1, 100),
(5, 3, 14, 1, 20),
(6, 4, 15, 1, 20),
(7, 5, 15, 1, 20),
(8, 6, 17, 1, 25),
(9, 6, 15, 1, 20),
(10, 6, 16, 1, 300);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Canceled'),
(5, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `sub_categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `best_seller` int(11) NOT NULL,
  `meta_title` varchar(2000) NOT NULL,
  `meta_desc` varchar(2000) NOT NULL,
  `meta_keyword` varchar(2000) NOT NULL,
  `added_by` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `sub_categories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `best_seller`, `meta_title`, `meta_desc`, `meta_keyword`, `added_by`, `status`) VALUES
(4, 2, 2, 'SHEEN-SOLID TROUSER-OLIVE', 1999, 1200, 3, '697347005_2__1538219531_49.204.69.38_600x.jpg', 'per inceptos himenaeos. Ut commodo ullamcorper quam non pulvinar.', 'Duis a felis congue, feugiat est non, suscipit quam. In elit lacus, auctor sed lacus eget, egestas consectetur leo. Duis pellentesque pharetra ante, ac ornare nibh faucibus id. Integer pulvinar malesuada nisl. Nulla vel orci nunc. Nullam a tellus eu ex ullamcorper mollis. Donec commodo ligula a accumsan fermentum. Mauris sed orci lacinia, posuere leo molestie, pretium mi. Cras sodales, neque id cursus fermentum, mi purus vehicula sem, vel laoreet lorem justo id tortor. Sed ut urna ut ipsum vestibulum commodo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut commodo ullamcorper quam non pulvinar.', 0, 'SHEEN-SOLID TROUSER-OLIVE', 'SHEEN-SOLID TROUSER-OLIVE', 'SHEEN-SOLID TROUSER-OLIVE', 0, 1),
(5, 2, 0, 'NATURE-LINEN SHIRT-GREEN', 2799, 2399, 8, '812581380_nature_green-0224_600x.jpg', 'a nisl pharetra orci, at condimentum nisl lorem elementum ipsum.', 'Nunc auctor turpis ante, eget bibendum mi mollis in. Aliquam quis neque ut libero malesuada auctor. Aliquam interdum enim at commodo gravida. Donec nisl sem, molestie ut quam quis, vulputate venenatis ipsum. Aenean quis ex ut magna accumsan fringilla. Quisque id ex massa. Sed libero ante, fringilla ac condimentum in, porttitor ac risus. Integer mattis odio nec nunc semper imperdiet. In porttitor tellus eget sapien vulputate, eu euismod lacus aliquet. Maecenas molestie elit augue, sit amet fringilla dolor congue et. Nunc eu libero auctor, sollicitudin lectus quis, porta ligula. In vel ullamcorper risus. Nullam viverra, mi sit amet laoreet luctus, urna nisl pharetra orci, at condimentum nisl lorem elementum ipsum.', 0, 'NATURE-LINEN SHIRT-GREEN', 'NATURE-LINEN SHIRT-GREEN', 'T-Shirt, NATURE-LINEN SHIRT-GREEN', 0, 1),
(6, 2, 1, 'Monte Carlo Turquoise Blue Solid Collar T Shirt', 1999, 1500, 10, '931830512__8-(1)-E5x-104831-NJD.jpg', 'lacus quis urna tristique suscipit. Praesent vitae mi mollis dui facilisis convallis eu faucibus augue.', 'Duis in risus quis lectus dictum fringilla. Aenean tempor pellentesque velit id ullamcorper. Ut id aliquam odio. Morbi id pharetra libero, ut tempor nisi. Maecenas a lectus nec risus maximus rutrum. Mauris vel elit ut magna semper laoreet nec sed magna. Quisque eleifend vel sem non malesuada. Interdum et malesuada fames ac ante ipsum primis in faucibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum eget posuere orci, eu ultrices sapien. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam sit amet ex dictum nisl bibendum elementum non in turpis. In bibendum ipsum nunc, bibendum lacinia lacus maximus eu. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus aliquam lacus quis urna tristique suscipit. Praesent vitae mi mollis dui facilisis convallis eu faucibus augue.', 0, 'Monte Carlo Turquoise Blue Solid Collar T Shirt', 'Monte Carlo Turquoise Blue Solid Collar T Shirt', 'Monte Carlo Turquoise Blue Solid Collar T Shirt', 0, 1),
(11, 2, 0, 'Test1', 100, 50, 10, '457926432_697347005_2__1538219531_49.204.69.38_600x.jpg', 'Test', 'test', 0, '', '', '', 0, 1),
(12, 2, 1, 'Test Man', 120, 100, 10, '332899305_457926432_697347005_2__1538219531_49.204.69.38_600x.jpg', 'Test desc', 'Test desc', 0, '', '', '', 2, 1),
(14, 2, 1, 'Carabao Mango', 40, 20, 1000, '189422983_mango1.jpg', 'Mango', 'Cheap and Sweet', 1, 'mango', 'sweet and cheap mango', 'sweet cheap mango', 6, 1),
(15, 6, 4, 'Carabao Mango', 40, 20, 1000, '509799916_mango1.jpg', 'Delicious, sweet and cheap mango', 'Delicious, sweet and cheap mango from local farm located in Legazpi City.', 1, 'Carabao Mango', 'Carabao mango with sweet taste and not sour', 'mango sweet', 6, 1),
(16, 6, 19, 'Pili', 450, 300, 50, '649199317_pili.jpg', 'Pili per kilo', 'The pili is from Legazpi City. The price is per kilo', 1, 'pili per kilo mura', 'pili per kilo mura', 'pili per kilo mura cheap', 6, 1),
(17, 6, 40, 'Guava', 30, 25, 500, '819904253_guava.jpg', 'Guava per kilo', 'Guava per kilo', 0, 'Guava per kilo', 'Guava per kilo', 'Guava per kilo', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shiprocket_token`
--

CREATE TABLE `shiprocket_token` (
  `id` int(11) NOT NULL,
  `token` varchar(500) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shiprocket_token`
--

INSERT INTO `shiprocket_token` (`id`, `token`, `added_on`) VALUES
(1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjQ5NDkwOSwiaXNzIjoiaHR0cHM6Ly9hcGl2Mi5zaGlwcm9ja2V0LmluL3YxL2V4dGVybmFsL2F1dGgvbG9naW4iLCJpYXQiOjE1OTA0MDQ4NTMsImV4cCI6MTU5MTI2ODg1MywibmJmIjoxNTkwNDA0ODUzLCJqdGkiOiJWZU4zaE5YMm1LdVY4cXB0In0.YKracv-yDKppYb2FISr5zE_4gEGWIAz-HzIa6cit9nw', '2020-05-25 05:07:26');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `sub_categories` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `categories_id`, `sub_categories`, `status`) VALUES
(1, 2, 'Mangoes', 1),
(2, 2, 'Pineapple', 1),
(4, 6, 'Mango', 1),
(5, 6, 'Pineapple', 1),
(6, 8, 'Rice', 1),
(7, 8, 'Corn', 1),
(8, 8, 'Wheat', 1),
(9, 8, 'Barley', 1),
(10, 7, 'Hyacinth Bean (Batao)', 1),
(11, 7, 'Lima Bean (Patani)', 1),
(12, 7, 'Rice Beans', 1),
(13, 7, 'Sabawels', 1),
(14, 7, 'Jack Bean', 1),
(15, 7, 'Sam-Sampimg', 1),
(16, 7, 'Sword Bean', 1),
(17, 6, 'Banana', 1),
(18, 6, 'Calamansi', 1),
(19, 6, 'Pili', 1),
(20, 6, 'Bali-gang', 1),
(21, 6, 'Kurumbot', 1),
(22, 6, 'Tublon/Tablon', 1),
(23, 6, 'Mirinda', 1),
(24, 6, 'Biriran', 1),
(25, 7, 'Gumyan/Gumihan', 1),
(26, 6, 'Agis/Hagis', 1),
(27, 6, 'Bignay/Bugnay', 1),
(28, 6, 'Ogob/Ogog', 1),
(29, 6, 'Tambis', 1),
(30, 6, 'Ampol kan niyog', 1),
(31, 6, 'Siregwelas', 1),
(32, 6, 'Berba', 1),
(33, 6, 'Sapinit', 1),
(34, 6, 'Tagbak', 1),
(35, 6, 'Tungaw tungaw', 1),
(36, 6, 'Kamagong/Mabolo', 1),
(37, 6, 'Laptukay', 1),
(38, 6, 'Bulala', 1),
(39, 6, 'Katmon', 1),
(40, 6, 'Bayawas/Bayabas/Guava', 1),
(41, 6, 'Chiesa / Tisa / Canistel', 1),
(42, 6, 'Batag-batag / Uvaria rufa', 1),
(43, 6, 'Tangkwa / Kundol / Wintermelon', 1),
(44, 6, 'Bugnay', 1),
(45, 6, 'Marang', 1),
(46, 6, 'Kurumbot / Dulce Kurumbot', 1),
(47, 6, 'Iba / Kamias', 1),
(48, 6, 'Balîgang / Lipote', 1),
(49, 6, 'Kaimito / Star Apple', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mobile`, `added_on`) VALUES
(1, 'Vishal Gupta', 'vishal', 'ytlearnwebdevelopment@gmail.com', '1234567890', '2020-05-13 00:00:00'),
(2, 'user', 'user', 'user@gmail.com', '1234567890', '2020-05-14 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_master`
--
ALTER TABLE `coupon_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shiprocket_token`
--
ALTER TABLE `shiprocket_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `coupon_master`
--
ALTER TABLE `coupon_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `shiprocket_token`
--
ALTER TABLE `shiprocket_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
