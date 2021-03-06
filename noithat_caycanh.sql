-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 26, 2021 at 03:37 PM
-- Server version: 10.1.18-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `noithat_caycanh`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `admin_group_id` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `type` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `name`, `admin_group_id`, `created`, `last_login`, `type`) VALUES
(1, 'administrator', '6e13ba34f874bace5e32289146ef127b', 'Administrator', -1, 1528433953, 1619332691, 'root');

-- --------------------------------------------------------

--
-- Table structure for table `admin_group`
--

CREATE TABLE `admin_group` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin_group`
--

INSERT INTO `admin_group` (`id`, `name`, `permissions`, `sort_order`, `created`) VALUES
(4, 'Content', '{\"pages\":[\"index\",\"add\",\"edit\",\"delete\",\"del_all\",\"status\"],\"news\":[\"index\",\"add\",\"edit\",\"delete\",\"del_all\",\"status\",\"home\",\"sidebar\"],\"catalognew\":[\"index\",\"add\",\"edit\",\"delete\",\"del_all\"],\"product\":[\"index\",\"add\",\"edit\",\"delete\",\"del_all\",\"status\",\"home\"],\"catalog\":[\"index\",\"add\",\"edit\",\"delete\",\"del_all\",\"status\",\"home\"],\"menu\":[\"index\",\"add\",\"edit\",\"delete\",\"del_all\",\"an_hien\",\"load_type_menu\",\"validationadd\"],\"slide\":[\"index\",\"add\",\"edit\",\"delete\",\"del_all\"],\"header\":[\"index\"],\"footer\":[\"index\"],\"script\":[\"index\"],\"deletecache\":[\"index\"],\"admin\":[\"edit\"],\"ajax\":[\"slug\"]}', 0, 1553314421),
(5, 'Super Admin', '{\"pages\":[\"index\",\"add\",\"edit\",\"delete\",\"del_all\",\"status\"],\"news\":[\"index\",\"add\",\"edit\",\"delete\",\"del_all\",\"status\",\"home\",\"sidebar\"],\"catalognew\":[\"index\",\"add\",\"edit\",\"delete\",\"del_all\",\"status\"],\"product\":[\"index\",\"add\",\"edit\",\"delete\",\"del_all\",\"status\",\"home\"],\"catalog\":[\"index\",\"add\",\"edit\",\"delete\",\"del_all\",\"status\",\"home\"],\"notlink\":[\"index\",\"add\",\"edit\",\"delete\",\"del_all\"],\"headerlink\":[\"index\",\"add\",\"edit\",\"delete\",\"del_all\"],\"order\":[\"index\",\"edit\",\"delete\",\"del_all\"],\"menu\":[\"index\",\"add\",\"edit\",\"delete\",\"del_all\",\"an_hien\",\"load_type_menu\",\"validationadd\"],\"slide\":[\"index\",\"add\",\"edit\",\"delete\",\"del_all\"],\"contact\":[\"index\",\"delete\",\"del_all\"],\"pagehome\":[\"index\"],\"pagecontact\":[\"index\"],\"header\":[\"index\"],\"social\":[\"index\"],\"footer\":[\"index\"],\"script\":[\"index\"],\"infowebsite\":[\"index\"],\"deletecache\":[\"index\"],\"admin\":[\"edit\"],\"ajax\":[\"slug\"]}', 0, 1553494652);

-- --------------------------------------------------------

--
-- Table structure for table `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_seo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `home` tinyint(1) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `url`, `image_link`, `image_thumb`, `image_seo`, `banner`, `intro`, `title`, `description`, `keyword`, `parent_id`, `created`, `updated`, `status`, `home`, `sort_order`) VALUES
(1, 'NHO TH??N G???', 'nho-than-go', '/uploads/images/category/category-1.jpg', '', '', '', 'M?? t??? ng???n danh m???c', '', '', '', 0, 1619670119, 1619679162, 1, 1, 0),
(2, 'L???U C??? TH???', 'luu-co-thu', '/uploads/images/category/category-2.jpg', '', '', '', 'M?? t??? ng???n danh m???c', '', '', '', 0, 1619670136, 1619679169, 1, 1, 0),
(3, 'CHERRY BRAZIL', 'cherry-brazil', '/uploads/images/category/category-3.jpg', '', '', '', 'M?? t??? ng???n danh m???c', '', '', '', 0, 1619670150, 1619679176, 1, 1, 0),
(4, 'C??Y ??N TR??I ?????C L???', 'cay-an-trai-doc-la', '', '', '', '', '', '', '', '', 0, 1619670162, 1619670162, 1, 0, 0),
(5, 'C??Y C???NH ?????C L???', 'cay-canh-doc-la', '', '', '', '', '', '', '', '', 0, 1619670173, 1619670173, 1, 0, 0),
(6, 'NHO TH??N G??? ????? 12 V???', 'nho-than-go-do-12-vu', '', '', '', '', '', '', '', '', 1, 1619670364, 1619670364, 1, 0, 0),
(7, 'NHO TH??N G??? T??? QU??', 'nho-than-go-tu-quy', '', '', '', '', '', '', '', '', 1, 1619670383, 1619670383, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_image`
--

CREATE TABLE `catalog_image` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_seo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `home` tinyint(1) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_new`
--

CREATE TABLE `catalog_new` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_seo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `home` tinyint(1) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `catalog_new`
--

INSERT INTO `catalog_new` (`id`, `name`, `url`, `image_link`, `image_thumb`, `image_seo`, `banner`, `intro`, `title`, `description`, `keyword`, `parent_id`, `created`, `updated`, `status`, `home`, `sort_order`) VALUES
(1, 'Tin t???c', 'tin-tuc', '', '', '', '', '', '', '', '', 0, 1620101820, 1620101820, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_service`
--

CREATE TABLE `catalog_service` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_seo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `home` tinyint(1) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  `sessions` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `country_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_email`
--

CREATE TABLE `contact_email` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_footer`
--

CREATE TABLE `contact_footer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_phone`
--

CREATE TABLE `contact_phone` (
  `id` int(11) NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `chucdanh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ykien` text COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `header_link`
--

CREATE TABLE `header_link` (
  `id` int(11) NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_seo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_list` text COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `timer` int(11) NOT NULL,
  `view` int(11) NOT NULL,
  `catalog_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `home` tinyint(1) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images_catalogimage`
--

CREATE TABLE `images_catalogimage` (
  `image_id` int(11) NOT NULL,
  `catalog_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `id_type` int(11) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `url`, `type`, `id_type`, `parent_id`, `sort_order`, `created`, `status`) VALUES
(1, 'NHO TH??N G???', 'nho-than-go', 'catalog', 1, 0, 1, 1619670196, 1),
(2, 'L???U C??? TH???', 'luu-co-thu', 'catalog', 2, 0, 2, 1619670201, 1),
(3, 'CHERRY BRAZIL', 'cherry-brazil', 'catalog', 3, 0, 3, 1619670207, 1),
(4, 'C??Y ??N TR??I ?????C L???', 'cay-an-trai-doc-la', 'catalog', 4, 0, 4, 1619670211, 1),
(5, 'C??Y C???NH ?????C L???', 'cay-canh-doc-la', 'catalog', 5, 0, 5, 1619670215, 1),
(6, 'LI??N H???', '/lien-he', 'outlink', 0, 0, 6, 1619670233, 1),
(7, 'NHO TH??N G??? ????? 12 V???', 'nho-than-go-do-12-vu', 'catalog', 6, 1, 0, 1619670403, 1),
(8, 'NHO TH??N G??? T??? QU??', 'nho-than-go-tu-quy', 'catalog', 7, 1, 0, 1619670412, 1);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_seo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) DEFAULT '0',
  `updated` int(11) DEFAULT '0',
  `timer` int(11) DEFAULT '0',
  `view` int(11) DEFAULT '0',
  `catalog_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `home` tinyint(1) NOT NULL,
  `sidebar` tinyint(1) NOT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  `layout` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `name`, `url`, `intro`, `content`, `title`, `description`, `keyword`, `image_link`, `image_thumb`, `image_seo`, `created`, `updated`, `timer`, `view`, `catalog_id`, `status`, `home`, `sidebar`, `author`, `sort_order`, `layout`) VALUES
(1, 'C??y h???nh ph??c cho v?????n nh?? r???c r??? s???c hoa, gia ch??? h???nh ph??c su???t ?????i', 'cay-hanh-phuc-cho-vuon-nha-ruc-ro-sac-hoa-gia-chu-hanh-phuc-suot-doi', '', '<p>adsf</p>\r\n', '', '', '', '', '', '', 1620101881, 1620101881, 1620101820, 1, 1, 1, 0, 1, '', 0, 'sidebar');

-- --------------------------------------------------------

--
-- Table structure for table `news_catalognew`
--

CREATE TABLE `news_catalognew` (
  `new_id` int(11) NOT NULL,
  `catalog_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `news_catalognew`
--

INSERT INTO `news_catalognew` (`new_id`, `catalog_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `notlink`
--

CREATE TABLE `notlink` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `images` text COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `transaction_id` int(255) NOT NULL,
  `id` int(255) NOT NULL,
  `product_id` int(255) NOT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`transaction_id`, `id`, `product_id`, `product_name`, `size`, `price`, `qty`, `amount`) VALUES
(1, 1, 199, 'Nh???n ????i b???c ND0371', 0, 300000, 1, 300000),
(1, 2, 198, 'Nh???n ????i s??nh b?????c ND0370', 0, 400000, 3, 1200000),
(1, 3, 35, 'Nh???n nam NNA1006', 0, 300000, 1, 300000),
(2, 4, 63, 'EZVIZ C1C 1080P', 0, 2450000, 1, 2450000),
(3, 5, 63, 'EZVIZ C1C 1080P', 0, 2450000, 1, 2450000);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_seo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `url`, `intro`, `content`, `title`, `description`, `keyword`, `image_link`, `image_thumb`, `image_seo`, `created`, `updated`, `status`, `sort_order`, `type`) VALUES
(1, 'Gi???i thi???u', 'gioi-thieu', '', '<div>\r\n	<h1>\r\n		<span style=\"color:#008000;\">C??NG TY TNHH TM &amp; DV NI???M TIN VI???T</span></h1>\r\n</div>\r\n<p style=\"color: rgb(51, 51, 51); font-family: Verdana, Geneva, sans-serif;\">\r\n	&nbsp;</p>\r\n<p style=\"color: rgb(51, 51, 51); font-family: Verdana, Geneva, sans-serif;\">\r\n	<br />\r\n	<strong>NI???M TIN VI???T</strong> l?? m???t ????n v??? ho???t ?????ng trong l??nh v???c c??n kh?? m???i m??? c???a n???n kinh t??? Vi???t Nam hi???n nay.&nbsp;Tuy m???i ra ?????i v?? ph??t tri???n, nh??ng&nbsp;<strong>NI???M TIN VI???T</strong>&nbsp;???? ?????t ???????c nh???ng b?????c ph??t tri???n kh??ng ng???ng trong vi???c h??? tr??? v?? ph??t tri???n h??? th???ng an ninh cho c??c c?? nh??n v?? doanh nghi???p.</p>\r\n<p style=\"color: rgb(51, 51, 51); font-family: Verdana, Geneva, sans-serif;\">\r\n	<strong>NI???M TIN VI???T</strong>&nbsp;chuy??n ph??n ph???i v?? l???p ?????t h??? th???ng&nbsp;<a href=\"http://vienthongntv.com/camera-vantech-c6\">camera&nbsp;quan&nbsp;s??t</a>,&nbsp;thi???t b??? b??o ch??y, b??o tr???m, h??? th???ng t???ng ????i v?? c??c thi???t b??? v??n ph??ng.</p>\r\n<div>\r\n	V???i ?????i ng?? nh??n vi??n ?????y s??ng t???o, n??ng ?????ng, ch???u kh??, nhi???t t??nh v?? phong c??ch l??m vi???c chuy??n nghi???p,&nbsp;<strong style=\"color: rgb(51, 51, 51); font-family: Verdana, Geneva, sans-serif;\">NI???M TIN VI???T</strong>&nbsp;cam k???t mang ?????n cho kh??ch h??ng nh???ng s???n ph???m ch???t l?????ng cao, ????p ???ng v?? th???a m??n m???i nhu c???u c???a ng?????i d??ng.<br />\r\n	&nbsp;</div>\r\n<div>\r\n	<strong style=\"color: rgb(51, 51, 51); font-family: Verdana, Geneva, sans-serif;\">NI???M TIN VI???T</strong>&nbsp;lu??n c??? g???ng, n??? l???c h???t m??nh ????? mang ?????n nh???ng s???n ph???m, d???ch v??? uy t??n, ch???t l?????ng nh???t nh???m ????p ???ng nhu c???u ng??y c??ng cao c???a ng?????i s??? d???ng, mang ?????n cho kh??ch h??ng nh???ng tr???i nghi???m m???i m??? v?? th?? v???.<br />\r\n	&nbsp;</div>\r\n<div>\r\n	Kh??ng d???ng l???i ??? ????,&nbsp;<strong style=\"color: rgb(51, 51, 51); font-family: Verdana, Geneva, sans-serif;\">NI???M TIN VI???T</strong>&nbsp;lu??n n??? l???c, t??m t??i, h???c h???i v?? s??ng t???o h??n n???a ????? ng??y c??ng ho??n thi???n v?? ph??t tri???n m???t c??ch to??n v???n nh???t.</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<strong><em>Tri???t l?? kinh doanh c???a</em></strong>&nbsp;<font color=\"#333333\" face=\"Verdana, Geneva, sans-serif\"><b>c??ng ty: NI???M TIN VI???T - GI??? TR???N NI???M TIN</b></font><br />\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<span style=\"font-size:14px;\">Xin tr??n th??nh c???m ??n!</span></div>\r\n', '', '', '', '', '', '', 1619329162, 1619329208, 1, 0, 'default');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `content_1` text COLLATE utf8_unicode_ci NOT NULL,
  `price` int(100) NOT NULL DEFAULT '0',
  `discount` int(100) NOT NULL DEFAULT '0',
  `code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_seo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_list` text COLLATE utf8_unicode_ci NOT NULL,
  `gift` text COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `timer` int(11) NOT NULL,
  `view` int(11) NOT NULL DEFAULT '0',
  `catalog_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `home` tinyint(1) NOT NULL,
  `selling` tinyint(1) NOT NULL,
  `productStatus` tinyint(1) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `url`, `intro`, `content`, `content_1`, `price`, `discount`, `code`, `title`, `description`, `keyword`, `image_link`, `image_thumb`, `image_seo`, `image_list`, `gift`, `created`, `updated`, `timer`, `view`, `catalog_id`, `status`, `home`, `selling`, `productStatus`, `sort_order`) VALUES
(1, 'C??y Gi???ng Nho Th??n G??? ????? 12 V???', 'cay-giong-nho-than-go-do-12-vu', '', '', '', 450000, 0, 'cay-giong-nho-than-go-do-12-vu', '', '', '', '/uploads/images/products/cay-giong-nho-than-go-do-12-vu-01.jpg', '', '', '', '', 1619670814, 1619670814, 1619670720, 0, 6, 1, 0, 1, 1, 0),
(2, 'C??y Nho Th??n G??? ????? 12 M??a Cao 1m', 'cay-nho-than-go-do-12-mua-cao-1m', '', '', '', 4000000, 0, 'cay-nho-than-go-do-12-mua-cao-1m', '', '', '', '/uploads/images/products/cay-giong-nho-than-go-do-12-vu-02.jpg', '', '', '', '', 1619670848, 1619670848, 1619670780, 0, 1, 1, 1, 1, 1, 0),
(3, 'C??y Nho Th??n G??? ????? 12 V??? ??ang Tr??i Xum Xu?? 10 N??m Tu???i', 'cay-nho-than-go-do-12-vu-dang-trai-xum-xue-10-nam-tuoi', '', '', '', 10000000, 0, 'cay-nho-than-go-do-12-vu-dang-trai-xum-xue-10-nam-tuoi', '', '', '', '/uploads/images/products/cay-giong-nho-than-go-do-12-vu-03.jpg', '', '', '', '', 1619670874, 1619670874, 1619670840, 0, 1, 1, 1, 1, 1, 0),
(4, 'C??y Nho Th??n G??? ????? 12 V??? L??u N??m', 'cay-nho-than-go-do-12-vu-lau-nam', '', '', '', 30000000, 0, 'cay-nho-than-go-do-12-vu-lau-nam', '', '', '', '/uploads/images/products/cay-giong-nho-than-go-do-12-vu-04.jpg', '', '', '', '', 1619670895, 1619670895, 1619670840, 0, 1, 1, 1, 1, 1, 0),
(5, 'C??y Nho Th??n G??? ????? 12 V??? Sai Tr??i Nhi???u N??m Tu???i', 'cay-nho-than-go-do-12-vu-sai-trai-nhieu-nam-tuoi', '', '', '', 22000000, 0, 'cay-nho-than-go-do-12-vu-sai-trai-nhieu-nam-tuoi', '', '', '', '/uploads/images/products/cay-giong-nho-than-go-do-12-vu-05.jpg', '', '', '', '', 1619670928, 1619670928, 1619670840, 0, 1, 1, 1, 1, 1, 0),
(6, 'C??y Nho Th??n G??? ????? 12 V??? Tr?????ng Th??nh Ra Tr??i Quanh N??m', 'cay-nho-than-go-do-12-vu-truong-thanh-ra-trai-quanh-nam', '', '<p><span style=\"font-size:16px\"><strong>C??y Cherry Brazil&nbsp; ???? ra tr??i ba m??a&nbsp;</strong></span></p>\r\n\r\n<p><span style=\"font-size:16px\">- T??n&nbsp;l?? r???ng, c??nh l?? xum xu??.</span></p>\r\n\r\n<p><span style=\"font-size:11pt\">- <span style=\"font-size:16px\">Chi???u Cao h??n&nbsp;1,6-1,8m</span></span></p>\r\n<p><span style=\"font-size:16px\">- C??y ch???u h???n t???t, ??t s??u b???nh, d??? ch??m s??c</span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\">- </span></span><span style=\"font-size:14.6667px\"><span style=\"font-size:16px\">Cherry Brazil&nbsp;</span></span><span style=\"font-size:16px\">lo???i c??y th??n g???,&nbsp;???????c thu???n d?????ng th??ch h???p v???i kh?? h???u t???i Vi???t Nam.&nbsp;</span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\">- C??y cho tr??i t??? 2-3 v??? trong m???t n??m.</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\">- C??y r???t ??a ??nh s??ng m???t tr???i tr???c ti???p. Th???i l?????ng ??nh s??ng th??ch h???p nh???t cho s??? t??ng tr?????ng v?? ?????u qu??? c???a c??y l?? 12 ti???ng n???ng m???t ng??y</span></p>\r\n\r\n<p><iframe frameborder=\"0\" height=\"500\" src=\"https://www.youtube.com/embed/Q0eCsmi3sik\" width=\"100%\"></iframe></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><strong><span style=\"font-size:16.0pt\">1/ Ngu???n g???c &ndash; xu???t x??? Cherry Brazil:</span></strong></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\">Cherry Brazil c?? ngu???n g???c t??? Brazil. L?? m???t lo??i c??y b???n ?????a, quen sinh s???ng ??? ph??a v??ng duy??n h???i Nam Brazil.</span></span><span style=\"font-size:16px\">&nbsp;C??y Cherry gi???ng&nbsp;s??? cho tr??i sau kho???ng 2&nbsp;?????n 3&nbsp;n??m&nbsp;tr???ng.</span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><strong><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\">?????c ??i???m c???a Cherry Brazil</span></span></strong></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\">Cherry Brazil thu???c d??ng th??n g??? s???ng l??u n??m ??? kh?? h???u nhi???t ?????i. Ch??nh v?? v???y, r???t ph?? h???p v???i kh?? h???u Vi???t Nam. C??y ph??t tri???n nhanh v?? ra tr??i sai c??y. ?????c t??nh d??? tr???ng, kh??ng c???n nhi???u k??? thu???t ch??m s??c. &nbsp;</span></span></p>\r\n\r\n<p style=\"text-align: center\"><img alt=\"C??y Cherry Brazil 0001\" src=\"//file.hstatic.net/200000186977/file/cay-cherry-brazil-loai-dai-xum-xue-trai-cao-khoang-2m-1_74860455ccdb4fb8bf22d46d7884e715_grande.jpg\" /></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\">T??n Cherry tr??n ?????u, c??nh nh??nh xum xu??, th??ch h???p cho khu??n vi??n s??n v?????n, bi???t th???</span></span></p>\r\n\r\n<p style=\"text-align: center\"><img alt=\"C??y Cherry Brazil 0002\" src=\"//file.hstatic.net/200000186977/file/cay-cherry-brazil-4_e4e3862a82944298ac701c2c85048ba3_grande.jpg\" /></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\">Sau 1 th??ng t??? l??c n??? hoa. Cherry b???t ?????u ra qu??? xanh. Nh??n chung qu??? Cherry Brazil nh?? m???t nh??n b???n thu nh??? c???a qu??? l???u. </span></span></p>\r\n\r\n<p style=\"text-align: center\"><img alt=\"C??y Cherry Brazil 0003\" src=\"//file.hstatic.net/200000186977/file/cay-cherry-brazil-2_9e333373e77d4ad0982503ae8526d81c_grande.jpg\" /></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\">Cherry khi ch??n s??? chuy???n t??? ????? th??nh m??u t??m ??en ?????c tr??ng, qu??? c??ng m???ng, tr??n c?? cu???ng d??i, v??? ng???t thanh . V?? c?? ph???n ??u??i kh??c bi???t</span></span></p>\r\n\r\n<p style=\"text-align: center\"><img alt=\"C??y Cherry Brazil 0004\" src=\"//file.hstatic.net/200000186977/file/cay-cherry-brazil-3_0687efb38fbc4d68b2b158114cd76c2b_grande.jpg\" /></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><strong><span style=\"font-size:16.0pt\">2/ ??i???u ki???n sinh th??i ch??m s??c c??y Cherry Brazil:</span></strong></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><strong><span style=\"font-size:13.0pt\">??nh s??ng:</span></strong></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\">C??y r???t ??a ??nh s??ng. ????? qu??? m???ng, c??ng tr??n, n??n cung c???p ??nh n???ng v???a ph???i cho c??y. Vi???c n??y s??? gi??p c??y sinh tr?????ng t???t, t??ng tu???i th???. V?? ra tr??i ngon ng???t , ?????p m???t.</span></span></p>\r\n\r\n<p style=\"text-align: center\"><img alt=\"C??y Cherry Brazil 0005\" src=\"//file.hstatic.net/200000186977/file/cay-cherry-brazil-1_621df1df213f402c9a51a5c89df1ba1b_grande.jpg\" /></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><strong><span style=\"font-size:13.0pt\">C??ch t?????i n?????c:</span></strong></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\">Tr??nh t??nh tr???ng t?????i n?????c qu?? nhi???u. Th???i ??i???m t???t nh???t ????? t?????i l?? bu???i s??ng ( kh??ng t?????i v??o chi???u t???i). N???u v??o m??a m??a, n??n c??n nh???c l?????ng n?????c c???n t?????i cho c??y.</span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><strong><span style=\"font-size:13.0pt\">B??n ph??n: </span></strong></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\">Ch???n ph???n b??, ph??n c??, ph???n h???u c??, ??i???u ????? h??ng th??ng ????? ????? ch???t dinh d?????ng t???o qu???. </span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><strong><span style=\"font-size:13.0pt\">?????t tr???ng:</span></strong></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\"><span style=\"background-color:white\"><span style=\"color:#333333\">Ch?? ?? ch???n ?????t m??n t??i x???p, </span></span></span><span style=\"font-size:13.0pt\"><span style=\"background-color:white\"><span style=\"color:#0a0a0a\">?????t th???t c?? pha c??t, ch???a nhi???u m??n h???u c??, tho??t n?????c t???t. N???u ?????t kh??ng tho??t ???????c n?????c, s??? g??y ra hi???n tr???ng ng???p ??ng cho c??y. ??i???u n??y ?????ng ngh??a c??y s??? b??? gi???m tu???i th??? tr???m tr???ng. </span></span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><strong><span style=\"font-size:13.0pt\"><span style=\"background-color:white\"><span style=\"color:#0a0a0a\">Ch??m s??c c??y:</span></span></span></strong></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\"><span style=\"background-color:white\"><span style=\"color:#0a0a0a\">C???t t???a c??y ????ng c??ch</span></span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\"><span style=\"background-color:white\"><span style=\"color:#333333\">C???t t???a c??y v??o m??a xu??n ????? tr??nh b???nh b???c l??. </span></span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><strong><span style=\"font-size:16.0pt\">3/ M???t s??? c??ng d???ng b???t ng??? t??? qu??? Cherry Brazil</span></strong></span></p>\r\n\r\n<p style=\"text-align: center\"><img alt=\"C??y Cherry Brazil 0006\" src=\"//file.hstatic.net/200000186977/file/cay-cherry-brazil-6_22c19d23b26f4003af70d84933166025_grande.jpg\" /></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><strong><span style=\"font-size:13.0pt\">Gi??p cho ????i m???t s??ng</span></strong><span style=\"font-size:13.0pt\">:</span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\">Theo nghi??n c???u, h??m l?????ng vitamin A c?? trong Cherry Brazil ?????n 20 l???n so v???i qu??? d??u t??y, vi???t qu???t th??ng th?????ng. <span style=\"background-color:white\"><span style=\"color:#222222\">M???t ph???n c???a vi_ta_min n??y l?? be-ta carotene&nbsp;<strong>gi??p</strong>&nbsp;th??c ?????y t???m nh??n t???t v?? gi??? cho ????i&nbsp;<strong>m???t</strong>&nbsp;c???a b???n kh???e m???nh. D??ng Cherry m???i ng??y s??? gi??p h??? tr??? th??? l???c t???t h??n.</span></span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><strong><span style=\"font-size:13.0pt\"><span style=\"background-color:white\"><span style=\"color:#222222\">C???i thi???n ???????ng ti??u h??a:</span></span></span></strong></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\"><span style=\"background-color:white\"><span style=\"color:black\">Cherry Brazil ch???a ch???t<strong>&nbsp;</strong>ch???ng oxy h??a&nbsp;cao, l??m gi???m nguy c?? ung th?? v?? ch???m qu?? tr??nh l??o h??a. B??? sung th??m lo???i qu??? n??y v??o ch??? ????? ??n ????? t??ng s???c ????? kh??ng cho c?? th??? </span></span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><strong><span style=\"font-size:13.0pt\"><span style=\"background-color:white\"><span style=\"color:#222222\">H??? tr??? gi???c ng???:</span></span></span></strong></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\"><span style=\"background-color:white\"><span style=\"color:#222222\">N???u l?? &ldquo; C??? c???ng &rdquo; c???a h???i C?? ????m th?? n??n b??? qua ph???n n??y nh??. V?? Cherry Brazil gi??p c???i thi???n t??nh tr???ng m???t ng??? r???t t???t. Trong tr??i C</span></span></span><span style=\"font-size:13.0pt\"><span style=\"background-color:white\"><span style=\"color:black\">herry ch???a m???t l?????ng me-la-tonin an to??n gi??p cho gi???c ng??? s??u v?? ngon h??n. </span></span></span></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><strong><span style=\"font-size:13.0pt\"><span style=\"background-color:white\"><span style=\"color:#222222\">H??? tr??? tim m???ch - huy???t ??p &ndash; c???i thi???n ch???c n??ng n??o b???:</span></span></span></strong></span></p>\r\n\r\n<p style=\"margin-bottom:11px\"><span style=\"font-size:11pt\"><span style=\"font-size:13.0pt\"><span style=\"background-color:white\"><span style=\"color:black\">Ch???a nhi???u ch???t ch???ng oxy h??a m???nh, ????y l?? m???t ch???t tuy???t v???i ????? gi???i quy???t v???n ????? suy gi???m tr?? nh???, mau qu??n khi tu???i t??c ch??a ?????n ????? l??o h??a.V?? ?????c bi???t, Cherry r???t t???t cho tim m???ch. Gi??p l??u th??ng tu???n ho??n m??u ?????n n??o, gi???m nguy c?? t???t ngh???n m???ch.</span></span></span></span></p>', '', 7000000, 6500000, 'cay-nho-than-go-do-12-vu-truong-thanh-ra-trai-quanh-nam', '', '', '', '/uploads/images/products/cay-giong-nho-than-go-do-12-vu-06.jpg', '', '', '', '', 1619670949, 1620099913, 1619670900, 0, 1, 1, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products_catalog`
--

CREATE TABLE `products_catalog` (
  `product_id` int(11) NOT NULL,
  `catalog_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products_catalog`
--

INSERT INTO `products_catalog` (`product_id`, `catalog_id`) VALUES
(1, 1),
(1, 6),
(2, 1),
(2, 6),
(3, 1),
(3, 6),
(4, 1),
(4, 6),
(5, 1),
(5, 6),
(6, 6),
(6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_seo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_list` text COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `timer` int(11) NOT NULL,
  `view` int(11) NOT NULL,
  `catalog_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `home` tinyint(1) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services_catalogservice`
--

CREATE TABLE `services_catalogservice` (
  `service_id` int(11) NOT NULL,
  `catalog_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setup`
--

CREATE TABLE `setup` (
  `id` int(11) NOT NULL,
  `col` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `setup`
--

INSERT INTO `setup` (`id`, `col`, `value`) VALUES
(1, 'phone', '{\"phone1\":\"090 324 6284\",\"phone2\":\"\"}'),
(2, 'address', '{\"address1\":\"811 Nguy\\u1ec5n Xi\\u1ec3n - Ph\\u01b0\\u1eddng Long Th\\u1ea1nh M\\u1ef9 - Qu\\u1eadn 9 - TP. HCM\",\"address2\":\"409\\/5 Nguy\\u1ec5n Oanh, Ph\\u01b0\\u1eddng 17, Qu\\u1eadn G\\u00f2 V\\u1ea5p- TP H\\u1ed3 Ch\\u00ed Minh\"}'),
(3, 'email', 'niemtinviettelecom@gmail.com'),
(4, 'website', 'http://vienthongntv.com'),
(5, 'company', '{\"tenquocte\":\"C\\u00d4NG TY TNHH TM & DV NI\\u1ec0M TIN VI\\u1ec6T\",\"tengoitat\":\"C\\u00d4NG TY TNHH TM & DV NI\\u1ec0M TIN VI\\u1ec6T\"}'),
(6, 'logo', '{\"name\":\"NH\\u00c0 V\\u01af\\u1edcN FUHOUSE\",\"image_link\":\"\\/uploads\\/images\\/logo.png\"}'),
(7, 'favico', '/uploads/images/favicon.webp'),
(8, 'map', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.460643932376!2d106.83112831480138!3d10.85252589226989!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317520b97d2b827b%3A0x91485f69e81ca620!2zODExIE5ndXnhu4VuIFhp4buDbiwgTG9uZyBUaOG6oW5oIE3hu7ksIFF14bqtbiA5LCBUaMOgbmggcGjhu5EgSOG7kyBDaMOtIE1pbmg!5e0!3m2!1svi!2s!4v1619329796220!5m2!1svi!2s'),
(9, 'footer1', '{\"title\":\"TH\\u00d4NG TIN C\\u00d4NG TY\",\"content\":\"<p><strong>C\\u00d4NG TY TNHH TM &amp; DV NI\\u1ec0M TIN VI\\u1ec6T<\\/strong><\\/p>\\r\\n\\r\\n<p>\\u0110\\u1ecba ch\\u1ec9: 811 Nguy\\u1ec5n Xi\\u1ec3n - Ph\\u01b0\\u1eddng Long Th\\u1ea1nh M\\u1ef9 - Qu\\u1eadn 9 - TP. HCM<\\/p>\\r\\n\\r\\n<p>Email: niemtinviettelecom@gmail.com<\\/p>\\r\\n\\r\\n<p>Hotline: 090 324 6284<\\/p>\\r\\n\"}'),
(10, 'footer2', '{\"title\":\"Li\\u00ean k\\u1ebft nhanh\",\"content\":\"<ul>\\r\\n\\t<li><a href=\\\"#\\\">Ch\\u00ednh s\\u00e1ch mua h\\u00e0ng<\\/a><\\/li>\\r\\n\\t<li><a href=\\\"#\\\">Ph\\u01b0\\u01a1ng th\\u1ee9c thanh to\\u00e1n<\\/a><\\/li>\\r\\n\\t<li><a href=\\\"#\\\">H\\u01b0\\u1edbng d\\u1eabn \\u0111o size<\\/a><\\/li>\\r\\n\\t<li><a href=\\\"#\\\">H\\u01b0\\u1edbng d\\u1eabn b\\u1ea3o qu\\u1ea3n<\\/a><\\/li>\\r\\n<\\/ul>\\r\\n\"}'),
(11, 'footer3', '{\"title\":\"V\\u1ec0 CH\\u00daNG T\\u00d4I\",\"content\":\"<ul>\\r\\n\\t<li><a href=\\\"#\\\">Nh\\u1eabn nam<\\/a><\\/li>\\r\\n\\t<li><a href=\\\"#\\\">Nh\\u1eabn n\\u1eef&nbsp;<\\/a><\\/li>\\r\\n\\t<li><a href=\\\"#\\\">D\\u00e2y chuy\\u1ec1n<\\/a><\\/li>\\r\\n\\t<li><a href=\\\"#\\\">Ph\\u1ee5 ki\\u1ec7n<\\/a><\\/li>\\r\\n<\\/ul>\\r\\n\"}'),
(12, 'footer4', '{\"title\":\"FANPAGE\",\"content\":\"\"}'),
(14, 'emailnhan', 'vietqmax@gmail.com'),
(15, 'social', '{\"facebook\":\"\",\"id_facebook\":\"#\",\"youtube\":\"\",\"zalo\":\"#\",\"skype\":\"#\",\"linkedin\":\"#\",\"twitter\":\"https:\\/\\/www.facebook.com\\/tuvan.iweb247.vn\\/\",\"instagram\":\"\"}'),
(16, 'copyright', '<p style=\"text-align: center;\">Design by <a href=\"http://vienthongntv.com\">NI???M TIN VI???T</a></p>\r\n'),
(17, 'script_head', ''),
(18, 'script_body', ''),
(19, 'script_footer', ''),
(35, 'seo', '{\"title\":\"TRANG CH\\u1ee6\",\"description\":\"TRANG CH\\u1ee6\",\"keyword\":\"TRANG CH\\u1ee6\",\"image_link\":\"\"}'),
(151, 'sidebar', 'TIN M???I NH???T'),
(36, 'seo_contact', '{\"title\":\"LI\\u00caN H\\u1ec6\",\"description\":\"LI\\u00caN H\\u1ec6\",\"keyword\":\"LI\\u00caN H\\u1ec6\",\"image_link\":\"\"}'),
(37, 'content_contact', '{\"title\":\"LI\\u00caN H\\u1ec6\",\"info\":\"<h2>C\\u00d4NG TY TNHH TM &amp; DV NI\\u1ec0M TIN VI\\u1ec6T<\\/h2>\\r\\n\\r\\n<p><strong>\\u0110\\u1ecba ch\\u1ec9:<\\/strong> 811 Nguy\\u1ec5n Xi\\u1ec3n - Ph\\u01b0\\u1eddng Long Th\\u1ea1nh M\\u1ef9 - Qu\\u1eadn 9 - TP. HCM<\\/p>\\r\\n\\r\\n<p><strong>Hotline:<\\/strong> (028) 37305058 - 090 324 6284<\\/p>\\r\\n\\r\\n<p><strong>Email:<\\/strong> niemtinviettelecom@gmail.com<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<h2><b>TH\\u00d4NG TIN LI\\u00caN H\\u00ca\\u0323<\\/b><\\/h2>\\r\\n\",\"success\":\"<p>C\\u1ea3m \\u01a1n b\\u1ea1n \\u0111\\u00e3 g\\u1eedi th\\u00f4ng tin&nbsp;li\\u00ean h\\u1ec7!<\\/p>\\r\\n\"}'),
(38, 'nganhang', '<p>X</p>\r\n'),
(39, 'cartdone', '<p>C???m ??n Qu?? kh??ch ???? ?????t h??ng t??? Shop, Shop s??? li??n h??? v???i Qu?? kh??ch ngay sau khi nh???n ???????c ????n h??ng!</p>\r\n'),
(115, 'slogan', 'Xin ch??o Qu?? kh??ch!'),
(152, 'visit', '{\"online\":\"0\",\"day\":\"0\",\"week\":\"0\",\"month\":\"0\",\"total\":\"0\"}'),
(153, 'sort_catalog', 'numAsc'),
(154, 'sort_catalog_new', 'numAsc'),
(155, 'sort_catalog_image', 'numAsc'),
(156, 'sort_catalog_service', 'numAsc'),
(157, 'sort_products', 'timerDesc'),
(158, 'sort_news', 'timerDesc'),
(159, 'sort_images', 'timerAsc'),
(160, 'sort_services', 'timerAsc'),
(161, 'pagination_catalog', '10'),
(162, 'pagination_catalog_new', '10'),
(163, 'pagination_catalog_image', '1'),
(164, 'pagination_catalog_service', '3'),
(165, 'limit_catalog', '20'),
(166, 'limit_catalog_new', '10'),
(167, 'limit_catalog_image', '3'),
(168, 'limit_catalog_service', '4'),
(169, 'check_css', 'off'),
(170, 'emailorder', 'vietqmax@gmail.com'),
(184, 'homeProduct2', '{\"title\":\"C\\u00c2Y \\u0110\\u1ed8C L\\u1ea0 NH\\u1eacP KH\\u1ea8U\",\"intro\":\"\"}'),
(186, 'homeAbout', '{\"img\":\"\\/uploads\\/images\\/background-about.webp\",\"title\":\"V\\u1ec0 CH\\u00daNG T\\u00d4I\",\"link\":\"#\",\"video\":\"https:\\/\\/www.youtube.com\\/embed\\/pTIN6-pLeds\",\"content\":\"<p>V\\u1edbi \\u0111am m\\u00ea v\\u00e0 kinh nghi\\u1ec7m l\\u00e2u n\\u0103m v\\u1ec1 gi\\u1ed1ng c\\u00e2y tr\\u1ed3ng, nh\\u00e0 v\\u01b0\\u1eddn Kh\\u00e1nh V\\u00f5 t\\u1ef1 tin s\\u1ebd \\u0111em l\\u1ea1i s\\u1ef1 h\\u00e0i l\\u00f2ng cho qu\\u00fd kh\\u00e1ch h\\u00e0ng v\\u1edbi c\\u00e1c lo\\u1ea1i c\\u00e2y c\\u1ea3nh v\\u00e0 c\\u00e2y qu\\u00fd hi\\u1ebfm. Ngo\\u00e0i Nho Th\\u00e2n G\\u1ed7, nh\\u00e0 v\\u01b0\\u1eddn Kh\\u00e1nh V\\u00f5 c\\u00f2n c\\u00f3 c\\u00e2y Cherry, c\\u00e2y V\\u00fa S\\u1eefa Ho\\u00e0ng Kim \\u0111\\u00e3 v\\u00e0 \\u0111ang ra tr\\u00e1i. Kh\\u00f4ng ch\\u1ec9 cung c\\u1ea5p c\\u00e2y tr\\u1ed3ng, nh\\u00e0 v\\u01b0\\u1eddn Kh\\u00e1nh V\\u00f5 c\\u00f2n cung c\\u1ea5p th\\u00eam cho kh\\u00e1ch h\\u00e0ng v\\u1ec1 c\\u00e1ch th\\u1ee9c, kinh nghi\\u1ec7m ch\\u0103m s\\u00f3c \\u0111\\u1ec3 c\\u00e2y sinh tr\\u01b0\\u1edfng v\\u00e0 ph\\u00e1t tri\\u1ec3n t\\u1ed1t nh\\u1ea5t.<\\/p>\\r\\n\\r\\n<p>V\\u1edbi \\u0111am m\\u00ea v\\u00e0 kinh nghi\\u1ec7m l\\u00e2u n\\u0103m v\\u1ec1 gi\\u1ed1ng c\\u00e2y tr\\u1ed3ng, nh\\u00e0 v\\u01b0\\u1eddn Kh\\u00e1nh V\\u00f5 t\\u1ef1 tin s\\u1ebd \\u0111em l\\u1ea1i s\\u1ef1 h\\u00e0i l\\u00f2ng cho qu\\u00fd kh\\u00e1ch h\\u00e0ng v\\u1edbi c\\u00e1c lo\\u1ea1i c\\u00e2y c\\u1ea3nh v\\u00e0 c\\u00e2y qu\\u00fd hi\\u1ebfm. Ngo\\u00e0i Nho Th\\u00e2n G\\u1ed7, nh\\u00e0 v\\u01b0\\u1eddn Kh\\u00e1nh V\\u00f5 c\\u00f2n c\\u00f3 c\\u00e2y Cherry, c\\u00e2y V\\u00fa S\\u1eefa Ho\\u00e0ng Kim \\u0111\\u00e3 v\\u00e0 \\u0111ang ra tr\\u00e1i. Kh\\u00f4ng ch\\u1ec9 cung c\\u1ea5p c\\u00e2y tr\\u1ed3ng, nh\\u00e0 v\\u01b0\\u1eddn Kh\\u00e1nh V\\u00f5 c\\u00f2n cung c\\u1ea5p th\\u00eam cho kh\\u00e1ch h\\u00e0ng v\\u1ec1 c\\u00e1ch th\\u1ee9c, kinh nghi\\u1ec7m ch\\u0103m s\\u00f3c \\u0111\\u1ec3 c\\u00e2y sinh tr\\u01b0\\u1edfng v\\u00e0 ph\\u00e1t tri\\u1ec3n t\\u1ed1t nh\\u1ea5t.<\\/p>\\r\\n\\r\\n<p>V\\u1edbi \\u0111am m\\u00ea v\\u00e0 kinh nghi\\u1ec7m l\\u00e2u n\\u0103m v\\u1ec1 gi\\u1ed1ng c\\u00e2y tr\\u1ed3ng, nh\\u00e0 v\\u01b0\\u1eddn Kh\\u00e1nh V\\u00f5 t\\u1ef1 tin s\\u1ebd \\u0111em l\\u1ea1i s\\u1ef1 h\\u00e0i l\\u00f2ng cho qu\\u00fd kh\\u00e1ch h\\u00e0ng v\\u1edbi c\\u00e1c lo\\u1ea1i c\\u00e2y c\\u1ea3nh v\\u00e0 c\\u00e2y qu\\u00fd hi\\u1ebfm. Ngo\\u00e0i Nho Th\\u00e2n G\\u1ed7, nh\\u00e0 v\\u01b0\\u1eddn Kh\\u00e1nh V\\u00f5 c\\u00f2n c\\u00f3 c\\u00e2y Cherry, c\\u00e2y V\\u00fa S\\u1eefa Ho\\u00e0ng Kim \\u0111\\u00e3 v\\u00e0 \\u0111ang ra tr\\u00e1i. Kh\\u00f4ng ch\\u1ec9 cung c\\u1ea5p c\\u00e2y tr\\u1ed3ng, nh\\u00e0 v\\u01b0\\u1eddn Kh\\u00e1nh V\\u00f5 c\\u00f2n cung c\\u1ea5p th\\u00eam cho kh\\u00e1ch h\\u00e0ng v\\u1ec1 c\\u00e1ch th\\u1ee9c, kinh nghi\\u1ec7m ch\\u0103m s\\u00f3c \\u0111\\u1ec3 c\\u00e2y sinh tr\\u01b0\\u1edfng v\\u00e0 ph\\u00e1t tri\\u1ec3n t\\u1ed1t nh\\u1ea5t.<\\/p>\\r\\n\\r\\n<p>V\\u1edbi \\u0111am m\\u00ea v\\u00e0 kinh nghi\\u1ec7m l\\u00e2u n\\u0103m v\\u1ec1 gi\\u1ed1ng c\\u00e2y tr\\u1ed3ng, nh\\u00e0 v\\u01b0\\u1eddn Kh\\u00e1nh V\\u00f5 t\\u1ef1 tin s\\u1ebd \\u0111em l\\u1ea1i s\\u1ef1 h\\u00e0i l\\u00f2ng cho qu\\u00fd kh\\u00e1ch h\\u00e0ng v\\u1edbi c\\u00e1c lo\\u1ea1i c\\u00e2y c\\u1ea3nh v\\u00e0 c\\u00e2y qu\\u00fd hi\\u1ebfm. Ngo\\u00e0i Nho Th\\u00e2n G\\u1ed7, nh\\u00e0 v\\u01b0\\u1eddn Kh\\u00e1nh V\\u00f5 c\\u00f2n c\\u00f3 c\\u00e2y Cherry, c\\u00e2y V\\u00fa S\\u1eefa Ho\\u00e0ng Kim \\u0111\\u00e3 v\\u00e0 \\u0111ang ra tr\\u00e1i. Kh\\u00f4ng ch\\u1ec9 cung c\\u1ea5p c\\u00e2y tr\\u1ed3ng, nh\\u00e0 v\\u01b0\\u1eddn Kh\\u00e1nh V\\u00f5 c\\u00f2n cung c\\u1ea5p th\\u00eam cho kh\\u00e1ch h\\u00e0ng v\\u1ec1 c\\u00e1ch th\\u1ee9c, kinh nghi\\u1ec7m ch\\u0103m s\\u00f3c \\u0111\\u1ec3 c\\u00e2y sinh tr\\u01b0\\u1edfng v\\u00e0 ph\\u00e1t tri\\u1ec3n t\\u1ed1t nh\\u1ea5t.<\\/p>\\r\\n\\r\\n<p>V\\u1edbi \\u0111am m\\u00ea v\\u00e0 kinh nghi\\u1ec7m l\\u00e2u n\\u0103m v\\u1ec1 gi\\u1ed1ng c\\u00e2y tr\\u1ed3ng, nh\\u00e0 v\\u01b0\\u1eddn Kh\\u00e1nh V\\u00f5 t\\u1ef1 tin s\\u1ebd \\u0111em l\\u1ea1i s\\u1ef1 h\\u00e0i l\\u00f2ng cho qu\\u00fd kh\\u00e1ch h\\u00e0ng v\\u1edbi c\\u00e1c lo\\u1ea1i c\\u00e2y c\\u1ea3nh v\\u00e0 c\\u00e2y qu\\u00fd hi\\u1ebfm. Ngo\\u00e0i Nho Th\\u00e2n G\\u1ed7, nh\\u00e0 v\\u01b0\\u1eddn Kh\\u00e1nh V\\u00f5 c\\u00f2n c\\u00f3 c\\u00e2y Cherry, c\\u00e2y V\\u00fa S\\u1eefa Ho\\u00e0ng Kim \\u0111\\u00e3 v\\u00e0 \\u0111ang ra tr\\u00e1i. Kh\\u00f4ng ch\\u1ec9 cung c\\u1ea5p c\\u00e2y tr\\u1ed3ng, nh\\u00e0 v\\u01b0\\u1eddn Kh\\u00e1nh V\\u00f5 c\\u00f2n cung c\\u1ea5p th\\u00eam cho kh\\u00e1ch h\\u00e0ng v\\u1ec1 c\\u00e1ch th\\u1ee9c, kinh nghi\\u1ec7m ch\\u0103m s\\u00f3c \\u0111\\u1ec3 c\\u00e2y sinh tr\\u01b0\\u1edfng v\\u00e0 ph\\u00e1t tri\\u1ec3n t\\u1ed1t nh\\u1ea5t.<\\/p>\\r\\n<p>V\\u1edbi \\u0111am m\\u00ea v\\u00e0 kinh nghi\\u1ec7m l\\u00e2u n\\u0103m v\\u1ec1 gi\\u1ed1ng c\\u00e2y tr\\u1ed3ng, nh\\u00e0 v\\u01b0\\u1eddn Kh\\u00e1nh V\\u00f5 t\\u1ef1 tin s\\u1ebd \\u0111em l\\u1ea1i s\\u1ef1 h\\u00e0i l\\u00f2ng cho qu\\u00fd kh\\u00e1ch h\\u00e0ng v\\u1edbi c\\u00e1c lo\\u1ea1i c\\u00e2y c\\u1ea3nh v\\u00e0 c\\u00e2y qu\\u00fd hi\\u1ebfm. Ngo\\u00e0i Nho Th\\u00e2n G\\u1ed7, nh\\u00e0 v\\u01b0\\u1eddn Kh\\u00e1nh V\\u00f5 c\\u00f2n c\\u00f3 c\\u00e2y Cherry, c\\u00e2y V\\u00fa S\\u1eefa Ho\\u00e0ng Kim \\u0111\\u00e3 v\\u00e0 \\u0111ang ra tr\\u00e1i. Kh\\u00f4ng ch\\u1ec9 cung c\\u1ea5p c\\u00e2y tr\\u1ed3ng, nh\\u00e0 v\\u01b0\\u1eddn Kh\\u00e1nh V\\u00f5 c\\u00f2n cung c\\u1ea5p th\\u00eam cho kh\\u00e1ch h\\u00e0ng v\\u1ec1 c\\u00e1ch th\\u1ee9c, kinh nghi\\u1ec7m ch\\u0103m s\\u00f3c \\u0111\\u1ec3 c\\u00e2y sinh tr\\u01b0\\u1edfng v\\u00e0 ph\\u00e1t tri\\u1ec3n t\\u1ed1t nh\\u1ea5t.<\\/p>\\r\\n<p>V\\u1edbi \\u0111am m\\u00ea v\\u00e0 kinh nghi\\u1ec7m l\\u00e2u n\\u0103m v\\u1ec1 gi\\u1ed1ng c\\u00e2y tr\\u1ed3ng, nh\\u00e0 v\\u01b0\\u1eddn Kh\\u00e1nh V\\u00f5 t\\u1ef1 tin s\\u1ebd \\u0111em l\\u1ea1i s\\u1ef1 h\\u00e0i l\\u00f2ng cho qu\\u00fd kh\\u00e1ch h\\u00e0ng v\\u1edbi c\\u00e1c lo\\u1ea1i c\\u00e2y c\\u1ea3nh v\\u00e0 c\\u00e2y qu\\u00fd hi\\u1ebfm. Ngo\\u00e0i Nho Th\\u00e2n G\\u1ed7, nh\\u00e0 v\\u01b0\\u1eddn Kh\\u00e1nh V\\u00f5 c\\u00f2n c\\u00f3 c\\u00e2y Cherry, c\\u00e2y V\\u00fa S\\u1eefa Ho\\u00e0ng Kim \\u0111\\u00e3 v\\u00e0 \\u0111ang ra tr\\u00e1i. Kh\\u00f4ng ch\\u1ec9 cung c\\u1ea5p c\\u00e2y tr\\u1ed3ng, nh\\u00e0 v\\u01b0\\u1eddn Kh\\u00e1nh V\\u00f5 c\\u00f2n cung c\\u1ea5p th\\u00eam cho kh\\u00e1ch h\\u00e0ng v\\u1ec1 c\\u00e1ch th\\u1ee9c, kinh nghi\\u1ec7m ch\\u0103m s\\u00f3c \\u0111\\u1ec3 c\\u00e2y sinh tr\\u01b0\\u1edfng v\\u00e0 ph\\u00e1t tri\\u1ec3n t\\u1ed1t nh\\u1ea5t.<\\/p>\\r\\n\"}'),
(178, 'homeProduct1', '{\"title\":\"NHO TH\\u00c2N G\\u1ed6 VIP\",\"intro\":\"\"}');

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_link_mobile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slide`
--

INSERT INTO `slide` (`id`, `name`, `image_link`, `image_link_mobile`, `link`, `intro`, `sort_order`, `status`, `created`, `updated`) VALUES
(1, 'Slide 1', '/uploads/images/slide_1.jpg', '', '', '', 0, 1, 1619668983, 1619668983),
(2, 'Slide 2', '/uploads/images/slide-2.webp', '', '', '', 0, 1, 1619668994, 1619668994);

-- --------------------------------------------------------

--
-- Table structure for table `supportonline`
--

CREATE TABLE `supportonline` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `chucdanh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_seo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tagsproduct`
--

CREATE TABLE `tagsproduct` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_seo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tagsproduct_products`
--

CREATE TABLE `tagsproduct_products` (
  `tag_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tags_news`
--

CREATE TABLE `tags_news` (
  `tag_id` int(11) NOT NULL,
  `new_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `other_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `other_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `other_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `other_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_mst` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `ship` int(11) NOT NULL,
  `payment` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `updated` int(11) NOT NULL,
  `note_admin` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `status`, `user_id`, `user_name`, `user_email`, `user_phone`, `user_address`, `other_name`, `other_email`, `other_phone`, `other_address`, `company_name`, `company_email`, `company_address`, `company_mst`, `amount`, `ship`, `payment`, `message`, `created`, `updated`, `note_admin`) VALUES
(1, 1, 0, 'Hu???nh Vi???t', 'vietqmax@gmail.com', '0703519795', 'H??? Ch?? Minh', '', '', '', '', '', '', '', '', 1800000, 0, 'COD', '', 1619330488, 0, ''),
(2, 1, 0, 'asrfsadf', '', '23423423434', 'dfg', '', '', '', '', '', '', '', '', 2450000, 0, 'COD', '', 1619331114, 0, ''),
(3, 1, 0, 'Hu???nh Vi???t', 'vietqmax@gmail.com', '0703519795', 'H??? Ch?? Minh', '', '', '', '', '', '', '', '', 2450000, 0, 'COD', '', 1619331173, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `user_online`
--

CREATE TABLE `user_online` (
  `session` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_group`
--
ALTER TABLE `admin_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`),
  ADD UNIQUE KEY `url_2` (`url`),
  ADD KEY `url_3` (`url`);

--
-- Indexes for table `catalog_image`
--
ALTER TABLE `catalog_image`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `catalog_new`
--
ALTER TABLE `catalog_new`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `catalog_service`
--
ALTER TABLE `catalog_service`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_email`
--
ALTER TABLE `contact_email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_footer`
--
ALTER TABLE `contact_footer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_phone`
--
ALTER TABLE `contact_phone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `header_link`
--
ALTER TABLE `header_link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);
ALTER TABLE `news` ADD FULLTEXT KEY `title` (`name`);

--
-- Indexes for table `notlink`
--
ALTER TABLE `notlink`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`),
  ADD UNIQUE KEY `code` (`code`);
ALTER TABLE `products` ADD FULLTEXT KEY `name` (`name`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `setup`
--
ALTER TABLE `setup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `col` (`col`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supportonline`
--
ALTER TABLE `supportonline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `tagsproduct`
--
ALTER TABLE `tagsproduct`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `admin_group`
--
ALTER TABLE `admin_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `catalog_image`
--
ALTER TABLE `catalog_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalog_new`
--
ALTER TABLE `catalog_new`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `catalog_service`
--
ALTER TABLE `catalog_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_email`
--
ALTER TABLE `contact_email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_footer`
--
ALTER TABLE `contact_footer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_phone`
--
ALTER TABLE `contact_phone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `header_link`
--
ALTER TABLE `header_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notlink`
--
ALTER TABLE `notlink`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setup`
--
ALTER TABLE `setup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `supportonline`
--
ALTER TABLE `supportonline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tagsproduct`
--
ALTER TABLE `tagsproduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
