-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Mer 08 Juin 2016 à 11:12
-- Version du serveur: 5.5.49
-- Version de PHP: 5.3.10-1ubuntu3.22

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `s0007`
--

-- --------------------------------------------------------

--
-- Structure de la table `sm_address`
--

CREATE TABLE IF NOT EXISTS `sm_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_affiliate`
--

CREATE TABLE IF NOT EXISTS `sm_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_affiliate_activity`
--

CREATE TABLE IF NOT EXISTS `sm_affiliate_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_affiliate_login`
--

CREATE TABLE IF NOT EXISTS `sm_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`affiliate_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `sm_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_api`
--

CREATE TABLE IF NOT EXISTS `sm_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `password` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `sm_api`
--

INSERT INTO `sm_api` (`api_id`, `username`, `firstname`, `lastname`, `password`, `status`, `date_added`, `date_modified`) VALUES
(1, 'NUYuLodpXT8oCJzS0fhrDNDcXo0oBn32rgoPoIGVk0rPsdaiwXtY7YlTB2faIoZU', '', '', 'DFwH9AkXpuSMRL2Mjnxbu6ChgdDkIDyJSBxWNO7xmCvhsQNNOQu2Y2VJ5bcGAyFWZVp9T0MkbrHQBsakwQjq5KgHLxuAv7O5YBa8R0TuJtVVNifWMnQ1U0jdUf4RYdP2PFDVHMSSsIbyRudefYzam3fNVl763XJM8hjFz6KNK5aoNUSApgRWvUTTOF17Qn53kV6NaD4ffFR1BSA3sBkpxH9x95oWfRj8EhMs3hgKrmAcsmlJn4wVrShonJTInSFa', 1, '2015-10-09 16:18:28', '2015-10-09 16:18:28');

-- --------------------------------------------------------

--
-- Structure de la table `sm_attribute`
--

CREATE TABLE IF NOT EXISTS `sm_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `sm_attribute`
--

INSERT INTO `sm_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Structure de la table `sm_attribute_description`
--

CREATE TABLE IF NOT EXISTS `sm_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sm_attribute_description`
--

INSERT INTO `sm_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(3, 1, 'Clockspeed'),
(1, 2, 'Description'),
(2, 2, 'No. of Cores'),
(4, 2, 'test 1'),
(5, 2, 'test 2'),
(6, 2, 'test 3'),
(7, 2, 'test 4'),
(8, 2, 'test 5'),
(9, 2, 'test 6'),
(10, 2, 'test 7'),
(11, 2, 'test 8'),
(3, 2, 'Clockspeed');

-- --------------------------------------------------------

--
-- Structure de la table `sm_attribute_group`
--

CREATE TABLE IF NOT EXISTS `sm_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `sm_attribute_group`
--

INSERT INTO `sm_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Structure de la table `sm_attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `sm_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sm_attribute_group_description`
--

INSERT INTO `sm_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor'),
(3, 2, 'Memory'),
(4, 2, 'Technical'),
(5, 2, 'Motherboard'),
(6, 2, 'Processor');

-- --------------------------------------------------------

--
-- Structure de la table `sm_banner`
--

CREATE TABLE IF NOT EXISTS `sm_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `sm_banner`
--

INSERT INTO `sm_banner` (`banner_id`, `name`, `status`) VALUES
(7, 'Home Page Slideshow', 1);

-- --------------------------------------------------------

--
-- Structure de la table `sm_banner_image`
--

CREATE TABLE IF NOT EXISTS `sm_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `starDate` int(11) DEFAULT '0',
  `endDate` int(11) DEFAULT '0',
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=323 ;

--
-- Contenu de la table `sm_banner_image`
--

INSERT INTO `sm_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`, `sort_order`, `starDate`, `endDate`) VALUES
(322, 7, '', 'catalog/hitas/banners/slide3.jpg', 3, 0, 0),
(321, 7, '', 'catalog/hitas/banners/slide2.jpg', 2, 0, 0),
(320, 7, '', 'catalog/hitas/banners/slide1.jpg', 1, 0, 0),
(319, 7, '', 'catalog/hitas/banners/slide0.jpg', 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `sm_banner_image_description`
--

CREATE TABLE IF NOT EXISTS `sm_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sm_banner_image_description`
--

INSERT INTO `sm_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(322, 2, 7, 'Hitas'),
(322, 1, 7, 'Hitas'),
(321, 2, 7, 'Hitas'),
(321, 1, 7, 'Hitas'),
(320, 2, 7, 'Hitas'),
(320, 1, 7, 'Hitas'),
(319, 2, 7, 'Hitas'),
(319, 1, 7, 'Hitas');

-- --------------------------------------------------------

--
-- Structure de la table `sm_category`
--

CREATE TABLE IF NOT EXISTS `sm_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- Contenu de la table `sm_category`
--

INSERT INTO `sm_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(25, '', 0, 1, 1, 3, 1, '2009-01-31 01:04:25', '2011-05-30 12:14:55'),
(27, '', 20, 0, 0, 2, 1, '2009-01-31 01:55:34', '2010-08-22 06:32:15'),
(20, 'catalog/demo/compaq_presario.jpg', 0, 1, 1, 1, 1, '2009-01-05 21:49:43', '2011-07-16 02:14:42'),
(24, '', 0, 1, 1, 5, 1, '2009-01-20 02:36:26', '2011-05-30 12:15:18'),
(18, 'catalog/demo/hp_2.jpg', 0, 1, 0, 2, 1, '2009-01-05 21:49:15', '2011-05-30 12:13:55'),
(17, '', 0, 1, 1, 4, 1, '2009-01-03 21:08:57', '2011-05-30 12:15:11'),
(28, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:12', '2010-08-22 06:32:46'),
(26, '', 20, 0, 0, 1, 1, '2009-01-31 01:55:14', '2010-08-22 06:31:45'),
(29, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:37', '2010-08-22 06:32:39'),
(30, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:59', '2010-08-22 06:33:00'),
(31, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:24', '2010-08-22 06:33:06'),
(32, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:34', '2010-08-22 06:33:12'),
(33, '', 0, 1, 1, 6, 1, '2009-02-03 14:17:55', '2011-05-30 12:15:25'),
(34, 'catalog/demo/ipod_touch_4.jpg', 0, 1, 4, 7, 1, '2009-02-03 14:18:11', '2011-05-30 12:15:31'),
(35, '', 28, 0, 0, 0, 1, '2010-09-17 10:06:48', '2010-09-18 14:02:42'),
(36, '', 28, 0, 0, 0, 1, '2010-09-17 10:07:13', '2010-09-18 14:02:55'),
(37, '', 34, 0, 0, 0, 1, '2010-09-18 14:03:39', '2011-04-22 01:55:08'),
(38, '', 34, 0, 0, 0, 1, '2010-09-18 14:03:51', '2010-09-18 14:03:51'),
(39, '', 34, 0, 0, 0, 1, '2010-09-18 14:04:17', '2011-04-22 01:55:20'),
(40, '', 34, 0, 0, 0, 1, '2010-09-18 14:05:36', '2010-09-18 14:05:36'),
(41, '', 34, 0, 0, 0, 1, '2010-09-18 14:05:49', '2011-04-22 01:55:30'),
(42, '', 34, 0, 0, 0, 1, '2010-09-18 14:06:34', '2010-11-07 20:31:04'),
(43, '', 34, 0, 0, 0, 1, '2010-09-18 14:06:49', '2011-04-22 01:55:40'),
(44, '', 34, 0, 0, 0, 1, '2010-09-21 15:39:21', '2010-11-07 20:30:55'),
(45, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:16', '2011-04-26 08:52:11'),
(46, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:31', '2011-04-26 08:52:23'),
(47, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:16', '2010-11-07 11:13:16'),
(48, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:33', '2010-11-07 11:13:33'),
(49, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:04', '2010-11-07 11:14:04'),
(50, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:23', '2011-04-22 01:16:01'),
(51, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:38', '2011-04-22 01:16:13'),
(52, '', 34, 0, 0, 0, 1, '2010-11-07 11:16:09', '2011-04-22 01:54:57'),
(53, '', 34, 0, 0, 0, 1, '2010-11-07 11:28:53', '2011-04-22 01:14:36'),
(54, '', 34, 0, 0, 0, 1, '2010-11-07 11:29:16', '2011-04-22 01:16:50'),
(55, '', 34, 0, 0, 0, 1, '2010-11-08 10:31:32', '2010-11-08 10:31:32'),
(56, '', 34, 0, 0, 0, 1, '2010-11-08 10:31:50', '2011-04-22 01:16:37'),
(57, '', 0, 1, 1, 3, 1, '2011-04-26 08:53:16', '2011-05-30 12:15:05'),
(58, '', 52, 0, 0, 0, 1, '2011-05-08 13:44:16', '2011-05-08 13:44:16');

-- --------------------------------------------------------

--
-- Structure de la table `sm_category_description`
--

CREATE TABLE IF NOT EXISTS `sm_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sm_category_description`
--

INSERT INTO `sm_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(28, 1, 'Monitors', '', '', '', ''),
(33, 1, 'Cameras', '', '', '', ''),
(32, 1, 'Web Cameras', '', '', '', ''),
(31, 1, 'Scanners', '', '', '', ''),
(30, 1, 'Printers', '', '', '', ''),
(29, 1, 'Mice and Trackballs', '', '', '', ''),
(27, 1, 'Mac', '', '', '', ''),
(26, 1, 'PC', '', '', '', ''),
(17, 1, 'Software', '', '', '', ''),
(25, 1, 'Components', '', '', '', ''),
(24, 1, 'Phones &amp; PDAs', '', '', '', ''),
(20, 1, 'Desktops', '&lt;p&gt;\r\n	Example of category description text&lt;/p&gt;\r\n', '', 'Example of category description', ''),
(35, 1, 'test 1', '', '', '', ''),
(36, 1, 'test 2', '', '', '', ''),
(37, 1, 'test 5', '', '', '', ''),
(38, 1, 'test 4', '', '', '', ''),
(39, 1, 'test 6', '', '', '', ''),
(40, 1, 'test 7', '', '', '', ''),
(41, 1, 'test 8', '', '', '', ''),
(42, 1, 'test 9', '', '', '', ''),
(43, 1, 'test 11', '', '', '', ''),
(34, 1, 'MP3 Players', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', '', '', ''),
(18, 1, 'Laptops &amp; Notebooks', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', '', '', ''),
(44, 1, 'test 12', '', '', '', ''),
(45, 1, 'Windows', '', '', '', ''),
(46, 1, 'Macs', '', '', '', ''),
(47, 1, 'test 15', '', '', '', ''),
(48, 1, 'test 16', '', '', '', ''),
(49, 1, 'test 17', '', '', '', ''),
(50, 1, 'test 18', '', '', '', ''),
(51, 1, 'test 19', '', '', '', ''),
(52, 1, 'test 20', '', '', '', ''),
(53, 1, 'test 21', '', '', '', ''),
(54, 1, 'test 22', '', '', '', ''),
(55, 1, 'test 23', '', '', '', ''),
(56, 1, 'test 24', '', '', '', ''),
(57, 1, 'Tablets', '', '', '', ''),
(58, 1, 'test 25', '', '', '', ''),
(28, 2, 'Monitors', '', '', '', ''),
(33, 2, 'Cameras', '', '', '', ''),
(32, 2, 'Web Cameras', '', '', '', ''),
(31, 2, 'Scanners', '', '', '', ''),
(30, 2, 'Printers', '', '', '', ''),
(29, 2, 'Mice and Trackballs', '', '', '', ''),
(27, 2, 'Mac', '', '', '', ''),
(26, 2, 'PC', '', '', '', ''),
(17, 2, 'Software', '', '', '', ''),
(25, 2, 'Components', '', '', '', ''),
(24, 2, 'Phones &amp; PDAs', '', '', '', ''),
(20, 2, 'Desktops', '&lt;p&gt;\r\n	Example of category description text&lt;/p&gt;\r\n', '', 'Example of category description', ''),
(35, 2, 'test 1', '', '', '', ''),
(36, 2, 'test 2', '', '', '', ''),
(37, 2, 'test 5', '', '', '', ''),
(38, 2, 'test 4', '', '', '', ''),
(39, 2, 'test 6', '', '', '', ''),
(40, 2, 'test 7', '', '', '', ''),
(41, 2, 'test 8', '', '', '', ''),
(42, 2, 'test 9', '', '', '', ''),
(43, 2, 'test 11', '', '', '', ''),
(34, 2, 'MP3 Players', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', '', '', ''),
(18, 2, 'Laptops &amp; Notebooks', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', '', '', ''),
(44, 2, 'test 12', '', '', '', ''),
(45, 2, 'Windows', '', '', '', ''),
(46, 2, 'Macs', '', '', '', ''),
(47, 2, 'test 15', '', '', '', ''),
(48, 2, 'test 16', '', '', '', ''),
(49, 2, 'test 17', '', '', '', ''),
(50, 2, 'test 18', '', '', '', ''),
(51, 2, 'test 19', '', '', '', ''),
(52, 2, 'test 20', '', '', '', ''),
(53, 2, 'test 21', '', '', '', ''),
(54, 2, 'test 22', '', '', '', ''),
(55, 2, 'test 23', '', '', '', ''),
(56, 2, 'test 24', '', '', '', ''),
(57, 2, 'Tablets', '', '', '', ''),
(58, 2, 'test 25', '', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `sm_category_filter`
--

CREATE TABLE IF NOT EXISTS `sm_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sm_category_path`
--

CREATE TABLE IF NOT EXISTS `sm_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sm_category_path`
--

INSERT INTO `sm_category_path` (`category_id`, `path_id`, `level`) VALUES
(25, 25, 0),
(28, 25, 0),
(28, 28, 1),
(35, 25, 0),
(35, 28, 1),
(35, 35, 2),
(36, 25, 0),
(36, 28, 1),
(36, 36, 2),
(29, 25, 0),
(29, 29, 1),
(30, 25, 0),
(30, 30, 1),
(31, 25, 0),
(31, 31, 1),
(32, 25, 0),
(32, 32, 1),
(20, 20, 0),
(27, 20, 0),
(27, 27, 1),
(26, 20, 0),
(26, 26, 1),
(24, 24, 0),
(18, 18, 0),
(45, 18, 0),
(45, 45, 1),
(46, 18, 0),
(46, 46, 1),
(17, 17, 0),
(33, 33, 0),
(34, 34, 0),
(37, 34, 0),
(37, 37, 1),
(38, 34, 0),
(38, 38, 1),
(39, 34, 0),
(39, 39, 1),
(40, 34, 0),
(40, 40, 1),
(41, 34, 0),
(41, 41, 1),
(42, 34, 0),
(42, 42, 1),
(43, 34, 0),
(43, 43, 1),
(44, 34, 0),
(44, 44, 1),
(47, 34, 0),
(47, 47, 1),
(48, 34, 0),
(48, 48, 1),
(49, 34, 0),
(49, 49, 1),
(50, 34, 0),
(50, 50, 1),
(51, 34, 0),
(51, 51, 1),
(52, 34, 0),
(52, 52, 1),
(58, 34, 0),
(58, 52, 1),
(58, 58, 2),
(53, 34, 0),
(53, 53, 1),
(54, 34, 0),
(54, 54, 1),
(55, 34, 0),
(55, 55, 1),
(56, 34, 0),
(56, 56, 1),
(57, 57, 0);

-- --------------------------------------------------------

--
-- Structure de la table `sm_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `sm_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sm_category_to_store`
--

CREATE TABLE IF NOT EXISTS `sm_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sm_category_to_store`
--

INSERT INTO `sm_category_to_store` (`category_id`, `store_id`) VALUES
(17, 0),
(18, 0),
(20, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0);

-- --------------------------------------------------------

--
-- Structure de la table `sm_country`
--

CREATE TABLE IF NOT EXISTS `sm_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=258 ;

--
-- Contenu de la table `sm_country`
--

INSERT INTO `sm_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'Korea, Republic of', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1),
(252, 'Ascension Island (British)', 'AC', 'ASC', '', 0, 1),
(253, 'Kosovo, Republic of', 'XK', 'UNK', '', 0, 1),
(254, 'Isle of Man', 'IM', 'IMN', '', 0, 1),
(255, 'Tristan da Cunha', 'TA', 'SHN', '', 0, 1),
(256, 'Guernsey', 'GG', 'GGY', '', 0, 1),
(257, 'Jersey', 'JE', 'JEY', '', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `sm_coupon`
--

CREATE TABLE IF NOT EXISTS `sm_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `sm_coupon`
--

INSERT INTO `sm_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', 10.0000, 0, 0, 0.0000, '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', 0.0000, 0, 1, 100.0000, '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', 10.0000, 0, 0, 10.0000, '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Structure de la table `sm_coupon_category`
--

CREATE TABLE IF NOT EXISTS `sm_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sm_coupon_history`
--

CREATE TABLE IF NOT EXISTS `sm_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_coupon_product`
--

CREATE TABLE IF NOT EXISTS `sm_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_currency`
--

CREATE TABLE IF NOT EXISTS `sm_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `sm_currency`
--

INSERT INTO `sm_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Pound Sterling', 'GBP', '£', '', '2', 0.65060002, 1, '2015-10-09 11:20:44'),
(2, 'US Dollar', 'USD', '$', '', '2', 1.00000000, 1, '2015-10-09 11:23:19'),
(3, 'Euro', 'EUR', '', '€', '2', 0.88270003, 1, '2015-10-09 11:20:44');

-- --------------------------------------------------------

--
-- Structure de la table `sm_customer`
--

CREATE TABLE IF NOT EXISTS `sm_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_code` varchar(255) DEFAULT NULL,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `date_birth` datetime DEFAULT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `ma_thue` varchar(255) DEFAULT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_off` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0:new user , 1: active Pin 2: active money 3: active user',
  `history_status` tinyint(1) NOT NULL,
  `num_off` tinyint(4) DEFAULT NULL,
  `type_off` tinyint(4) DEFAULT '0',
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `cmnd` varchar(255) NOT NULL,
  `date_cmnd` datetime DEFAULT NULL,
  `address_cmnd` varchar(255) DEFAULT NULL,
  `account_bank` varchar(255) NOT NULL,
  `address_bank` varchar(255) NOT NULL,
  `address_cus` text NOT NULL,
  `note` text NOT NULL,
  `img_profile` text,
  `username` varchar(255) NOT NULL,
  `p_node` int(11) DEFAULT '0',
  `country_id` int(10) NOT NULL,
  `transaction_password` varchar(250) NOT NULL,
  `ping` int(11) NOT NULL,
  `wallet` varchar(255) NOT NULL,
  `returning_time` tinyint(1) NOT NULL COMMENT '1: 1_month , 2: 2_month, 3: 3_month; 4:4_month',
  `date_return_money` datetime NOT NULL,
  `count_s_pd` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=355 ;

--
-- Contenu de la table `sm_customer`
--

INSERT INTO `sm_customer` (`customer_id`, `customer_code`, `customer_group_id`, `store_id`, `firstname`, `lastname`, `date_birth`, `email`, `telephone`, `fax`, `ma_thue`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `custom_field`, `ip`, `date_off`, `status`, `history_status`, `num_off`, `type_off`, `approved`, `safe`, `token`, `date_added`, `cmnd`, `date_cmnd`, `address_cmnd`, `account_bank`, `address_bank`, `address_cus`, `note`, `img_profile`, `username`, `p_node`, `country_id`, `transaction_password`, `ping`, `wallet`, `returning_time`, `date_return_money`, `count_s_pd`) VALUES
(97, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84976525823', '', NULL, '57c28c66b68d1dbea1f175b26062e64ea264b206', 'c60b96115', 'a:0:{}', '', 0, 0, '', '171.253.4.26', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '034080001686', NULL, NULL, '', '', '', '', NULL, 'annaminh', 53, 230, '351d376753fb069273f4642a26aedb981a93c992', 0, '', 4, '2016-09-30 14:13:26', 0),
(98, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84909890447', '', NULL, '987f33b352e87d66577d65d3348d42b549fdc362', 'fd3a8e969', 'a:0:{}', '', 0, 0, '', '42.116.229.148', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '320897531', NULL, NULL, '', '', '', '', NULL, 'trinhvanthanhsg76', 48, 230, '987f33b352e87d66577d65d3348d42b549fdc362', 0, '', 4, '2016-09-30 14:16:56', 0),
(96, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84935189423', '', NULL, '8afe2cbff9d3dca6a12cc0d896eee96444c9bd46', '718991691', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '301013742', NULL, NULL, '', '', '', '', NULL, 'Nguyễn Thị Cẩm Linh', 48, 230, '8afe2cbff9d3dca6a12cc0d896eee96444c9bd46', 0, '', 4, '2016-09-30 14:06:16', 0),
(93, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84981428657', '', NULL, 'd736c0f2070e49326644eaa83d6b60b5cc2e7af5', '4e043dc50', 'a:0:{}', '', 0, 0, '', '113.163.101.65', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '272029497', NULL, NULL, '', '', '', '', NULL, 'ninhmac', 91, 230, 'd736c0f2070e49326644eaa83d6b60b5cc2e7af5', 0, '', 4, '2016-09-30 12:27:18', 0),
(94, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84932798867', '', NULL, '593c10699a059d5bfa56718ed06838f324170dd4', '56198f70f', 'a:0:{}', '', 0, 0, '', '42.118.205.104', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '024598953', NULL, NULL, '', '', '', '', NULL, 'myanh', 68, 230, '593c10699a059d5bfa56718ed06838f324170dd4', 1, '', 4, '2016-09-30 12:30:53', 0),
(92, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84906600544', '', NULL, '2d2640ac8a78962578333ade428d46806e7e45e2', '9dc1d3a23', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 2, 0, NULL, 0, 0, 0, '', '2016-06-06 11:56:15', '280902398', NULL, NULL, '', '', '', '', NULL, 'loinguyen', 68, 230, '2d2640ac8a78962578333ade428d46806e7e45e2', 6, '', 4, '2016-09-30 12:22:44', 0),
(91, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84969262840', '', NULL, 'b1f82f07ccb6a51640fa61baeeeb03d35b2b5fa7', 'bce5e5b2f', 'a:0:{}', '', 0, 0, '', '115.73.236.3', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '221283014', NULL, NULL, '', '', '', '', NULL, 'register', 48, 230, 'b1f82f07ccb6a51640fa61baeeeb03d35b2b5fa7', 0, '', 4, '2016-09-30 12:16:41', 0),
(89, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84937386146', '', NULL, '901d9bf7ad255149fc8376a6fc86c3af1e4faa03', '8bb50c988', 'a:0:{}', '', 0, 0, '', '14.183.117.197', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '172735715', NULL, NULL, '', '', '', '', NULL, 'dientyphu', 87, 230, '901d9bf7ad255149fc8376a6fc86c3af1e4faa03', 0, '', 4, '2016-09-30 10:52:56', 0),
(90, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84963544328', '', NULL, '4bec360977ac78946018193fa4d6e066a4bd15ec', '4a39cfef9', 'a:0:{}', '', 0, 0, '', '171.253.5.220', NULL, 4, 0, NULL, 0, 0, 0, '', '2016-06-06 13:25:37', '030081001064', NULL, NULL, '', '', '', '', 'http://member.s0007.club/system/upload/90_IMG_20160606_130919.jpg.c8ebf4ca5a8d657cb43455599809b7a4', 'KheNguyen', 45, 230, '701c623705b3ba9e484a053a59773a55c1e4b94d', 8, '1CZv1TXADAjGiqmxzDjG8219agmJ1ydukp', 4, '2016-09-30 10:56:01', 1),
(88, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84964197179', '', NULL, '36c287b5bbfb129cecda54534d337172056f4eac', '49b68e44c', 'a:0:{}', '', 0, 0, '', '113.183.19.138', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '135379407', NULL, NULL, '', '', '', '', NULL, 'namvp', 87, 230, '36c287b5bbfb129cecda54534d337172056f4eac', 0, '', 4, '2016-09-30 10:25:18', 0),
(95, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0968095386', '', NULL, '6bdc7bd02b5b1f5a1ae256110308948a59dbfec5', '5eba01b8a', 'a:0:{}', '', 0, 0, '', '171.253.16.254', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '030180001231', NULL, NULL, '', '', '', '', NULL, 'Yenhoavp', 90, 230, '6bdc7bd02b5b1f5a1ae256110308948a59dbfec5', 0, '', 4, '2016-09-30 13:37:11', 0),
(87, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84915470815', '', NULL, '3722c7efb439e819a19c1636f4a0dbd599f80f9c', '0fd3f69cd', 'a:0:{}', '', 0, 0, '', '58.187.97.17', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '023181351', NULL, NULL, '', '', '', '', NULL, 'hp68', 73, 230, '3722c7efb439e819a19c1636f4a0dbd599f80f9c', 25, '', 4, '2016-09-30 09:47:13', 0),
(86, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+841226152935', '', NULL, '12980e248fd9b6801056548b9617ee825b22d12e', '1a31e733a', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 4, 0, NULL, 0, 0, 0, '', '2016-06-06 14:22:36', '024144348', NULL, NULL, '', '', '', '', 'http://member.s0007.club/system/upload/86_IMG_20160606_142043.jpg.536032b90fe29fa8b1f58c883548047f', 'bichnhungq10', 84, 230, '12980e248fd9b6801056548b9617ee825b22d12e', 1, '1H2hsi5qu9c17grdqwXRKcgD48W49UBiSd', 4, '2016-09-29 18:02:47', 0),
(85, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84939379639', '', NULL, '3c22e618830cdb895d62aeb55ff8195a05a0482d', '6c896a8c9', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '311478702', NULL, NULL, '', '', '', '', NULL, 'vanvinhmt', 83, 230, '3c22e618830cdb895d62aeb55ff8195a05a0482d', 0, '', 4, '2016-09-29 18:00:55', 0),
(83, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84933422417', '', NULL, 'ee46912bb6b68dfe6b0fd2dc391c3bda860d84d0', '6a0966e39', 'a:0:{}', '', 0, 0, '', '14.161.17.5', NULL, 2, 1, NULL, 0, 0, 0, '', '2016-06-06 15:26:42', '311878333', NULL, NULL, '', '', '', '', NULL, 'truc1987', 82, 230, 'ee46912bb6b68dfe6b0fd2dc391c3bda860d84d0', 1, '', 4, '2016-09-29 17:56:14', 0),
(84, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+841256135888', '', NULL, '9e8b5fb51dd7ed474c7648414fa067bcbb037671', 'fc6772163', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 3, 0, NULL, 0, 0, 0, '', '2016-06-06 14:38:45', '025340016', NULL, NULL, '', '', '', '', 'http://member.s0007.club/system/upload/84_$500.jpg.893ae37f63ad3aed46221a7d8c5b6189', 'tuananh1991', 83, 230, '21d913d2522ab818cb2d8f6e65050b84a77a96d7', 1, '', 4, '2016-09-29 17:59:31', 0),
(82, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84984760363', '', NULL, '0a84d354bfc21c37b28c980b4de8b80bf7305acd', 'a87487749', 'a:0:{}', '', 0, 0, '', '116.100.159.40', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '141761591', NULL, NULL, '', '', '', '', NULL, 'truongnamdh', 64, 230, '0a84d354bfc21c37b28c980b4de8b80bf7305acd', 0, '', 4, '2016-09-29 17:51:42', 0),
(81, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84946937766', '', NULL, '8e9d99b64404df14053dafdfbad5b354cee28a2a', 'fd8a76c24', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '240448470', NULL, NULL, '', '', '', '', NULL, 'duynhan74', 67, 230, '8e9d99b64404df14053dafdfbad5b354cee28a2a', 0, '', 4, '2016-09-29 17:47:07', 0),
(80, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84981986911', '', NULL, 'dc445a3add487353a6408e3fc0336087f0aa3cb5', 'c5a6d565d', 'a:0:{}', '', 0, 0, '', '14.167.107.56', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '211423200', NULL, NULL, '', '', '', '', NULL, 'dinhthai72', 67, 230, 'dc445a3add487353a6408e3fc0336087f0aa3cb5', 0, '', 4, '2016-09-29 17:28:41', 0),
(79, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+841212340340', '', NULL, '2aa344bb4756aa3d1ed6c9a5c6333ab59b46df3b', 'ff57c0d6c', 'a:0:{}', '', 0, 0, '', '118.68.37.25', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '271781995', NULL, NULL, '', '', '', '', NULL, 'nguyenduy', 71, 230, '2aa344bb4756aa3d1ed6c9a5c6333ab59b46df3b', 0, '', 4, '2016-09-29 17:13:31', 0),
(78, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84978503937', '', NULL, 'ce5beceb3d1a9a7d5d5ac275ddbe815724b0f794', 'ce06ab505', 'a:0:{}', '', 0, 0, '', '66.249.82.184', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '245001845', NULL, NULL, '', '', '', '', NULL, 'tiensy', 71, 230, 'ce5beceb3d1a9a7d5d5ac275ddbe815724b0f794', 0, '', 4, '2016-09-29 17:12:21', 0),
(77, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84963021456', '', NULL, 'ca416b2618f884bc85445ead5c83f1a4a536d4f9', 'af523c7a9', 'a:0:{}', '', 0, 0, '', '117.0.54.45', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '172738894', NULL, NULL, '', '', '', '', NULL, 'vanloihn', 67, 230, 'ca416b2618f884bc85445ead5c83f1a4a536d4f9', 0, '', 4, '2016-09-29 16:50:39', 0),
(76, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84946771288', '', NULL, '3d10d7cb7c7a0f059c2ded80837488d459fab110', 'd35d29811', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '371743409', NULL, NULL, '', '', '', '', NULL, 'menkg', 74, 230, '3d10d7cb7c7a0f059c2ded80837488d459fab110', 0, '', 4, '2016-09-29 16:21:24', 0),
(75, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+841626094798', '', NULL, '478736fc31abf0fbab886bb6d16e04f097ccd345', '59ef4eddc', 'a:0:{}', '', 0, 0, '', '14.184.119.128', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '371743254', NULL, NULL, '', '', '', '', NULL, 'benhokg', 74, 230, '478736fc31abf0fbab886bb6d16e04f097ccd345', 0, '', 4, '2016-09-29 16:18:41', 0),
(74, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84907577569', '', NULL, '24c6e2f235411af78a757e00a60a3f85314fc5db', '5b7ae6607', 'a:0:{}', '', 0, 0, '', '116.100.159.40', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '370909246', NULL, NULL, '', '', '', '', NULL, 'utkiengiang', 72, 230, '24c6e2f235411af78a757e00a60a3f85314fc5db', 0, '', 4, '2016-09-29 16:15:29', 0),
(73, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84984291393', '', NULL, '6d1bdf76bf31b721d7f8651ddf0deda9da027eba', '2e9c2974c', 'a:0:{}', '', 0, 0, '', '14.186.255.132', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '011654700', NULL, NULL, '', '', '', '', NULL, 'phongthuhn', 69, 230, '6d1bdf76bf31b721d7f8651ddf0deda9da027eba', 0, '', 4, '2016-09-29 16:13:31', 0),
(72, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84937172199', '', NULL, '466d3ff9a7a3d68c3fda211bcfad8f1c9f6afebb', '42e30b6e9', 'a:0:{}', '', 0, 0, '', '116.100.159.40', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '320971944', NULL, NULL, '', '', '', '', NULL, 'hodinh79', 65, 230, '466d3ff9a7a3d68c3fda211bcfad8f1c9f6afebb', 0, '', 4, '2016-09-29 16:07:56', 0),
(71, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84985770342', '', NULL, '1f6316d015c59a8516bfcac6c70721989768d617', 'b3f611a84', 'a:0:{}', '', 0, 0, '', '113.185.22.34', NULL, 4, 0, NULL, 0, 0, 0, '', '2016-06-06 13:26:25', '173892415', NULL, NULL, '', '', '', '', 'http://member.s0007.club/system/upload/71_IMG_20160606_131203.jpg.14c467032dd75ad9622ef032d7d1b90c', 'quangminhhn', 65, 230, '1f6316d015c59a8516bfcac6c70721989768d617', 21, '1LxZuoCBSzdtyaP9ZkQ2DBU2eDioRDxJt3', 4, '2016-09-29 16:04:00', 0),
(70, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84908461833', '', NULL, 'f07b78d956cf664749e4425cb149789b3c616bb6', 'ac4e73726', 'a:0:{}', '', 0, 0, '', '101.99.47.14', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '024876275', NULL, NULL, '', '', '', '', NULL, 'hungcuongeuro', 65, 230, 'f07b78d956cf664749e4425cb149789b3c616bb6', 0, '', 4, '2016-09-29 16:00:42', 0),
(69, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84963158098', '', NULL, 'afb14391e73de464d9cdd3bead98d14b5aaf8945', '304153175', 'a:0:{}', '', 0, 0, '', '113.185.8.232', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '100030295', NULL, NULL, '', '', '', '', NULL, 'quangtehn', 48, 230, 'afb14391e73de464d9cdd3bead98d14b5aaf8945', 0, '', 4, '2016-09-29 15:57:57', 0),
(68, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84938982179', '', NULL, 'e79692f6bb158c1d448d671424525238e534aff8', '481336598', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 4, 0, NULL, 0, 0, 0, '', '2016-06-06 13:27:29', '371273890', NULL, NULL, '', '', '', '', 'http://member.s0007.club/system/upload/68_image.png.ba8b1b295c39d32f0ed213b3da84d148', 'chithiensg', 48, 230, 'e79692f6bb158c1d448d671424525238e534aff8', 9, '13NauQrWArGr4zP4UmzB95tVdF9ZzPEzVj', 4, '2016-09-29 15:54:41', 0),
(67, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84973232567', '', NULL, '43ec8e8c8725781fe828af3b1d11a2026f763eb8', 'd3d51638c', 'a:0:{}', '', 0, 0, '', '64.233.173.121', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '290664475', NULL, NULL, '', '', '', '', NULL, 'tonypham', 64, 230, '43ec8e8c8725781fe828af3b1d11a2026f763eb8', 0, '', 4, '2016-09-29 15:48:28', 0),
(66, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84988917297', '', NULL, 'e61b4be237f8d8572c93552fea4dd537ddec1502', '1c8038df1', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 2, 0, NULL, 0, 0, 0, '', '2016-06-06 12:42:11', '271847392', NULL, NULL, '', '', '', '', NULL, 'manhtuan', 48, 230, 'e61b4be237f8d8572c93552fea4dd537ddec1502', 1, '', 4, '2016-09-29 15:37:45', 0),
(65, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84907593673', '', NULL, '52321099c9e6d0a0700fe89ad78c200bdb063677', '0a5b4604e', 'a:0:{}', '', 0, 0, '', '113.185.22.34', NULL, 2, 0, NULL, 0, 0, 0, '', '2016-06-06 12:01:19', '172211986', NULL, NULL, '', '', '', '', NULL, 'cuonghungbit', 48, 230, '52321099c9e6d0a0700fe89ad78c200bdb063677', 15, '', 4, '2016-09-29 15:35:52', 0),
(64, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84908461833', '', NULL, '484c45db89dd66d1f118711182e2c1dab494fa6c', 'b22c985c7', 'a:0:{}', '', 0, 0, '', '113.185.22.34', NULL, 4, 1, NULL, 0, 0, 0, '', '2016-06-06 13:47:51', '023596987', NULL, NULL, '', '', '', '', 'http://member.s0007.club/system/upload/64_IMG_20160606_132244.jpg.cc4d302d157f128bad729205d7510ef9', 'doanhnhantre', 48, 230, '484c45db89dd66d1f118711182e2c1dab494fa6c', 26, '1frui7S1J4d3GCVzsPfLU61GsjVE3vHUr', 4, '2016-09-29 15:33:28', 0),
(63, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0903790898', '', NULL, 'f292b7c1190873b49704b58ff78bd66250e26ddb', '177383d71', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '022771234', NULL, NULL, '', '', '', '', NULL, 'trần quang minh', 61, 230, '70a7a25294f382ee067273e0fa35cbd9363ac067', 0, '', 4, '2016-09-29 15:06:57', 0),
(62, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84906702269', '', NULL, '9f20368109dc9ddf928aed6af3a99b586ab9d862', '9ffa5739c', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '024972649', NULL, NULL, '', '', '', '', NULL, 'BANGTRINH', 49, 230, '9f20368109dc9ddf928aed6af3a99b586ab9d862', 0, '', 4, '2016-09-29 15:05:17', 0),
(60, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '1', '', NULL, 'a00cd62ae31f03902800f78e5a56f88fd3138872', '606a80be2', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '1', NULL, NULL, '', '', '', '', NULL, 'phucnguyen', 50, 15, 'a00cd62ae31f03902800f78e5a56f88fd3138872', 0, '', 1, '2016-06-29 13:58:36', 0),
(61, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84903780898', '', NULL, 'e47716634c2b20292b296260fb850bed37bbcb73', '521af5dcc', 'a:0:{}', '', 0, 0, '', '116.108.58.105', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '022771234', NULL, NULL, '', '', '', '', NULL, 'QuangMinh', 49, 230, 'e47716634c2b20292b296260fb850bed37bbcb73', 20, '', 4, '2016-09-29 14:53:38', 0),
(53, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84904783479', '', NULL, 'b55543c2c81b0edc942e8a52421943bfc314ab91', 'fcdce3de6', 'a:0:{}', '', 0, 0, '', '171.253.3.160', NULL, 2, 0, NULL, 0, 0, 0, '', '2016-06-06 11:53:48', '125076059', NULL, NULL, '', '', '', '', NULL, 'ThanhHai', 49, 230, 'b55543c2c81b0edc942e8a52421943bfc314ab91', 130, '', 4, '2016-09-29 13:17:32', 0),
(50, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84906381516', '', NULL, '76a5d785189e24567f3066b151faf4b34d765d71', 'ec53c861b', 'a:0:{}', '', 0, 0, '', '113.185.15.214', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '011854741', NULL, NULL, '', '', '', '', NULL, 'dunguyen', 45, 230, '76a5d785189e24567f3066b151faf4b34d765d71', 0, '', 4, '2016-09-29 12:52:16', 0),
(49, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84915437525', '', NULL, 'c74ded80ab4e401f5ea7bbec41db1d9533ba870a', '59bf08c91', 'a:0:{}', '', 0, 0, '', '115.79.62.72', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '272545903', NULL, NULL, '', '', '', '', NULL, 'minhtriet', 45, 230, 'c74ded80ab4e401f5ea7bbec41db1d9533ba870a', 0, '', 4, '2016-09-29 12:49:14', 0),
(48, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+841243663663', '', NULL, 'c725e8091dd02baf75e5ed0db1995782f86ef471', '0cec1ba4d', 'a:0:{}', '', 0, 0, '', '192.168.0.10', NULL, 4, 0, NULL, 0, 0, 0, '', '2016-06-07 08:21:16', '311766262', NULL, NULL, '', '', '', '', 'http://192.168.0.68/s007/system/upload/48_Screenshot_from_2016-05-23_09:23:59.png.58235e4274c1c88416e5f40fc18f2008', 'teamS0007', 45, 230, 'da2e94e3c4bc0e33835064ad33f62329935bd90f', 30, '', 4, '2016-09-29 12:10:01', 0),
(45, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+840976183818', '', NULL, '2d7d276a7ca4005fbc03429f4706003d3663766a', '65673d007', 'a:0:{}', '', 0, 0, '', '192.168.0.10', NULL, 4, 1, NULL, 0, 0, 0, '', '2016-06-07 08:11:09', '024732678', NULL, NULL, '', '', '', '', 'http://192.168.0.68/s007/system/upload/45_Screenshot_from_2016-05-23_09:23:59.png.661d2b0649aa4bc6b41a6df33a7b7d33', 'tunglam', 0, 15, '2d7d276a7ca4005fbc03429f4706003d3663766a', 19, '21412', 4, '2016-12-28 15:24:21', 0),
(99, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0937224829', '', NULL, 'b4d36dc5beb149e8c0aa81ece094206905980033', 'f5eb656aa', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '280904648', NULL, NULL, '', '', '', '', NULL, 'thuytrang16202', 48, 230, 'b4d36dc5beb149e8c0aa81ece094206905980033', 0, '', 4, '2016-09-30 14:22:39', 0),
(100, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84907908766', '', NULL, 'f8adc495427e9e727bbe6c8e6bd2fb39904e0844', 'e8e46e6b8', 'a:0:{}', '', 0, 0, '', '14.186.255.132', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '024893248', NULL, NULL, '', '', '', '', NULL, 'nguyenthixuanchau', 48, 230, 'f8adc495427e9e727bbe6c8e6bd2fb39904e0844', 0, '', 4, '2016-09-30 14:28:10', 0),
(101, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84946228655', '', NULL, 'cce234882cd81d194fbfbaa321a91c79cf0535ba', 'a98befbe6', 'a:0:{}', '', 0, 0, '', '116.99.153.115', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '191225750', NULL, NULL, '', '', '', '', NULL, 'phuongthao72', 53, 230, 'cce234882cd81d194fbfbaa321a91c79cf0535ba', 0, '', 4, '2016-09-30 14:31:41', 0),
(102, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+489969093833', '', NULL, '31341ac68510c57ea44310fb1ed8adcc4c5f5dcb', '5798f0de4', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '023749454', NULL, NULL, '', '', '', '', NULL, 'nguyenchien', 53, 230, '31341ac68510c57ea44310fb1ed8adcc4c5f5dcb', 0, '', 4, '2016-09-30 14:38:25', 0),
(103, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+4891236186', '', NULL, 'b1eb65ec9e8965fb2a71cd03d97087cb5ac62e12', 'c9891c0ec', 'a:0:{}', '', 0, 0, '', '171.253.4.26', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '034080001686', NULL, NULL, '', '', '', '', NULL, 'namtuan', 97, 230, 'b1eb65ec9e8965fb2a71cd03d97087cb5ac62e12', 0, '', 4, '2016-09-30 14:43:05', 0),
(104, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+4891236186', '', NULL, '42a209cf89a1d40079bbca1421a6e72053b584e7', '697308ab0', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '034080001686', NULL, NULL, '', '', '', '', NULL, '9999', 97, 230, '42a209cf89a1d40079bbca1421a6e72053b584e7', 0, '', 4, '2016-09-30 14:45:05', 0),
(105, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+4891236186', '', NULL, '5d164d2683a93eafb7ea60d9b80c5415d72683b2', 'cff3f0825', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '034080001686', NULL, NULL, '', '', '', '', NULL, '6666', 97, 230, '5d164d2683a93eafb7ea60d9b80c5415d72683b2', 0, '', 4, '2016-09-30 14:48:04', 0),
(106, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84976525823', '', NULL, '17c534a43640b4be70ca52c451062739ab2df8fa', '3c1a3ef01', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '034080001686', NULL, NULL, '', '', '', '', NULL, 'tuan68', 103, 230, '17c534a43640b4be70ca52c451062739ab2df8fa', 0, '', 4, '2016-09-30 14:55:09', 0),
(107, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84934068119', '', NULL, '5891b5de393ce4863a9e5811d776ee469d80f3c7', '89bf5961a', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '331507719', NULL, NULL, '', '', '', '', NULL, 'trung16112', 48, 230, '5891b5de393ce4863a9e5811d776ee469d80f3c7', 0, '', 4, '2016-09-30 15:00:06', 0),
(108, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84912933322', '', NULL, '1e3e5283f57b4959baa8bbabe53bb90e5e49086d', 'e76ea6f7b', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '034167001410', NULL, NULL, '', '', '', '', NULL, 'tuyettb', 103, 230, '1e3e5283f57b4959baa8bbabe53bb90e5e49086d', 0, '', 4, '2016-09-30 15:01:19', 0),
(109, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84938814114', '', NULL, '228ea690f128f16d0048bc1979083f5a6f4477b0', '13cbc43bc', 'a:0:{}', '', 0, 0, '', '14.161.36.41', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '271784761', NULL, NULL, '', '', '', '', NULL, 'tomle814114', 48, 230, '228ea690f128f16d0048bc1979083f5a6f4477b0', 0, '', 4, '2016-09-30 15:02:43', 0),
(110, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84906737125', '', NULL, 'a241b076cd7e087395aab1db2e60a2c0b1adce7e', 'cc3104562', 'a:0:{}', '', 0, 0, '', '116.99.241.212', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '212308469', NULL, NULL, '', '', '', '', NULL, 'vietthai22', 48, 230, 'a241b076cd7e087395aab1db2e60a2c0b1adce7e', 0, '', 4, '2016-09-30 15:05:48', 0),
(111, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84904824665', '', NULL, 'ae4d6cc9916c2194b3d832c27d06a2841511b111', '7a6bdc9f9', 'a:0:{}', '', 0, 0, '', '66.249.82.184', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '141761591', NULL, NULL, '', '', '', '', NULL, 'nambeo', 103, 230, 'ae4d6cc9916c2194b3d832c27d06a2841511b111', 0, '', 4, '2016-09-30 15:12:41', 0),
(112, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84909127419', '', NULL, '84231f84c65bcb04f9ce9da325f2383f7fb9bcbf', '367784aa5', 'a:0:{}', '', 0, 0, '', '1.55.198.58', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '271272468', NULL, NULL, '', '', '', '', NULL, 'bachtuyet0124', 48, 230, '84231f84c65bcb04f9ce9da325f2383f7fb9bcbf', 0, '', 4, '2016-09-30 15:38:45', 0),
(113, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84907910109', '', NULL, '23fc0e058622a36330c75e63ca1e967bb31911f3', 'a61e93aec', 'a:0:{}', '', 0, 0, '', '42.116.225.236', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '025386759', NULL, NULL, '', '', '', '', NULL, 'danbitcoin1609', 48, 230, '23fc0e058622a36330c75e63ca1e967bb31911f3', 0, '', 4, '2016-09-30 15:41:18', 0),
(114, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84988033283', '', NULL, '193b68a46f2b7eb71a94b738a278794bb535e5a3', 'b5742d90a', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '261137641', NULL, NULL, '', '', '', '', NULL, 'thanhthanh', 111, 230, '193b68a46f2b7eb71a94b738a278794bb535e5a3', 0, '', 4, '2016-09-30 15:49:53', 0),
(115, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84964197179', '', NULL, '42107fe66dd1403c277d39149b423afa945ca7ad', '7a3588e9e', 'a:0:{}', '', 0, 0, '', '14.189.147.147', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '135379407', NULL, NULL, '', '', '', '', NULL, 'dinhloi', 88, 230, '552c919f4bd7ddee2ecf72d9160bcfe3642226c8', 0, '', 4, '2016-09-30 22:42:10', 0),
(116, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84944629627', '', NULL, '6a49d042380c998a548541faeab859f5185cf957', '9a41e56ff', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '151169102', NULL, NULL, '', '', '', '', NULL, 'thanhquang', 115, 230, '6a49d042380c998a548541faeab859f5185cf957', 0, '', 4, '2016-09-30 22:46:43', 0),
(117, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84913823743', '', NULL, '0a18411b2e1de2dc85b9c8f2b77f0bd8673d2af7', 'd63bdf7d3', 'a:0:{}', '', 0, 0, '', '14.189.147.147', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '280991028', NULL, NULL, '', '', '', '', NULL, 'haidang', 115, 230, '0a18411b2e1de2dc85b9c8f2b77f0bd8673d2af7', 0, '', 4, '2016-09-30 22:51:37', 0),
(118, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84976477717', '', NULL, 'ff3b7ded85d26071c0dbdbdbd1826243e2c34e1b', 'c3e1d5958', 'a:0:{}', '', 0, 0, '', '113.185.22.56', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '151379442', NULL, NULL, '', '', '', '', NULL, 'luyenbn', 115, 230, 'ff3b7ded85d26071c0dbdbdbd1826243e2c34e1b', 0, '', 4, '2016-09-30 23:03:00', 0),
(119, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84989613628', '', NULL, '728f03783d0a0063465975eaa13278e09a5496a7', 'f74e819d7', 'a:0:{}', '', 0, 0, '', '14.189.147.147', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '132124900', NULL, NULL, '', '', '', '', NULL, 'thinhpt', 88, 230, '728f03783d0a0063465975eaa13278e09a5496a7', 0, '', 4, '2016-09-30 23:07:09', 0),
(120, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84963109773', '', NULL, '1b0167938d66ca62b3cdb0ed6e954d93748d2078', 'da27194c4', 'a:0:{}', '', 0, 0, '', '203.210.131.250', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '001080004977', NULL, NULL, '', '', '', '', NULL, 'manhtam', 88, 230, '1b0167938d66ca62b3cdb0ed6e954d93748d2078', 0, '', 4, '2016-09-30 23:09:09', 0),
(121, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84989613628', '', NULL, 'ca7527e61c36bdc091d6b114c420b46879363fad', '88281db8c', 'a:0:{}', '', 0, 0, '', '14.189.147.147', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '132124900', NULL, NULL, '', '', '', '', NULL, 'thinhpt1', 119, 230, 'ca7527e61c36bdc091d6b114c420b46879363fad', 0, '', 3, '2016-08-30 23:16:34', 0),
(122, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84989613628', '', NULL, 'f7b75b6ec070867b0e2ebf517a702bce19f3ce85', 'f87812faa', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '132124900', NULL, NULL, '', '', '', '', NULL, 'thinhpt2', 119, 230, 'f7b75b6ec070867b0e2ebf517a702bce19f3ce85', 0, '', 3, '2016-08-30 23:18:13', 0),
(123, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84976066953', '', NULL, 'd3f796f0757f7da086e79ad5ae90352a9d2232b4', '194d226f7', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '131047375', NULL, NULL, '', '', '', '', NULL, 'trunganhpt', 121, 230, 'd3f796f0757f7da086e79ad5ae90352a9d2232b4', 0, '', 3, '2016-08-30 23:23:14', 0),
(124, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84977931668', '', NULL, '97aacc72d3c225f846145651018a3580c3efe44d', 'aeafb4874', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '131080386', NULL, NULL, '', '', '', '', NULL, 'kimxuanpt', 121, 230, '97aacc72d3c225f846145651018a3580c3efe44d', 0, '', 3, '2016-08-30 23:26:14', 0),
(125, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84976477717', '', NULL, 'f44eb162f173821899323785be6601a78ed7b047', '396440c47', 'a:0:{}', '', 0, 0, '', '113.185.22.56', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '151379442', NULL, NULL, '', '', '', '', NULL, 'luyenbn1', 118, 230, 'f44eb162f173821899323785be6601a78ed7b047', 0, '', 4, '2016-09-30 23:29:19', 0),
(126, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84976477717', '', NULL, '20d14c2856beab7575e435f9828d036a0e6cbb92', 'cfc1b2f5f', 'a:0:{}', '', 0, 0, '', '113.183.19.138', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '151379442', NULL, NULL, '', '', '', '', NULL, 'lehuybn2', 118, 230, '20d14c2856beab7575e435f9828d036a0e6cbb92', 0, '', 4, '2016-09-30 23:30:36', 0),
(127, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84917437559', '', NULL, '9c4498f0bf832684019e66a463fdaa701e28df84', '8d8fd1f84', 'a:0:{}', '', 0, 0, '', '14.189.147.147', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '380608910', NULL, NULL, '', '', '', '', NULL, 'battung', 117, 230, '9c4498f0bf832684019e66a463fdaa701e28df84', 0, '', 4, '2016-09-30 23:34:53', 0),
(128, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84949114323', '', NULL, '4fdedfad8cebba34dd21fb6faca04bcbe926694a', '4f4c87383', 'a:0:{}', '', 0, 0, '', '113.183.19.138', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '271554085', NULL, NULL, '', '', '', '', NULL, 'ngocba', 117, 230, '4fdedfad8cebba34dd21fb6faca04bcbe926694a', 0, '', 4, '2016-09-30 23:37:19', 0),
(129, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84984615666', '', NULL, 'be653fbba31987bae629cc0823255941ad1426a1', '60b4c853c', 'a:0:{}', '', 0, 0, '', '14.189.147.147', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '125325673', NULL, NULL, '', '', '', '', NULL, 'thanhlam', 128, 230, 'be653fbba31987bae629cc0823255941ad1426a1', 0, '', 4, '2016-09-30 23:39:43', 0),
(130, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84984615666', '', NULL, '7cadc188dd8c9a3e203023e9657f811e8c796d53', '4ab5bee68', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '125325673', NULL, NULL, '', '', '', '', NULL, 'thanhlam1', 129, 230, '7cadc188dd8c9a3e203023e9657f811e8c796d53', 0, '', 4, '2016-09-30 23:41:44', 0),
(131, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84984615666', '', NULL, 'b506558f7d93c5f3bd589cbe81b2965128d99cef', 'ec9dc5f11', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '125325673', NULL, NULL, '', '', '', '', NULL, 'thanhlam2', 129, 230, 'b506558f7d93c5f3bd589cbe81b2965128d99cef', 0, '', 4, '2016-09-30 23:43:00', 0),
(132, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84907259130', '', NULL, '59ab2253d77a7821faf83acfd478607f60f55e15', 'f4031579d', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '024303678', NULL, NULL, '', '', '', '', NULL, 'minhnhat', 127, 230, '59ab2253d77a7821faf83acfd478607f60f55e15', 0, '', 4, '2016-09-30 23:45:40', 0),
(133, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84964528691', '', NULL, '25ab77db5517e870d2c64730eccf301b4312e107', '8b631e861', 'a:0:{}', '', 0, 0, '', '14.189.147.147', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '125763600', NULL, NULL, '', '', '', '', NULL, 'cuong', 125, 230, '25ab77db5517e870d2c64730eccf301b4312e107', 0, '', 4, '2016-09-30 23:50:11', 0),
(134, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84904565468', '', NULL, '9482f3e7ed55c0241d2792a4bb33d9b7ad89d055', '6a4e138c3', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '125101350', NULL, NULL, '', '', '', '', NULL, 'minhtuan', 125, 230, '9482f3e7ed55c0241d2792a4bb33d9b7ad89d055', 0, '', 4, '2016-09-30 23:53:46', 0),
(135, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84963956166', '', NULL, 'df64a087aa5a07d63e4d7acac3036840556caafb', 'aaeebd398', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '125638204', NULL, NULL, '', '', '', '', NULL, 'hoabn', 133, 230, 'df64a087aa5a07d63e4d7acac3036840556caafb', 0, '', 4, '2016-09-30 23:57:57', 0),
(136, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84989843458', '', NULL, '3edff02bfdb27f88392b0db6b6c36cdfff807bb1', 'd1ac975fc', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '125363446', NULL, NULL, '', '', '', '', NULL, 'thobn', 133, 230, '3edff02bfdb27f88392b0db6b6c36cdfff807bb1', 0, '', 4, '2016-09-30 00:00:23', 0),
(137, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84961318151', '', NULL, 'd82b8ff2ebfc75a9365f5d96b299a167ff2b598c', '828915c43', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '381146960', NULL, NULL, '', '', '', '', NULL, 'phuongcamau001', 48, 230, 'd82b8ff2ebfc75a9365f5d96b299a167ff2b598c', 0, '', 4, '2016-09-30 09:15:00', 0),
(138, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0909306372', '', NULL, '1a9925339cc62fa74f03d9d3ac1a31302a2a3e13', '870eaa416', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '023080535', NULL, NULL, '', '', '', '', NULL, 'vannam', 87, 230, '1a9925339cc62fa74f03d9d3ac1a31302a2a3e13', 0, '', 4, '2016-09-30 11:45:56', 0),
(139, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0946803286', '', NULL, '6337baaf42e03643cdd5e98feca070945616e236', '0b2f7e768', 'a:0:{}', '', 0, 0, '', '116.99.153.115', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '230732756', NULL, NULL, '', '', '', '', NULL, 'Dinhcanh', 101, 230, '6337baaf42e03643cdd5e98feca070945616e236', 0, '', 4, '2016-09-30 12:27:19', 0),
(140, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0939977889', '', NULL, 'eea78b5382668de2bb9b953fc2d0269d72fa08cb', '82e6dcb49', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '361644719', NULL, NULL, '', '', '', '', NULL, 'Quocduy', 101, 230, 'eea78b5382668de2bb9b953fc2d0269d72fa08cb', 0, '', 4, '2016-09-30 12:52:34', 0),
(141, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0901470608', '', NULL, '97a26bf514aa8181e91fed5854cbc4dc8c12f5f3', '04dc05b9e', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '225399655', NULL, NULL, '', '', '', '', NULL, 'Baoha', 101, 230, '97a26bf514aa8181e91fed5854cbc4dc8c12f5f3', 0, '', 4, '2016-09-30 12:55:05', 0),
(142, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84938334544', '', NULL, '56d84e286399fb0923ccdf6bf6c4948f1ab921b6', '7d1f863df', 'a:0:{}', '', 0, 0, '', '113.185.8.87', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '020213838', NULL, NULL, '', '', '', '', NULL, 'Vinhhien', 71, 230, '56d84e286399fb0923ccdf6bf6c4948f1ab921b6', 0, '', 4, '2016-09-30 14:13:25', 0),
(143, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84909460718', '', NULL, 'af44e00c19a5ae91f2e9ba530a10048fc3ee725e', 'e372aa3d0', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 2, 0, NULL, 0, 0, 0, '', '2016-06-06 12:05:08', '023013646', NULL, NULL, '', '', '', '', NULL, 'Lý Trung Lai', 70, 230, 'af44e00c19a5ae91f2e9ba530a10048fc3ee725e', 3, '', 4, '2016-09-30 15:25:13', 0),
(144, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84906798239', '', NULL, '46817e8fa3ad16001c9b41af363a1d5a6251b1d3', 'b6a3e10f0', 'a:0:{}', '', 0, 0, '', '27.75.251.248', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '271246388', NULL, NULL, '', '', '', '', NULL, 'ngocoanhdn', 70, 230, '46817e8fa3ad16001c9b41af363a1d5a6251b1d3', 0, '', 4, '2016-09-30 15:29:35', 0),
(145, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0985618800', '', NULL, '1a966519413a129230157156942dd099994cfec9', '3b5cdb299', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 4, 0, NULL, 0, 0, 0, '', '2016-06-06 13:25:01', '245344645', NULL, NULL, '', '', '', '', 'http://member.s0007.club/system/upload/145_888b0a05590ae50cf17acfdea7706754.jpg.28b7479992347a5720f7ef38d6b896dd', 'Letrung', 90, 230, '1a966519413a129230157156942dd099994cfec9', 2, '1tULDKTewm19juFbbzH1UQiYCDfe9W1TX', 4, '2016-09-30 15:30:08', 2),
(146, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84938636904', '', NULL, '9878797b9378169540b52c4a514ab2faf929b408', 'ad1738da0', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 2, 0, NULL, 0, 0, 0, '', '2016-06-06 12:12:38', '024900776', NULL, NULL, '', '', '', '', NULL, 'vancaosg', 143, 230, '9878797b9378169540b52c4a514ab2faf929b408', 1, '', 4, '2016-09-30 15:35:02', 0),
(147, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84916164759', '', NULL, 'c690c6e0365ebb7c2b977636bc69d3197dce9ecd', '9d1b20b4b', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 2, 0, NULL, 0, 0, 0, '', '2016-06-06 12:07:36', '022643464', NULL, NULL, '', '', '', '', NULL, 'thilanhsg', 143, 230, 'c690c6e0365ebb7c2b977636bc69d3197dce9ecd', 1, '', 4, '2016-09-30 15:38:10', 0),
(148, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84916802065', '', NULL, 'd7969ea749b2e785c1493a09e3dd139860b26e29', 'ead1d68fb', 'a:0:{}', '', 0, 0, '', '116.108.25.21', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '002795143', NULL, NULL, '', '', '', '', NULL, 'trieuphutre', 70, 230, 'd7969ea749b2e785c1493a09e3dd139860b26e29', 0, '', 4, '2016-09-30 15:43:55', 0),
(149, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84935157855', '', NULL, 'ee862cd2bb603ad0fa437b5984f851e1c3ec3f0d', '07068de2a', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '172160254', NULL, NULL, '', '', '', '', NULL, 'phamquangduansg', 48, 230, 'ee862cd2bb603ad0fa437b5984f851e1c3ec3f0d', 0, '', 4, '2016-09-30 15:57:38', 0),
(150, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84906800365', '', NULL, 'd60d3d25bd035d812672a340b4347769a08121ef', '931536b0a', 'a:0:{}', '', 0, 0, '', '216.177.128.152', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '025687867', NULL, NULL, '', '', '', '', NULL, 'trungnamdl', 100, 230, 'd60d3d25bd035d812672a340b4347769a08121ef', 0, '', 4, '2016-09-30 16:05:38', 0),
(151, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84984760363', '', NULL, 'a2bd1880a87f446c64ccf6bb3925e4eb961b41fa', 'c18a1635f', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '141761591', NULL, NULL, '', '', '', '', NULL, 'truongnam668', 70, 230, 'a2bd1880a87f446c64ccf6bb3925e4eb961b41fa', 0, '', 4, '2016-09-30 16:09:04', 0),
(152, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84903076548', '', NULL, '46f5153888a8f53ca115ee4eea3238a06e1a6367', 'ebe306192', 'a:0:{}', '', 0, 0, '', '14.186.255.132', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '112033040', NULL, NULL, '', '', '', '', NULL, 'bathanhn', 70, 230, '46f5153888a8f53ca115ee4eea3238a06e1a6367', 0, '', 4, '2016-09-30 16:10:38', 0),
(153, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84989221365', '', NULL, '28e1eb7e4260bb7b17194ef519406587de7d27a2', 'a7324f44f', 'a:0:{}', '', 0, 0, '', '14.186.255.132', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '022178506', NULL, NULL, '', '', '', '', NULL, 'kimloansg', 152, 230, '28e1eb7e4260bb7b17194ef519406587de7d27a2', 0, '', 4, '2016-09-30 16:42:33', 0),
(154, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84989221365', '', NULL, 'a20fa585948d50889448ca872b2da32bb812a01b', 'f50f176d0', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '022178506', NULL, NULL, '', '', '', '', NULL, 'kimloansg1', 153, 230, 'a20fa585948d50889448ca872b2da32bb812a01b', 0, '', 4, '2016-09-30 16:44:37', 0),
(155, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84989221365', '', NULL, '5e5ce3a4f38fd92078223ca8fc88b8a472343821', '2c1356a31', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '022178506', NULL, NULL, '', '', '', '', NULL, 'kimloansg2', 153, 230, '5e5ce3a4f38fd92078223ca8fc88b8a472343821', 0, '', 4, '2016-09-30 16:45:45', 0),
(156, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84903775161', '', NULL, '50dd2d4eac712e16a41e2efaccecffb3504f3116', 'dd41b1852', 'a:0:{}', '', 0, 0, '', '113.187.16.121', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '021060530', NULL, NULL, '', '', '', '', NULL, 'huynhmysg', 153, 230, '50dd2d4eac712e16a41e2efaccecffb3504f3116', 0, '', 4, '2016-09-30 18:06:37', 0),
(157, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84903775161', '', NULL, '9e07919ba30a75a5275995f4e5cde71345585fa1', '212a1c4e1', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '021060530', NULL, NULL, '', '', '', '', NULL, 'huynhmysg1', 156, 230, '9e07919ba30a75a5275995f4e5cde71345585fa1', 0, '', 4, '2016-09-30 18:10:55', 0),
(158, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84903775161', '', NULL, 'bd7a435e12421cebc525d654f37da3ed97312651', 'd55e2b611', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '021060530', NULL, NULL, '', '', '', '', NULL, 'huynhmysg2', 156, 230, 'bd7a435e12421cebc525d654f37da3ed97312651', 0, '', 4, '2016-09-30 18:12:02', 0),
(159, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84903775161', '', NULL, '6bde5b895d84661145cf9e80781764e940636f82', '943de32ab', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '021060530', NULL, NULL, '', '', '', '', NULL, 'huynhmysg3', 156, 230, '6bde5b895d84661145cf9e80781764e940636f82', 0, '', 4, '2016-09-30 18:13:08', 0),
(160, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84903775161', '', NULL, '035e5b10115578101215bbef9e3b7cd01e9a78b9', '8d2ac5ec2', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '021060530', NULL, NULL, '', '', '', '', NULL, 'huynhmysg4', 156, 230, '035e5b10115578101215bbef9e3b7cd01e9a78b9', 0, '', 4, '2016-09-30 18:15:01', 0),
(161, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+841686191228', '', NULL, '5ae9313144e6b591c08c30f30510bc41cde75b09', '35c507418', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '125424153', NULL, NULL, '', '', '', '', NULL, 'thuybn', 118, 230, '5ae9313144e6b591c08c30f30510bc41cde75b09', 0, '', 4, '2016-09-30 19:55:08', 0),
(162, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '01293183868', '', NULL, 'e59ab324607a87412362018f1aaf9acc7034797f', '6ee8b3146', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '017234765', NULL, NULL, '', '', '', '', NULL, 'haiyen', 45, 230, 'e59ab324607a87412362018f1aaf9acc7034797f', 0, '', 4, '2016-09-30 19:55:57', 0),
(163, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84981638368', '', NULL, '37717bda663900f32b8d0289dc41b831e0ecdace', 'ab6710a3e', 'a:0:{}', '', 0, 0, '', '27.66.129.59', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '121872958', NULL, NULL, '', '', '', '', NULL, 'xuanbg', 118, 230, '37717bda663900f32b8d0289dc41b831e0ecdace', 0, '', 4, '2016-09-30 19:59:23', 0),
(169, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84902358719', '', NULL, 'a91aaa16df55eebe6cf4bbf34baadd36e617af97', '6f4e2755b', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '271561597', NULL, NULL, '', '', '', '', NULL, 'dothithanhhai', 164, 230, 'a91aaa16df55eebe6cf4bbf34baadd36e617af97', 0, '', 4, '2016-10-01 12:40:37', 0),
(164, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84933133143', '', NULL, '76719e113f6d64d6aa63252daed428321ea06289', '545c5485e', 'a:0:{}', '', 0, 0, '', '66.249.82.131', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '240540940', NULL, NULL, '', '', '', '', NULL, 'hathanhtuan', 79, 230, '76719e113f6d64d6aa63252daed428321ea06289', 0, '', 4, '2016-10-01 12:07:52', 0),
(165, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84976176989', '', NULL, '2d1297228d18d80c38b969a3b7fab4229d50ff7a', '19f9726b6', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '173720713', NULL, NULL, '', '', '', '', NULL, 'Luongthithuy', 79, 230, '2d1297228d18d80c38b969a3b7fab4229d50ff7a', 0, '', 4, '2016-10-01 12:15:12', 0),
(166, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84974609752', '', NULL, 'a3750f66bbfad2d0f0ee3aaf422b5ee4f7546169', '5e3b929ac', 'a:0:{}', '', 0, 0, '', '27.75.150.72', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '271672349', NULL, NULL, '', '', '', '', NULL, 'nguyenphuoctinh', 79, 230, 'a3750f66bbfad2d0f0ee3aaf422b5ee4f7546169', 0, '', 4, '2016-10-01 12:19:46', 0),
(167, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+841217084635', '', NULL, 'ab7edbdb0bf018eec8903b49e4b76a0190e62724', '9fdac8d72', 'a:0:{}', '', 0, 0, '', '171.250.128.29', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '271551760', NULL, NULL, '', '', '', '', NULL, 'laituanphong', 164, 230, 'ab7edbdb0bf018eec8903b49e4b76a0190e62724', 0, '', 4, '2016-10-01 12:28:50', 0),
(168, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84909097168', '', NULL, '2db46432fb51a5e5171411b7e031d966ca14ba39', '4ee1cf55f', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '023733193', NULL, NULL, '', '', '', '', NULL, 'nguyenthuynga', 164, 230, '2db46432fb51a5e5171411b7e031d966ca14ba39', 0, '', 4, '2016-10-01 12:33:47', 0),
(170, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84976163287', '', NULL, '5078d7868b6fb476f3cb0435d25ab277e4812784', '94656689d', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '272135916', NULL, NULL, '', '', '', '', NULL, 'vothihang', 79, 230, '5078d7868b6fb476f3cb0435d25ab277e4812784', 0, '', 4, '2016-10-01 12:47:23', 0),
(171, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0977714246', '', NULL, 'bb9105b6273bfe7ff29dfe089bfc19a2a490d85d', '63b2504a6', 'a:0:{}', '', 0, 0, '', '64.233.173.1', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '135084718', NULL, NULL, '', '', '', '', NULL, 'Kimthu', 78, 230, 'bb9105b6273bfe7ff29dfe089bfc19a2a490d85d', 0, '', 4, '2016-10-01 12:47:40', 0),
(172, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84988670105', '', NULL, '98743e6cfaa9da51f4b06fe70b3d1077e7fc63f3', 'c39d8e56d', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '271926208', NULL, NULL, '', '', '', '', NULL, 'damvanhung', 79, 230, '98743e6cfaa9da51f4b06fe70b3d1077e7fc63f3', 0, '', 4, '2016-10-01 12:53:54', 0),
(173, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84937737100', '', NULL, 'ee51dc80b312096b44498ec9bc84bb8caf307bf3', '2cc544356', 'a:0:{}', '', 0, 0, '', '14.164.92.35', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '272096357', NULL, NULL, '', '', '', '', NULL, 'tranhoangsang', 167, 230, 'ee51dc80b312096b44498ec9bc84bb8caf307bf3', 0, '', 4, '2016-10-01 13:02:17', 0),
(174, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84915793366', '', NULL, 'bc78909abaa20c7e19a347db331eea04644aafd3', '972d3e60a', 'a:0:{}', '', 0, 0, '', '113.185.18.241', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '021580794', NULL, NULL, '', '', '', '', NULL, 'lethithanhhai', 71, 230, 'bc78909abaa20c7e19a347db331eea04644aafd3', 0, '', 4, '2016-10-01 13:10:37', 0),
(175, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84942287079', '', NULL, 'b1923f14c2588969e272ec630e23966526841e26', 'c767a78ee', 'a:0:{}', '', 0, 0, '', '64.233.173.1', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '271854805', NULL, NULL, '', '', '', '', NULL, 'vuxuanhieu', 71, 230, 'b1923f14c2588969e272ec630e23966526841e26', 0, '', 4, '2016-10-01 13:14:56', 0),
(176, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84911522666', '', NULL, '1b766461f8dde63588da49c0b9a21bfe391c0fb8', '78819b7fb', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '173663508', NULL, NULL, '', '', '', '', NULL, 'tranngocnguyen', 71, 230, '1b766461f8dde63588da49c0b9a21bfe391c0fb8', 0, '', 4, '2016-10-01 13:38:22', 0),
(177, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84948068027', '', NULL, '24e86f377625ece649c747cfaff9b2a60817bccb', 'b1da57cc8', 'a:0:{}', '', 0, 0, '', '113.185.5.202', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '230501376', NULL, NULL, '', '', '', '', NULL, 'nguyenducminh', 71, 230, '24e86f377625ece649c747cfaff9b2a60817bccb', 0, '', 4, '2016-10-01 13:45:50', 0),
(178, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84983603353', '', NULL, 'f9e9b2ef8d17ba2c0ee52c157ae3474824cb447b', 'cb83aa132', 'a:0:{}', '', 0, 0, '', '27.74.15.216', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '241124105', NULL, NULL, '', '', '', '', NULL, 'hoangvanhuan', 71, 230, 'f9e9b2ef8d17ba2c0ee52c157ae3474824cb447b', 0, '', 4, '2016-10-01 13:49:43', 0),
(179, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '01685302860', '', NULL, '2abf6ecda293baa1f49129e964d4aa0b57dab1e3', '8200d03bb', 'a:0:{}', '', 0, 0, '', '14.176.132.89', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '036092001764', NULL, NULL, '', '', '', '', NULL, 'dangtoan', 91, 230, '6b8190b06412ce60d790da3ecde9f676251a4e2f', 0, '', 4, '2016-10-01 15:57:40', 0),
(180, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84935675482', '', NULL, 'bdf5ded65deff8b578f73016c0fb515cf79d3d2e', 'e420a4c5e', 'a:0:{}', '', 0, 0, '', '1.52.32.1', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '024185835', NULL, NULL, '', '', '', '', NULL, 'nguyenthikimlien', 79, 230, 'bdf5ded65deff8b578f73016c0fb515cf79d3d2e', 0, '', 4, '2016-10-01 16:05:10', 0),
(181, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0938898303', '', NULL, '743af9284e0b0de16d2bd6be9fb884393f27f1e8', '82ebfc1f8', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '271987507', NULL, NULL, '', '', '', '', NULL, 'duyluan', 91, 230, 'd991cddd184dbb4eab72e3f24972f741253f83c3', 0, '', 4, '2016-10-01 16:07:02', 0),
(182, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84988240983', '', NULL, '6daee41e1df719bbfef102aa7c09f072da8c5f72', 'ce81c1bf3', 'a:0:{}', '', 0, 0, '', '113.187.17.95', NULL, 4, 0, NULL, 0, 0, 0, '', '2016-06-06 13:24:18', '111880598', NULL, NULL, '', '', '', '', 'http://member.s0007.club/system/upload/182_image.png.3c3026752bf2ee658fd0b4c7a4bb43f1', 'nguyenloi.lt', 68, 230, '6daee41e1df719bbfef102aa7c09f072da8c5f72', 4, '', 4, '2016-10-01 16:15:57', 0);
INSERT INTO `sm_customer` (`customer_id`, `customer_code`, `customer_group_id`, `store_id`, `firstname`, `lastname`, `date_birth`, `email`, `telephone`, `fax`, `ma_thue`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `custom_field`, `ip`, `date_off`, `status`, `history_status`, `num_off`, `type_off`, `approved`, `safe`, `token`, `date_added`, `cmnd`, `date_cmnd`, `address_cmnd`, `account_bank`, `address_bank`, `address_cus`, `note`, `img_profile`, `username`, `p_node`, `country_id`, `transaction_password`, `ping`, `wallet`, `returning_time`, `date_return_money`, `count_s_pd`) VALUES
(183, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84941341312', '', NULL, '434358792789f4e18195db1c7d24d00e685f35e0', '4b9447d01', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '381447644', NULL, NULL, '', '', '', '', NULL, 'hotrongtinh1989', 92, 230, '434358792789f4e18195db1c7d24d00e685f35e0', 0, '', 4, '2016-10-01 16:20:20', 0),
(184, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+841203200767', '', NULL, 'ea53bf36c49390155e2895a969449261e68a832d', 'd9b3a9a90', 'a:0:{}', '', 0, 0, '', '113.187.17.119', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '311946217', NULL, NULL, '', '', '', '', NULL, 'ngomysus', 86, 230, 'ea53bf36c49390155e2895a969449261e68a832d', 0, '', 4, '2016-10-01 16:25:59', 0),
(185, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84935189423', '', NULL, '5c9daea19abc2d481011735844e801539a05af0e', '566985582', 'a:0:{}', '', 0, 0, '', '113.187.16.108', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '301013742', NULL, NULL, '', '', '', '', NULL, 'camlinh68', 70, 230, '5c9daea19abc2d481011735844e801539a05af0e', 1, '', 4, '2016-10-01 16:56:20', 0),
(186, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84908673752', '', NULL, '252177faab941705ddb7e969e208a5de12695f41', 'e79e932f1', 'a:0:{}', '', 0, 0, '', '42.119.49.106', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '273672827', NULL, NULL, '', '', '', '', NULL, 'thanhphuvungtau', 185, 230, '252177faab941705ddb7e969e208a5de12695f41', 0, '', 4, '2016-10-01 16:57:49', 0),
(187, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0932254052', '', NULL, 'd0c2c2124f97524ac3d44e5215dc66d890bd1dea', '920599b70', 'a:0:{}', '', 0, 0, '', '221.121.1.27', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '270445881', NULL, NULL, '', '', '', '', NULL, 'thienchien', 91, 230, 'cda583837d7ae6febe45317ecf294cc39c7540a7', 0, '', 4, '2016-10-01 17:09:47', 0),
(188, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84908793485', '', NULL, '17b1e4ca2bb1b67f29a012a51d8c54700b9b6d63', 'b7d94e447', 'a:0:{}', '', 0, 0, '', '113.187.16.108', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '301480908', NULL, NULL, '', '', '', '', NULL, 'doanriem', 185, 230, '17b1e4ca2bb1b67f29a012a51d8c54700b9b6d63', 3, '', 4, '2016-10-01 17:10:01', 0),
(189, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84908793485', '', NULL, 'e5dc0eb4f9643d27bc25b86e352d498ab3498fcc', '023e7e161', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '301480908', NULL, NULL, '', '', '', '', NULL, 'doanriem1', 188, 230, 'e5dc0eb4f9643d27bc25b86e352d498ab3498fcc', 0, '', 4, '2016-10-01 17:12:17', 0),
(190, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84908793485', '', NULL, '0b10a27ba7fdcdd0b5ff7da21fed6fc1528d0e0a', '68cfd3537', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '301480908', NULL, NULL, '', '', '', '', NULL, 'doanriem2', 188, 230, '0b10a27ba7fdcdd0b5ff7da21fed6fc1528d0e0a', 0, '', 4, '2016-10-01 17:16:31', 0),
(191, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0901480269', '', NULL, 'd60655b00bad409fca5ef3fa4acd33ba2c5f19dc', 'a22eacb95', 'a:0:{}', '', 0, 0, '', '113.163.101.65', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '131612958', NULL, NULL, '', '', '', '', NULL, 'thongnhat', 91, 230, '44ce1da0b9893f37761fa80d4c3f394fb1667bc9', 0, '', 1, '2016-07-01 17:21:59', 0),
(192, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0935795040', '', NULL, '1b637c812a9a3888a3ec14651a5bdaa0a3f3bc6d', '12c28d01c', 'a:0:{}', '', 0, 0, '', '14.167.56.43', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '212727730', NULL, NULL, '', '', '', '', NULL, 'thuyhuong', 191, 230, '90d934ab75e87c9b08961ac747044434fd66b3e5', 0, '', 4, '2016-10-01 17:26:59', 0),
(194, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84934068119', '', NULL, '771624f3bcf9cbc16ca4f54f127a5b6b8a0a81e1', 'cd3c29eb2', 'a:0:{}', '', 0, 0, '', '27.75.16.114', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '331507719', NULL, NULL, '', '', '', '', NULL, 'thanhtrung88', 48, 230, '771624f3bcf9cbc16ca4f54f127a5b6b8a0a81e1', 0, '', 4, '2016-10-01 18:49:49', 0),
(193, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84976223342', '', NULL, '293030d1b19a2f103ea90f08b4161429dc48ae0a', '7b53ba5a5', 'a:0:{}', '', 0, 0, '', '113.185.22.80', NULL, 2, 0, NULL, 0, 0, 0, '', '2016-06-06 12:19:05', '186614980', NULL, NULL, '', '', '', '', NULL, 'daigiasaigon', 185, 230, '293030d1b19a2f103ea90f08b4161429dc48ae0a', 1, '', 4, '2016-10-01 17:43:35', 0),
(196, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+12063569916', '', NULL, '2c6e31edaa706e10f5ac2b1072e3b540ddb5ed26', '1e4c40e41', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '98104', NULL, NULL, '', '', '', '', NULL, 'tony tran', 45, 223, '2c6e31edaa706e10f5ac2b1072e3b540ddb5ed26', 0, '', 1, '2016-07-01 23:28:39', 0),
(195, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84903696619', '', NULL, 'ebe926b4aaabb629b06f51bf4cb2ac013940a889', 'df19cb5a7', 'a:0:{}', '', 0, 0, '', '1.55.203.248', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '168385257', NULL, NULL, '', '', '', '', NULL, 'trantu', 71, 230, 'b2db3d884af884c287bc99089a40cda232d010a1', 0, '', 4, '2016-10-01 22:55:41', 0),
(197, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+12063569916', '', NULL, 'c345d05563cf7aca4586e4ce96f3c8464866ff49', 'a2b6c48d8', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '98104', NULL, NULL, '', '', '', '', NULL, 'linda', 45, 223, 'c345d05563cf7aca4586e4ce96f3c8464866ff49', 0, '', 1, '2016-07-01 23:31:26', 0),
(198, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+12063569916', '', NULL, 'a5fb4dac676736e1a3df76cf2cbc2943eb06d863', '13957495a', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '98104', NULL, NULL, '', '', '', '', NULL, 'Diana', 45, 223, 'a5fb4dac676736e1a3df76cf2cbc2943eb06d863', 0, '', 1, '2016-07-01 23:34:08', 0),
(199, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0932254052', '', NULL, 'f2ed60254e1164cefb601d4c14b08d6c5ae28a78', 'f775fbb70', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '272440322', NULL, NULL, '', '', '', '', NULL, 'nguyen chien', 187, 230, 'f2ed60254e1164cefb601d4c14b08d6c5ae28a78', 0, '', 1, '2016-07-02 00:08:20', 0),
(200, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+841285685496', '', NULL, '1b74de2f0b4eff885927012e20c50b8de64b78b2', 'f660ba35a', 'a:0:{}', '', 0, 0, '', '113.185.18.192', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '270653532', NULL, NULL, '', '', '', '', NULL, 'lekimphung', 71, 230, '1b74de2f0b4eff885927012e20c50b8de64b78b2', 0, '', 4, '2016-10-02 02:45:01', 0),
(201, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+12065380293', '', NULL, 'c8e749816f5502dfbf07c30408bd541bafcb7f7c', '35d17c927', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '98104', NULL, NULL, '', '', '', '', NULL, 'tony', 45, 223, 'c8e749816f5502dfbf07c30408bd541bafcb7f7c', 0, '', 1, '2016-07-02 08:18:11', 0),
(202, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+12065380293', '', NULL, '07ffd75cf7951acf810c72952f77289d1c647cb0', 'f9e91c0e2', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '98104', NULL, NULL, '', '', '', '', NULL, 'Jenny', 45, 223, '07ffd75cf7951acf810c72952f77289d1c647cb0', 0, '', 1, '2016-07-02 08:25:06', 0),
(203, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+12065380293', '', NULL, 'f6e3c67bb85d1b2b01ec171699ad196b3e076611', 'c5d3501b7', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '98104', NULL, NULL, '', '', '', '', NULL, 'christ', 45, 223, 'f6e3c67bb85d1b2b01ec171699ad196b3e076611', 0, '', 1, '2016-07-02 08:27:40', 0),
(204, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+12065380293', '', NULL, 'f603d91d6a65c7bc486ec2c0c7d750de69843c1f', '8465af88e', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '98104', NULL, NULL, '', '', '', '', NULL, 'donald', 45, 223, 'f603d91d6a65c7bc486ec2c0c7d750de69843c1f', 0, '', 1, '2016-07-02 08:30:10', 0),
(205, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+12065380293', '', NULL, 'c4da86a7e752af0562593af84b244af4b63dd371', '3e09e5c1c', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '98104', NULL, NULL, '', '', '', '', NULL, 'Tracy', 45, 223, 'c4da86a7e752af0562593af84b244af4b63dd371', 0, '', 1, '2016-07-02 08:32:13', 0),
(206, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+12065380293', '', NULL, 'de99c70d410e8ff8addbdc4e571ab8970a80eba4', 'e3dccdc62', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '98104', NULL, NULL, '', '', '', '', NULL, 'Ruby', 45, 223, 'de99c70d410e8ff8addbdc4e571ab8970a80eba4', 0, '', 1, '2016-07-02 08:34:09', 0),
(207, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+12065380293', '', NULL, 'fff649b25ae054bf049a12fbbc2ce0ffa0297d7e', '10e44c28b', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '98104', NULL, NULL, '', '', '', '', NULL, 'Diamond', 45, 223, 'fff649b25ae054bf049a12fbbc2ce0ffa0297d7e', 0, '', 1, '2016-07-02 08:36:10', 0),
(208, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+12065380293', '', NULL, 'ab84a97b96ddaadb4f9753c252acb95aca4156ed', '3913cd3a3', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '98105', NULL, NULL, '', '', '', '', NULL, 'Cindy', 45, 223, 'ab84a97b96ddaadb4f9753c252acb95aca4156ed', 0, '', 1, '2016-07-02 08:39:30', 0),
(209, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+12065380293', '', NULL, 'c41f87e0ca11036129b4afc10205fc918894a8d8', 'f1424c9e1', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '98105', NULL, NULL, '', '', '', '', NULL, 'Monaco', 45, 223, 'c41f87e0ca11036129b4afc10205fc918894a8d8', 0, '', 1, '2016-07-02 08:41:28', 0),
(210, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+12065380293', '', NULL, '7443372085a349a8c121f8ed362dfb22524d0ebe', '286734b9b', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '98105', NULL, NULL, '', '', '', '', NULL, 'Tarif', 45, 223, '7443372085a349a8c121f8ed362dfb22524d0ebe', 0, '', 1, '2016-07-02 08:43:47', 0),
(211, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '097571337', '', NULL, '350569bb6568cc238c50d362d6ff5f17168abd8d', 'ece5bdfd0', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '272428145', NULL, NULL, '', '', '', '', NULL, 'Thanhsang', 93, 230, '025356eab0ef87a94fcc5bf3673b107fc09d7575', 0, '', 4, '2016-10-02 09:21:37', 0),
(212, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84972703886', '', NULL, '6e11ed04dd7cdaa42886d8b30ed25a81b96831b5', '3969f76dd', 'a:0:{}', '', 0, 0, '', '59.153.243.127', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '031421390', NULL, NULL, '', '', '', '', NULL, 'DoanduanHP', 182, 230, '6e11ed04dd7cdaa42886d8b30ed25a81b96831b5', 0, '', 4, '2016-10-02 12:40:40', 0),
(213, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84903622267', '', NULL, '5aaaff616259dba3d59fa6d21176d012dbbeaf36', 'f8735e92b', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 2, 0, NULL, 0, 0, 0, '', '2016-06-06 12:59:46', '023050823', NULL, NULL, '', '', '', '', NULL, 'tuantai', 86, 230, '5aaaff616259dba3d59fa6d21176d012dbbeaf36', 1, '', 4, '2016-10-02 15:33:41', 0),
(214, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84903622267', '', NULL, '046129ef2253c52b1e02be38948940ef90c676c8', 'e3326da17', NULL, NULL, 0, 0, '', '', NULL, 2, 0, NULL, 0, 0, 0, '', '2016-06-06 13:02:14', '023050823', NULL, NULL, '', '', '', '', NULL, 'tuantai1', 213, 230, '046129ef2253c52b1e02be38948940ef90c676c8', 1, '', 4, '2016-10-02 15:37:40', 0),
(215, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84903622267', '', NULL, 'e8c0c5ed1e9a940eb7365731e261459d4eeb40ec', '98e9dd02f', NULL, NULL, 0, 0, '', '', NULL, 2, 0, NULL, 0, 0, 0, '', '2016-06-06 13:04:04', '023050823', NULL, NULL, '', '', '', '', NULL, 'tuantai2', 213, 230, 'e8c0c5ed1e9a940eb7365731e261459d4eeb40ec', 1, '', 4, '2016-10-02 15:41:15', 0),
(220, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0989554545', '', NULL, 'c787b3172f86e2f84202d17fbf200c9cc9394556', 'a64f0986c', 'a:0:{}', '', 0, 0, '', '113.185.8.118', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '024964520', NULL, NULL, '', '', '', '', NULL, 'VANDONGSG', 69, 230, 'c787b3172f86e2f84202d17fbf200c9cc9394556', 0, '', 4, '2016-10-02 17:08:31', 0),
(216, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+841687288886', '', NULL, 'd4b104f49fbac73145501553af857cdebd497816', 'cb9aced99', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '022861192', NULL, NULL, '', '', '', '', NULL, 'kcrusvn01', 147, 230, 'd4b104f49fbac73145501553af857cdebd497816', 1, '', 4, '2016-10-02 16:31:26', 0),
(217, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+841687288886', '', NULL, 'f96f4ac3909ff5299e6972864da0ce7dd6df5a68', '50fe306d9', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '022861192', NULL, NULL, '', '', '', '', NULL, 'kcrusvn02', 216, 230, 'f96f4ac3909ff5299e6972864da0ce7dd6df5a68', 1, '', 4, '2016-10-02 16:33:08', 0),
(218, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+841687288886', '', NULL, '9c4f9187ed8a129451332ec03466d0a3b8fe1d72', 'e9a9293bf', 'a:0:{}', '', 0, 0, '', '101.99.47.14', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '022861192', NULL, NULL, '', '', '', '', NULL, 'kcrusvn03', 216, 230, '9c4f9187ed8a129451332ec03466d0a3b8fe1d72', 1, '', 4, '2016-10-02 16:34:47', 0),
(219, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+841687288886', '', NULL, '6baf0534d59ca56bbaa2894732d9ca139b8ce65b', '5659145bb', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '022861192', NULL, NULL, '', '', '', '', NULL, 'kcrusvn06', 218, 230, '6baf0534d59ca56bbaa2894732d9ca139b8ce65b', 0, '', 4, '2016-10-02 16:37:36', 0),
(221, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+841687288886', '', NULL, '8f05135cab32656a5fa8496e99f6c3168f938b6b', '528a05114', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '022861192', NULL, NULL, '', '', '', '', NULL, 'kcrusvn04', 216, 230, '8f05135cab32656a5fa8496e99f6c3168f938b6b', 1, '', 4, '2016-10-02 17:11:31', 0),
(222, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+841687288886', '', NULL, '8c786f7fd8271fb6c0e72a6eeb8e459bf38d5762', '2180196a7', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '022861192', NULL, NULL, '', '', '', '', NULL, 'kcrusvn05', 216, 230, '8c786f7fd8271fb6c0e72a6eeb8e459bf38d5762', 1, '', 4, '2016-10-02 17:12:52', 0),
(223, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84968558392', '', NULL, 'eb418e78cb9369b161a32a87368e4cab0b263f59', '55236d4eb', 'a:0:{}', '', 0, 0, '', '113.183.19.138', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '122041122', NULL, NULL, '', '', '', '', NULL, 'quangduc', 126, 230, 'eb418e78cb9369b161a32a87368e4cab0b263f59', 0, '', 4, '2016-10-02 17:15:16', 0),
(224, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0903883462', '', NULL, 'e3d1da337e42b7a660454220d76869d71a4eb8a2', '3c48bc465', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '23099421', NULL, NULL, '', '', '', '', NULL, 'Hangngasg', 220, 230, 'e3d1da337e42b7a660454220d76869d71a4eb8a2', 0, '', 4, '2016-10-02 17:15:46', 0),
(225, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+841663182782', '', NULL, 'd6774b4215c44acfd812c40a20cfa2f053ab087e', '3a7fd9268', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '125714909', NULL, NULL, '', '', '', '', NULL, 'dungbn', 126, 230, 'd6774b4215c44acfd812c40a20cfa2f053ab087e', 0, '', 4, '2016-10-02 17:19:06', 0),
(226, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0913602325', '', NULL, '3fa78fce9ee39bc7c32f01dd83a4f40639e79a69', '7d403da5c', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '020132860', NULL, NULL, '', '', '', '', NULL, 'Baxuansg', 220, 230, '3fa78fce9ee39bc7c32f01dd83a4f40639e79a69', 0, '', 4, '2016-10-02 17:19:42', 0),
(227, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+841679494995', '', NULL, '10aad109f091cc0b4ca2f5cc84a066402f723e2d', '0fac98bd2', 'a:0:{}', '', 0, 0, '', '203.210.129.14', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '112188161', NULL, NULL, '', '', '', '', NULL, 'dinhlam', 120, 230, '10aad109f091cc0b4ca2f5cc84a066402f723e2d', 0, '', 4, '2016-10-02 17:23:56', 0),
(228, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '01688655688', '', NULL, 'ab7e63377f1c2b7b4f566b7654eb2f81127ef27f', 'bbaa52361', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '141952300', NULL, NULL, '', '', '', '', NULL, 'Xuanthanhhn', 69, 230, 'ab7e63377f1c2b7b4f566b7654eb2f81127ef27f', 0, '', 4, '2016-10-02 17:25:11', 0),
(229, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0983777600', '', NULL, '4bc364812262c7b0daace123bc4faa2f0407cca8', '928316150', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '024504583', NULL, NULL, '', '', '', '', NULL, 'Vinhtyphu', 69, 230, '4bc364812262c7b0daace123bc4faa2f0407cca8', 0, '', 4, '2016-10-02 17:29:43', 0),
(230, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '01689375863', '', NULL, 'c130fa8da86cf0f09d9e6db12b0a1910995de858', '71e129ab5', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '381138020', NULL, NULL, '', '', '', '', NULL, 'minhdaigia', 69, 230, 'c130fa8da86cf0f09d9e6db12b0a1910995de858', 0, '', 4, '2016-10-02 17:33:00', 0),
(231, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0969589686', '', NULL, '45934f62f159affce93a5a77f0fa1857ec0fb290', '020f7fc80', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '012173991', NULL, NULL, '', '', '', '', NULL, 'Trungdaigia', 69, 230, '45934f62f159affce93a5a77f0fa1857ec0fb290', 0, '', 4, '2016-10-02 17:35:59', 0),
(232, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '01688209999', '', NULL, 'e6527f53dea037c575a3a8ff4cbde1c5196e2b13', 'c305389bf', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '145076574', NULL, NULL, '', '', '', '', NULL, 'Anhanoi', 69, 230, 'e6527f53dea037c575a3a8ff4cbde1c5196e2b13', 0, '', 4, '2016-10-02 17:43:16', 0),
(233, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0963550007', '', NULL, '753ee937f0d7d92cce35123555aa246a722895e3', '37221035a', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '186062582', NULL, NULL, '', '', '', '', NULL, 'Typhunghean', 69, 230, '753ee937f0d7d92cce35123555aa246a722895e3', 0, '', 4, '2016-10-02 17:58:43', 0),
(234, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0903169282', '', NULL, '9eaa62d09a05b01eabe134b47d878d4a7eb026b9', '39a7b7488', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '151438885', NULL, NULL, '', '', '', '', NULL, 'ngoclansg', 69, 230, '9eaa62d09a05b01eabe134b47d878d4a7eb026b9', 0, '', 4, '2016-10-02 18:04:14', 0),
(235, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0973881799', '', NULL, 'a43d1797eb3b1354da10e6173a2d3827458f1ef7', '51c0fedb5', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '142412397', NULL, NULL, '', '', '', '', NULL, 'thanggialai', 69, 230, 'a43d1797eb3b1354da10e6173a2d3827458f1ef7', 0, '', 4, '2016-10-02 18:08:19', 0),
(236, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0984291393', '', NULL, '793ef5d2ab6511eeebd297ef4365bf9ecdf76f66', '6ecadba76', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '012064755', NULL, NULL, '', '', '', '', NULL, 'minhngochn', 69, 230, '793ef5d2ab6511eeebd297ef4365bf9ecdf76f66', 0, '', 4, '2016-10-02 18:12:20', 0),
(237, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '01642615162', '', NULL, '344dde934ab7a64bc45737ff347a839c0f3ff404', '1dfa3be9d', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '135612998', NULL, NULL, '', '', '', '', NULL, 'Nguyenhahn', 69, 230, '344dde934ab7a64bc45737ff347a839c0f3ff404', 0, '', 4, '2016-10-02 18:16:50', 0),
(238, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0987702789', '', NULL, '42b11235607a882f340a52335f0d5a58ccf9e080', '6e4d684cf', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '060615215', NULL, NULL, '', '', '', '', NULL, 'Kientyphu', 69, 230, '42b11235607a882f340a52335f0d5a58ccf9e080', 0, '', 4, '2016-10-02 18:19:28', 0),
(239, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0917645538', '', NULL, 'e5d4684ada1cbb80b49bb07754633d92d3526e09', '0b3ddf8ab', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '023949775', NULL, NULL, '', '', '', '', NULL, 'minhhaisg', 69, 230, 'e5d4684ada1cbb80b49bb07754633d92d3526e09', 0, '', 4, '2016-10-02 18:23:31', 0),
(240, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84168878856', '', NULL, 'd5170ef8a5e8cf2239c4c8e7c9bf3517f10baae2', '5016e60e1', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '023579655', NULL, NULL, '', '', '', '', NULL, 'anhnguyet', 92, 230, 'd5170ef8a5e8cf2239c4c8e7c9bf3517f10baae2', 4, '', 4, '2016-10-02 19:12:02', 0),
(241, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84919852208', '', NULL, '38a3a767198ab1269b68390e63cdd9424a985bd4', '00cceec29', 'a:0:{}', '', 0, 0, '', '113.187.16.48', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '280900615', NULL, NULL, '', '', '', '', NULL, 'lyphuchung1983', 92, 230, '38a3a767198ab1269b68390e63cdd9424a985bd4', 4, '', 4, '2016-10-02 19:13:13', 0),
(242, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84946669167', '', NULL, '9e8e58f457b44fada2d58de630420518b90fef92', '351fbbc42', 'a:0:{}', '', 0, 0, '', '115.75.5.100', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '225250374', NULL, NULL, '', '', '', '', NULL, 'hungvinh', 94, 230, '9e8e58f457b44fada2d58de630420518b90fef92', 0, '', 4, '2016-10-02 19:52:19', 0),
(243, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84908898169', '', NULL, 'd2bc2c22089672d7c903f207a5a8f661db6d8c9b', 'c7f392dd4', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '025428466', NULL, NULL, '', '', '', '', NULL, 'tuhuong', 94, 230, 'd2bc2c22089672d7c903f207a5a8f661db6d8c9b', 1, '', 4, '2016-10-02 19:55:01', 0),
(244, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84906866352', '', NULL, 'cf86a37ce45b5088843df86bd5d4be9ab50a8732', 'd6e7ddde4', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '021830619', NULL, NULL, '', '', '', '', NULL, '7ngochanh', 94, 230, 'cf86a37ce45b5088843df86bd5d4be9ab50a8732', 0, '', 4, '2016-10-02 19:56:49', 0),
(245, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84987629331', '', NULL, '392c22d55da7a182c0ff3cdbb296a3ad7feb4ebc', 'fb0d24ea1', 'a:0:{}', '', 0, 0, '', '42.118.205.104', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '215434421', NULL, NULL, '', '', '', '', NULL, 'phuonguyen', 242, 230, '392c22d55da7a182c0ff3cdbb296a3ad7feb4ebc', 0, '', 4, '2016-10-02 19:58:51', 0),
(246, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84934173639', '', NULL, 'daed25e976680699184634ab4e9e6d61c01ca359', '816d855da', 'a:0:{}', '', 0, 0, '', '1.55.198.58', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '280431340', NULL, NULL, '', '', '', '', NULL, 'chauhoangtam', 242, 230, 'daed25e976680699184634ab4e9e6d61c01ca359', 1, '', 4, '2016-10-02 20:00:17', 0),
(247, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84909562717', '', NULL, 'a7c176f5161ec0b0ec1eb29942212216310a6f47', 'ef9696308', 'a:0:{}', '', 0, 0, '', '113.185.22.80', NULL, 4, 0, NULL, 0, 0, 0, '', '2016-06-06 13:24:44', '311586206', NULL, NULL, '', '', '', '', 'http://member.s0007.club/system/upload/247_a.tien.jpg.08a775b81d8d1bad35dfddd021b28062', 'tiennguyen', 68, 230, 'a7c176f5161ec0b0ec1eb29942212216310a6f47', 4, '', 4, '2016-10-02 20:14:04', 0),
(248, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84913369861', '', NULL, '48d2ddf23b9f2cd55054bde64a2571a0db2258f7', '739bbc2c3', 'a:0:{}', '', 0, 0, '', '27.74.101.45', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '272272090', NULL, NULL, '', '', '', '', NULL, 'theanh', 68, 230, '48d2ddf23b9f2cd55054bde64a2571a0db2258f7', 2, '', 4, '2016-10-02 20:15:32', 0),
(264, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0988290090', '', NULL, '27fefbc9cbc26804d9fe453a9b4ddab8faa9fd8d', '882214f85', 'a:0:{}', '', 0, 0, '', '113.185.8.118', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '271990200', NULL, NULL, '', '', '', '', NULL, 'Namphanthiet', 148, 230, '27fefbc9cbc26804d9fe453a9b4ddab8faa9fd8d', 0, '', 4, '2016-10-03 10:49:27', 0),
(249, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84931344507', '', NULL, '87d3d493601a39b8edb6c0a27537b957ec4dcc1b', 'a6e365abd', 'a:0:{}', '', 0, 0, '', '180.93.118.140', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '273425338', NULL, NULL, '', '', '', '', NULL, 'Thoumax', 148, 230, '87d3d493601a39b8edb6c0a27537b957ec4dcc1b', 0, '', 4, '2016-10-02 20:26:37', 0),
(250, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84937390880', '', NULL, '8ee711747b0f9eaf4878e772766816097afa4c93', 'df5e004c5', 'a:0:{}', '', 0, 0, '', '113.187.17.27', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '285276901', NULL, NULL, '', '', '', '', NULL, 'Bachuthienha', 249, 230, '8ee711747b0f9eaf4878e772766816097afa4c93', 0, '', 4, '2016-10-02 20:30:15', 0),
(251, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0971015482', '', NULL, '91bb713f652f6d4af4f7b87e141a8e16aa1cb1fa', 'ff37dc200', 'a:0:{}', '', 0, 0, '', '14.160.27.59', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '168053169', NULL, NULL, '', '', '', '', NULL, 'Duytoan', 145, 230, '91bb713f652f6d4af4f7b87e141a8e16aa1cb1fa', 0, '', 4, '2016-10-03 04:24:11', 0),
(252, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0983531289', '', NULL, '5d083e8c527d5224a00e2e8b83d9416b134dcb6a', 'ed8b636a2', 'a:0:{}', '', 0, 0, '', '113.20.119.141', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '017076613', NULL, NULL, '', '', '', '', NULL, 'Thanhtunghn', 145, 230, '5d083e8c527d5224a00e2e8b83d9416b134dcb6a', 10, '', 4, '2016-10-03 04:27:58', 0),
(253, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0966203430', '', NULL, '90f2ce0ec2175e81f3577079d610ad959467ede3', '51b6a20a8', 'a:0:{}', '', 0, 0, '', '116.104.10.9', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '966203430', NULL, NULL, '', '', '', '', NULL, 'Thuy68', 252, 230, '90f2ce0ec2175e81f3577079d610ad959467ede3', 0, '', 1, '2016-07-03 06:37:18', 0),
(254, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0988111466', '', NULL, '9589b40cb6d3fe9287c532bc8b35d93b7c577650', 'b206e526f', 'a:0:{}', '', 0, 0, '', '14.189.47.229', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '988111466', NULL, NULL, '', '', '', '', NULL, 'Dongruby', 252, 230, '9589b40cb6d3fe9287c532bc8b35d93b7c577650', 0, '', 1, '2016-07-03 06:46:58', 0),
(255, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0978573571', '', NULL, '67c01ee38c90df8a495fa74768f9083b14a02919', '519e4ec66', 'a:0:{}', '', 0, 0, '', '171.239.103.70', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '978573571', NULL, NULL, '', '', '', '', NULL, 'Daiphat', 252, 230, '77782cfb3f5ee283ad6ecf6400b54bd8461ea7fc', 0, '', 1, '2016-07-03 06:49:45', 0),
(256, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0942287079', '', NULL, 'cb6ce61d56b2958c72384b593bb3af095b13b416', '755f30622', 'a:0:{}', '', 0, 0, '', '58.187.170.219', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '271854805', NULL, NULL, '', '', '', '', NULL, 'Nguyenchin', 175, 230, 'd709c305b5fa5f299c838e61ead33161eccdd7f0', 0, '', 1, '2016-07-03 08:14:37', 0),
(257, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0947444255', '', NULL, '0a8aaa77ff58770c6f67562ab942f22f1a8fc751', '25a423b93', 'a:0:{}', '', 0, 0, '', '27.74.4.49', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '272797990', NULL, NULL, '', '', '', '', NULL, 'Dongvanngoc', 175, 230, '49e86d27893c4df8eb8d9db6519c8d60a6b1c6fd', 0, '', 1, '2016-07-03 08:19:40', 0),
(258, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0988738901', '', NULL, 'efdb2b9d4888c361086b1c1bcb55156f43e999c0', '41942d4e6', 'a:0:{}', '', 0, 0, '', '42.114.75.168', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '3585131', NULL, NULL, '', '', '', '', NULL, 'Hongdangtn', 145, 230, 'efdb2b9d4888c361086b1c1bcb55156f43e999c0', 0, '', 4, '2016-10-03 08:31:21', 0),
(259, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0979361697', '', NULL, '02f0663345409a803801341d1b0b7c5752ee7353', '52c516dae', 'a:0:{}', '', 0, 0, '', '171.253.5.220', NULL, 4, 0, NULL, 0, 0, 0, '', '2016-06-06 13:27:52', '001175007366', NULL, NULL, '', '', '', '', 'http://member.s0007.club/system/upload/259_IMG_20160606_131640.jpg.3351e676907bbb8a8d2a74bf91d0dc45', 'Mytranghn', 90, 230, 'b36f1ba54c6bc8d5a52a077f58109d3a89b7f38b', 2, '1CZv1TXADAjGiqmxzDjG8219agmJ1ydukp', 4, '2016-10-03 09:19:18', 0),
(260, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0948049239', '', NULL, '5d3234658b86b0f95a0ed2f7546b6a2ce50bac99', '5c935de55', 'a:0:{}', '', 0, 0, '', '42.116.186.252', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '272112549', NULL, NULL, '', '', '', '', NULL, 'myhuong', 191, 230, '7eeb916418d9785ee9314e8274a955445e738d87', 0, '', 4, '2016-10-03 09:40:14', 0),
(261, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0913809619', '', NULL, 'bf0ffc18e50e3edf22a8d2dee68e26282e077974', 'e08513fe2', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '241053340', NULL, NULL, '', '', '', '', NULL, 'thaiminhtu', 93, 230, 'fe01873c4ed3d8868fba28bcde271f4e6f3e8b20', 0, '', 4, '2016-10-03 09:56:39', 0),
(262, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0901972759', '', NULL, '57bd5a2ebbab35c41da35f6a195cb7d2e436b12e', 'a7889cb21', 'a:0:{}', '', 0, 0, '', '115.79.49.26', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '272029497', NULL, NULL, '', '', '', '', NULL, 'dinhthong', 93, 230, '297e7417464947e130caca62066b32c15fca3793', 0, '', 4, '2016-10-03 09:58:59', 0),
(263, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0918000109', '', NULL, '7d6ff575a501fc3ed3060a4b0c79622b80648d9e', '8705b2df3', 'a:0:{}', '', 0, 0, '', '42.119.49.106', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '273447047', NULL, NULL, '', '', '', '', NULL, 'Tuyenvt', 186, 230, '982635b547ce8d8c031918be03a2c91e2ac88d05', 0, '', 1, '2016-07-03 10:14:15', 0),
(265, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0971015482', '', NULL, 'd250aa0aac9ab858959b4e2af4eb8472c3e35c70', '93677c694', 'a:0:{}', '', 0, 0, '', '171.239.103.70', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '971015482', NULL, NULL, '', '', '', '', NULL, 'Phuocloc', 255, 230, 'd250aa0aac9ab858959b4e2af4eb8472c3e35c70', 0, '', 1, '2016-07-03 11:06:59', 0),
(266, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0986073628', '', NULL, 'fac965c3334728d80bfaec6b37d171ca4932ab83', '9d86f8ca0', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '986073628', NULL, NULL, '', '', '', '', NULL, 'Daiphat1', 255, 230, 'fac965c3334728d80bfaec6b37d171ca4932ab83', 0, '', 1, '2016-07-03 11:20:32', 0),
(267, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0983531289', '', NULL, '7f18105f0b172d77fdf676ff15368d003406951a', '0195d4648', 'a:0:{}', '', 0, 0, '', '171.239.103.70', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '017076613', NULL, NULL, '', '', '', '', NULL, 'Daiphat2', 255, 230, '7f18105f0b172d77fdf676ff15368d003406951a', 0, '', 1, '2016-07-03 11:22:31', 0),
(274, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0948550115', '', NULL, 'eb7d52f1841a3d3631cb456c0a00a099f0ceb1c4', '6cd6f42f1', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '191225750', NULL, NULL, '', '', '', '', NULL, 'Phuongthao46', 101, 230, 'eb7d52f1841a3d3631cb456c0a00a099f0ceb1c4', 0, '', 4, '2016-10-03 13:28:10', 0),
(268, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84919860376', '', NULL, '4da47a9eaf19b877bd360174579160f93443bda9', 'c7c0febf3', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '272487952', NULL, NULL, '', '', '', '', NULL, 'hungcuong68', 128, 230, '4da47a9eaf19b877bd360174579160f93443bda9', 0, '', 4, '2016-10-03 11:29:44', 0),
(269, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '123456', '', NULL, '69b06893a0eb3730ce603b504f30478f14d7d166', '8cf0640e0', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '123456', NULL, NULL, '', '', '', '', NULL, 'Hoangyen', 148, 230, '69b06893a0eb3730ce603b504f30478f14d7d166', 0, '', 4, '2016-10-03 11:34:41', 0),
(270, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0988111466', '', NULL, 'e1e78f0a616d7aa1516edfd08f1423a0f31563ce', '42d451715', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '141961656', NULL, NULL, '', '', '', '', NULL, 'Dongruby1', 254, 230, 'e1e78f0a616d7aa1516edfd08f1423a0f31563ce', 0, '', 4, '2016-10-03 11:38:42', 0),
(271, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0935651631', '', NULL, '50d6a15260e8d87ed92f2b9ead230923cea5201e', 'dc0f9b627', 'a:0:{}', '', 0, 0, '', '115.72.193.5', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '351579000', NULL, NULL, '', '', '', '', NULL, 'muons0007', 185, 230, '50d6a15260e8d87ed92f2b9ead230923cea5201e', 0, '', 1, '2016-07-03 12:06:18', 0),
(272, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0965164511', '', NULL, '242ff397980f963d12eed9cb8ebe66f495a52a11', '34befc5c2', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '142159943', NULL, NULL, '', '', '', '', NULL, 'Xuanhoahd', 95, 230, '242ff397980f963d12eed9cb8ebe66f495a52a11', 0, '', 4, '2016-10-03 12:52:21', 0),
(273, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84947258586', '', NULL, '98547e2326cab22a26018c8d6bce718cc7e99b3c', '7a2d9af9a', 'a:0:{}', '', 0, 0, '', '113.185.18.149', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '125559938', NULL, NULL, '', '', '', '', NULL, 'baybn', 223, 230, '98547e2326cab22a26018c8d6bce718cc7e99b3c', 0, '', 4, '2016-10-03 13:12:01', 0),
(275, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0978573571', '', NULL, '36d4f4839990a1532346a8eff75f2165769ba8fb', '6745b86ef', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '017076613', NULL, NULL, '', '', '', '', NULL, 'Daiphat3', 267, 230, '36d4f4839990a1532346a8eff75f2165769ba8fb', 0, '', 4, '2016-10-03 13:34:13', 0),
(276, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0978573571', '', NULL, 'f82d2fb5c3fa26de907946057b9d7233843eb294', '839598b4e', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '017076613', NULL, NULL, '', '', '', '', NULL, 'Daiphat4', 267, 230, 'f82d2fb5c3fa26de907946057b9d7233843eb294', 0, '', 4, '2016-10-03 13:36:08', 0),
(277, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0978573571', '', NULL, 'd476273fec99b3190525e34a61659bb039516c10', '9696896de', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '017076613', NULL, NULL, '', '', '', '', NULL, 'Daiphat5', 267, 230, 'd476273fec99b3190525e34a61659bb039516c10', 0, '', 4, '2016-10-03 13:38:16', 0),
(278, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0982526283', '', NULL, 'b7f3c83aa99f2844c4f8ba41ac74cca5e6a9b995', '17a7d7640', 'a:0:{}', '', 0, 0, '', '171.239.103.70', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '982526283', NULL, NULL, '', '', '', '', NULL, 'Khuong68', 252, 230, 'b7f3c83aa99f2844c4f8ba41ac74cca5e6a9b995', 0, '', 4, '2016-10-03 13:42:39', 0),
(279, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0915021867', '', NULL, '960f081c2f9bad372c99ab83d0f09fc58347a21a', '320e3b9ab', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '915021867', NULL, NULL, '', '', '', '', NULL, 'Nang69', 252, 230, '960f081c2f9bad372c99ab83d0f09fc58347a21a', 0, '', 4, '2016-10-03 13:46:03', 0),
(280, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0936367778', '', NULL, '1591ffa20f674f852a3312ebc5b221b554a60636', 'edad5317b', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '936367778', NULL, NULL, '', '', '', '', NULL, 'Bac68', 278, 230, '1591ffa20f674f852a3312ebc5b221b554a60636', 0, '', 4, '2016-10-03 14:39:27', 0),
(281, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0964576999', '', NULL, '42431d636c6f1edd2eeeb3d3f3030aa4ad7a3174', 'f0803db4c', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '964576999', NULL, NULL, '', '', '', '', NULL, 'Hang68', 278, 230, '42431d636c6f1edd2eeeb3d3f3030aa4ad7a3174', 0, '', 4, '2016-10-03 14:42:32', 0),
(282, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84937881033', '', NULL, '1a79c96c2d979b9b63d3116cf68d5a53a50883d9', '72f1754e7', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '270831211', NULL, NULL, '', '', '', '', NULL, 'blockchainmrlee', 48, 230, '1a79c96c2d979b9b63d3116cf68d5a53a50883d9', 0, '', 4, '2016-10-03 15:23:27', 0),
(283, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84945817781', '', NULL, 'af20900a80fdb8284fc9ceaf40d0cd681ee71044', '86f8f5153', 'a:0:{}', '', 0, 0, '', '42.118.205.104', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '024937677', NULL, NULL, '', '', '', '', NULL, 'thienkidieu', 282, 230, 'af20900a80fdb8284fc9ceaf40d0cd681ee71044', 0, '', 4, '2016-10-03 15:29:05', 0),
(284, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84909670414', '', NULL, '2d3591b6760e2d3f8def19237de3ae3653c705a5', 'c3cdfdf97', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '023521964', NULL, NULL, '', '', '', '', NULL, 'phuonghoangmwg.vn', 283, 230, '2d3591b6760e2d3f8def19237de3ae3653c705a5', 0, '', 4, '2016-10-03 15:30:33', 0),
(285, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0933829338', '', NULL, 'da98e81726a27c3f07abdb7ab3f9ae66c3fef877', '8f6a52e89', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '150650517', NULL, NULL, '', '', '', '', NULL, 'giabao2015', 87, 230, 'da98e81726a27c3f07abdb7ab3f9ae66c3fef877', 0, '', 4, '2016-10-03 15:54:06', 0),
(286, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0985618800', '', NULL, '86624eadbf0c47572fe5e70811b9212cae601389', 'e8d87051d', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 4, 0, NULL, 0, 0, 0, '', '2016-06-06 13:27:07', '245344645', NULL, NULL, '', '', '', '', 'http://member.s0007.club/system/upload/286_fd193bb3b5df058943427cfcfe2a132a.jpg.b320046dada8c9ebf1b1b7be8cdd20cb', 'letrung1', 145, 230, '86624eadbf0c47572fe5e70811b9212cae601389', 2, '1tULDKTewm19juFbbzH1UQiYCDfe9W1TX', 4, '2016-10-03 18:22:38', 0),
(287, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0985618800', '', NULL, 'bdd4a9c74c955cfd0057c909d38e6742f28faf29', 'c64114f9c', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 4, 0, NULL, 0, 0, 0, '', '2016-06-06 13:38:24', '245344645', NULL, NULL, '', '', '', '', 'http://member.s0007.club/system/upload/287_b236bb765d2adea5de89c28744059f28.jpg.e7217ea05673ae9cdf75c0a194b94931', 'letrung2', 145, 230, 'bdd4a9c74c955cfd0057c909d38e6742f28faf29', 2, '1tULDKTewm19juFbbzH1UQiYCDfe9W1TX', 4, '2016-10-03 18:24:45', 2),
(288, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0985618800', '', NULL, '9179c0b0ae5d9c8cc3be22e175a970566eeef2e3', '9893550e8', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 4, 0, NULL, 0, 0, 0, '', '2016-06-06 13:37:44', '245344645', NULL, NULL, '', '', '', '', 'http://member.s0007.club/system/upload/288_1a168a05a945bd1d430449d99e446ac1.jpg.a4235c22a1bf855ac779e44930caa797', 'letrung3', 286, 230, '9179c0b0ae5d9c8cc3be22e175a970566eeef2e3', 2, '1tULDKTewm19juFbbzH1UQiYCDfe9W1TX', 4, '2016-10-03 18:27:01', 0),
(289, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0985618800', '', NULL, 'e60448e0a09c357d96360714e9f816673be38e9b', '49e1171b7', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 4, 0, NULL, 0, 0, 0, '', '2016-06-06 13:43:53', '245344645', NULL, NULL, '', '', '', '', 'http://member.s0007.club/system/upload/289_9224b11f01539fb8876492c7cfff2f2a.jpg.f8d87ab94d9d0a0b13099c60d4761dc5', 'letrung4', 286, 230, 'e60448e0a09c357d96360714e9f816673be38e9b', 2, '1tULDKTewm19juFbbzH1UQiYCDfe9W1TX', 4, '2016-10-03 18:29:31', 0),
(290, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0985618800', '', NULL, '693613179abd5fddf36bcfb3dbd256c27cf61d34', 'a81a8a1f1', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 4, 0, NULL, 0, 0, 0, '', '2016-06-06 14:21:55', '245344645', NULL, NULL, '', '', '', '', 'http://member.s0007.club/system/upload/290_5a8afedfbecd2ccdf050da78e755f04c.jpg.50edfce76a5b7e628c2c594309f36095', 'letrung5', 286, 230, '693613179abd5fddf36bcfb3dbd256c27cf61d34', 2, '1tULDKTewm19juFbbzH1UQiYCDfe9W1TX', 4, '2016-10-03 18:31:06', 0),
(291, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0985618800', '', NULL, 'b75d210ac34241a8ec0fa26f1d61034d197f8061', '489f621be', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 4, 0, NULL, 0, 0, 0, '', '2016-06-06 14:11:42', '245344645', NULL, NULL, '', '', '', '', 'http://member.s0007.club/system/upload/291_d4512cd2a5466c379ddf7a504b5db6cf.jpg.53e6c8fd2333fec9a1e82dbdcb69c140', 'letrung6', 286, 230, 'b75d210ac34241a8ec0fa26f1d61034d197f8061', 2, '1tULDKTewm19juFbbzH1UQiYCDfe9W1TX', 4, '2016-10-03 18:32:23', 0),
(292, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0985618800', '', NULL, '43994947bfe5fb283d772f311ac52d2fcf23670b', 'dd91e3559', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 4, 0, NULL, 0, 0, 0, '', '2016-06-06 14:22:10', '245344645', NULL, NULL, '', '', '', '', 'http://member.s0007.club/system/upload/292_1b81c2d73f265e32df5a65f98dc23247.jpg.03caec2b08bb6a73e9ed23961366efd0', 'letrung7', 286, 230, '43994947bfe5fb283d772f311ac52d2fcf23670b', 0, '1tULDKTewm19juFbbzH1UQiYCDfe9W1TX', 4, '2016-10-03 18:33:42', 0),
(293, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0985618800', '', NULL, 'c610e436c4bc2586ea2c2bbab464c565b7ccb470', '797575416', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 4, 0, NULL, 0, 0, 0, '', '2016-06-06 14:13:10', '245344645', NULL, NULL, '', '', '', '', 'http://member.s0007.club/system/upload/293_54c12bde2d2ef95dbc251246d42ca154.jpg.77abd5c699afa3d9fbc7843d82906342', 'letrung8', 286, 230, 'c610e436c4bc2586ea2c2bbab464c565b7ccb470', 2, '1tULDKTewm19juFbbzH1UQiYCDfe9W1TX', 4, '2016-10-03 18:35:12', 0),
(294, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0985618800', '', NULL, '4d121012be6aeb399b135acc1506c09b002037a9', '172d329ca', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 4, 0, NULL, 0, 0, 0, '', '2016-06-06 14:12:27', '245344645', NULL, NULL, '', '', '', '', 'http://member.s0007.club/system/upload/294_98180c3119a434f785fa8b9a336ee6ec.jpg.806de8d8460c83adc0467f18cafbc758', 'letrung9', 287, 230, '4d121012be6aeb399b135acc1506c09b002037a9', 2, '1tULDKTewm19juFbbzH1UQiYCDfe9W1TX', 4, '2016-10-03 18:38:41', 0),
(295, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0968258565', '', NULL, 'e240401f3279ad004a24f1a84fe781b4c3cb22e0', 'a9a94172b', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 4, 0, NULL, 0, 0, 0, '', '2016-06-06 14:21:09', '090775288', NULL, NULL, '', '', '', '', 'http://member.s0007.club/system/upload/295_4c67ce7cadaf021c72ec260309db145f.jpg.0933c21bc16767f746287517b78294fc', 'liem68', 287, 230, 'e240401f3279ad004a24f1a84fe781b4c3cb22e0', 2, '1tULDKTewm19juFbbzH1UQiYCDfe9W1TX', 4, '2016-10-03 18:41:01', 0),
(297, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0907855808', '', NULL, 'd2fea25ab5884cf237bcb872a2045540013686e7', 'd021bf615', 'a:0:{}', '', 0, 0, '', '27.74.64.151', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '182319162', NULL, NULL, '', '', '', '', NULL, 'Buidangtue', 257, 230, 'cc90915754c1c0ebe91ac03b862f539bd21eeb60', 0, '', 1, '2016-07-03 21:35:32', 0),
(296, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0937188291', '', NULL, '8567962401a0050737900fb9b889eb0fc1f4366a', '9c4b9effe', 'a:0:{}', '', 0, 0, '', '171.253.29.227', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '271455470', NULL, NULL, '', '', '', '', NULL, 'Lenhamnhit', 257, 230, '63b63471481c8745136c246397e2f9cdfbf0b408', 0, '', 1, '2016-07-03 21:30:18', 0),
(298, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0908729733', '', NULL, '5fb93e5ce233fe8df7066c5bf333e4e0f40a643f', '42b577229', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '271482502', NULL, NULL, '', '', '', '', NULL, 'Dinhthibichngoc', 257, 230, '1704e45bc61777be9505dbc0b8235b42ad750592', 0, '', 1, '2016-07-03 21:39:27', 0),
(299, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0984117931', '', NULL, '4c90522047bdbe6f281bbfc6a0eadd883d8a0881', 'df19581d1', 'a:0:{}', '', 0, 0, '', '183.81.52.144', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '271990018', NULL, NULL, '', '', '', '', NULL, 'tranthanh', 178, 230, '4c90522047bdbe6f281bbfc6a0eadd883d8a0881', 0, '', 4, '2016-10-03 22:32:50', 0),
(300, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0966711110', '', NULL, '4bde693804e34882a2ae9be1d7e7a7838f79cb57', '386bb5da8', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '186288263', NULL, NULL, '', '', '', '', NULL, 'phankhanh', 178, 230, '4bde693804e34882a2ae9be1d7e7a7838f79cb57', 0, '', 4, '2016-10-03 23:04:13', 0),
(301, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0981028905', '', NULL, '54fb0b3bad17ed86e8e72f5cb30742cbee212edf', '9d58809f3', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '191555433', NULL, NULL, '', '', '', '', NULL, 'nguyencongtoan', 178, 230, '54fb0b3bad17ed86e8e72f5cb30742cbee212edf', 0, '', 4, '2016-10-03 23:26:54', 0),
(302, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0939440362', '', NULL, '36ef9c18f7708af2ba8aa4b10105353893eb597c', 'a446f5f1b', 'a:0:{}', '', 0, 0, '', '113.187.23.24', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '340987865', NULL, NULL, '', '', '', '', NULL, 'khanhdts007', 271, 230, '36ef9c18f7708af2ba8aa4b10105353893eb597c', 0, '', 1, '2016-07-04 08:24:04', 0),
(303, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0938989226', '', NULL, '45b12fefba51b19db44d8e385a7d80f79109fac7', '5b0b96c04', 'a:0:{}', '', 0, 0, '', '115.72.193.5', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '365427183', NULL, NULL, '', '', '', '', NULL, 'nguyenchilinhs0007', 271, 230, '45b12fefba51b19db44d8e385a7d80f79109fac7', 0, '', 1, '2016-07-04 08:30:42', 0),
(304, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0938989226', '', NULL, '314b3250564d02f6404970379e845891f5076afc', '849c13ea5', 'a:0:{}', '', 0, 0, '', '115.72.193.5', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '365427183', NULL, NULL, '', '', '', '', NULL, 'nguyenchilinhs00071', 303, 230, '314b3250564d02f6404970379e845891f5076afc', 0, '', 1, '2016-07-04 08:35:22', 0),
(305, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0938989226', '', NULL, '7396f7e49bfcdeacafb632e8ce65ac048597102f', '3442aa06a', 'a:0:{}', '', 0, 0, '', '115.72.193.5', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '365427183', NULL, NULL, '', '', '', '', NULL, 'nguyenchilinhs00072', 303, 230, '7396f7e49bfcdeacafb632e8ce65ac048597102f', 0, '', 1, '2016-07-04 08:37:20', 0),
(306, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0938989226', '', NULL, 'd0194f45793bfce88eae41b970c98e995cd53d33', '5eab3de36', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '365427183', NULL, NULL, '', '', '', '', NULL, 'nguyenchilinhs00073', 303, 230, 'd0194f45793bfce88eae41b970c98e995cd53d33', 0, '', 1, '2016-07-04 08:39:25', 0),
(307, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0938989226', '', NULL, '3ee253961360f391b59a76b80f8f362c9d71c8ff', 'c771e32e4', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '365427183', NULL, NULL, '', '', '', '', NULL, 'nguyenchilinhs00074', 304, 230, '3ee253961360f391b59a76b80f8f362c9d71c8ff', 0, '', 1, '2016-07-04 08:42:05', 0),
(308, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84981428657', '', NULL, '2689a9d4e1a2fe7c9775cd32a8b38b5157098399', 'b5499e8e6', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '272029497', NULL, NULL, '', '', '', '', NULL, 'Kiettrieuphutre', 48, 230, '2689a9d4e1a2fe7c9775cd32a8b38b5157098399', 0, '', 4, '2016-10-04 08:42:31', 0),
(309, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0938989226', '', NULL, '43190f3987577c90668416259de356fc08c4d90f', '568913988', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '365427183', NULL, NULL, '', '', '', '', NULL, 'nguyenchilinhs00075', 305, 230, '43190f3987577c90668416259de356fc08c4d90f', 0, '', 1, '2016-07-04 08:45:16', 0),
(310, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84981428657', '', NULL, '22ea110ce8ee4b3cc2c1711edfee8c35bf5f71ed', '8defc52ad', 'a:0:{}', '', 0, 0, '', '115.73.236.3', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '272029497', NULL, NULL, '', '', '', '', NULL, 'Tuankiet', 48, 230, '740ba44550ce4ab33a6a46e940806fb540be833b', 0, '', 4, '2016-10-04 08:49:44', 0);
INSERT INTO `sm_customer` (`customer_id`, `customer_code`, `customer_group_id`, `store_id`, `firstname`, `lastname`, `date_birth`, `email`, `telephone`, `fax`, `ma_thue`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `custom_field`, `ip`, `date_off`, `status`, `history_status`, `num_off`, `type_off`, `approved`, `safe`, `token`, `date_added`, `cmnd`, `date_cmnd`, `address_cmnd`, `account_bank`, `address_bank`, `address_cus`, `note`, `img_profile`, `username`, `p_node`, `country_id`, `transaction_password`, `ping`, `wallet`, `returning_time`, `date_return_money`, `count_s_pd`) VALUES
(311, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '01636456120', '', NULL, '385b473a82a4f96b6396e79ad00f07a834eb4883', '844dac972', 'a:0:{}', '', 0, 0, '', '115.79.49.26', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '215159205', NULL, NULL, '', '', '', '', NULL, 'duytin', 310, 230, '385b473a82a4f96b6396e79ad00f07a834eb4883', 0, '', 4, '2016-10-04 09:06:13', 0),
(312, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0977833678', '', NULL, '17dd9240890a1914b04ec809ec41ee789a557b5c', 'a9c025a1f', 'a:0:{}', '', 0, 0, '', '42.116.186.252', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '285745303', NULL, NULL, '', '', '', '', NULL, 'phamdinhthong', 310, 230, 'cc0bb734f37a94443198fb8765dbf6acdb0c50a9', 0, '', 4, '2016-10-04 09:12:48', 0),
(313, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+841636456120', '', NULL, 'ee729fb588d04997d57b3b077d23bb75e6048d2f', 'a945da0c1', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '215159205', NULL, NULL, '', '', '', '', NULL, 'DUY TIN NGUYEN', 311, 230, '7ab1cd671ba2bd8692fef43874d411987fc68a9b', 0, '', 4, '2016-10-04 09:13:53', 0),
(314, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0919818763', '', NULL, '2645c2e165969443fe22f852966b0dd142e8cca0', 'b6916b024', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '271797999', NULL, NULL, '', '', '', '', NULL, 'Phamvanson', 296, 230, '1de71331c331fd0687023e719c36b1e3524c8c07', 0, '', 1, '2016-07-04 09:46:38', 0),
(315, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0938898303', '', NULL, '8c01adc986bc7e321cf458fa53fcb82dc7ed5ecb', '833047ee2', 'a:0:{}', '', 0, 0, '', '42.116.186.252', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '271987507', NULL, NULL, '', '', '', '', NULL, 'taduyluan', 310, 230, 'aad1472cbd5653917a4d713de15871c72063c755', 0, '', 4, '2016-10-04 09:55:38', 0),
(340, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0962479103', '', NULL, '60fc8238b4459a9a61ec5bc3f90215febba2bea1', '479e10c69', 'a:0:{}', '', 0, 0, '', '27.65.56.147', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '100548743', NULL, NULL, '', '', '', '', NULL, 'Ngochungqn', 90, 230, '60fc8238b4459a9a61ec5bc3f90215febba2bea1', 0, '', 4, '2016-10-05 12:48:15', 0),
(316, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '01685302860', '', NULL, 'b870bf5b5e9d7ce44b568c92f860fc37080af4c4', '15182c0b7', 'a:0:{}', '', 0, 0, '', '14.176.132.89', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '270445881', NULL, NULL, '', '', '', '', NULL, 'trinhdangtoan', 311, 230, '08a9838d94098a43a89b0a0c9bd134bd1e490505', 0, '', 4, '2016-10-04 10:00:25', 0),
(317, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0988075336', '', NULL, 'bc1ad6c068be2bc457b63663ccf04540def6f3e7', 'd1eb99a0f', 'a:0:{}', '', 0, 0, '', '42.116.186.252', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '241053340', NULL, NULL, '', '', '', '', NULL, 'minhtu88', 312, 230, '8901995973590afb5ff40f7d5d006df879c2e57d', 0, '', 4, '2016-10-04 10:07:23', 0),
(318, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '01685302860', '', NULL, '37e13d17fb85db2e39637deca640fa0f6b4d190c', '70eeed681', 'a:0:{}', '', 0, 0, '', '42.116.186.252', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '036092001764', NULL, NULL, '', '', '', '', NULL, 'dangtoan92', 311, 230, '77a3cc9dfb787305b5f35e403128ca3950228e28', 0, '', 4, '2016-10-04 10:14:52', 0),
(319, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0932254052', '', NULL, '3f029abb7bde7fae2f80e620d2a2bee3950b1e95', '826b4ed8e', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '270445881', NULL, NULL, '', '', '', '', NULL, 'nguyenthienchien', 312, 230, '5ed2764f40925f4d379b2b8e33ecfb5829675a19', 0, '', 4, '2016-10-04 10:20:05', 0),
(320, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0975711337', '', NULL, 'c96c8ea45c566ea6dc2182565ae635ac06d7713b', '3c6e4fff7', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '272428145', NULL, NULL, '', '', '', '', NULL, 'vuthanhsang', 317, 230, 'f253a3e9740bf4a3dd7e854babc4458d629f4932', 0, '', 4, '2016-10-04 10:38:51', 0),
(321, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0901480269', '', NULL, 'd87144c7b25b54b577439dedb52df25e3d6a16ba', '16a684cb6', 'a:0:{}', '', 0, 0, '', '113.185.18.185', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '131612958', NULL, NULL, '', '', '', '', NULL, 'dothongnhat', 315, 230, '07a31a92b1ce47e4bd968ca265605681a60a6575', 0, '', 4, '2016-10-04 10:43:49', 0),
(322, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0935795040', '', NULL, '609b75a8157d4ce43a8d95865ac1b35166b9c50b', '1b2cee00c', 'a:0:{}', '', 0, 0, '', '14.167.56.43', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '212727730', NULL, NULL, '', '', '', '', NULL, 'phamthithuyhuong', 321, 230, 'bb223f237ead37748cf172d10c9fcc4ac59bff34', 0, '', 4, '2016-10-04 10:46:13', 0),
(323, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0948049239', '', NULL, '80f973a5710300c0f2866587642c675d712df148', 'ba65d7f82', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '272112549', NULL, NULL, '', '', '', '', NULL, 'myhuong007', 321, 230, '19ba1de52ff173385ac189fc17505059b20db959', 0, '', 4, '2016-10-04 11:02:47', 0),
(324, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0985062995', '', NULL, '127036e4853d0b8158808cf3ae2847280f3023bd', '09866b1e8', 'a:0:{}', '', 0, 0, '', '171.255.148.27', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '197143575', NULL, NULL, '', '', '', '', NULL, 'phanquochuy', 311, 230, '353b6bcec6450ed6eb29577632bce1c8b87a119f', 0, '', 4, '2016-10-04 11:05:43', 0),
(325, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0903729222', '', NULL, '99d78816ae5bb7c1efd12b2cb452e07af4efa6d1', '92480b226', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 2, 0, NULL, 0, 0, 0, '', '2016-06-06 12:11:00', '021706048', NULL, NULL, '', '', '', '', NULL, 'vinhpham68', 143, 230, '99d78816ae5bb7c1efd12b2cb452e07af4efa6d1', 1, '', 4, '2016-10-04 11:31:15', 0),
(326, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0979563828', '', NULL, '39e1afe0b4e87cd020db1a6fde996c5a947a520c', '486f37b9c', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '172874998', NULL, NULL, '', '', '', '', NULL, 'levanmanh', 324, 230, '3d1a833a1f9aedf59a91f68f61593e01ff75a17d', 0, '', 4, '2016-10-04 11:52:50', 0),
(327, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0988111466', '', NULL, '71c4e3636bcf7db62b2726859df1b38953f2d5f6', '856edfa9c', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '141961656', NULL, NULL, '', '', '', '', NULL, 'Dongruby2', 254, 230, '71c4e3636bcf7db62b2726859df1b38953f2d5f6', 0, '', 4, '2016-10-04 14:15:49', 0),
(328, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0988111466', '', NULL, '2064cccc88dc0bf66182f25e4863f90cce977929', 'd5ab378e3', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '141961656', NULL, NULL, '', '', '', '', NULL, 'Dongruby3', 254, 230, '2064cccc88dc0bf66182f25e4863f90cce977929', 0, '', 4, '2016-10-04 14:18:05', 0),
(329, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0988111466', '', NULL, '287b2528c272938d1e1cbc8463b4121fd6280020', 'b05dc7087', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '141961656', NULL, NULL, '', '', '', '', NULL, 'Dongruby4', 254, 230, '287b2528c272938d1e1cbc8463b4121fd6280020', 0, '', 4, '2016-10-04 14:22:27', 0),
(330, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0988111466', '', NULL, '10cf82c3912d3c8028c26e3422bef7d495632cac', '15511dcc5', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '141961656', NULL, NULL, '', '', '', '', NULL, 'Dongruby5', 254, 230, '10cf82c3912d3c8028c26e3422bef7d495632cac', 0, '', 4, '2016-10-04 14:24:23', 0),
(331, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84901347900', '', NULL, 'f5cca6f5f8bbfaa990cc470b6cdeb9f26a6ded90', '39811f540', 'a:0:{}', '', 0, 0, '', '113.185.26.12', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '361169830', NULL, NULL, '', '', '', '', NULL, 'Dungct', 185, 230, 'f5cca6f5f8bbfaa990cc470b6cdeb9f26a6ded90', 0, '', 4, '2016-10-04 14:37:55', 0),
(332, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84971721831', '', NULL, '8566eb530e46a3cd7bd1f594e820af8edcf504f1', '8a4db83b2', 'a:0:{}', '', 0, 0, '', '14.167.108.18', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '281048043', NULL, NULL, '', '', '', '', NULL, 'kieuluyen', 86, 230, '8566eb530e46a3cd7bd1f594e820af8edcf504f1', 0, '', 4, '2016-10-04 17:02:12', 0),
(333, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84979186865', '', NULL, '4602f4daf16f21185cb544e2ecba6820de74ebad', '91f475345', 'a:0:{}', '', 0, 0, '', '113.183.19.138', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '125200904', NULL, NULL, '', '', '', '', NULL, 'hoatuoi', 88, 230, '4602f4daf16f21185cb544e2ecba6820de74ebad', 0, '', 4, '2016-10-04 22:18:20', 0),
(334, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84979186865', '', NULL, '50651fed9476733f2ece69312fb5749d3951cb5f', '9096ca17c', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '125200904', NULL, NULL, '', '', '', '', NULL, 'hoatuoi1', 333, 230, '50651fed9476733f2ece69312fb5749d3951cb5f', 0, '', 4, '2016-10-04 22:21:12', 0),
(335, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+841689010866', '', NULL, '5054400b82e286f04cf29a19b393dd1416ad8cd4', '75247f454', 'a:0:{}', '', 0, 0, '', '113.185.8.135', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '125452755', NULL, NULL, '', '', '', '', NULL, 'nguyenthuy', 333, 230, '5054400b82e286f04cf29a19b393dd1416ad8cd4', 0, '', 4, '2016-10-04 22:25:06', 0),
(336, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84909991719', '', NULL, '5e7529d46f361c14e15b8f24c0ebf52bfe628622', '70ebd8b8f', 'a:0:{}', '', 0, 0, '', '171.233.142.103', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '023949229', NULL, NULL, '', '', '', '', NULL, 'Thientrang', 247, 230, '5e7529d46f361c14e15b8f24c0ebf52bfe628622', 0, '', 4, '2016-10-05 07:08:38', 0),
(337, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84918426996', '', NULL, 'd3d84ef5f8a9f2d39d3e9ae9dc5a26ccdf9820ae', '6fd7cf9e1', 'a:0:{}', '', 0, 0, '', '113.187.23.45', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '022706695', NULL, NULL, '', '', '', '', NULL, 'thienthao68', 144, 230, 'd3d84ef5f8a9f2d39d3e9ae9dc5a26ccdf9820ae', 0, '', 4, '2016-10-05 07:16:29', 0),
(338, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0901593679', '', NULL, '4514f4d0e619dbbf43efd4e728f56cec8eb52477', '811757cf8', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '031160987', NULL, NULL, '', '', '', '', NULL, 'Ducthinhhp', 90, 230, '4514f4d0e619dbbf43efd4e728f56cec8eb52477', 0, '', 4, '2016-10-05 11:43:51', 0),
(339, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84948334544', '', NULL, '6560132c0a3c97efa04b567cfc6c70cf95ebc5e2', '7af86c331', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '030676571', NULL, NULL, '', '', '', '', NULL, 'leanhdoan', 142, 230, '6560132c0a3c97efa04b567cfc6c70cf95ebc5e2', 0, '', 4, '2016-10-05 12:22:03', 0),
(341, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84967795589', '', NULL, 'e75edb97d4c0e298bfb3552942ecd0507617d753', '37d231c9b', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '271577653', NULL, NULL, '', '', '', '', NULL, 'cuongthinh', 185, 230, 'e75edb97d4c0e298bfb3552942ecd0507617d753', 0, '', 4, '2016-10-05 14:02:06', 0),
(342, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '01698969852', '', NULL, '76ec552067592d15e4c1d4499a20484ed86a626b', '8cb51ec40', 'a:0:{}', '', 0, 0, '', '168.235.196.87', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '024685904', NULL, NULL, '', '', '', '', NULL, 'Thuy2016', 185, 230, '76ec552067592d15e4c1d4499a20484ed86a626b', 0, '', 4, '2016-10-05 14:27:35', 0),
(343, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84914826881', '', NULL, 'ca2d26022de5025b4ed34b5a48fec275a5b8e862', '2a2e4257a', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '024145206', NULL, NULL, '', '', '', '', NULL, 'thiluyenla', 184, 230, 'ca2d26022de5025b4ed34b5a48fec275a5b8e862', 0, '', 4, '2016-10-05 15:35:24', 0),
(344, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84919978018', '', NULL, 'bd6ed23eb781b8e3fe649e56b75c6a02898a38e7', 'ec6be0bca', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 2, 0, NULL, 0, 0, 0, '', '2016-06-06 11:53:10', '321172935', NULL, NULL, '', '', '', '', NULL, 'thanhchinh', 247, 230, '15ecb57ffd140885a04dbc18b422319420e2537d', 4, '', 4, '2016-10-05 18:50:52', 0),
(345, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '0988895800', '', NULL, 'a0bfacf9eb9846d79e75c6fee92cc88dc3e983a3', 'a414bbbd4', 'a:0:{}', '', 0, 0, '', '117.0.112.219', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '060591850', NULL, NULL, '', '', '', '', NULL, 'builanhuong', 310, 230, '08632842a2ece88ce99d7bfa3637538acfb73044', 0, '', 4, '2016-10-06 08:59:15', 0),
(346, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84973847198', '', NULL, '27a8691c2256e37b969ef4405ae9d011a12bbed1', '6521d6ac5', 'a:0:{}', '', 0, 0, '', '113.183.19.138', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '125491870', NULL, NULL, '', '', '', '', NULL, 'duatbn', 333, 230, '27a8691c2256e37b969ef4405ae9d011a12bbed1', 0, '', 4, '2016-10-06 10:54:07', 0),
(347, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+841687288886', '', NULL, 'f0b91bfeddc1ba086d3a200a20daac29be71e469', '8244c215a', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '022861192', NULL, NULL, '', '', '', '', NULL, 'kcrusvn07', 216, 230, 'f0b91bfeddc1ba086d3a200a20daac29be71e469', 1, '', 4, '2016-10-06 11:22:40', 0),
(348, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84904797967', '', NULL, 'b2e52d84326ac96bab9d9dffee95c4bf9b860dc6', '0dfa7f893', 'a:0:{}', '', 0, 0, '', '116.100.153.125', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '031721494', NULL, NULL, '', '', '', '', NULL, 'thanhthanh99', 66, 230, 'b2e52d84326ac96bab9d9dffee95c4bf9b860dc6', 0, '', 4, '2016-10-06 12:27:49', 0),
(349, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+841687288886', '', NULL, '12d4fcab9a1e380d8d4ee06f5d04c3e6c93dab11', '3007a3847', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '022861192', NULL, NULL, '', '', '', '', NULL, 'kcrusvn08', 216, 230, '12d4fcab9a1e380d8d4ee06f5d04c3e6c93dab11', 1, '', 4, '2016-10-06 13:06:47', 0),
(350, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '123456', '', NULL, 'ce0dc92ad8b62be690130c4e7d469c2e6478c82c', 'f505ac8a9', NULL, NULL, 0, 0, '', '', NULL, 1, 1, NULL, 0, 0, 0, '', '2016-06-06 14:31:52', '123456', NULL, NULL, '', '', '', '', NULL, 'Thanhthanh88', 66, 230, 'ce0dc92ad8b62be690130c4e7d469c2e6478c82c', 0, '', 4, '2016-10-06 13:10:41', 0),
(351, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84908096879', '', NULL, '9177abc29d0a83e78bca55a71519e821d0494e4a', '49665d3ff', 'a:0:{}', '', 0, 0, '', '113.185.22.41', NULL, 1, 0, NULL, 0, 0, 0, '', '2016-06-06 13:11:55', '023949949', NULL, NULL, '', '', '', '', NULL, 'leminhchi', 48, 230, '9177abc29d0a83e78bca55a71519e821d0494e4a', 0, '', 4, '2016-10-06 13:11:55', 0),
(352, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '+84917469768', '', NULL, '6d6a1b0af41958f1eb7f2e20ecaa7eefa08c279e', 'ce1c65aa5', NULL, NULL, 0, 0, '', '', NULL, 1, 0, NULL, 0, 0, 0, '', '2016-06-06 13:23:15', '020205601', NULL, NULL, '', '', '', '', NULL, 'Queenngoc', 351, 230, '6d6a1b0af41958f1eb7f2e20ecaa7eefa08c279e', 0, '', 4, '2016-10-06 13:23:15', 0),
(354, NULL, 0, 0, '', '', NULL, 'tunglam1@gmai.com', '1', '', NULL, 'd54a19c4455bfcb7117c29e20f040c3d1bd9f084', '67f19425d', 'a:0:{}', '', 0, 0, '', '192.168.0.10', NULL, 4, 0, NULL, 0, 0, 0, '', '2016-06-08 10:55:09', '1', NULL, NULL, '', '', '', '', 'http://192.168.0.68/s007/system/upload/354_Screenshot_from_2016-05-23_09:23:27.png.84b27aaab58f5af04c1196d1afcf38a0', 'tunglam2', 45, 4, 'd54a19c4455bfcb7117c29e20f040c3d1bd9f084', 1, '', 1, '2016-07-08 10:53:26', 0),
(353, NULL, 0, 0, '', '', NULL, 'phucnguyen@icsc.vn', '1', '', NULL, '730a6bba526973dc7fa9f303e1e5f81b3ce46e67', 'cf7e420a7', 'a:0:{}', '', 0, 0, '', '192.168.0.10', NULL, 4, 0, NULL, 0, 0, 0, '', '2016-06-08 10:52:12', '1', NULL, NULL, '', '', '', '', 'http://192.168.0.68/s007/system/upload/353_Screenshot_from_2016-05-23_09:23:59.png.5fdb1ddc46f91b98e180323dac0abd0e', 'tunglam1', 45, 7, '730a6bba526973dc7fa9f303e1e5f81b3ce46e67', 1, '', 1, '2016-07-08 10:48:12', 0);

-- --------------------------------------------------------

--
-- Structure de la table `sm_customer_activity`
--

CREATE TABLE IF NOT EXISTS `sm_customer_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=209 ;

--
-- Contenu de la table `sm_customer_activity`
--

INSERT INTO `sm_customer_activity` (`activity_id`, `customer_id`, `key`, `data`, `ip`, `date_added`) VALUES
(1, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:8:"Company ";}', '27.70.184.67', '2016-03-26 10:01:38'),
(2, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:8:"Company ";}', '27.70.184.67', '2016-03-26 11:27:27'),
(3, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.187.23.6', '2016-03-26 14:06:27'),
(4, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.187.23.6', '2016-03-26 15:46:25'),
(5, 8, 'login', 'a:2:{s:11:"customer_id";s:1:"8";s:4:"name";s:21:"Nguyễn Ngọc Minh ";}', '113.187.23.6', '2016-03-26 15:49:49'),
(6, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.187.23.6', '2016-03-26 16:42:49'),
(7, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.187.17.56', '2016-03-27 09:10:07'),
(8, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.187.23.36', '2016-03-27 11:48:28'),
(9, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.182.243.153', '2016-03-27 14:57:40'),
(10, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-03-28 13:47:43'),
(11, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '113.176.64.43', '2016-03-28 13:55:03'),
(12, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-03-28 14:03:51'),
(13, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.69.23.177', '2016-03-28 16:00:53'),
(14, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-03-28 16:28:37'),
(15, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-03-28 17:00:50'),
(16, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-03-28 17:10:03'),
(17, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.69.6.105', '2016-03-29 09:54:41'),
(18, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.69.6.105', '2016-03-29 10:48:32'),
(19, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.187.17.48', '2016-03-29 11:11:46'),
(20, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-03-29 15:17:14'),
(21, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-03-29 15:35:36'),
(22, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-03-29 15:38:51'),
(23, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-03-29 16:37:57'),
(24, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.69.6.105', '2016-03-29 17:11:56'),
(25, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-03-29 17:12:28'),
(26, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.187.23.22', '2016-03-29 18:45:22'),
(27, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.187.23.22', '2016-03-29 18:52:17'),
(28, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '183.80.182.150', '2016-03-29 21:29:18'),
(29, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:19:"Bùi Thị Kim Hoa ";}', '183.80.83.40', '2016-03-29 22:59:46'),
(30, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '66.249.82.98', '2016-03-30 03:16:18'),
(31, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.70.71.136', '2016-03-30 08:44:47'),
(32, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.70.71.136', '2016-03-30 09:27:55'),
(33, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-03-30 09:50:32'),
(34, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-03-30 10:36:23'),
(35, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.70.71.136', '2016-03-30 10:41:13'),
(36, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.70.71.136', '2016-03-30 10:41:49'),
(37, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.70.71.136', '2016-03-30 10:48:39'),
(38, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-03-30 14:01:28'),
(39, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-03-30 15:36:55'),
(40, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.70.76.136', '2016-03-31 09:21:25'),
(41, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '183.80.51.201', '2016-03-31 13:05:28'),
(42, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.73.172.81', '2016-03-31 14:29:58'),
(43, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.73.172.81', '2016-03-31 14:42:52'),
(44, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.73.172.81', '2016-03-31 15:28:37'),
(45, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.73.172.81', '2016-03-31 15:46:05'),
(46, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-03-31 17:22:13'),
(47, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-03-31 17:24:02'),
(48, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '66.249.82.92', '2016-04-01 03:33:05'),
(49, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:21:"Lâm Minh Trrường ";}', '58.186.106.76', '2016-04-02 22:25:43'),
(50, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '58.186.106.76', '2016-04-02 22:28:16'),
(51, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '171.249.32.107', '2016-04-03 10:56:23'),
(52, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-04-04 16:18:39'),
(53, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.69.87.245', '2016-04-04 17:38:46'),
(54, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.69.160.232', '2016-04-05 08:19:47'),
(55, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.69.160.232', '2016-04-05 08:25:34'),
(56, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-04-05 10:24:36'),
(57, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-04-05 10:48:04'),
(58, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.69.160.232', '2016-04-05 13:22:31'),
(59, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '66.249.82.98', '2016-04-05 14:59:48'),
(60, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.69.160.232', '2016-04-05 15:27:15'),
(61, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.187.17.12', '2016-04-05 15:36:32'),
(62, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.69.160.232', '2016-04-05 16:01:54'),
(63, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-04-05 17:59:35'),
(64, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '66.249.82.98', '2016-04-05 19:40:19'),
(65, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-04-06 13:55:29'),
(66, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-04-06 14:06:08'),
(67, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '66.249.82.92', '2016-04-06 14:34:10'),
(68, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '64.233.172.224', '2016-04-06 19:15:54'),
(69, 16, 'login', 'a:2:{s:11:"customer_id";s:2:"16";s:4:"name";s:16:"Mai Văn Hiếu ";}', '113.185.1.109', '2016-04-07 08:27:45'),
(70, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '66.249.82.95', '2016-04-07 20:12:48'),
(71, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '66.249.82.92', '2016-04-08 16:04:49'),
(72, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.187.17.23', '2016-04-08 17:55:49'),
(73, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '120.72.83.181', '2016-04-09 08:52:26'),
(74, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '120.72.83.181', '2016-04-09 08:54:08'),
(75, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '120.72.83.181', '2016-04-09 09:09:33'),
(76, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '120.72.83.181', '2016-04-09 09:10:16'),
(77, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '120.72.83.181', '2016-04-09 09:17:19'),
(78, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '120.72.83.181', '2016-04-09 09:22:32'),
(79, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '120.72.83.181', '2016-04-09 09:48:20'),
(80, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '120.72.107.82', '2016-04-09 09:54:29'),
(81, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:20:"Lâm Minh Trường ";}', '171.249.110.222', '2016-04-09 21:12:17'),
(82, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '171.249.110.222', '2016-04-09 21:17:48'),
(83, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '42.116.35.47', '2016-04-10 06:33:27'),
(84, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '171.249.35.71', '2016-04-10 11:30:45'),
(85, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-04-11 08:04:00'),
(86, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-04-11 09:22:11'),
(87, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.187.17.103', '2016-04-12 21:04:57'),
(88, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-04-13 14:02:01'),
(89, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '::1', '2016-04-11 15:51:27'),
(90, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.73.34.154', '2016-04-15 16:20:53'),
(91, 16, 'login', 'a:2:{s:11:"customer_id";s:2:"16";s:4:"name";s:16:"Mai Văn Hiếu ";}', '113.185.25.107', '2016-04-15 22:55:33'),
(92, 16, 'login', 'a:2:{s:11:"customer_id";s:2:"16";s:4:"name";s:16:"Mai Văn Hiếu ";}', '113.185.27.95', '2016-04-16 02:08:17'),
(93, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '171.249.35.71', '2016-04-17 08:36:55'),
(94, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '171.249.35.71', '2016-04-17 10:36:44'),
(95, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '66.249.82.92', '2016-04-17 14:57:11'),
(96, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '171.249.35.71', '2016-04-17 15:23:29'),
(97, 17, 'login', 'a:2:{s:11:"customer_id";s:2:"17";s:4:"name";s:21:"Lại Thị Kim Loan ";}', '171.249.35.71', '2016-04-17 16:09:40'),
(98, 17, 'login', 'a:2:{s:11:"customer_id";s:2:"17";s:4:"name";s:21:"Lại Thị Kim Loan ";}', '116.102.200.156', '2016-04-17 16:55:06'),
(99, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '66.249.82.98', '2016-04-18 22:48:16'),
(100, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '66.249.82.92', '2016-04-19 03:18:45'),
(101, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.187.17.66', '2016-04-21 19:53:30'),
(102, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.161.60.235', '2016-04-24 13:24:00'),
(103, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '1.54.232.110', '2016-04-24 21:30:26'),
(104, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '1.54.232.110', '2016-04-24 23:10:31'),
(105, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.70.125.29', '2016-04-26 11:12:04'),
(106, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.70.125.29', '2016-04-26 15:48:38'),
(107, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-04-26 17:45:35'),
(108, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.70.177.29', '2016-04-27 09:36:33'),
(109, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '113.176.64.43', '2016-04-27 16:48:02'),
(110, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '27.70.177.29', '2016-04-27 17:39:11'),
(111, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '66.249.82.92', '2016-04-28 02:08:16'),
(112, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '192.168.0.10', '2016-05-11 08:27:44'),
(113, 2, 'login', 'a:2:{s:11:"customer_id";s:1:"2";s:4:"name";s:26:"Nguyễn Thị Thùy Linh ";}', '192.168.0.11', '2016-05-11 09:41:31'),
(114, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '192.168.0.10', '2016-05-11 15:47:28'),
(115, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '192.168.0.10', '2016-05-11 15:54:15'),
(116, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '192.168.0.10', '2016-05-11 16:00:06'),
(117, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '192.168.0.10', '2016-05-11 16:05:38'),
(118, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '192.168.0.10', '2016-05-11 16:55:48'),
(119, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '192.168.0.10', '2016-05-11 17:01:11'),
(120, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '192.168.0.10', '2016-05-11 17:02:08'),
(121, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:19:"Bùi Thị Kim Hoa ";}', '192.168.0.10', '2016-05-11 17:23:52'),
(122, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:20:"Lâm Minh Trường ";}', '192.168.0.10', '2016-05-12 08:21:38'),
(123, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:20:"Lâm Minh Trường ";}', '192.168.0.10', '2016-05-12 08:24:43'),
(124, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:20:"Lâm Minh Trường ";}', '192.168.0.10', '2016-05-12 09:25:25'),
(125, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:20:"Lâm Minh Trường ";}', '192.168.0.10', '2016-05-12 13:05:47'),
(126, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-12 14:32:34'),
(127, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '192.168.0.10', '2016-05-12 16:55:59'),
(128, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '192.168.0.10', '2016-05-12 16:56:04'),
(129, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:19:"Bùi Thị Kim Hoa ";}', '192.168.0.68', '2016-05-12 17:54:02'),
(130, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:21:"Phạm Tuyết Trinh ";}', '192.168.0.10', '2016-05-13 10:25:18'),
(131, 7, 'login', 'a:2:{s:11:"customer_id";s:1:"7";s:4:"name";s:21:"Trần Thị Thu Nhi ";}', '192.168.0.68', '2016-05-13 11:02:31'),
(132, 18, 'login', 'a:2:{s:11:"customer_id";s:2:"18";s:4:"name";s:5:"test ";}', '192.168.0.10', '2016-05-13 13:34:05'),
(133, 18, 'login', 'a:2:{s:11:"customer_id";s:2:"18";s:4:"name";s:5:"test ";}', '192.168.0.10', '2016-05-13 14:46:34'),
(134, 18, 'login', 'a:2:{s:11:"customer_id";s:2:"18";s:4:"name";s:5:"test ";}', '192.168.0.10', '2016-05-13 16:22:54'),
(135, 18, 'login', 'a:2:{s:11:"customer_id";s:2:"18";s:4:"name";s:5:"test ";}', '192.168.0.10', '2016-05-14 08:59:01'),
(136, 18, 'login', 'a:2:{s:11:"customer_id";s:2:"18";s:4:"name";s:5:"test ";}', '192.168.0.10', '2016-05-14 12:05:57'),
(137, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-18 08:59:14'),
(138, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-18 09:24:27'),
(139, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-18 09:44:20'),
(140, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-18 11:18:53'),
(141, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-18 12:50:06'),
(142, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-18 15:05:53'),
(143, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-18 16:21:01'),
(144, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-18 16:32:04'),
(145, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-18 17:11:35'),
(146, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-19 08:48:20'),
(147, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-19 08:59:28'),
(148, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-19 09:15:21'),
(149, 21, 'login', 'a:2:{s:11:"customer_id";s:2:"21";s:4:"name";s:1:" ";}', '192.168.0.10', '2016-05-19 09:16:19'),
(150, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-19 09:16:32'),
(151, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:19:"Bùi Thị Kim Hoa ";}', '192.168.0.10', '2016-05-19 12:26:32'),
(152, 22, 'login', 'a:2:{s:11:"customer_id";s:2:"22";s:4:"name";s:1:" ";}', '192.168.0.10', '2016-05-19 12:27:20'),
(153, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-19 12:34:00'),
(154, 22, 'login', 'a:2:{s:11:"customer_id";s:2:"22";s:4:"name";s:1:" ";}', '192.168.0.10', '2016-05-19 12:43:13'),
(155, 23, 'login', 'a:2:{s:11:"customer_id";s:2:"23";s:4:"name";s:1:" ";}', '192.168.0.10', '2016-05-19 12:45:13'),
(156, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-19 12:50:34'),
(157, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-19 13:14:42'),
(158, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-19 15:18:45'),
(159, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-20 14:16:32'),
(160, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-20 15:08:28'),
(161, 18, 'login', 'a:2:{s:11:"customer_id";s:2:"18";s:4:"name";s:5:"test ";}', '192.168.0.10', '2016-05-20 17:50:01'),
(162, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-23 13:06:45'),
(163, 18, 'login', 'a:2:{s:11:"customer_id";s:2:"18";s:4:"name";s:5:"test ";}', '192.168.0.10', '2016-05-23 13:13:32'),
(164, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-23 13:22:16'),
(165, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:18:"Lâm Minh Nguyên ";}', '192.168.0.10', '2016-05-23 13:23:26'),
(166, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-23 16:36:10'),
(167, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-24 09:22:50'),
(168, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-24 10:16:39'),
(169, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-24 13:28:31'),
(170, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-24 13:30:04'),
(171, 18, 'login', 'a:2:{s:11:"customer_id";s:2:"18";s:4:"name";s:5:"test ";}', '192.168.0.10', '2016-05-24 14:20:09'),
(172, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-24 15:56:21'),
(173, 18, 'login', 'a:2:{s:11:"customer_id";s:2:"18";s:4:"name";s:5:"test ";}', '192.168.0.235', '2016-05-25 08:19:27'),
(174, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.235', '2016-05-25 08:21:03'),
(175, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-25 08:28:05'),
(176, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-25 09:26:25'),
(177, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-25 09:28:36'),
(178, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-25 11:47:08'),
(179, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-25 13:08:53'),
(180, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-25 14:45:40'),
(181, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-25 14:51:50'),
(182, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-26 10:37:02'),
(183, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-26 13:01:06'),
(184, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-26 14:06:02'),
(185, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-26 16:00:08'),
(186, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-26 16:03:26'),
(187, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-27 09:30:59'),
(188, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-27 09:49:41'),
(189, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-27 11:06:45'),
(190, 48, 'login', 'a:2:{s:11:"customer_id";s:2:"48";s:4:"name";s:1:" ";}', '192.168.0.10', '2016-05-27 11:15:49'),
(191, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-27 12:18:27'),
(192, 48, 'login', 'a:2:{s:11:"customer_id";s:2:"48";s:4:"name";s:1:" ";}', '192.168.0.10', '2016-05-27 12:30:18'),
(193, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-27 14:02:46'),
(194, 31, 'login', 'a:2:{s:11:"customer_id";s:2:"31";s:4:"name";s:1:" ";}', '192.168.0.10', '2016-05-27 14:04:17'),
(195, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-27 14:19:27'),
(196, 31, 'login', 'a:2:{s:11:"customer_id";s:2:"31";s:4:"name";s:1:" ";}', '192.168.0.10', '2016-05-27 14:21:41'),
(197, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-27 14:40:13'),
(198, 31, 'login', 'a:2:{s:11:"customer_id";s:2:"31";s:4:"name";s:1:" ";}', '192.168.0.10', '2016-05-27 14:40:48'),
(199, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-27 14:41:08'),
(200, 31, 'login', 'a:2:{s:11:"customer_id";s:2:"31";s:4:"name";s:1:" ";}', '192.168.0.10', '2016-05-27 14:41:47'),
(201, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-27 14:42:20'),
(202, 31, 'login', 'a:2:{s:11:"customer_id";s:2:"31";s:4:"name";s:1:" ";}', '192.168.0.10', '2016-05-27 14:43:47'),
(203, 31, 'login', 'a:2:{s:11:"customer_id";s:2:"31";s:4:"name";s:1:" ";}', '192.168.0.10', '2016-05-27 14:55:20'),
(204, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:15:"Lâm Minh Sang ";}', '192.168.0.10', '2016-05-27 15:17:15'),
(205, 20, 'login', 'a:2:{s:11:"customer_id";s:2:"20";s:4:"name";s:1:" ";}', '192.168.0.10', '2016-05-27 15:41:11'),
(206, 20, 'login', 'a:2:{s:11:"customer_id";s:2:"20";s:4:"name";s:1:" ";}', '192.168.0.10', '2016-05-27 15:43:51'),
(207, 20, 'login', 'a:2:{s:11:"customer_id";s:2:"20";s:4:"name";s:1:" ";}', '192.168.0.10', '2016-05-27 15:47:12'),
(208, 20, 'login', 'a:2:{s:11:"customer_id";s:2:"20";s:4:"name";s:1:" ";}', '192.168.0.10', '2016-05-27 15:47:45');

-- --------------------------------------------------------

--
-- Structure de la table `sm_customer_ban_ip`
--

CREATE TABLE IF NOT EXISTS `sm_customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_customer_c_wallet`
--

CREATE TABLE IF NOT EXISTS `sm_customer_c_wallet` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Contenu de la table `sm_customer_c_wallet`
--

INSERT INTO `sm_customer_c_wallet` (`id`, `customer_id`, `amount`) VALUES
(1, 282, 0),
(2, 182, 0),
(3, 68, 0),
(4, 342, 0),
(5, 195, 0),
(6, 216, 0),
(7, 61, 0),
(8, 45, 0),
(9, 259, 0),
(10, 285, 0),
(11, 84, 0),
(12, 344, 0),
(13, 145, 0),
(14, 92, 0),
(15, 48, 0),
(16, 353, 0),
(17, 354, 0);

-- --------------------------------------------------------

--
-- Structure de la table `sm_customer_e_wallet`
--

CREATE TABLE IF NOT EXISTS `sm_customer_e_wallet` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Contenu de la table `sm_customer_e_wallet`
--

INSERT INTO `sm_customer_e_wallet` (`id`, `customer_id`, `amount`) VALUES
(1, 282, 0),
(2, 182, 0),
(3, 68, 150),
(4, 342, 0),
(5, 195, 0),
(6, 216, 0),
(7, 61, 0),
(8, 45, 20),
(9, 259, 0),
(10, 285, 0),
(11, 84, 0),
(12, 344, 0),
(13, 145, 0),
(14, 92, 0),
(15, 64, 0),
(16, 48, 0),
(17, 353, 0),
(18, 201, 0),
(19, 162, 0),
(20, 50, 0),
(21, 354, 0);

-- --------------------------------------------------------

--
-- Structure de la table `sm_customer_get_donation`
--

CREATE TABLE IF NOT EXISTS `sm_customer_get_donation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `date_added` datetime NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0: WATTING ; 1: MATCHED  2: FINISH',
  `gd_number` double NOT NULL,
  `filled` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `sm_customer_get_donation`
--

INSERT INTO `sm_customer_get_donation` (`id`, `customer_id`, `amount`, `date_added`, `status`, `gd_number`, `filled`) VALUES
(1, 68, 200, '2016-06-06 12:32:27', 2, 146333582723, 0),
(2, 45, 200, '2016-06-08 10:57:13', 2, 18524230711, 0);

-- --------------------------------------------------------

--
-- Structure de la table `sm_customer_group`
--

CREATE TABLE IF NOT EXISTS `sm_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `sm_customer_group`
--

INSERT INTO `sm_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1),
(2, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `sm_customer_group_description`
--

CREATE TABLE IF NOT EXISTS `sm_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sm_customer_group_description`
--

INSERT INTO `sm_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test'),
(1, 2, 'Default', 'test');

-- --------------------------------------------------------

--
-- Structure de la table `sm_customer_history`
--

CREATE TABLE IF NOT EXISTS `sm_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_customer_ip`
--

CREATE TABLE IF NOT EXISTS `sm_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=960 ;

--
-- Contenu de la table `sm_customer_ip`
--

INSERT INTO `sm_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '27.70.184.67', '2016-03-26 10:01:39'),
(2, 1, '113.187.23.6', '2016-03-26 14:06:27'),
(3, 8, '113.187.23.6', '2016-03-26 15:49:50'),
(4, 1, '113.187.17.56', '2016-03-27 09:10:08'),
(5, 1, '113.187.23.36', '2016-03-27 11:48:29'),
(6, 1, '113.182.243.153', '2016-03-27 14:57:40'),
(7, 1, '113.176.64.43', '2016-03-28 13:47:44'),
(8, 5, '113.176.64.43', '2016-03-28 13:55:03'),
(9, 1, '27.69.23.177', '2016-03-28 16:00:53'),
(10, 1, '27.69.6.105', '2016-03-29 09:54:41'),
(11, 1, '113.187.17.48', '2016-03-29 11:11:46'),
(12, 1, '113.187.23.22', '2016-03-29 18:45:22'),
(13, 1, '183.80.182.150', '2016-03-29 21:29:18'),
(14, 4, '183.80.83.40', '2016-03-29 22:59:46'),
(15, 5, '66.249.82.95', '2016-03-30 03:16:18'),
(16, 5, '66.249.82.92', '2016-03-30 03:16:19'),
(17, 5, '66.249.82.98', '2016-03-30 03:17:58'),
(18, 1, '27.70.71.136', '2016-03-30 08:44:47'),
(19, 1, '27.70.76.136', '2016-03-31 09:21:25'),
(20, 1, '183.80.51.201', '2016-03-31 13:05:28'),
(21, 1, '27.73.172.81', '2016-03-31 14:29:59'),
(22, 6, '58.186.106.76', '2016-04-02 22:25:43'),
(23, 1, '58.186.106.76', '2016-04-02 22:28:16'),
(24, 1, '171.249.32.107', '2016-04-03 10:56:24'),
(25, 1, '27.69.87.245', '2016-04-04 17:38:48'),
(26, 1, '27.69.160.232', '2016-04-05 08:19:48'),
(27, 1, '113.187.17.12', '2016-04-05 15:36:32'),
(28, 1, '116.102.207.30', '2016-04-05 15:37:44'),
(29, 5, '64.233.172.216', '2016-04-06 19:15:55'),
(30, 5, '64.233.172.224', '2016-04-06 19:16:05'),
(31, 16, '113.185.1.109', '2016-04-07 08:27:47'),
(32, 16, '113.185.5.179', '2016-04-07 08:28:35'),
(33, 1, '113.187.17.23', '2016-04-08 17:55:49'),
(34, 1, '120.72.83.181', '2016-04-09 08:52:26'),
(35, 1, '120.72.107.82', '2016-04-09 09:54:29'),
(36, 6, '171.249.110.222', '2016-04-09 21:12:18'),
(37, 1, '171.249.110.222', '2016-04-09 21:17:48'),
(38, 1, '42.116.35.47', '2016-04-10 06:33:28'),
(39, 5, '171.249.35.71', '2016-04-10 11:30:47'),
(40, 1, '113.187.17.103', '2016-04-12 21:04:57'),
(41, 1, '::1', '2016-04-11 15:51:27'),
(42, 1, '27.73.34.154', '2016-04-15 16:20:53'),
(43, 16, '113.185.25.2', '2016-04-15 22:55:33'),
(44, 16, '113.185.25.83', '2016-04-15 22:56:12'),
(45, 16, '113.185.25.113', '2016-04-15 22:56:14'),
(46, 16, '113.185.25.57', '2016-04-15 22:56:40'),
(47, 16, '113.185.27.95', '2016-04-16 02:08:17'),
(48, 1, '171.249.35.71', '2016-04-17 08:36:56'),
(49, 17, '171.249.35.71', '2016-04-17 16:09:40'),
(50, 17, '116.102.200.156', '2016-04-17 16:55:06'),
(51, 1, '113.187.17.66', '2016-04-21 19:53:30'),
(52, 1, '113.161.60.235', '2016-04-24 13:24:00'),
(53, 1, '1.54.232.110', '2016-04-24 21:30:26'),
(54, 1, '27.70.125.29', '2016-04-26 11:12:04'),
(55, 1, '27.70.177.29', '2016-04-27 09:36:33'),
(56, 1, '192.168.0.10', '2016-05-11 08:27:44'),
(57, 2, '192.168.0.11', '2016-05-11 09:41:31'),
(58, 5, '192.168.0.10', '2016-05-11 15:47:28'),
(59, 4, '192.168.0.10', '2016-05-11 17:23:52'),
(60, 6, '192.168.0.10', '2016-05-12 08:21:38'),
(61, 3, '192.168.0.10', '2016-05-12 14:32:34'),
(62, 4, '192.168.0.68', '2016-05-12 17:54:02'),
(63, 7, '192.168.0.68', '2016-05-13 11:02:31'),
(64, 18, '192.168.0.10', '2016-05-13 13:34:05'),
(65, 21, '192.168.0.10', '2016-05-19 09:16:19'),
(66, 22, '192.168.0.10', '2016-05-19 12:27:20'),
(67, 23, '192.168.0.10', '2016-05-19 12:45:13'),
(68, 18, '192.168.0.235', '2016-05-25 08:19:27'),
(69, 3, '192.168.0.235', '2016-05-25 08:21:03'),
(70, 48, '192.168.0.10', '2016-05-27 11:15:49'),
(71, 31, '192.168.0.10', '2016-05-27 14:04:17'),
(72, 20, '192.168.0.10', '2016-05-27 15:41:11'),
(73, 18, '120.72.83.181', '2016-05-28 10:32:08'),
(74, 18, '171.249.117.39', '2016-05-28 11:18:00'),
(75, 18, '64.233.173.1', '2016-05-28 11:18:01'),
(76, 18, '64.233.173.121', '2016-05-28 11:18:01'),
(77, 18, '64.233.173.126', '2016-05-28 11:21:00'),
(78, 36, '171.249.117.39', '2016-05-28 11:29:21'),
(79, 36, '64.233.173.126', '2016-05-28 11:29:23'),
(80, 36, '64.233.173.1', '2016-05-28 11:29:23'),
(81, 36, '64.233.173.121', '2016-05-28 11:30:14'),
(82, 18, '66.249.82.184', '2016-05-28 11:54:06'),
(83, 18, '66.249.82.188', '2016-05-28 11:54:07'),
(84, 18, '171.253.2.247', '2016-05-28 14:03:54'),
(85, 18, '171.253.23.43', '2016-05-28 14:46:03'),
(86, 18, '171.250.126.162', '2016-05-28 14:59:32'),
(87, 3, '171.250.126.162', '2016-05-28 15:14:22'),
(88, 45, '171.250.126.162', '2016-05-28 15:17:30'),
(89, 45, '171.253.23.43', '2016-05-28 15:44:32'),
(90, 45, '64.233.173.126', '2016-05-28 16:53:10'),
(91, 45, '64.233.173.1', '2016-05-28 16:53:35'),
(92, 45, '64.233.173.121', '2016-05-28 16:54:28'),
(93, 45, '42.112.92.115', '2016-05-28 21:54:24'),
(94, 45, '14.187.145.231', '2016-05-29 12:07:22'),
(95, 48, '14.187.145.231', '2016-05-29 12:11:33'),
(96, 45, '66.249.82.184', '2016-05-29 12:42:45'),
(97, 45, '66.249.82.188', '2016-05-29 12:42:45'),
(98, 45, '66.249.82.131', '2016-05-29 12:49:13'),
(99, 49, '14.187.145.231', '2016-05-29 13:12:54'),
(100, 49, '66.249.82.184', '2016-05-29 13:12:55'),
(101, 49, '66.249.82.188', '2016-05-29 13:13:06'),
(102, 49, '66.249.82.131', '2016-05-29 13:17:58'),
(103, 48, '116.100.159.40', '2016-05-29 13:20:59'),
(104, 50, '171.250.126.162', '2016-05-29 13:26:04'),
(105, 53, '171.255.161.177', '2016-05-29 13:27:28'),
(106, 49, '171.248.124.171', '2016-05-29 14:49:06'),
(107, 61, '116.108.25.49', '2016-05-29 14:57:55'),
(108, 50, '113.185.15.247', '2016-05-29 15:08:58'),
(109, 50, '113.185.15.138', '2016-05-29 15:09:00'),
(110, 50, '113.185.15.214', '2016-05-29 15:09:00'),
(111, 65, '116.100.159.40', '2016-05-29 15:39:33'),
(112, 64, '116.100.159.40', '2016-05-29 15:43:26'),
(113, 65, '113.185.18.244', '2016-05-29 15:58:33'),
(114, 65, '113.185.18.195', '2016-05-29 15:58:33'),
(115, 65, '113.185.18.88', '2016-05-29 15:58:33'),
(116, 65, '113.185.18.151', '2016-05-29 15:58:47'),
(117, 65, '113.185.18.9', '2016-05-29 15:59:52'),
(118, 65, '113.185.8.252', '2016-05-29 15:59:53'),
(119, 65, '113.185.18.20', '2016-05-29 15:59:56'),
(120, 65, '113.185.18.154', '2016-05-29 15:59:58'),
(121, 65, '113.185.18.114', '2016-05-29 16:00:09'),
(122, 45, '171.253.26.213', '2016-05-29 16:11:03'),
(123, 69, '116.100.159.40', '2016-05-29 16:11:52'),
(124, 72, '116.100.159.40', '2016-05-29 16:14:25'),
(125, 74, '116.100.159.40', '2016-05-29 16:16:59'),
(126, 65, '42.117.204.207', '2016-05-29 16:24:23'),
(127, 65, '113.185.18.207', '2016-05-29 16:30:08'),
(128, 65, '113.185.18.123', '2016-05-29 16:30:20'),
(129, 65, '113.185.18.236', '2016-05-29 16:30:21'),
(130, 67, '116.100.159.40', '2016-05-29 16:49:54'),
(131, 71, '116.100.159.40', '2016-05-29 17:10:31'),
(132, 82, '116.100.159.40', '2016-05-29 17:52:23'),
(133, 83, '116.100.159.40', '2016-05-29 17:58:32'),
(134, 84, '116.100.159.40', '2016-05-29 18:01:49'),
(135, 65, '113.185.18.85', '2016-05-29 19:38:07'),
(136, 65, '113.185.8.251', '2016-05-29 19:38:08'),
(137, 65, '113.185.18.145', '2016-05-29 19:38:08'),
(138, 65, '113.185.18.235', '2016-05-29 19:39:46'),
(139, 65, '113.185.18.13', '2016-05-29 19:39:47'),
(140, 45, '171.253.8.224', '2016-05-29 19:41:08'),
(141, 67, '113.187.16.81', '2016-05-29 21:05:34'),
(142, 67, '66.249.82.131', '2016-05-29 21:05:35'),
(143, 67, '66.249.82.188', '2016-05-29 21:05:35'),
(144, 45, '42.112.92.251', '2016-05-30 06:22:41'),
(145, 73, '14.186.255.132', '2016-05-30 09:46:10'),
(146, 75, '116.100.80.23', '2016-05-30 09:55:45'),
(147, 87, '14.186.255.132', '2016-05-30 10:24:13'),
(148, 45, '113.161.78.151', '2016-05-30 10:35:50'),
(149, 49, '115.75.7.46', '2016-05-30 10:42:35'),
(150, 87, '58.187.97.17', '2016-05-30 10:43:41'),
(151, 90, '113.161.78.151', '2016-05-30 10:57:39'),
(152, 80, '14.167.107.56', '2016-05-30 11:18:32'),
(153, 49, '115.79.62.72', '2016-05-30 11:22:29'),
(154, 68, '14.186.255.132', '2016-05-30 12:06:06'),
(155, 48, '14.186.255.132', '2016-05-30 12:15:12'),
(156, 91, '8.37.233.239', '2016-05-30 12:19:21'),
(157, 91, '14.186.255.132', '2016-05-30 12:27:17'),
(158, 93, '8.37.233.239', '2016-05-30 12:29:41'),
(159, 90, '14.161.14.123', '2016-05-30 13:01:30'),
(160, 90, '115.79.42.236', '2016-05-30 13:01:40'),
(161, 45, '171.253.4.26', '2016-05-30 13:09:19'),
(162, 90, '101.53.19.5', '2016-05-30 13:33:05'),
(163, 53, '171.253.4.26', '2016-05-30 14:08:37'),
(164, 67, '113.187.16.80', '2016-05-30 14:08:51'),
(165, 67, '64.233.173.121', '2016-05-30 14:08:52'),
(166, 67, '64.233.173.126', '2016-05-30 14:08:52'),
(167, 67, '64.233.173.1', '2016-05-30 14:09:00'),
(168, 97, '171.253.4.26', '2016-05-30 14:18:39'),
(169, 103, '171.253.4.26', '2016-05-30 14:51:38'),
(170, 111, '171.253.4.26', '2016-05-30 15:15:17'),
(171, 101, '116.99.247.149', '2016-05-30 15:47:37'),
(172, 45, '171.253.14.129', '2016-05-30 15:56:01'),
(173, 111, '66.249.82.184', '2016-05-30 16:01:44'),
(174, 111, '66.249.82.188', '2016-05-30 16:01:44'),
(175, 111, '113.185.28.68', '2016-05-30 16:02:05'),
(176, 111, '66.249.82.131', '2016-05-30 16:03:30'),
(177, 77, '117.0.59.88', '2016-05-30 16:35:09'),
(178, 93, '115.79.49.26', '2016-05-30 18:10:54'),
(179, 88, '14.189.147.147', '2016-05-30 18:41:28'),
(180, 65, '113.185.2.191', '2016-05-30 20:06:49'),
(181, 71, '113.185.2.191', '2016-05-30 20:08:20'),
(182, 71, '118.71.172.3', '2016-05-30 20:09:26'),
(183, 91, '115.79.49.26', '2016-05-30 20:21:46'),
(184, 115, '14.189.147.147', '2016-05-30 22:43:55'),
(185, 101, '116.99.238.4', '2016-05-30 22:53:45'),
(186, 119, '14.189.147.147', '2016-05-30 23:10:39'),
(187, 121, '14.189.147.147', '2016-05-30 23:19:51'),
(188, 67, '116.106.147.107', '2016-05-30 23:20:57'),
(189, 118, '14.189.147.147', '2016-05-30 23:27:35'),
(190, 117, '14.189.147.147', '2016-05-30 23:32:14'),
(191, 128, '14.189.147.147', '2016-05-30 23:38:12'),
(192, 129, '14.189.147.147', '2016-05-30 23:40:28'),
(193, 127, '14.189.147.147', '2016-05-30 23:43:45'),
(194, 125, '14.189.147.147', '2016-05-30 23:46:52'),
(195, 133, '14.189.147.147', '2016-05-30 23:56:26'),
(196, 48, '14.187.13.200', '2016-05-31 09:14:24'),
(197, 75, '14.184.119.128', '2016-05-31 09:27:57'),
(198, 45, '42.117.204.108', '2016-05-31 09:50:47'),
(199, 48, '14.161.36.41', '2016-05-31 10:11:08'),
(200, 90, '171.253.45.200', '2016-05-31 10:19:29'),
(201, 120, '113.183.19.138', '2016-05-31 11:09:53'),
(202, 90, '171.253.1.127', '2016-05-31 11:34:02'),
(203, 48, '116.100.157.85', '2016-05-31 11:48:12'),
(204, 79, '101.99.47.14', '2016-05-31 12:14:45'),
(205, 89, '14.183.117.197', '2016-05-31 12:30:32'),
(206, 71, '101.99.47.14', '2016-05-31 13:09:44'),
(207, 71, '42.112.124.100', '2016-05-31 13:16:24'),
(208, 71, '14.186.255.132', '2016-05-31 14:29:50'),
(209, 67, '14.186.213.159', '2016-05-31 14:33:01'),
(210, 70, '14.186.255.132', '2016-05-31 15:14:22'),
(211, 90, '183.81.15.104', '2016-05-31 15:23:28'),
(212, 110, '42.112.86.205', '2016-05-31 15:24:31'),
(213, 143, '14.186.255.132', '2016-05-31 15:31:52'),
(214, 144, '14.186.255.132', '2016-05-31 15:36:08'),
(215, 100, '14.186.255.132', '2016-05-31 16:00:35'),
(216, 152, '14.186.255.132', '2016-05-31 16:41:49'),
(217, 153, '14.186.255.132', '2016-05-31 16:43:09'),
(218, 156, '14.186.255.132', '2016-05-31 18:09:47'),
(219, 118, '113.183.19.138', '2016-05-31 19:49:58'),
(220, 125, '113.183.19.138', '2016-05-31 20:07:01'),
(221, 120, '203.210.135.74', '2016-05-31 20:12:25'),
(222, 65, '113.170.56.61', '2016-05-31 21:25:51'),
(223, 120, '123.24.32.73', '2016-05-31 21:52:42'),
(224, 45, '172.58.41.148', '2016-06-01 02:16:31'),
(225, 45, '113.22.197.199', '2016-06-01 09:31:08'),
(226, 93, '113.22.252.3', '2016-06-01 10:51:26'),
(227, 90, '183.91.25.34', '2016-06-01 11:15:57'),
(228, 48, '113.187.17.68', '2016-06-01 11:37:25'),
(229, 79, '118.69.52.100', '2016-06-01 11:48:25'),
(230, 79, '66.249.82.184', '2016-06-01 11:48:27'),
(231, 79, '66.249.82.188', '2016-06-01 11:48:27'),
(232, 79, '66.249.82.131', '2016-06-01 11:57:03'),
(233, 164, '118.69.52.100', '2016-06-01 12:23:06'),
(234, 164, '66.249.82.131', '2016-06-01 12:23:08'),
(235, 164, '66.249.82.184', '2016-06-01 12:23:08'),
(236, 68, '115.75.5.100', '2016-06-01 12:29:03'),
(237, 164, '66.249.82.188', '2016-06-01 12:29:16'),
(238, 45, '171.253.27.184', '2016-06-01 12:33:32'),
(239, 48, '113.185.18.169', '2016-06-01 12:34:38'),
(240, 48, '113.185.18.241', '2016-06-01 12:34:39'),
(241, 48, '113.185.18.39', '2016-06-01 12:34:39'),
(242, 48, '113.185.8.255', '2016-06-01 12:34:45'),
(243, 48, '113.185.18.162', '2016-06-01 12:34:46'),
(244, 48, '113.185.8.239', '2016-06-01 12:40:31'),
(245, 48, '113.185.8.236', '2016-06-01 12:40:32'),
(246, 48, '113.185.18.250', '2016-06-01 12:40:32'),
(247, 78, '113.185.26.129', '2016-06-01 12:43:11'),
(248, 78, '113.185.26.76', '2016-06-01 12:43:12'),
(249, 78, '113.185.26.41', '2016-06-01 12:43:12'),
(250, 78, '113.185.26.168', '2016-06-01 12:43:28'),
(251, 48, '113.185.18.66', '2016-06-01 12:44:32'),
(252, 71, '118.69.52.100', '2016-06-01 12:45:05'),
(253, 48, '113.185.18.75', '2016-06-01 12:45:25'),
(254, 48, '113.185.18.137', '2016-06-01 12:45:25'),
(255, 48, '113.185.18.62', '2016-06-01 12:45:25'),
(256, 48, '113.185.18.126', '2016-06-01 12:45:40'),
(257, 48, '113.185.18.88', '2016-06-01 12:47:36'),
(258, 48, '113.185.18.90', '2016-06-01 12:47:36'),
(259, 48, '113.185.18.81', '2016-06-01 12:47:36'),
(260, 48, '113.185.18.25', '2016-06-01 12:47:37'),
(261, 48, '113.185.18.16', '2016-06-01 12:47:37'),
(262, 78, '113.185.26.149', '2016-06-01 12:47:39'),
(263, 78, '113.185.26.154', '2016-06-01 12:47:39'),
(264, 78, '113.185.26.181', '2016-06-01 12:47:40'),
(265, 78, '113.185.26.231', '2016-06-01 12:47:40'),
(266, 78, '113.185.26.60', '2016-06-01 12:47:40'),
(267, 48, '113.185.18.198', '2016-06-01 12:48:57'),
(268, 78, '113.185.26.242', '2016-06-01 12:49:57'),
(269, 78, '113.185.26.165', '2016-06-01 12:50:04'),
(270, 78, '113.185.26.209', '2016-06-01 12:50:04'),
(271, 78, '113.185.26.151', '2016-06-01 12:50:04'),
(272, 78, '113.185.26.238', '2016-06-01 12:50:10'),
(273, 167, '118.69.52.100', '2016-06-01 12:57:22'),
(274, 167, '66.249.82.131', '2016-06-01 12:57:23'),
(275, 167, '66.249.82.188', '2016-06-01 12:57:23'),
(276, 167, '66.249.82.184', '2016-06-01 12:57:26'),
(277, 71, '66.249.82.184', '2016-06-01 13:07:24'),
(278, 71, '66.249.82.131', '2016-06-01 13:07:37'),
(279, 78, '113.185.26.75', '2016-06-01 13:09:02'),
(280, 71, '66.249.82.188', '2016-06-01 13:10:36'),
(281, 78, '113.185.26.72', '2016-06-01 13:12:10'),
(282, 78, '113.185.26.184', '2016-06-01 13:12:11'),
(283, 78, '113.185.26.156', '2016-06-01 13:12:11'),
(284, 78, '113.185.26.112', '2016-06-01 13:23:37'),
(285, 78, '113.185.26.207', '2016-06-01 13:23:38'),
(286, 71, '113.20.116.229', '2016-06-01 13:30:42'),
(287, 156, '113.187.16.121', '2016-06-01 13:39:06'),
(288, 177, '116.98.90.33', '2016-06-01 13:53:36'),
(289, 48, '113.185.20.42', '2016-06-01 14:41:35'),
(290, 110, '42.112.94.109', '2016-06-01 15:45:14'),
(291, 91, '116.100.218.88', '2016-06-01 15:51:33'),
(292, 48, '115.72.196.165', '2016-06-01 16:15:00'),
(293, 68, '115.72.196.165', '2016-06-01 16:15:17'),
(294, 92, '115.72.196.165', '2016-06-01 16:16:53'),
(295, 86, '115.72.196.165', '2016-06-01 16:24:14'),
(296, 70, '115.72.196.165', '2016-06-01 16:55:35'),
(297, 185, '115.72.196.165', '2016-06-01 16:57:07'),
(298, 188, '115.72.196.165', '2016-06-01 17:11:04'),
(299, 191, '116.100.218.88', '2016-06-01 17:24:19'),
(300, 48, '113.187.23.6', '2016-06-01 17:27:12'),
(301, 64, '113.187.23.6', '2016-06-01 17:29:51'),
(302, 45, '171.253.25.190', '2016-06-01 17:33:39'),
(303, 185, '113.185.20.42', '2016-06-01 17:57:43'),
(304, 45, '120.72.83.181', '2016-06-01 18:13:11'),
(305, 150, '216.177.128.152', '2016-06-01 19:46:53'),
(306, 91, '42.117.182.21', '2016-06-01 20:59:26'),
(307, 86, '27.3.127.96', '2016-06-01 21:55:22'),
(308, 79, '171.236.123.100', '2016-06-01 22:28:33'),
(309, 71, '171.236.123.100', '2016-06-01 22:52:03'),
(310, 71, '64.233.173.121', '2016-06-01 22:52:03'),
(311, 71, '64.233.173.1', '2016-06-01 22:52:05'),
(312, 71, '64.233.173.126', '2016-06-01 22:56:10'),
(313, 195, '27.2.211.184', '2016-06-01 23:11:48'),
(314, 195, '171.236.123.100', '2016-06-01 23:12:14'),
(315, 195, '64.233.173.126', '2016-06-01 23:12:15'),
(316, 195, '64.233.173.1', '2016-06-01 23:12:15'),
(317, 195, '64.233.173.121', '2016-06-01 23:12:49'),
(318, 79, '64.233.173.1', '2016-06-01 23:13:33'),
(319, 79, '64.233.173.126', '2016-06-01 23:13:33'),
(320, 45, '98.26.78.224', '2016-06-01 23:22:37'),
(321, 45, '208.54.44.242', '2016-06-01 23:28:34'),
(322, 79, '64.233.173.121', '2016-06-01 23:40:06'),
(323, 187, '221.121.1.27', '2016-06-01 23:57:55'),
(324, 193, '14.186.124.144', '2016-06-02 00:12:25'),
(325, 71, '113.185.18.134', '2016-06-02 02:38:48'),
(326, 71, '113.185.18.16', '2016-06-02 02:38:49'),
(327, 71, '113.185.18.109', '2016-06-02 02:38:49'),
(328, 71, '113.185.18.29', '2016-06-02 02:38:58'),
(329, 71, '113.185.18.6', '2016-06-02 02:38:58'),
(330, 71, '113.185.18.67', '2016-06-02 02:39:33'),
(331, 71, '113.185.8.251', '2016-06-02 02:39:37'),
(332, 71, '113.185.18.248', '2016-06-02 02:39:37'),
(333, 71, '113.185.18.247', '2016-06-02 02:39:39'),
(334, 71, '113.185.18.172', '2016-06-02 02:40:10'),
(335, 71, '113.185.18.205', '2016-06-02 02:45:00'),
(336, 71, '113.185.8.238', '2016-06-02 02:45:01'),
(337, 71, '113.185.8.247', '2016-06-02 02:45:01'),
(338, 71, '113.185.18.79', '2016-06-02 02:45:01'),
(339, 71, '113.185.18.133', '2016-06-02 02:45:01'),
(340, 71, '113.185.18.45', '2016-06-02 02:45:35'),
(341, 71, '113.185.18.113', '2016-06-02 02:45:54'),
(342, 71, '113.185.18.104', '2016-06-02 02:46:00'),
(343, 71, '113.185.18.69', '2016-06-02 02:46:04'),
(344, 71, '113.185.18.38', '2016-06-02 02:46:05'),
(345, 71, '113.185.18.82', '2016-06-02 02:47:34'),
(346, 71, '113.185.18.86', '2016-06-02 02:47:34'),
(347, 71, '113.185.18.206', '2016-06-02 02:47:34'),
(348, 71, '113.185.18.170', '2016-06-02 02:47:35'),
(349, 71, '113.185.18.230', '2016-06-02 02:47:35'),
(350, 71, '113.185.18.77', '2016-06-02 02:49:48'),
(351, 200, '113.185.18.236', '2016-06-02 02:50:11'),
(352, 200, '113.185.18.125', '2016-06-02 02:50:11'),
(353, 200, '113.185.18.248', '2016-06-02 02:50:11'),
(354, 200, '113.185.18.197', '2016-06-02 02:50:19'),
(355, 200, '113.185.18.95', '2016-06-02 02:50:20'),
(356, 200, '113.185.18.65', '2016-06-02 02:51:36'),
(357, 65, '113.185.18.229', '2016-06-02 02:53:12'),
(358, 65, '113.185.18.144', '2016-06-02 02:53:12'),
(359, 65, '113.185.18.199', '2016-06-02 02:53:12'),
(360, 65, '113.185.18.188', '2016-06-02 02:53:20'),
(361, 65, '113.185.18.65', '2016-06-02 02:53:20'),
(362, 200, '113.185.18.8', '2016-06-02 02:55:07'),
(363, 200, '113.185.18.50', '2016-06-02 02:55:08'),
(364, 200, '113.185.18.168', '2016-06-02 02:55:08'),
(365, 200, '113.185.18.192', '2016-06-02 02:55:32'),
(366, 65, '113.185.18.69', '2016-06-02 02:55:57'),
(367, 65, '113.185.18.57', '2016-06-02 02:55:58'),
(368, 65, '113.185.18.56', '2016-06-02 02:56:16'),
(369, 65, '113.185.8.237', '2016-06-02 02:56:17'),
(370, 65, '113.185.18.192', '2016-06-02 02:57:56'),
(371, 65, '113.185.18.74', '2016-06-02 02:58:06'),
(372, 174, '113.185.18.51', '2016-06-02 02:58:31'),
(373, 174, '113.185.18.63', '2016-06-02 02:58:32'),
(374, 174, '113.185.8.227', '2016-06-02 02:58:32'),
(375, 174, '113.185.18.32', '2016-06-02 02:58:37'),
(376, 174, '113.185.18.241', '2016-06-02 02:58:38'),
(377, 45, '108.31.82.221', '2016-06-02 08:06:42'),
(378, 45, '172.56.2.226', '2016-06-02 08:19:03'),
(379, 179, '42.116.180.32', '2016-06-02 08:39:57'),
(380, 45, '172.56.3.156', '2016-06-02 08:44:40'),
(381, 192, '113.187.16.42', '2016-06-02 08:45:24'),
(382, 192, '14.167.56.43', '2016-06-02 08:46:47'),
(383, 91, '113.187.16.42', '2016-06-02 08:51:19'),
(384, 93, '113.187.16.42', '2016-06-02 09:18:18'),
(385, 77, '117.0.61.128', '2016-06-02 09:30:08'),
(386, 120, '113.178.4.24', '2016-06-02 09:47:35'),
(387, 90, '171.253.40.123', '2016-06-02 09:48:45'),
(388, 71, '113.185.18.92', '2016-06-02 10:10:55'),
(389, 71, '113.185.8.255', '2016-06-02 10:10:57'),
(390, 71, '113.185.18.52', '2016-06-02 10:10:59'),
(391, 71, '113.185.18.95', '2016-06-02 10:11:38'),
(392, 71, '113.185.18.71', '2016-06-02 10:11:42'),
(393, 71, '113.185.18.241', '2016-06-02 10:11:45'),
(394, 71, '113.185.18.115', '2016-06-02 10:12:04'),
(395, 67, '101.99.47.14', '2016-06-02 10:31:34'),
(396, 67, '66.249.82.184', '2016-06-02 10:31:36'),
(397, 177, '14.174.30.148', '2016-06-02 10:50:27'),
(398, 91, '1.54.122.47', '2016-06-02 11:05:22'),
(399, 179, '14.176.132.89', '2016-06-02 11:41:14'),
(400, 94, '1.53.103.6', '2016-06-02 12:03:07'),
(401, 110, '116.99.247.22', '2016-06-02 12:11:13'),
(402, 182, '171.232.239.139', '2016-06-02 12:14:53'),
(403, 45, '42.117.204.5', '2016-06-02 12:44:39'),
(404, 48, '113.187.23.3', '2016-06-02 12:46:10'),
(405, 143, '27.74.159.155', '2016-06-02 13:06:53'),
(406, 146, '27.74.159.155', '2016-06-02 13:10:34'),
(407, 147, '27.74.159.155', '2016-06-02 13:11:14'),
(408, 195, '117.0.0.166', '2016-06-02 13:14:09'),
(409, 186, '113.187.22.66', '2016-06-02 13:24:36'),
(410, 90, '171.253.13.23', '2016-06-02 14:04:40'),
(411, 98, '101.99.47.14', '2016-06-02 14:20:07'),
(412, 71, '117.0.0.166', '2016-06-02 14:22:17'),
(413, 91, '113.187.16.118', '2016-06-02 14:40:27'),
(414, 48, '101.99.47.14', '2016-06-02 14:43:56'),
(415, 191, '113.185.20.30', '2016-06-02 15:30:01'),
(416, 86, '101.99.47.14', '2016-06-02 15:32:32'),
(417, 213, '101.99.47.14', '2016-06-02 15:36:16'),
(418, 67, '42.118.145.23', '2016-06-02 15:47:50'),
(419, 45, '171.253.23.130', '2016-06-02 15:53:31'),
(420, 147, '101.99.47.14', '2016-06-02 16:03:14'),
(421, 191, '171.253.3.49', '2016-06-02 16:10:39'),
(422, 216, '101.99.47.14', '2016-06-02 16:32:14'),
(423, 143, '101.99.47.14', '2016-06-02 16:35:33'),
(424, 218, '101.99.47.14', '2016-06-02 16:36:40'),
(425, 90, '171.253.5.125', '2016-06-02 16:43:43'),
(426, 69, '115.79.60.181', '2016-06-02 16:47:44'),
(427, 95, '42.114.135.9', '2016-06-02 16:50:55'),
(428, 88, '113.183.19.138', '2016-06-02 17:05:29'),
(429, 45, '27.74.136.92', '2016-06-02 17:06:29'),
(430, 126, '113.183.19.138', '2016-06-02 17:08:46'),
(431, 220, '115.79.60.181', '2016-06-02 17:10:19'),
(432, 69, '113.185.18.159', '2016-06-02 17:22:47'),
(433, 69, '113.185.18.80', '2016-06-02 17:22:48'),
(434, 69, '113.185.18.28', '2016-06-02 17:22:48'),
(435, 69, '113.185.18.144', '2016-06-02 17:22:58'),
(436, 69, '113.185.18.110', '2016-06-02 17:25:10'),
(437, 69, '113.185.18.232', '2016-06-02 17:25:10'),
(438, 69, '113.185.18.104', '2016-06-02 17:25:10'),
(439, 69, '113.185.18.67', '2016-06-02 17:25:11'),
(440, 69, '113.185.18.16', '2016-06-02 17:25:35'),
(441, 69, '113.185.18.186', '2016-06-02 17:25:42'),
(442, 69, '113.185.18.90', '2016-06-02 17:26:26'),
(443, 69, '113.185.18.45', '2016-06-02 17:26:27'),
(444, 69, '113.185.18.132', '2016-06-02 17:26:27'),
(445, 69, '113.185.18.217', '2016-06-02 17:26:37'),
(446, 69, '113.185.18.221', '2016-06-02 17:29:42'),
(447, 69, '113.185.18.109', '2016-06-02 17:29:42'),
(448, 69, '113.185.18.102', '2016-06-02 17:29:42'),
(449, 69, '113.185.18.151', '2016-06-02 17:29:42'),
(450, 69, '113.185.18.195', '2016-06-02 17:29:43'),
(451, 69, '113.185.18.233', '2016-06-02 17:30:08'),
(452, 69, '113.185.18.32', '2016-06-02 17:32:59'),
(453, 69, '113.185.18.225', '2016-06-02 17:32:59'),
(454, 69, '113.185.18.247', '2016-06-02 17:32:59'),
(455, 69, '113.185.18.136', '2016-06-02 17:32:59'),
(456, 69, '113.185.18.205', '2016-06-02 17:33:00'),
(457, 69, '113.185.18.249', '2016-06-02 17:33:18'),
(458, 69, '113.185.18.234', '2016-06-02 17:35:58'),
(459, 69, '113.185.18.126', '2016-06-02 17:35:59'),
(460, 69, '113.185.18.39', '2016-06-02 17:35:59'),
(461, 69, '113.185.18.83', '2016-06-02 17:35:59'),
(462, 69, '113.185.18.173', '2016-06-02 17:35:59'),
(463, 69, '113.185.18.229', '2016-06-02 17:36:56'),
(464, 69, '113.185.18.157', '2016-06-02 17:43:15'),
(465, 69, '113.185.18.72', '2016-06-02 17:43:16'),
(466, 69, '113.185.8.233', '2016-06-02 17:43:16'),
(467, 69, '113.185.18.181', '2016-06-02 17:43:16'),
(468, 69, '113.185.18.14', '2016-06-02 17:43:16'),
(469, 69, '113.185.18.84', '2016-06-02 17:43:41'),
(470, 69, '113.185.18.63', '2016-06-02 17:43:57'),
(471, 69, '113.185.18.74', '2016-06-02 17:43:57'),
(472, 69, '113.185.18.55', '2016-06-02 17:47:10'),
(473, 69, '113.185.18.201', '2016-06-02 17:47:15'),
(474, 69, '113.185.18.18', '2016-06-02 17:47:16'),
(475, 69, '113.185.8.229', '2016-06-02 17:47:16'),
(476, 69, '113.185.18.17', '2016-06-02 17:48:17'),
(477, 69, '113.185.18.174', '2016-06-02 17:48:17'),
(478, 69, '113.185.18.30', '2016-06-02 17:48:18'),
(479, 69, '113.185.18.71', '2016-06-02 17:48:39'),
(480, 69, '113.185.18.97', '2016-06-02 17:48:39'),
(481, 148, '101.99.47.14', '2016-06-02 17:49:30'),
(482, 70, '101.99.47.14', '2016-06-02 17:50:07'),
(483, 69, '113.185.18.127', '2016-06-02 17:50:35'),
(484, 69, '113.185.18.214', '2016-06-02 17:50:42'),
(485, 69, '113.185.18.160', '2016-06-02 17:50:59'),
(486, 69, '113.185.18.147', '2016-06-02 17:50:59'),
(487, 69, '113.185.18.124', '2016-06-02 17:50:59'),
(488, 69, '113.185.18.203', '2016-06-02 17:51:01'),
(489, 69, '113.185.18.220', '2016-06-02 17:51:04'),
(490, 69, '113.185.18.46', '2016-06-02 17:51:10'),
(491, 69, '113.185.18.58', '2016-06-02 17:51:11'),
(492, 69, '113.185.18.122', '2016-06-02 17:51:37'),
(493, 69, '113.185.18.209', '2016-06-02 17:51:37'),
(494, 69, '113.185.18.131', '2016-06-02 17:52:26'),
(495, 69, '113.185.18.49', '2016-06-02 17:52:27'),
(496, 69, '113.185.18.142', '2016-06-02 17:52:27'),
(497, 69, '113.185.8.254', '2016-06-02 17:58:42'),
(498, 69, '113.185.18.135', '2016-06-02 17:58:43'),
(499, 69, '113.185.18.11', '2016-06-02 17:58:43'),
(500, 69, '113.185.18.224', '2016-06-02 17:59:07'),
(501, 69, '113.185.18.91', '2016-06-02 17:59:17'),
(502, 69, '113.185.18.137', '2016-06-02 18:04:13'),
(503, 69, '113.185.18.219', '2016-06-02 18:04:13'),
(504, 69, '113.185.18.38', '2016-06-02 18:04:13'),
(505, 69, '113.185.18.68', '2016-06-02 18:04:14'),
(506, 69, '113.185.8.249', '2016-06-02 18:04:14'),
(507, 69, '113.185.8.232', '2016-06-02 18:04:39'),
(508, 69, '113.185.18.113', '2016-06-02 18:04:51'),
(509, 148, '115.79.60.181', '2016-06-02 18:07:25'),
(510, 69, '113.185.18.85', '2016-06-02 18:08:18'),
(511, 69, '113.185.18.182', '2016-06-02 18:08:18'),
(512, 69, '113.185.18.20', '2016-06-02 18:08:18'),
(513, 69, '113.185.8.238', '2016-06-02 18:08:19'),
(514, 69, '113.185.18.175', '2016-06-02 18:08:37'),
(515, 69, '113.185.8.244', '2016-06-02 18:08:54'),
(516, 69, '113.185.18.241', '2016-06-02 18:12:20'),
(517, 69, '113.185.18.176', '2016-06-02 18:12:20'),
(518, 69, '113.185.18.37', '2016-06-02 18:12:20'),
(519, 69, '113.185.18.238', '2016-06-02 18:12:20'),
(520, 69, '113.185.18.95', '2016-06-02 18:12:46'),
(521, 69, '113.185.18.255', '2016-06-02 18:12:53'),
(522, 69, '113.185.18.2', '2016-06-02 18:12:54'),
(523, 69, '113.185.18.243', '2016-06-02 18:16:50'),
(524, 69, '113.185.8.253', '2016-06-02 18:16:50'),
(525, 69, '113.185.18.223', '2016-06-02 18:16:50'),
(526, 69, '113.185.8.245', '2016-06-02 18:16:50'),
(527, 69, '113.185.18.208', '2016-06-02 18:16:50'),
(528, 69, '113.185.18.185', '2016-06-02 18:17:12'),
(529, 69, '113.185.18.184', '2016-06-02 18:17:19'),
(530, 69, '113.185.18.212', '2016-06-02 18:19:27'),
(531, 69, '113.185.8.240', '2016-06-02 18:19:27'),
(532, 69, '113.185.18.19', '2016-06-02 18:19:28'),
(533, 69, '113.185.18.111', '2016-06-02 18:19:53'),
(534, 69, '113.185.18.169', '2016-06-02 18:20:02'),
(535, 45, '171.253.16.165', '2016-06-02 18:20:44'),
(536, 98, '42.116.229.148', '2016-06-02 18:20:55'),
(537, 69, '113.185.18.61', '2016-06-02 18:23:30'),
(538, 69, '113.185.18.170', '2016-06-02 18:23:30'),
(539, 69, '113.185.18.250', '2016-06-02 18:23:30'),
(540, 69, '113.185.18.41', '2016-06-02 18:23:31'),
(541, 69, '113.185.18.119', '2016-06-02 18:23:31'),
(542, 69, '113.185.18.33', '2016-06-02 18:23:45'),
(543, 69, '113.185.18.152', '2016-06-02 18:23:59'),
(544, 69, '113.185.18.244', '2016-06-02 18:24:00'),
(545, 69, '113.185.18.149', '2016-06-02 18:24:46'),
(546, 69, '113.185.18.70', '2016-06-02 18:24:47'),
(547, 212, '113.190.214.224', '2016-06-02 18:30:46'),
(548, 212, '59.153.243.127', '2016-06-02 18:31:21'),
(549, 48, '115.75.5.100', '2016-06-02 18:52:30'),
(550, 92, '115.75.5.100', '2016-06-02 19:11:20'),
(551, 45, '113.187.17.103', '2016-06-02 19:29:17'),
(552, 90, '171.253.24.86', '2016-06-02 19:30:51'),
(553, 48, '113.187.17.103', '2016-06-02 19:31:20'),
(554, 94, '115.75.5.100', '2016-06-02 19:51:00'),
(555, 242, '115.75.5.100', '2016-06-02 19:57:45'),
(556, 86, '112.197.31.214', '2016-06-02 19:59:28'),
(557, 148, '113.187.17.121', '2016-06-02 20:22:26'),
(558, 148, '180.93.118.140', '2016-06-02 20:23:52'),
(559, 249, '180.93.118.140', '2016-06-02 20:27:49'),
(560, 250, '180.93.118.140', '2016-06-02 20:31:21'),
(561, 175, '116.106.107.61', '2016-06-02 20:57:57'),
(562, 175, '64.233.173.126', '2016-06-02 20:58:00'),
(563, 175, '64.233.173.121', '2016-06-02 20:58:00'),
(564, 175, '64.233.173.1', '2016-06-02 21:00:40'),
(565, 147, '27.74.226.189', '2016-06-02 21:03:22'),
(566, 178, '171.232.167.117', '2016-06-02 22:44:10'),
(567, 68, '116.108.37.189', '2016-06-02 23:24:25'),
(568, 90, '183.81.13.128', '2016-06-03 04:17:36'),
(569, 145, '183.81.13.128', '2016-06-03 04:19:28'),
(570, 252, '171.239.55.123', '2016-06-03 06:27:19'),
(571, 78, '113.185.26.200', '2016-06-03 06:38:41'),
(572, 78, '113.185.26.106', '2016-06-03 06:38:41'),
(573, 78, '113.185.26.77', '2016-06-03 06:38:42'),
(574, 78, '113.185.26.141', '2016-06-03 06:39:04'),
(575, 78, '113.185.26.223', '2016-06-03 06:39:04'),
(576, 120, '203.210.129.14', '2016-06-03 06:48:28'),
(577, 227, '203.210.129.14', '2016-06-03 06:52:47'),
(578, 254, '27.66.151.236', '2016-06-03 07:11:07'),
(579, 93, '1.53.226.116', '2016-06-03 07:34:36'),
(580, 175, '1.52.27.63', '2016-06-03 08:03:53'),
(581, 175, '66.249.82.131', '2016-06-03 08:03:56'),
(582, 91, '1.53.226.116', '2016-06-03 08:07:44'),
(583, 175, '66.249.82.184', '2016-06-03 08:14:35'),
(584, 175, '66.249.82.188', '2016-06-03 08:14:36'),
(585, 94, '42.119.58.61', '2016-06-03 08:18:53'),
(586, 145, '14.174.191.152', '2016-06-03 08:19:08'),
(587, 251, '14.174.191.152', '2016-06-03 08:24:08'),
(588, 91, '113.163.101.65', '2016-06-03 09:12:54'),
(589, 191, '113.163.101.65', '2016-06-03 09:36:50'),
(590, 253, '116.104.10.9', '2016-06-03 09:41:38'),
(591, 220, '113.185.8.118', '2016-06-03 09:48:38'),
(592, 93, '113.163.101.65', '2016-06-03 09:52:48'),
(593, 250, '113.187.17.27', '2016-06-03 09:53:28'),
(594, 186, '42.119.49.106', '2016-06-03 10:05:17'),
(595, 263, '42.119.49.106', '2016-06-03 10:21:38'),
(596, 262, '113.163.101.65', '2016-06-03 10:23:24'),
(597, 64, '113.187.17.112', '2016-06-03 10:34:08'),
(598, 143, '171.250.68.209', '2016-06-03 10:37:55'),
(599, 148, '113.185.8.118', '2016-06-03 10:40:12'),
(600, 64, '101.99.47.225', '2016-06-03 10:45:34'),
(601, 264, '113.185.8.118', '2016-06-03 10:51:21'),
(602, 255, '171.239.103.70', '2016-06-03 11:04:50'),
(603, 148, '42.118.205.104', '2016-06-03 11:26:59'),
(604, 128, '113.183.19.138', '2016-06-03 11:27:11'),
(605, 254, '14.189.47.229', '2016-06-03 11:36:00'),
(606, 185, '113.187.17.112', '2016-06-03 11:44:30'),
(607, 259, '59.153.243.192', '2016-06-03 11:44:30'),
(608, 194, '27.75.16.114', '2016-06-03 11:59:25'),
(609, 90, '171.253.16.254', '2016-06-03 12:07:30'),
(610, 271, '113.187.17.112', '2016-06-03 12:08:25'),
(611, 77, '117.0.3.74', '2016-06-03 12:13:34'),
(612, 86, '180.93.248.118', '2016-06-03 12:14:17'),
(613, 95, '171.253.16.254', '2016-06-03 12:16:28'),
(614, 144, '113.187.17.112', '2016-06-03 12:46:03'),
(615, 195, '113.20.116.207', '2016-06-03 13:07:50'),
(616, 83, '101.99.47.225', '2016-06-03 13:08:10'),
(617, 223, '113.183.19.138', '2016-06-03 13:09:45'),
(618, 148, '14.161.36.41', '2016-06-03 13:16:33'),
(619, 101, '116.99.153.115', '2016-06-03 13:22:38'),
(620, 139, '116.99.153.115', '2016-06-03 13:30:53'),
(621, 267, '171.239.103.70', '2016-06-03 13:32:09'),
(622, 252, '171.239.103.70', '2016-06-03 13:39:26'),
(623, 48, '113.187.17.104', '2016-06-03 13:58:57'),
(624, 216, '113.185.26.102', '2016-06-03 14:02:01'),
(625, 216, '113.185.26.120', '2016-06-03 14:02:02'),
(626, 216, '113.185.26.134', '2016-06-03 14:02:02'),
(627, 83, '27.77.156.76', '2016-06-03 14:06:40'),
(628, 216, '113.185.26.125', '2016-06-03 14:06:48'),
(629, 216, '113.185.26.29', '2016-06-03 14:06:50'),
(630, 216, '113.185.26.26', '2016-06-03 14:06:50'),
(631, 262, '115.79.49.26', '2016-06-03 14:14:12'),
(632, 109, '14.161.36.41', '2016-06-03 14:22:13'),
(633, 48, '116.108.7.122', '2016-06-03 14:25:22'),
(634, 64, '113.187.23.86', '2016-06-03 14:35:15'),
(635, 48, '42.118.205.104', '2016-06-03 14:35:23'),
(636, 278, '171.239.103.70', '2016-06-03 14:37:48'),
(637, 94, '42.118.205.104', '2016-06-03 14:38:30'),
(638, 265, '171.239.103.70', '2016-06-03 14:44:19'),
(639, 193, '101.99.47.225', '2016-06-03 14:49:42'),
(640, 45, '171.253.42.152', '2016-06-03 15:05:31'),
(641, 282, '42.118.205.104', '2016-06-03 15:24:19'),
(642, 64, '113.187.23.94', '2016-06-03 15:29:27'),
(643, 283, '42.118.205.104', '2016-06-03 15:29:52'),
(644, 147, '101.99.47.225', '2016-06-03 15:30:20'),
(645, 246, '1.55.198.58', '2016-06-03 16:00:24'),
(646, 112, '1.55.198.58', '2016-06-03 16:03:06'),
(647, 245, '42.118.205.104', '2016-06-03 16:09:00'),
(648, 68, '113.187.16.48', '2016-06-03 16:33:05'),
(649, 195, '14.162.181.209', '2016-06-03 16:34:57'),
(650, 77, '27.67.18.159', '2016-06-03 17:19:25'),
(651, 110, '113.185.23.177', '2016-06-03 17:51:39'),
(652, 185, '113.187.22.7', '2016-06-03 17:53:27'),
(653, 241, '113.187.16.48', '2016-06-03 17:54:12'),
(654, 48, '42.112.80.205', '2016-06-03 18:01:49'),
(655, 286, '183.81.13.128', '2016-06-03 18:25:39'),
(656, 287, '183.81.13.128', '2016-06-03 18:37:43'),
(657, 260, '115.79.49.26', '2016-06-03 18:57:58'),
(658, 258, '42.114.75.168', '2016-06-03 18:58:57'),
(659, 282, '42.119.149.159', '2016-06-03 19:25:44'),
(660, 247, '113.185.26.222', '2016-06-03 19:39:24'),
(661, 247, '113.185.26.184', '2016-06-03 19:39:26'),
(662, 247, '113.185.26.35', '2016-06-03 19:39:26'),
(663, 247, '113.185.26.48', '2016-06-03 19:39:40'),
(664, 247, '113.185.26.63', '2016-06-03 19:39:42'),
(665, 247, '113.185.26.103', '2016-06-03 19:40:05'),
(666, 247, '113.185.26.87', '2016-06-03 19:40:05'),
(667, 247, '113.185.26.241', '2016-06-03 19:40:07'),
(668, 247, '113.185.26.242', '2016-06-03 19:40:07'),
(669, 247, '113.185.26.101', '2016-06-03 19:40:55'),
(670, 247, '113.185.26.42', '2016-06-03 19:40:59'),
(671, 247, '113.185.26.157', '2016-06-03 19:40:59'),
(672, 247, '113.185.26.33', '2016-06-03 19:41:00'),
(673, 247, '113.185.26.28', '2016-06-03 19:41:01'),
(674, 247, '113.185.26.214', '2016-06-03 19:41:01'),
(675, 247, '113.185.26.53', '2016-06-03 19:41:20'),
(676, 247, '113.185.26.84', '2016-06-03 19:41:23'),
(677, 247, '113.185.26.123', '2016-06-03 19:41:31'),
(678, 145, '171.255.173.15', '2016-06-03 20:21:10'),
(679, 143, '27.74.155.164', '2016-06-03 20:42:58'),
(680, 145, '14.174.24.18', '2016-06-03 21:13:22'),
(681, 257, '14.183.217.47', '2016-06-03 21:25:03'),
(682, 175, '14.183.217.47', '2016-06-03 21:41:40'),
(683, 247, '113.185.26.99', '2016-06-03 21:41:54'),
(684, 247, '113.185.26.207', '2016-06-03 21:41:54'),
(685, 247, '113.185.26.9', '2016-06-03 21:42:08'),
(686, 247, '113.185.26.130', '2016-06-03 21:42:09'),
(687, 247, '113.185.26.57', '2016-06-03 21:43:23'),
(688, 247, '113.185.26.202', '2016-06-03 21:43:25'),
(689, 247, '113.185.26.92', '2016-06-03 21:43:25'),
(690, 247, '113.185.26.185', '2016-06-03 21:43:36'),
(691, 247, '113.185.26.127', '2016-06-03 21:43:38'),
(692, 118, '113.185.22.56', '2016-06-04 00:35:43'),
(693, 125, '113.185.22.56', '2016-06-04 00:38:21'),
(694, 254, '27.66.166.210', '2016-06-04 05:56:25'),
(695, 257, '113.187.22.89', '2016-06-04 06:13:47'),
(696, 175, '113.187.22.89', '2016-06-04 07:00:47'),
(697, 185, '113.187.16.84', '2016-06-04 08:12:44'),
(698, 297, '27.74.64.151', '2016-06-04 08:13:37'),
(699, 271, '115.72.193.5', '2016-06-04 08:18:59'),
(700, 303, '115.72.193.5', '2016-06-04 08:32:46'),
(701, 91, '42.116.186.252', '2016-06-04 08:33:55'),
(702, 48, '101.99.47.225', '2016-06-04 08:39:15'),
(703, 304, '115.72.193.5', '2016-06-04 08:40:37'),
(704, 305, '115.72.193.5', '2016-06-04 08:43:45'),
(705, 247, '113.185.26.166', '2016-06-04 08:44:27'),
(706, 247, '113.185.26.218', '2016-06-04 08:44:30'),
(707, 247, '113.185.26.31', '2016-06-04 08:44:30'),
(708, 247, '113.185.26.168', '2016-06-04 08:44:40'),
(709, 247, '113.185.26.113', '2016-06-04 08:44:42'),
(710, 247, '113.185.26.213', '2016-06-04 08:45:10'),
(711, 247, '113.185.26.162', '2016-06-04 08:45:12'),
(712, 247, '113.185.26.210', '2016-06-04 08:45:46'),
(713, 302, '115.72.193.5', '2016-06-04 08:51:54'),
(714, 310, '42.116.186.252', '2016-06-04 08:58:18'),
(715, 216, '101.99.55.137', '2016-06-04 09:04:16'),
(716, 302, '113.187.23.73', '2016-06-04 09:04:21'),
(717, 311, '27.74.15.19', '2016-06-04 09:08:43'),
(718, 248, '171.248.180.191', '2016-06-04 09:30:35'),
(719, 175, '113.185.18.58', '2016-06-04 09:37:01'),
(720, 175, '113.185.18.205', '2016-06-04 09:37:02'),
(721, 175, '113.185.18.69', '2016-06-04 09:37:02'),
(722, 175, '113.185.18.172', '2016-06-04 09:37:09'),
(723, 175, '113.185.18.88', '2016-06-04 09:37:10'),
(724, 175, '113.185.18.30', '2016-06-04 09:38:05'),
(725, 175, '113.185.18.138', '2016-06-04 09:38:05'),
(726, 175, '113.185.8.246', '2016-06-04 09:38:05'),
(727, 175, '113.185.18.8', '2016-06-04 09:38:06'),
(728, 175, '113.185.18.123', '2016-06-04 09:38:06'),
(729, 175, '113.185.18.66', '2016-06-04 09:38:20'),
(730, 175, '113.185.18.252', '2016-06-04 09:38:37'),
(731, 175, '113.185.18.250', '2016-06-04 09:38:38'),
(732, 175, '113.185.18.114', '2016-06-04 09:38:38'),
(733, 175, '113.185.18.41', '2016-06-04 09:38:40'),
(734, 175, '113.185.18.115', '2016-06-04 09:38:41'),
(735, 175, '113.185.8.241', '2016-06-04 09:38:56'),
(736, 175, '113.185.18.107', '2016-06-04 09:38:57'),
(737, 175, '113.185.18.170', '2016-06-04 09:38:57'),
(738, 175, '113.185.18.176', '2016-06-04 09:39:01'),
(739, 175, '113.185.18.165', '2016-06-04 09:39:01'),
(740, 175, '113.185.18.81', '2016-06-04 09:39:02'),
(741, 175, '113.185.18.146', '2016-06-04 09:39:02'),
(742, 175, '113.185.18.195', '2016-06-04 09:39:15'),
(743, 175, '113.185.18.111', '2016-06-04 09:39:17'),
(744, 175, '113.185.18.72', '2016-06-04 09:39:17'),
(745, 175, '113.185.18.6', '2016-06-04 09:40:24'),
(746, 175, '113.185.18.141', '2016-06-04 09:40:24'),
(747, 175, '113.185.18.113', '2016-06-04 09:40:25'),
(748, 175, '113.185.18.33', '2016-06-04 09:40:26'),
(749, 175, '113.185.8.249', '2016-06-04 09:40:26'),
(750, 175, '113.185.18.242', '2016-06-04 09:40:39'),
(751, 296, '113.185.18.185', '2016-06-04 09:41:33'),
(752, 296, '113.185.18.81', '2016-06-04 09:41:34'),
(753, 296, '113.185.18.7', '2016-06-04 09:41:34'),
(754, 296, '113.185.18.219', '2016-06-04 09:41:45'),
(755, 296, '113.185.8.251', '2016-06-04 09:41:46'),
(756, 296, '113.185.18.106', '2016-06-04 09:41:53'),
(757, 296, '113.185.18.53', '2016-06-04 09:41:53'),
(758, 296, '27.74.64.151', '2016-06-04 09:42:34'),
(759, 311, '42.116.186.252', '2016-06-04 09:56:48'),
(760, 77, '117.0.60.23', '2016-06-04 09:59:19'),
(761, 312, '42.116.186.252', '2016-06-04 10:02:24'),
(762, 316, '42.116.186.252', '2016-06-04 10:11:24'),
(763, 317, '42.116.186.252', '2016-06-04 10:26:37'),
(764, 90, '171.253.38.165', '2016-06-04 10:34:07'),
(765, 315, '42.116.186.252', '2016-06-04 10:40:07'),
(766, 321, '42.116.186.252', '2016-06-04 10:44:44'),
(767, 256, '58.187.170.219', '2016-06-04 10:47:24'),
(768, 185, '113.187.17.65', '2016-06-04 10:51:23'),
(769, 260, '42.116.186.252', '2016-06-04 10:51:32'),
(770, 68, '27.74.138.237', '2016-06-04 10:58:08'),
(771, 110, '116.99.241.212', '2016-06-04 11:03:01'),
(772, 83, '115.79.38.203', '2016-06-04 11:04:47'),
(773, 83, '14.161.17.5', '2016-06-04 11:04:48'),
(774, 83, '14.161.17.4', '2016-06-04 11:05:09'),
(775, 143, '113.187.17.58', '2016-06-04 11:27:35'),
(776, 325, '113.187.17.58', '2016-06-04 11:32:29'),
(777, 324, '42.116.186.252', '2016-06-04 11:50:47'),
(778, 147, '1.52.37.233', '2016-06-04 11:53:40'),
(779, 299, '58.186.154.133', '2016-06-04 12:01:54'),
(780, 316, '14.176.132.89', '2016-06-04 12:07:38'),
(781, 175, '27.74.64.151', '2016-06-04 12:25:47'),
(782, 318, '14.176.132.89', '2016-06-04 12:25:52'),
(783, 318, '42.116.186.252', '2016-06-04 12:41:10'),
(784, 185, '113.187.23.51', '2016-06-04 12:53:23'),
(785, 45, '171.253.46.3', '2016-06-04 13:05:41'),
(786, 178, '27.74.15.216', '2016-06-04 13:19:14'),
(787, 247, '113.185.26.174', '2016-06-04 13:37:44'),
(788, 247, '113.185.26.179', '2016-06-04 13:37:46'),
(789, 247, '113.185.26.96', '2016-06-04 13:37:46'),
(790, 86, '112.197.31.142', '2016-06-04 13:37:56'),
(791, 247, '113.185.26.206', '2016-06-04 13:38:00'),
(792, 247, '113.185.26.141', '2016-06-04 13:38:01'),
(793, 247, '113.185.26.115', '2016-06-04 13:38:04'),
(794, 247, '113.185.26.59', '2016-06-04 13:38:18'),
(795, 48, '113.185.8.123', '2016-06-04 13:39:25'),
(796, 48, '113.187.23.51', '2016-06-04 13:51:17'),
(797, 71, '113.185.8.233', '2016-06-04 14:01:50'),
(798, 71, '113.185.18.121', '2016-06-04 14:01:52'),
(799, 71, '113.185.18.89', '2016-06-04 14:01:52'),
(800, 71, '113.185.18.183', '2016-06-04 14:01:58'),
(801, 71, '113.185.18.62', '2016-06-04 14:02:00'),
(802, 71, '113.185.18.223', '2016-06-04 14:02:32'),
(803, 185, '113.185.26.1', '2016-06-04 14:33:17'),
(804, 185, '113.185.26.124', '2016-06-04 14:33:17'),
(805, 185, '113.185.26.118', '2016-06-04 14:33:17'),
(806, 185, '113.185.26.244', '2016-06-04 14:33:58'),
(807, 185, '113.185.26.18', '2016-06-04 14:37:55'),
(808, 185, '113.185.26.115', '2016-06-04 14:37:55'),
(809, 322, '14.167.56.43', '2016-06-04 14:37:55'),
(810, 185, '113.185.26.113', '2016-06-04 14:37:55'),
(811, 185, '113.185.26.221', '2016-06-04 14:37:55'),
(812, 185, '113.185.26.127', '2016-06-04 14:38:20'),
(813, 185, '113.185.26.153', '2016-06-04 14:38:34'),
(814, 331, '113.185.26.170', '2016-06-04 14:39:21'),
(815, 331, '113.185.26.252', '2016-06-04 14:39:22'),
(816, 331, '113.185.26.125', '2016-06-04 14:39:22'),
(817, 331, '113.185.26.12', '2016-06-04 14:39:37'),
(818, 48, '113.187.17.64', '2016-06-04 16:46:32'),
(819, 324, '171.255.148.27', '2016-06-04 16:47:54'),
(820, 325, '171.250.75.142', '2016-06-04 16:52:20'),
(821, 86, '113.187.17.64', '2016-06-04 16:55:02'),
(822, 273, '113.185.18.53', '2016-06-04 17:03:51'),
(823, 273, '113.185.18.114', '2016-06-04 17:03:52'),
(824, 273, '113.185.18.149', '2016-06-04 17:03:52'),
(825, 185, '113.187.16.20', '2016-06-04 17:04:16'),
(826, 332, '14.167.108.18', '2016-06-04 17:14:43'),
(827, 48, '113.185.26.168', '2016-06-04 18:17:40'),
(828, 48, '113.185.26.119', '2016-06-04 18:17:41'),
(829, 48, '113.185.26.70', '2016-06-04 18:17:41'),
(830, 48, '113.185.26.29', '2016-06-04 18:17:46'),
(831, 48, '113.185.26.30', '2016-06-04 18:17:47'),
(832, 252, '171.239.102.239', '2016-06-04 18:35:36'),
(833, 145, '171.255.153.153', '2016-06-04 20:33:00'),
(834, 321, '113.185.18.84', '2016-06-04 20:42:05'),
(835, 321, '113.185.18.162', '2016-06-04 20:42:08'),
(836, 321, '113.185.18.123', '2016-06-04 20:42:08'),
(837, 321, '113.185.18.41', '2016-06-04 20:42:56'),
(838, 321, '113.185.18.185', '2016-06-04 20:44:13'),
(839, 91, '183.80.23.16', '2016-06-04 20:52:53'),
(840, 120, '203.210.131.250', '2016-06-04 21:51:34'),
(841, 333, '113.183.19.138', '2016-06-04 22:19:24'),
(842, 185, '113.187.16.39', '2016-06-04 22:39:27'),
(843, 257, '113.169.49.97', '2016-06-04 23:01:37'),
(844, 325, '116.108.150.111', '2016-06-05 01:01:58'),
(845, 91, '113.174.63.6', '2016-06-05 01:44:08'),
(846, 248, '27.74.101.45', '2016-06-05 03:13:13'),
(847, 248, '171.255.159.110', '2016-06-05 03:13:35'),
(848, 147, '27.3.0.228', '2016-06-05 05:49:22'),
(849, 282, '27.2.191.60', '2016-06-05 05:54:18'),
(850, 247, '113.185.28.68', '2016-06-05 06:38:45'),
(851, 144, '113.187.23.45', '2016-06-05 07:05:22'),
(852, 337, '113.187.23.45', '2016-06-05 07:18:18'),
(853, 336, '171.233.142.103', '2016-06-05 07:50:18'),
(854, 257, '115.73.60.7', '2016-06-05 09:00:29'),
(855, 175, '115.73.60.7', '2016-06-05 09:00:34'),
(856, 48, '113.187.17.84', '2016-06-05 09:53:43'),
(857, 143, '171.250.69.85', '2016-06-05 10:06:52'),
(858, 143, '171.250.67.15', '2016-06-05 10:08:52'),
(859, 177, '117.3.120.205', '2016-06-05 10:19:12'),
(860, 167, '222.254.227.57', '2016-06-05 10:40:22'),
(861, 48, '42.119.151.3', '2016-06-05 11:48:07'),
(862, 79, '118.68.37.25', '2016-06-05 11:58:34'),
(863, 173, '113.188.158.139', '2016-06-05 12:06:40'),
(864, 180, '1.52.32.1', '2016-06-05 12:13:49'),
(865, 185, '113.187.16.66', '2016-06-05 12:17:19'),
(866, 142, '113.185.26.42', '2016-06-05 12:17:46'),
(867, 142, '66.249.82.188', '2016-06-05 12:17:48'),
(868, 142, '113.185.26.185', '2016-06-05 12:17:58'),
(869, 142, '66.249.82.131', '2016-06-05 12:18:06'),
(870, 142, '113.185.8.87', '2016-06-05 12:19:59'),
(871, 311, '115.79.49.26', '2016-06-05 12:45:37'),
(872, 90, '183.81.8.148', '2016-06-05 12:45:42'),
(873, 247, '113.187.16.3', '2016-06-05 12:51:28'),
(874, 71, '113.185.22.83', '2016-06-05 13:34:11'),
(875, 78, '113.185.22.83', '2016-06-05 13:35:00'),
(876, 78, '66.249.82.184', '2016-06-05 13:35:01'),
(877, 78, '66.249.82.131', '2016-06-05 13:35:02'),
(878, 78, '66.249.82.188', '2016-06-05 13:35:07'),
(879, 171, '115.72.196.165', '2016-06-05 13:38:22'),
(880, 171, '64.233.173.1', '2016-06-05 13:38:23'),
(881, 171, '64.233.173.121', '2016-06-05 13:38:23'),
(882, 171, '64.233.173.126', '2016-06-05 13:38:31'),
(883, 177, '113.185.5.202', '2016-06-05 13:45:52'),
(884, 185, '113.187.23.19', '2016-06-05 13:50:54'),
(885, 302, '113.187.17.30', '2016-06-05 14:30:35'),
(886, 193, '113.187.23.19', '2016-06-05 14:33:16'),
(887, 86, '113.187.23.19', '2016-06-05 15:18:05'),
(888, 184, '113.187.23.19', '2016-06-05 15:20:20'),
(889, 167, '171.250.140.50', '2016-06-05 15:37:55'),
(890, 145, '14.174.29.71', '2016-06-05 16:18:35'),
(891, 193, '115.72.196.165', '2016-06-05 16:34:07'),
(892, 251, '14.160.27.59', '2016-06-05 16:43:10'),
(893, 184, '113.187.17.119', '2016-06-05 17:44:37'),
(894, 86, '113.187.17.119', '2016-06-05 17:47:30'),
(895, 145, '14.174.184.220', '2016-06-05 17:48:50'),
(896, 48, '101.99.47.179', '2016-06-05 18:31:35'),
(897, 247, '101.99.47.179', '2016-06-05 18:46:04'),
(898, 333, '113.185.8.135', '2016-06-05 19:58:59'),
(899, 299, '183.81.52.144', '2016-06-05 20:28:54'),
(900, 335, '113.185.8.135', '2016-06-05 20:34:22'),
(901, 90, '183.81.9.20', '2016-06-05 20:46:58'),
(902, 91, '113.187.16.7', '2016-06-05 21:20:40'),
(903, 340, '27.65.56.147', '2016-06-05 22:31:36'),
(904, 144, '27.75.251.248', '2016-06-05 22:52:28'),
(905, 144, '113.187.23.29', '2016-06-05 23:00:39'),
(906, 193, '14.169.51.147', '2016-06-05 23:49:09'),
(907, 252, '113.20.119.141', '2016-06-06 00:21:03'),
(908, 167, '14.167.199.62', '2016-06-06 01:44:03'),
(909, 333, '113.185.6.30', '2016-06-06 06:11:10'),
(910, 148, '116.108.25.21', '2016-06-06 06:28:33'),
(911, 45, '42.112.90.19', '2016-06-06 06:50:52'),
(912, 163, '27.66.129.59', '2016-06-06 07:33:47'),
(913, 91, '115.73.236.3', '2016-06-06 08:13:06'),
(914, 310, '115.73.236.3', '2016-06-06 08:47:46'),
(915, 45, '120.72.107.82', '2016-06-06 08:58:55'),
(916, 90, '115.72.196.165', '2016-06-06 09:00:09'),
(917, 143, '101.99.47.179', '2016-06-06 09:12:11'),
(918, 345, '115.73.236.3', '2016-06-06 09:12:47'),
(919, 167, '171.250.128.29', '2016-06-06 09:17:49'),
(920, 166, '27.75.150.72', '2016-06-06 09:44:22'),
(921, 90, '116.100.153.125', '2016-06-06 09:45:11'),
(922, 247, '113.185.22.70', '2016-06-06 09:52:28'),
(923, 143, '116.100.153.125', '2016-06-06 09:57:29'),
(924, 185, '113.187.23.55', '2016-06-06 10:03:31'),
(925, 45, '171.253.1.90', '2016-06-06 10:04:45'),
(926, 45, '171.253.6.8', '2016-06-06 10:10:30'),
(927, 345, '117.0.112.219', '2016-06-06 10:10:50'),
(928, 86, '116.100.153.125', '2016-06-06 10:21:05'),
(929, 147, '116.100.153.125', '2016-06-06 10:32:26'),
(930, 71, '113.185.6.114', '2016-06-06 10:37:46'),
(931, 48, '113.187.23.55', '2016-06-06 10:45:01'),
(932, 296, '171.253.29.227', '2016-06-06 10:56:26'),
(933, 346, '113.183.19.138', '2016-06-06 10:56:28'),
(934, 325, '116.100.153.125', '2016-06-06 10:59:48'),
(935, 302, '113.187.23.24', '2016-06-06 11:03:20'),
(936, 282, '113.185.22.55', '2016-06-06 11:07:57'),
(937, 182, '113.187.17.95', '2016-06-06 11:09:06'),
(938, 68, '116.100.153.125', '2016-06-06 11:10:12'),
(939, 45, '171.253.46.202', '2016-06-06 11:11:15'),
(940, 282, '116.100.153.125', '2016-06-06 11:15:11'),
(941, 342, '171.253.12.215', '2016-06-06 11:15:20'),
(942, 195, '1.55.203.248', '2016-06-06 11:17:51'),
(943, 342, '168.235.196.87', '2016-06-06 11:17:58'),
(944, 145, '116.100.153.125', '2016-06-06 11:21:18'),
(945, 216, '116.100.153.125', '2016-06-06 11:21:55'),
(946, 61, '116.108.58.105', '2016-06-06 11:23:41'),
(947, 259, '59.153.243.121', '2016-06-06 11:27:32'),
(948, 285, '116.100.153.125', '2016-06-06 11:30:32'),
(949, 86, '113.187.23.55', '2016-06-06 11:34:15'),
(950, 71, '116.100.153.125', '2016-06-06 11:45:22'),
(951, 84, '116.100.153.125', '2016-06-06 11:46:08'),
(952, 64, '113.187.23.55', '2016-06-06 11:46:34'),
(953, 65, '116.100.153.125', '2016-06-06 11:48:52'),
(954, 344, '116.100.153.125', '2016-06-06 11:49:55'),
(955, 45, '192.168.0.10', '2016-06-06 11:45:42'),
(956, 92, '192.168.0.10', '2016-06-06 12:04:57'),
(957, 68, '192.168.0.10', '2016-06-06 12:30:54'),
(958, 353, '192.168.0.10', '2016-06-08 10:49:13'),
(959, 354, '192.168.0.10', '2016-06-08 10:53:59');

-- --------------------------------------------------------

--
-- Structure de la table `sm_customer_login`
--

CREATE TABLE IF NOT EXISTS `sm_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=164 ;

--
-- Contenu de la table `sm_customer_login`
--

INSERT INTO `sm_customer_login` (`customer_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`) VALUES
(1, 'hoivien0', '27.70.184.67', 3, '2016-03-26 02:59:19', '2016-03-26 02:59:34'),
(3, 'hoivien0', '27.69.23.177', 1, '2016-03-28 03:38:58', '2016-03-28 03:38:58'),
(5, '', '27.73.172.81', 1, '2016-03-31 08:45:48', '2016-03-31 08:45:48'),
(6, 'truong@nguyenphu.com.vn', '171.249.110.222', 2, '2016-04-09 14:10:46', '2016-04-09 14:10:50'),
(7, 'truong', '171.249.110.222', 1, '2016-04-09 14:11:38', '2016-04-09 14:11:38'),
(10, '063544997', '116.102.200.156', 1, '2016-04-17 09:53:39', '2016-04-17 09:53:39'),
(11, '063544977', '116.102.200.156', 2, '2016-04-17 09:53:49', '2016-04-17 09:54:02'),
(12, '063510997', '116.102.200.156', 1, '2016-04-17 09:54:23', '2016-04-17 09:54:23'),
(13, '0936822231', '66.249.82.95', 1, '2016-04-18 15:46:36', '2016-04-18 15:46:36'),
(14, '0936822231', '66.249.82.92', 1, '2016-04-18 15:46:40', '2016-04-18 15:46:40'),
(15, '063510997', '171.253.39.234', 1, '2016-04-30 10:27:13', '2016-04-30 10:27:13'),
(16, 'admin', '27.3.128.130', 1, '2016-05-04 23:13:51', '2016-05-04 23:13:51'),
(17, 'admin', '120.72.83.181', 1, '2016-05-07 04:28:06', '2016-05-07 04:28:06'),
(18, 'admin', '192.168.0.10', 3, '2016-05-10 09:33:38', '2016-05-12 06:19:01'),
(19, '0903257103', '192.168.0.10', 5, '2016-05-11 07:28:48', '2016-05-19 05:26:17'),
(20, 'adsf', '192.168.0.10', 4, '2016-05-11 07:39:24', '2016-05-11 07:50:10'),
(21, 'adsfsdfs', '192.168.0.10', 5, '2016-05-11 07:50:13', '2016-05-11 07:52:37'),
(22, 'sdafsdsdfsfd', '192.168.0.10', 5, '2016-05-11 07:55:44', '2016-05-11 07:56:35'),
(23, '', '192.168.0.10', 6, '2016-05-11 07:57:15', '2016-05-11 08:14:23'),
(24, 'adsfdsa', '192.168.0.10', 5, '2016-05-11 08:02:37', '2016-05-11 08:02:57'),
(25, 'adsfdsadfad', '192.168.0.10', 4, '2016-05-11 08:03:17', '2016-05-11 08:04:00'),
(26, 'sdfsa', '192.168.0.10', 1, '2016-05-11 08:04:07', '2016-05-11 08:04:07'),
(27, 'sdaf', '192.168.0.10', 5, '2016-05-11 08:04:17', '2016-05-11 08:05:39'),
(28, 'sdafsd', '192.168.0.10', 1, '2016-05-11 08:04:36', '2016-05-11 08:04:36'),
(29, 'sdafds', '192.168.0.10', 3, '2016-05-11 08:20:54', '2016-05-11 08:27:23'),
(30, 'sdfa', '192.168.0.10', 6, '2016-05-11 09:04:40', '2016-05-20 08:04:30'),
(34, 'tes15@gmail.com', '192.168.0.10', 4, '2016-05-19 02:13:45', '2016-05-19 02:14:34'),
(36, 'test25', '192.168.0.10', 3, '2016-05-19 05:24:42', '2016-05-19 05:25:52'),
(39, '0933622281', '192.168.0.10', 5, '2016-05-19 05:46:47', '2016-05-19 05:50:18'),
(42, '0903257103', '192.168.0.235', 1, '2016-05-25 01:20:54', '2016-05-25 01:20:54'),
(49, 'root', '120.72.83.181', 1, '2016-05-28 03:31:54', '2016-05-28 03:31:54'),
(50, 'root', '171.249.117.39', 5, '2016-05-28 04:11:48', '2016-05-28 04:15:17'),
(158, 'danbitcoins1609', '42.116.225.236', 2, '2016-06-06 04:57:10', '2016-06-06 04:57:46'),
(59, 'cuongs0007@gmail.com', '116.100.159.40', 3, '2016-05-29 06:20:01', '2016-05-29 06:20:42'),
(64, 'vinhhien kg', '116.100.80.23', 1, '2016-05-30 03:01:43', '2016-05-30 03:01:43'),
(63, 'cuonghungbitco', '113.185.18.216', 1, '2016-05-29 08:58:12', '2016-05-29 08:58:12'),
(65, 'vinhhie86@gmail.com', '116.100.80.23', 2, '2016-05-30 03:02:28', '2016-05-30 03:12:37'),
(66, 'cuong0007', '8.37.233.239', 1, '2016-05-30 05:29:05', '2016-05-30 05:29:05'),
(67, 'thamhhai', '171.253.4.26', 1, '2016-05-30 07:26:33', '2016-05-30 07:26:33'),
(157, 'cuongs0007', '171.253.43.176', 1, '2016-06-06 04:50:48', '2016-06-06 04:50:48'),
(156, '', '113.187.23.55', 1, '2016-06-06 04:32:46', '2016-06-06 04:32:46'),
(70, 'test', '42.115.143.114', 3, '2016-05-30 15:22:43', '2016-05-30 15:24:40'),
(71, 'root', '42.115.143.114', 1, '2016-05-30 15:23:04', '2016-05-30 15:23:04'),
(72, 'ericpham', '116.108.37.189', 1, '2016-05-31 00:56:17', '2016-05-31 00:56:17'),
(73, 'team', '115.79.49.26', 2, '2016-05-31 02:05:31', '2016-05-31 02:06:05'),
(75, 'vannam', '58.187.97.17', 1, '2016-05-31 04:41:42', '2016-05-31 04:41:42'),
(77, 'hungcuongero', '14.186.255.132', 1, '2016-05-31 08:13:56', '2016-05-31 08:13:56'),
(78, 'luyenbn2', '113.183.19.138', 5, '2016-05-31 13:03:38', '2016-05-31 13:06:35'),
(79, 'tiesy', '113.185.26.18', 1, '2016-06-01 05:42:52', '2016-06-01 05:42:52'),
(80, 'cuongs007', '113.187.17.56', 1, '2016-06-01 06:34:08', '2016-06-01 06:34:08'),
(81, 'huynhmy', '113.187.16.121', 2, '2016-06-01 06:38:26', '2016-06-01 06:38:44'),
(83, 'trunglai18@gmail.com', '27.74.159.155', 1, '2016-06-01 10:48:09', '2016-06-01 10:48:09'),
(84, 'lytrunglai', '27.74.159.155', 3, '2016-06-01 10:49:18', '2016-06-02 06:06:29'),
(86, 'tranvantu', '27.2.211.184', 2, '2016-06-01 16:08:40', '2016-06-01 16:09:25'),
(88, 'hungcuongbit', '113.185.18.97', 1, '2016-06-01 19:52:01', '2016-06-01 19:52:01'),
(89, 'hungcuongbit', '113.185.18.120', 1, '2016-06-01 19:52:19', '2016-06-01 19:52:19'),
(90, 'hungcuongbit', '113.185.18.136', 1, '2016-06-01 19:52:36', '2016-06-01 19:52:36'),
(91, 'lekimphunh', '113.185.18.159', 1, '2016-06-01 19:54:40', '2016-06-01 19:54:40'),
(93, 'thuy huong', '14.167.56.43', 5, '2016-06-02 01:41:20', '2016-06-02 01:42:55'),
(95, 'vietthai', '116.99.247.22', 1, '2016-06-02 05:11:02', '2016-06-02 05:11:02'),
(98, 'quangte', '113.185.18.61', 1, '2016-06-02 10:21:57', '2016-06-02 10:21:57'),
(99, 'trinhvinhanh', '115.79.60.181', 1, '2016-06-02 10:42:13', '2016-06-02 10:42:13'),
(100, 'trinh vinh anh', '115.79.60.181', 1, '2016-06-02 10:43:20', '2016-06-02 10:43:20'),
(101, 'jackson', '115.79.60.181', 1, '2016-06-02 10:45:50', '2016-06-02 10:45:50'),
(102, 'minhtuan', '115.79.60.181', 1, '2016-06-02 10:46:16', '2016-06-02 10:46:16'),
(103, 'donduanhp', '113.190.214.224', 1, '2016-06-02 11:29:57', '2016-06-02 11:29:57'),
(104, 'kcrusvno', '27.74.226.189', 1, '2016-06-02 14:05:15', '2016-06-02 14:05:15'),
(105, 'trunglaisg', '171.250.68.209', 1, '2016-06-03 03:37:35', '2016-06-03 03:37:35'),
(109, 'bachtuyet0124@gmail.com', '1.55.198.58', 1, '2016-06-03 09:00:06', '2016-06-03 09:00:06'),
(107, 'ngocbabn', '113.183.19.138', 1, '2016-06-03 04:26:46', '2016-06-03 04:26:46'),
(111, 'nguyenkhe', '183.81.13.128', 1, '2016-06-03 11:42:11', '2016-06-03 11:42:11'),
(135, 'lytrunglai', '171.250.69.85', 1, '2016-06-05 03:06:34', '2016-06-05 03:06:34'),
(118, 'lenhhamnhit', '27.74.64.151', 1, '2016-06-04 02:16:25', '2016-06-04 02:16:25'),
(115, 'khanhdts0007', '115.72.193.5', 1, '2016-06-04 01:50:18', '2016-06-04 01:50:18'),
(116, 'khanhs0007', '115.72.193.5', 1, '2016-06-04 01:50:37', '2016-06-04 01:50:37'),
(117, 'tungkiet', '42.116.186.252', 3, '2016-06-04 01:54:43', '2016-06-04 01:56:13'),
(119, 'lenhhamnhit', '113.185.18.223', 1, '2016-06-04 02:21:38', '2016-06-04 02:21:38'),
(120, 'lenhhamnhit', '113.185.8.247', 1, '2016-06-04 02:22:45', '2016-06-04 02:22:45'),
(121, 'lenhhamnhit', '113.185.18.148', 1, '2016-06-04 02:23:10', '2016-06-04 02:23:10'),
(122, 'lenhhamnhit', '113.185.18.25', 1, '2016-06-04 02:23:50', '2016-06-04 02:23:50'),
(123, 'lenhhamnhit', '113.185.18.18', 1, '2016-06-04 02:36:14', '2016-06-04 02:36:14'),
(124, 'vinhka', '113.187.17.58', 1, '2016-06-04 04:09:23', '2016-06-04 04:09:23'),
(125, 'lytrunglai', '113.187.17.65', 3, '2016-06-04 04:22:45', '2016-06-04 04:24:59'),
(126, 'trienphutre', '42.118.205.104', 3, '2016-06-04 07:16:13', '2016-06-04 07:17:20'),
(128, 'cuong0007', '113.185.26.249', 1, '2016-06-04 11:16:40', '2016-06-04 11:16:40'),
(129, 'cuong0007', '113.185.26.1', 1, '2016-06-04 11:17:00', '2016-06-04 11:17:00'),
(130, 'nguyenchin', '58.187.170.219', 5, '2016-06-04 14:45:32', '2016-06-04 14:46:35'),
(136, 'nguyenchilinhs007', '115.72.193.5', 2, '2016-06-05 04:08:58', '2016-06-05 04:09:24'),
(134, 'xuanhieu101082@gmail.com', '115.73.60.7', 2, '2016-06-05 01:59:24', '2016-06-05 02:00:08'),
(138, 'hoatuoi1', '113.185.8.135', 5, '2016-06-05 13:31:48', '2016-06-05 13:38:13'),
(139, 'hoatuoi1', '113.185.18.85', 1, '2016-06-05 16:04:29', '2016-06-05 16:04:29'),
(140, 'hoatuoi1', '113.185.18.103', 1, '2016-06-05 16:04:53', '2016-06-05 16:04:53'),
(142, '', '113.183.19.138', 1, '2016-06-05 23:08:48', '2016-06-05 23:08:48'),
(144, 'phamdinhthomg', '115.73.236.3', 1, '2016-06-06 02:34:05', '2016-06-06 02:34:05'),
(145, 'nguyenphuoctinh@gmail.com', '27.75.150.72', 1, '2016-06-06 02:40:33', '2016-06-06 02:40:33'),
(147, 'cuongs0007', '113.187.23.55', 3, '2016-06-06 03:01:15', '2016-06-06 03:02:18'),
(148, 'nguyenkhe', '116.100.153.125', 1, '2016-06-06 03:32:44', '2016-06-06 03:32:44'),
(149, 'hoatuoi1', '113.183.19.138', 6, '2016-06-06 03:48:20', '2016-06-06 03:51:13'),
(151, 'vinhka', '116.100.153.125', 2, '2016-06-06 03:58:42', '2016-06-06 03:59:09'),
(152, 'blockchainmrlee@gmail.com', '113.185.22.55', 1, '2016-06-06 04:04:23', '2016-06-06 04:04:23'),
(153, 'mrlee', '113.185.22.55', 1, '2016-06-06 04:05:30', '2016-06-06 04:05:30'),
(155, 'cuongs0007', '116.100.153.125', 5, '2016-06-06 04:20:46', '2016-06-06 04:45:37');

-- --------------------------------------------------------

--
-- Structure de la table `sm_customer_ml`
--

CREATE TABLE IF NOT EXISTS `sm_customer_ml` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `level` int(11) DEFAULT '0',
  `p_node` int(11) NOT NULL DEFAULT '0',
  `p_binary` int(11) DEFAULT '0',
  `left` int(11) DEFAULT '0',
  `right` int(11) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=355 ;

--
-- Contenu de la table `sm_customer_ml`
--

INSERT INTO `sm_customer_ml` (`id`, `customer_id`, `date_added`, `date_end`, `level`, `p_node`, `p_binary`, `left`, `right`, `status`) VALUES
(98, 98, '2016-05-30 14:16:56', '0000-00-00 00:00:00', 1, 48, 66, 0, 0, 1),
(97, 97, '2016-05-30 14:13:26', '0000-00-00 00:00:00', 1, 53, 53, 0, 0, 1),
(96, 96, '2016-05-30 14:06:16', '0000-00-00 00:00:00', 1, 48, 66, 0, 0, 1),
(95, 95, '2016-05-30 13:37:11', '0000-00-00 00:00:00', 1, 90, 90, 0, 0, 1),
(94, 94, '2016-05-30 12:30:53', '0000-00-00 00:00:00', 1, 68, 68, 0, 0, 1),
(93, 93, '2016-05-30 12:27:18', '0000-00-00 00:00:00', 1, 91, 91, 0, 0, 1),
(92, 92, '2016-05-30 12:22:44', '0000-00-00 00:00:00', 1, 68, 68, 0, 0, 2),
(91, 91, '2016-05-30 12:16:41', '0000-00-00 00:00:00', 1, 48, 66, 0, 0, 1),
(90, 90, '2016-05-30 10:56:01', '0000-00-00 00:00:00', 1, 45, 50, 0, 0, 4),
(89, 89, '2016-05-30 10:52:56', '0000-00-00 00:00:00', 1, 87, 87, 0, 0, 1),
(88, 88, '2016-05-30 10:25:18', '0000-00-00 00:00:00', 1, 87, 87, 0, 0, 1),
(87, 87, '2016-05-30 09:47:13', '0000-00-00 00:00:00', 1, 73, 73, 0, 0, 1),
(86, 86, '2016-05-29 18:02:47', '0000-00-00 00:00:00', 1, 84, 84, 0, 0, 4),
(85, 85, '2016-05-29 18:00:55', '0000-00-00 00:00:00', 1, 83, 83, 0, 0, 1),
(84, 84, '2016-05-29 17:59:31', '0000-00-00 00:00:00', 1, 83, 83, 0, 0, 3),
(83, 83, '2016-05-29 17:56:14', '0000-00-00 00:00:00', 1, 82, 82, 0, 0, 2),
(82, 82, '2016-05-29 17:51:42', '0000-00-00 00:00:00', 1, 64, 68, 0, 0, 1),
(81, 81, '2016-05-29 17:47:07', '0000-00-00 00:00:00', 1, 67, 67, 0, 0, 1),
(80, 80, '2016-05-29 17:28:41', '0000-00-00 00:00:00', 1, 67, 67, 0, 0, 1),
(79, 79, '2016-05-29 17:13:31', '0000-00-00 00:00:00', 1, 71, 71, 0, 0, 1),
(78, 78, '2016-05-29 17:12:21', '0000-00-00 00:00:00', 1, 71, 71, 0, 0, 1),
(77, 77, '2016-05-29 16:50:39', '0000-00-00 00:00:00', 1, 67, 67, 0, 0, 1),
(76, 76, '2016-05-29 16:21:24', '0000-00-00 00:00:00', 1, 74, 74, 0, 0, 1),
(75, 75, '2016-05-29 16:18:41', '0000-00-00 00:00:00', 1, 74, 74, 0, 0, 1),
(74, 74, '2016-05-29 16:15:29', '0000-00-00 00:00:00', 1, 72, 72, 0, 0, 1),
(73, 73, '2016-05-29 16:13:31', '0000-00-00 00:00:00', 1, 69, 69, 0, 0, 1),
(72, 72, '2016-05-29 16:07:56', '0000-00-00 00:00:00', 1, 65, 65, 0, 0, 1),
(71, 71, '2016-05-29 16:04:00', '0000-00-00 00:00:00', 1, 65, 65, 0, 0, 4),
(70, 70, '2016-05-29 16:00:42', '0000-00-00 00:00:00', 1, 65, 65, 0, 0, 1),
(69, 69, '2016-05-29 15:57:57', '0000-00-00 00:00:00', 1, 48, 64, 0, 0, 1),
(68, 68, '2016-05-29 15:54:41', '0000-00-00 00:00:00', 1, 48, 64, 0, 0, 4),
(67, 67, '2016-05-29 15:48:28', '0000-00-00 00:00:00', 1, 64, 64, 0, 0, 1),
(66, 66, '2016-05-29 15:37:45', '0000-00-00 00:00:00', 1, 48, 48, 0, 0, 2),
(65, 65, '2016-05-29 15:35:52', '0000-00-00 00:00:00', 1, 48, 48, 0, 0, 3),
(64, 64, '2016-05-29 15:33:28', '0000-00-00 00:00:00', 1, 48, 48, 0, 0, 4),
(63, 63, '2016-05-29 15:06:57', '0000-00-00 00:00:00', 1, 61, 61, 0, 0, 1),
(62, 62, '2016-05-29 15:05:17', '0000-00-00 00:00:00', 1, 49, 49, 0, 0, 1),
(61, 61, '2016-05-29 14:53:38', '0000-00-00 00:00:00', 1, 49, 49, 0, 0, 2),
(60, 60, '2016-05-29 13:58:36', '0000-00-00 00:00:00', 1, 50, 50, 0, 0, 1),
(53, 53, '2016-05-29 13:17:32', '0000-00-00 00:00:00', 1, 49, 49, 0, 0, 2),
(50, 50, '2016-05-29 12:52:16', '0000-00-00 00:00:00', 1, 45, 45, 0, 0, 1),
(49, 49, '2016-05-29 12:49:14', '0000-00-00 00:00:00', 1, 45, 45, 0, 0, 1),
(48, 48, '2016-05-29 12:10:01', '0000-00-00 00:00:00', 1, 45, 45, 0, 0, 4),
(44, 45, '2016-05-28 15:17:11', '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 4),
(99, 99, '2016-05-30 14:22:39', '0000-00-00 00:00:00', 1, 48, 69, 0, 0, 1),
(100, 100, '2016-05-30 14:28:10', '0000-00-00 00:00:00', 1, 48, 69, 0, 0, 1),
(101, 101, '2016-05-30 14:31:41', '0000-00-00 00:00:00', 1, 53, 53, 0, 0, 1),
(102, 102, '2016-05-30 14:38:25', '0000-00-00 00:00:00', 1, 53, 53, 0, 0, 1),
(103, 103, '2016-05-30 14:43:05', '0000-00-00 00:00:00', 1, 97, 97, 0, 0, 1),
(104, 104, '2016-05-30 14:45:05', '0000-00-00 00:00:00', 1, 97, 97, 0, 0, 1),
(105, 105, '2016-05-30 14:48:04', '0000-00-00 00:00:00', 1, 97, 97, 0, 0, 1),
(106, 106, '2016-05-30 14:55:09', '0000-00-00 00:00:00', 1, 103, 103, 0, 0, 1),
(107, 107, '2016-05-30 15:00:06', '0000-00-00 00:00:00', 1, 48, 91, 0, 0, 1),
(108, 108, '2016-05-30 15:01:19', '0000-00-00 00:00:00', 1, 103, 103, 0, 0, 1),
(109, 109, '2016-05-30 15:02:43', '0000-00-00 00:00:00', 1, 48, 91, 0, 0, 1),
(110, 110, '2016-05-30 15:05:48', '0000-00-00 00:00:00', 1, 48, 96, 0, 0, 1),
(111, 111, '2016-05-30 15:12:41', '0000-00-00 00:00:00', 1, 103, 103, 0, 0, 1),
(112, 112, '2016-05-30 15:38:45', '0000-00-00 00:00:00', 1, 48, 96, 0, 0, 1),
(113, 113, '2016-05-30 15:41:18', '0000-00-00 00:00:00', 1, 48, 96, 0, 0, 1),
(114, 114, '2016-05-30 15:49:53', '0000-00-00 00:00:00', 1, 111, 111, 0, 0, 1),
(115, 115, '2016-05-30 22:42:10', '0000-00-00 00:00:00', 1, 88, 88, 0, 0, 1),
(116, 116, '2016-05-30 22:46:43', '0000-00-00 00:00:00', 1, 115, 115, 0, 0, 1),
(117, 117, '2016-05-30 22:51:37', '0000-00-00 00:00:00', 1, 115, 115, 0, 0, 1),
(118, 118, '2016-05-30 23:03:00', '0000-00-00 00:00:00', 1, 115, 115, 0, 0, 1),
(119, 119, '2016-05-30 23:07:09', '0000-00-00 00:00:00', 1, 88, 88, 0, 0, 1),
(120, 120, '2016-05-30 23:09:09', '0000-00-00 00:00:00', 1, 88, 88, 0, 0, 1),
(121, 121, '2016-05-30 23:16:34', '0000-00-00 00:00:00', 1, 119, 119, 0, 0, 1),
(122, 122, '2016-05-30 23:18:13', '0000-00-00 00:00:00', 1, 119, 119, 0, 0, 1),
(123, 123, '2016-05-30 23:23:14', '0000-00-00 00:00:00', 1, 121, 121, 0, 0, 1),
(124, 124, '2016-05-30 23:26:14', '0000-00-00 00:00:00', 1, 121, 121, 0, 0, 1),
(125, 125, '2016-05-30 23:29:19', '0000-00-00 00:00:00', 1, 118, 118, 0, 0, 1),
(126, 126, '2016-05-30 23:30:36', '0000-00-00 00:00:00', 1, 118, 118, 0, 0, 1),
(127, 127, '2016-05-30 23:34:53', '0000-00-00 00:00:00', 1, 117, 117, 0, 0, 1),
(128, 128, '2016-05-30 23:37:19', '0000-00-00 00:00:00', 1, 117, 117, 0, 0, 1),
(129, 129, '2016-05-30 23:39:43', '0000-00-00 00:00:00', 1, 128, 128, 0, 0, 1),
(130, 130, '2016-05-30 23:41:44', '0000-00-00 00:00:00', 1, 129, 129, 0, 0, 1),
(131, 131, '2016-05-30 23:43:00', '0000-00-00 00:00:00', 1, 129, 129, 0, 0, 1),
(132, 132, '2016-05-30 23:45:40', '0000-00-00 00:00:00', 1, 127, 127, 0, 0, 1),
(133, 133, '2016-05-30 23:50:11', '0000-00-00 00:00:00', 1, 125, 125, 0, 0, 1),
(134, 134, '2016-05-30 23:53:46', '0000-00-00 00:00:00', 1, 125, 125, 0, 0, 1),
(135, 135, '2016-05-30 23:57:57', '0000-00-00 00:00:00', 1, 133, 133, 0, 0, 1),
(136, 136, '2016-05-31 00:00:23', '0000-00-00 00:00:00', 1, 133, 133, 0, 0, 1),
(137, 137, '2016-05-31 09:15:00', '0000-00-00 00:00:00', 1, 48, 98, 0, 0, 1),
(138, 138, '2016-05-31 11:45:56', '0000-00-00 00:00:00', 1, 87, 87, 0, 0, 1),
(139, 139, '2016-05-31 12:27:19', '0000-00-00 00:00:00', 1, 101, 101, 0, 0, 1),
(140, 140, '2016-05-31 12:52:34', '0000-00-00 00:00:00', 1, 101, 101, 0, 0, 1),
(141, 141, '2016-05-31 12:55:05', '0000-00-00 00:00:00', 1, 101, 101, 0, 0, 1),
(142, 142, '2016-05-31 14:13:25', '0000-00-00 00:00:00', 1, 71, 71, 0, 0, 1),
(143, 143, '2016-05-31 15:25:13', '0000-00-00 00:00:00', 1, 70, 70, 0, 0, 2),
(144, 144, '2016-05-31 15:29:35', '0000-00-00 00:00:00', 1, 70, 70, 0, 0, 1),
(145, 145, '2016-05-31 15:30:08', '0000-00-00 00:00:00', 1, 90, 90, 0, 0, 4),
(146, 146, '2016-05-31 15:35:02', '0000-00-00 00:00:00', 1, 143, 143, 0, 0, 2),
(147, 147, '2016-05-31 15:38:10', '0000-00-00 00:00:00', 1, 143, 143, 0, 0, 2),
(148, 148, '2016-05-31 15:43:55', '0000-00-00 00:00:00', 1, 70, 70, 0, 0, 1),
(149, 149, '2016-05-31 15:57:38', '0000-00-00 00:00:00', 1, 48, 98, 0, 0, 1),
(150, 150, '2016-05-31 16:05:38', '0000-00-00 00:00:00', 1, 100, 100, 0, 0, 1),
(151, 151, '2016-05-31 16:09:04', '0000-00-00 00:00:00', 1, 70, 143, 0, 0, 1),
(152, 152, '2016-05-31 16:10:38', '0000-00-00 00:00:00', 1, 70, 144, 0, 0, 1),
(153, 153, '2016-05-31 16:42:33', '0000-00-00 00:00:00', 1, 152, 152, 0, 0, 1),
(154, 154, '2016-05-31 16:44:37', '0000-00-00 00:00:00', 1, 153, 153, 0, 0, 1),
(155, 155, '2016-05-31 16:45:45', '0000-00-00 00:00:00', 1, 153, 153, 0, 0, 1),
(156, 156, '2016-05-31 18:06:37', '0000-00-00 00:00:00', 1, 153, 153, 0, 0, 1),
(157, 157, '2016-05-31 18:10:55', '0000-00-00 00:00:00', 1, 156, 156, 0, 0, 1),
(158, 158, '2016-05-31 18:12:02', '0000-00-00 00:00:00', 1, 156, 156, 0, 0, 1),
(159, 159, '2016-05-31 18:13:08', '0000-00-00 00:00:00', 1, 156, 156, 0, 0, 1),
(160, 160, '2016-05-31 18:15:01', '0000-00-00 00:00:00', 1, 156, 157, 0, 0, 1),
(161, 161, '2016-05-31 19:55:08', '0000-00-00 00:00:00', 1, 118, 118, 0, 0, 1),
(162, 162, '2016-05-31 19:55:57', '0000-00-00 00:00:00', 1, 45, 50, 0, 0, 1),
(163, 163, '2016-05-31 19:59:23', '0000-00-00 00:00:00', 1, 118, 125, 0, 0, 1),
(164, 164, '2016-06-01 12:07:52', '0000-00-00 00:00:00', 1, 79, 79, 0, 0, 1),
(165, 165, '2016-06-01 12:15:12', '0000-00-00 00:00:00', 1, 79, 79, 0, 0, 1),
(166, 166, '2016-06-01 12:19:46', '0000-00-00 00:00:00', 1, 79, 79, 0, 0, 1),
(167, 167, '2016-06-01 12:28:50', '0000-00-00 00:00:00', 1, 164, 164, 0, 0, 1),
(168, 168, '2016-06-01 12:33:47', '0000-00-00 00:00:00', 1, 164, 164, 0, 0, 1),
(169, 169, '2016-06-01 12:40:37', '0000-00-00 00:00:00', 1, 164, 164, 0, 0, 1),
(170, 170, '2016-06-01 12:47:23', '0000-00-00 00:00:00', 1, 79, 165, 0, 0, 1),
(171, 171, '2016-06-01 12:47:40', '0000-00-00 00:00:00', 1, 78, 78, 0, 0, 1),
(172, 172, '2016-06-01 12:53:54', '0000-00-00 00:00:00', 1, 79, 165, 0, 0, 1),
(173, 173, '2016-06-01 13:02:17', '0000-00-00 00:00:00', 1, 167, 167, 0, 0, 1),
(174, 174, '2016-06-01 13:10:37', '0000-00-00 00:00:00', 1, 71, 78, 0, 0, 1),
(175, 175, '2016-06-01 13:14:56', '0000-00-00 00:00:00', 1, 71, 78, 0, 0, 1),
(176, 176, '2016-06-01 13:38:22', '0000-00-00 00:00:00', 1, 71, 142, 0, 0, 1),
(177, 177, '2016-06-01 13:45:50', '0000-00-00 00:00:00', 1, 71, 142, 0, 0, 1),
(178, 178, '2016-06-01 13:49:43', '0000-00-00 00:00:00', 1, 71, 142, 0, 0, 1),
(179, 179, '2016-06-01 15:57:40', '0000-00-00 00:00:00', 1, 91, 93, 0, 0, 1),
(180, 180, '2016-06-01 16:05:10', '0000-00-00 00:00:00', 1, 79, 165, 0, 0, 1),
(181, 181, '2016-06-01 16:07:02', '0000-00-00 00:00:00', 1, 91, 93, 0, 0, 1),
(182, 182, '2016-06-01 16:15:57', '0000-00-00 00:00:00', 1, 68, 82, 0, 0, 4),
(183, 183, '2016-06-01 16:20:20', '0000-00-00 00:00:00', 1, 92, 92, 0, 0, 1),
(184, 184, '2016-06-01 16:25:59', '0000-00-00 00:00:00', 1, 86, 86, 0, 0, 1),
(185, 185, '2016-06-01 16:56:20', '0000-00-00 00:00:00', 1, 70, 144, 0, 0, 2),
(186, 186, '2016-06-01 16:57:49', '0000-00-00 00:00:00', 1, 185, 185, 0, 0, 1),
(187, 187, '2016-06-01 17:09:47', '0000-00-00 00:00:00', 1, 91, 93, 0, 0, 1),
(188, 188, '2016-06-01 17:10:01', '0000-00-00 00:00:00', 1, 185, 185, 0, 0, 2),
(189, 189, '2016-06-01 17:12:17', '0000-00-00 00:00:00', 1, 188, 188, 0, 0, 1),
(190, 190, '2016-06-01 17:16:31', '0000-00-00 00:00:00', 1, 188, 188, 0, 0, 1),
(191, 191, '2016-06-01 17:21:59', '0000-00-00 00:00:00', 1, 91, 107, 0, 0, 1),
(192, 192, '2016-06-01 17:26:59', '0000-00-00 00:00:00', 1, 191, 191, 0, 0, 1),
(193, 193, '2016-06-01 17:43:35', '0000-00-00 00:00:00', 1, 185, 185, 0, 0, 2),
(194, 194, '2016-06-01 18:49:49', '0000-00-00 00:00:00', 1, 48, 98, 0, 0, 1),
(195, 195, '2016-06-01 22:55:41', '0000-00-00 00:00:00', 1, 71, 174, 0, 0, 1),
(196, 196, '2016-06-01 23:28:39', '0000-00-00 00:00:00', 1, 45, 90, 0, 0, 1),
(197, 197, '2016-06-01 23:31:26', '0000-00-00 00:00:00', 1, 45, 162, 0, 0, 1),
(198, 198, '2016-06-01 23:34:08', '0000-00-00 00:00:00', 1, 45, 162, 0, 0, 1),
(199, 199, '2016-06-02 00:08:20', '0000-00-00 00:00:00', 1, 187, 187, 0, 0, 1),
(200, 200, '2016-06-02 02:45:01', '0000-00-00 00:00:00', 1, 71, 174, 0, 0, 1),
(201, 201, '2016-06-02 08:18:11', '0000-00-00 00:00:00', 1, 45, 162, 0, 0, 1),
(202, 202, '2016-06-02 08:25:06', '0000-00-00 00:00:00', 1, 45, 196, 0, 0, 1),
(203, 203, '2016-06-02 08:27:40', '0000-00-00 00:00:00', 1, 45, 196, 0, 0, 1),
(204, 204, '2016-06-02 08:30:10', '0000-00-00 00:00:00', 1, 45, 196, 0, 0, 1),
(205, 205, '2016-06-02 08:32:13', '0000-00-00 00:00:00', 1, 45, 197, 0, 0, 1),
(206, 206, '2016-06-02 08:34:09', '0000-00-00 00:00:00', 1, 45, 197, 0, 0, 1),
(207, 207, '2016-06-02 08:36:10', '0000-00-00 00:00:00', 1, 45, 197, 0, 0, 1),
(208, 208, '2016-06-02 08:39:30', '0000-00-00 00:00:00', 1, 45, 198, 0, 0, 1),
(209, 209, '2016-06-02 08:41:28', '0000-00-00 00:00:00', 1, 45, 198, 0, 0, 1),
(210, 210, '2016-06-02 08:43:47', '0000-00-00 00:00:00', 1, 45, 198, 0, 0, 1),
(211, 211, '2016-06-02 09:21:37', '0000-00-00 00:00:00', 1, 93, 179, 0, 0, 1),
(212, 212, '2016-06-02 12:40:40', '0000-00-00 00:00:00', 1, 182, 182, 0, 0, 1),
(213, 213, '2016-06-02 15:33:41', '0000-00-00 00:00:00', 1, 86, 86, 0, 0, 2),
(214, 214, '2016-06-02 15:37:40', '0000-00-00 00:00:00', 1, 213, 213, 0, 0, 2),
(215, 215, '2016-06-02 15:41:15', '0000-00-00 00:00:00', 1, 213, 213, 0, 0, 2),
(216, 216, '2016-06-02 16:31:26', '0000-00-00 00:00:00', 1, 147, 147, 0, 0, 1),
(217, 217, '2016-06-02 16:33:08', '0000-00-00 00:00:00', 1, 216, 216, 0, 0, 1),
(218, 218, '2016-06-02 16:34:47', '0000-00-00 00:00:00', 1, 216, 216, 0, 0, 1),
(219, 219, '2016-06-02 16:37:36', '0000-00-00 00:00:00', 1, 218, 218, 0, 0, 1),
(220, 220, '2016-06-02 17:08:31', '0000-00-00 00:00:00', 1, 69, 73, 0, 0, 1),
(221, 221, '2016-06-02 17:11:31', '0000-00-00 00:00:00', 1, 216, 216, 0, 0, 1),
(222, 222, '2016-06-02 17:12:52', '0000-00-00 00:00:00', 1, 216, 217, 0, 0, 1),
(223, 223, '2016-06-02 17:15:16', '0000-00-00 00:00:00', 1, 126, 126, 0, 0, 1),
(224, 224, '2016-06-02 17:15:46', '0000-00-00 00:00:00', 1, 220, 220, 0, 0, 1),
(225, 225, '2016-06-02 17:19:06', '0000-00-00 00:00:00', 1, 126, 126, 0, 0, 1),
(226, 226, '2016-06-02 17:19:42', '0000-00-00 00:00:00', 1, 220, 220, 0, 0, 1),
(227, 227, '2016-06-02 17:23:56', '0000-00-00 00:00:00', 1, 120, 120, 0, 0, 1),
(228, 228, '2016-06-02 17:25:11', '0000-00-00 00:00:00', 1, 69, 73, 0, 0, 1),
(229, 229, '2016-06-02 17:29:43', '0000-00-00 00:00:00', 1, 69, 99, 0, 0, 1),
(230, 230, '2016-06-02 17:33:00', '0000-00-00 00:00:00', 1, 69, 99, 0, 0, 1),
(231, 231, '2016-06-02 17:35:59', '0000-00-00 00:00:00', 1, 69, 99, 0, 0, 1),
(232, 232, '2016-06-02 17:43:16', '0000-00-00 00:00:00', 1, 69, 100, 0, 0, 1),
(233, 233, '2016-06-02 17:58:43', '0000-00-00 00:00:00', 1, 69, 100, 0, 0, 1),
(234, 234, '2016-06-02 18:04:14', '0000-00-00 00:00:00', 1, 69, 220, 0, 0, 1),
(235, 235, '2016-06-02 18:08:19', '0000-00-00 00:00:00', 1, 69, 228, 0, 0, 1),
(236, 236, '2016-06-02 18:12:20', '0000-00-00 00:00:00', 1, 69, 228, 0, 0, 1),
(237, 237, '2016-06-02 18:16:50', '0000-00-00 00:00:00', 1, 69, 228, 0, 0, 1),
(238, 238, '2016-06-02 18:19:28', '0000-00-00 00:00:00', 1, 69, 229, 0, 0, 1),
(239, 239, '2016-06-02 18:23:31', '0000-00-00 00:00:00', 1, 69, 229, 0, 0, 1),
(240, 240, '2016-06-02 19:12:02', '0000-00-00 00:00:00', 1, 92, 92, 0, 0, 1),
(241, 241, '2016-06-02 19:13:13', '0000-00-00 00:00:00', 1, 92, 92, 0, 0, 1),
(242, 242, '2016-06-02 19:52:19', '0000-00-00 00:00:00', 1, 94, 94, 0, 0, 1),
(243, 243, '2016-06-02 19:55:01', '0000-00-00 00:00:00', 1, 94, 94, 0, 0, 1),
(244, 244, '2016-06-02 19:56:49', '0000-00-00 00:00:00', 1, 94, 94, 0, 0, 1),
(245, 245, '2016-06-02 19:58:51', '0000-00-00 00:00:00', 1, 242, 242, 0, 0, 1),
(246, 246, '2016-06-02 20:00:17', '0000-00-00 00:00:00', 1, 242, 242, 0, 0, 1),
(247, 247, '2016-06-02 20:14:04', '0000-00-00 00:00:00', 1, 68, 82, 0, 0, 4),
(248, 248, '2016-06-02 20:15:32', '0000-00-00 00:00:00', 1, 68, 182, 0, 0, 1),
(249, 249, '2016-06-02 20:26:37', '0000-00-00 00:00:00', 1, 148, 148, 0, 0, 1),
(250, 250, '2016-06-02 20:30:15', '0000-00-00 00:00:00', 1, 249, 249, 0, 0, 1),
(251, 251, '2016-06-03 04:24:11', '0000-00-00 00:00:00', 1, 145, 145, 0, 0, 1),
(252, 252, '2016-06-03 04:27:58', '0000-00-00 00:00:00', 1, 145, 145, 0, 0, 1),
(253, 253, '2016-06-03 06:37:18', '0000-00-00 00:00:00', 1, 252, 252, 0, 0, 1),
(254, 254, '2016-06-03 06:46:58', '0000-00-00 00:00:00', 1, 252, 252, 0, 0, 1),
(255, 255, '2016-06-03 06:49:45', '0000-00-00 00:00:00', 1, 252, 252, 0, 0, 1),
(256, 256, '2016-06-03 08:14:37', '0000-00-00 00:00:00', 1, 175, 175, 0, 0, 1),
(257, 257, '2016-06-03 08:19:40', '0000-00-00 00:00:00', 1, 175, 175, 0, 0, 1),
(258, 258, '2016-06-03 08:31:21', '0000-00-00 00:00:00', 1, 145, 145, 0, 0, 1),
(259, 259, '2016-06-03 09:19:18', '0000-00-00 00:00:00', 1, 90, 95, 0, 0, 4),
(260, 260, '2016-06-03 09:40:14', '0000-00-00 00:00:00', 1, 191, 191, 0, 0, 1),
(261, 261, '2016-06-03 09:56:39', '0000-00-00 00:00:00', 1, 93, 179, 0, 0, 1),
(262, 262, '2016-06-03 09:58:59', '0000-00-00 00:00:00', 1, 93, 179, 0, 0, 1),
(263, 263, '2016-06-03 10:14:15', '0000-00-00 00:00:00', 1, 186, 186, 0, 0, 1),
(264, 264, '2016-06-03 10:49:27', '0000-00-00 00:00:00', 1, 148, 148, 0, 0, 1),
(265, 265, '2016-06-03 11:06:59', '0000-00-00 00:00:00', 1, 255, 255, 0, 0, 1),
(266, 266, '2016-06-03 11:20:32', '0000-00-00 00:00:00', 1, 255, 255, 0, 0, 1),
(267, 267, '2016-06-03 11:22:31', '0000-00-00 00:00:00', 1, 255, 255, 0, 0, 1),
(268, 268, '2016-06-03 11:29:44', '0000-00-00 00:00:00', 1, 128, 128, 0, 0, 1),
(269, 269, '2016-06-03 11:34:41', '0000-00-00 00:00:00', 1, 148, 148, 0, 0, 1),
(270, 270, '2016-06-03 11:38:42', '0000-00-00 00:00:00', 1, 254, 254, 0, 0, 1),
(271, 271, '2016-06-03 12:06:18', '0000-00-00 00:00:00', 1, 185, 186, 0, 0, 1),
(272, 272, '2016-06-03 12:52:21', '0000-00-00 00:00:00', 1, 95, 95, 0, 0, 1),
(273, 273, '2016-06-03 13:12:01', '0000-00-00 00:00:00', 1, 223, 223, 0, 0, 1),
(274, 274, '2016-06-03 13:28:10', '0000-00-00 00:00:00', 1, 101, 139, 0, 0, 1),
(275, 275, '2016-06-03 13:34:13', '0000-00-00 00:00:00', 1, 267, 267, 0, 0, 1),
(276, 276, '2016-06-03 13:36:08', '0000-00-00 00:00:00', 1, 267, 267, 0, 0, 1),
(277, 277, '2016-06-03 13:38:16', '0000-00-00 00:00:00', 1, 267, 267, 0, 0, 1),
(278, 278, '2016-06-03 13:42:39', '0000-00-00 00:00:00', 1, 252, 253, 0, 0, 1),
(279, 279, '2016-06-03 13:46:03', '0000-00-00 00:00:00', 1, 252, 253, 0, 0, 1),
(280, 280, '2016-06-03 14:39:27', '0000-00-00 00:00:00', 1, 278, 278, 0, 0, 1),
(281, 281, '2016-06-03 14:42:32', '0000-00-00 00:00:00', 1, 278, 278, 0, 0, 1),
(282, 282, '2016-06-03 15:23:27', '0000-00-00 00:00:00', 1, 48, 107, 0, 0, 1),
(283, 283, '2016-06-03 15:29:05', '0000-00-00 00:00:00', 1, 282, 282, 0, 0, 1),
(284, 284, '2016-06-03 15:30:33', '0000-00-00 00:00:00', 1, 283, 283, 0, 0, 1),
(285, 285, '2016-06-03 15:54:06', '0000-00-00 00:00:00', 1, 87, 89, 0, 0, 1),
(286, 286, '2016-06-03 18:22:38', '0000-00-00 00:00:00', 1, 145, 251, 0, 0, 4),
(287, 287, '2016-06-03 18:24:45', '0000-00-00 00:00:00', 1, 145, 251, 0, 0, 4),
(288, 288, '2016-06-03 18:27:01', '0000-00-00 00:00:00', 1, 286, 286, 0, 0, 4),
(289, 289, '2016-06-03 18:29:31', '0000-00-00 00:00:00', 1, 286, 286, 0, 0, 4),
(290, 290, '2016-06-03 18:31:06', '0000-00-00 00:00:00', 1, 286, 286, 0, 0, 4),
(291, 291, '2016-06-03 18:32:23', '0000-00-00 00:00:00', 1, 286, 288, 0, 0, 4),
(292, 292, '2016-06-03 18:33:42', '0000-00-00 00:00:00', 1, 286, 288, 0, 0, 4),
(293, 293, '2016-06-03 18:35:12', '0000-00-00 00:00:00', 1, 286, 288, 0, 0, 4),
(294, 294, '2016-06-03 18:38:41', '0000-00-00 00:00:00', 1, 287, 287, 0, 0, 4),
(295, 295, '2016-06-03 18:41:01', '0000-00-00 00:00:00', 1, 287, 287, 0, 0, 4),
(296, 296, '2016-06-03 21:30:18', '0000-00-00 00:00:00', 1, 257, 257, 0, 0, 1),
(297, 297, '2016-06-03 21:35:32', '0000-00-00 00:00:00', 1, 257, 257, 0, 0, 1),
(298, 298, '2016-06-03 21:39:27', '0000-00-00 00:00:00', 1, 257, 257, 0, 0, 1),
(299, 299, '2016-06-03 22:32:50', '0000-00-00 00:00:00', 1, 178, 178, 0, 0, 1),
(300, 300, '2016-06-03 23:04:13', '0000-00-00 00:00:00', 1, 178, 178, 0, 0, 1),
(301, 301, '2016-06-03 23:26:54', '0000-00-00 00:00:00', 1, 178, 178, 0, 0, 1),
(302, 302, '2016-06-04 08:24:04', '0000-00-00 00:00:00', 1, 271, 271, 0, 0, 1),
(303, 303, '2016-06-04 08:30:42', '0000-00-00 00:00:00', 1, 271, 271, 0, 0, 1),
(304, 304, '2016-06-04 08:35:22', '0000-00-00 00:00:00', 1, 303, 303, 0, 0, 1),
(305, 305, '2016-06-04 08:37:20', '0000-00-00 00:00:00', 1, 303, 303, 0, 0, 1),
(306, 306, '2016-06-04 08:39:25', '0000-00-00 00:00:00', 1, 303, 303, 0, 0, 1),
(307, 307, '2016-06-04 08:42:05', '0000-00-00 00:00:00', 1, 304, 304, 0, 0, 1),
(308, 308, '2016-06-04 08:42:31', '0000-00-00 00:00:00', 1, 48, 107, 0, 0, 1),
(309, 309, '2016-06-04 08:45:16', '0000-00-00 00:00:00', 1, 305, 305, 0, 0, 1),
(310, 310, '2016-06-04 08:49:44', '0000-00-00 00:00:00', 1, 48, 109, 0, 0, 1),
(311, 311, '2016-06-04 09:06:13', '0000-00-00 00:00:00', 1, 310, 310, 0, 0, 1),
(312, 312, '2016-06-04 09:12:48', '0000-00-00 00:00:00', 1, 310, 310, 0, 0, 1),
(313, 313, '2016-06-04 09:13:53', '0000-00-00 00:00:00', 1, 311, 311, 0, 0, 1),
(314, 314, '2016-06-04 09:46:38', '0000-00-00 00:00:00', 1, 296, 296, 0, 0, 1),
(315, 315, '2016-06-04 09:55:38', '0000-00-00 00:00:00', 1, 310, 310, 0, 0, 1),
(316, 316, '2016-06-04 10:00:25', '0000-00-00 00:00:00', 1, 311, 311, 0, 0, 1),
(317, 317, '2016-06-04 10:07:23', '0000-00-00 00:00:00', 1, 312, 312, 0, 0, 1),
(318, 318, '2016-06-04 10:14:52', '0000-00-00 00:00:00', 1, 311, 311, 0, 0, 1),
(319, 319, '2016-06-04 10:20:05', '0000-00-00 00:00:00', 1, 312, 312, 0, 0, 1),
(320, 320, '2016-06-04 10:38:51', '0000-00-00 00:00:00', 1, 317, 317, 0, 0, 1),
(321, 321, '2016-06-04 10:43:49', '0000-00-00 00:00:00', 1, 315, 315, 0, 0, 1),
(322, 322, '2016-06-04 10:46:13', '0000-00-00 00:00:00', 1, 321, 321, 0, 0, 1),
(323, 323, '2016-06-04 11:02:47', '0000-00-00 00:00:00', 1, 321, 321, 0, 0, 1),
(324, 324, '2016-06-04 11:05:43', '0000-00-00 00:00:00', 1, 311, 313, 0, 0, 1),
(325, 325, '2016-06-04 11:31:15', '0000-00-00 00:00:00', 1, 143, 146, 0, 0, 2),
(326, 326, '2016-06-04 11:52:50', '0000-00-00 00:00:00', 1, 324, 324, 0, 0, 1),
(327, 327, '2016-06-04 14:15:49', '0000-00-00 00:00:00', 1, 254, 254, 0, 0, 1),
(328, 328, '2016-06-04 14:18:05', '0000-00-00 00:00:00', 1, 254, 254, 0, 0, 1),
(329, 329, '2016-06-04 14:22:27', '0000-00-00 00:00:00', 1, 254, 270, 0, 0, 1),
(330, 330, '2016-06-04 14:24:23', '0000-00-00 00:00:00', 1, 254, 270, 0, 0, 1),
(331, 331, '2016-06-04 14:37:55', '0000-00-00 00:00:00', 1, 185, 186, 0, 0, 1),
(332, 332, '2016-06-04 17:02:12', '0000-00-00 00:00:00', 1, 86, 86, 0, 0, 1),
(333, 333, '2016-06-04 22:18:20', '0000-00-00 00:00:00', 1, 88, 119, 0, 0, 1),
(334, 334, '2016-06-04 22:21:12', '0000-00-00 00:00:00', 1, 333, 333, 0, 0, 1),
(335, 335, '2016-06-04 22:25:06', '0000-00-00 00:00:00', 1, 333, 333, 0, 0, 1),
(336, 336, '2016-06-05 07:08:38', '0000-00-00 00:00:00', 1, 247, 247, 0, 0, 1),
(337, 337, '2016-06-05 07:16:29', '0000-00-00 00:00:00', 1, 144, 144, 0, 0, 1),
(338, 338, '2016-06-05 11:43:51', '0000-00-00 00:00:00', 1, 90, 95, 0, 0, 1),
(339, 339, '2016-06-05 12:22:03', '0000-00-00 00:00:00', 1, 142, 176, 0, 0, 1),
(340, 340, '2016-06-05 12:48:15', '0000-00-00 00:00:00', 1, 90, 259, 0, 0, 1),
(341, 341, '2016-06-05 14:02:06', '0000-00-00 00:00:00', 1, 185, 188, 0, 0, 1),
(342, 342, '2016-06-05 14:27:35', '0000-00-00 00:00:00', 1, 185, 193, 0, 0, 1),
(343, 343, '2016-06-05 15:35:24', '0000-00-00 00:00:00', 1, 184, 184, 0, 0, 1),
(344, 344, '2016-06-05 18:50:52', '0000-00-00 00:00:00', 1, 247, 247, 0, 0, 2),
(345, 345, '2016-06-06 08:59:15', '0000-00-00 00:00:00', 1, 310, 312, 0, 0, 1),
(346, 346, '2016-06-06 10:54:07', '0000-00-00 00:00:00', 1, 333, 333, 0, 0, 1),
(347, 347, '2016-06-06 11:22:40', '0000-00-00 00:00:00', 1, 216, 217, 0, 0, 1),
(348, 348, '2016-06-06 12:27:49', '0000-00-00 00:00:00', 1, 66, 348, 0, 0, 1),
(349, 349, '2016-06-06 13:06:47', '0000-00-00 00:00:00', 1, 216, 217, 0, 0, 1),
(350, 350, '2016-06-06 13:10:41', '0000-00-00 00:00:00', 1, 66, 348, 0, 0, 1),
(351, 351, '2016-06-06 13:11:55', '0000-00-00 00:00:00', 1, 48, 109, 0, 0, 1),
(352, 352, '2016-06-06 13:23:15', '0000-00-00 00:00:00', 1, 351, 351, 0, 0, 1),
(353, 353, '2016-06-08 10:48:12', '0000-00-00 00:00:00', 1, 45, 201, 0, 0, 4),
(354, 354, '2016-06-08 10:53:26', '0000-00-00 00:00:00', 1, 45, 201, 0, 0, 4);

-- --------------------------------------------------------

--
-- Structure de la table `sm_customer_online`
--

CREATE TABLE IF NOT EXISTS `sm_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sm_customer_pd_logs`
--

CREATE TABLE IF NOT EXISTS `sm_customer_pd_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_customer_profit_custom`
--

CREATE TABLE IF NOT EXISTS `sm_customer_profit_custom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profit` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `sm_customer_profit_custom`
--

INSERT INTO `sm_customer_profit_custom` (`id`, `profit`) VALUES
(1, 40);

-- --------------------------------------------------------

--
-- Structure de la table `sm_customer_provide_donation`
--

CREATE TABLE IF NOT EXISTS `sm_customer_provide_donation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `status` int(11) NOT NULL COMMENT '0: watting, 1:marched, 2: finish',
  `pd_number` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `sm_customer_provide_donation`
--

INSERT INTO `sm_customer_provide_donation` (`id`, `customer_id`, `date_added`, `status`, `pd_number`) VALUES
(1, 68, '2016-05-06 12:30:59', 2, 146333582723),
(2, 45, '2016-05-08 10:55:09', 2, 18524230711);

-- --------------------------------------------------------

--
-- Structure de la table `sm_customer_reward`
--

CREATE TABLE IF NOT EXISTS `sm_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_customer_r_wallet`
--

CREATE TABLE IF NOT EXISTS `sm_customer_r_wallet` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Contenu de la table `sm_customer_r_wallet`
--

INSERT INTO `sm_customer_r_wallet` (`id`, `customer_id`, `amount`) VALUES
(2, 3, 1.5),
(3, 282, 0),
(4, 182, 0),
(5, 68, 0),
(6, 342, 0),
(7, 195, 0),
(8, 216, 0),
(9, 61, 0),
(10, 45, 0),
(11, 259, 0),
(12, 285, 0),
(13, 84, 0),
(14, 344, 0),
(15, 145, 0),
(16, 92, 0),
(17, 48, 0),
(18, 353, 0),
(19, 354, 0);

-- --------------------------------------------------------

--
-- Structure de la table `sm_customer_transaction`
--

CREATE TABLE IF NOT EXISTS `sm_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_custom_field`
--

CREATE TABLE IF NOT EXISTS `sm_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_custom_field_customer_group`
--

CREATE TABLE IF NOT EXISTS `sm_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sm_custom_field_description`
--

CREATE TABLE IF NOT EXISTS `sm_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sm_custom_field_value`
--

CREATE TABLE IF NOT EXISTS `sm_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_custom_field_value_description`
--

CREATE TABLE IF NOT EXISTS `sm_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sm_download`
--

CREATE TABLE IF NOT EXISTS `sm_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_download_description`
--

CREATE TABLE IF NOT EXISTS `sm_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sm_event`
--

CREATE TABLE IF NOT EXISTS `sm_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_extension`
--

CREATE TABLE IF NOT EXISTS `sm_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=448 ;

--
-- Contenu de la table `sm_extension`
--

INSERT INTO `sm_extension` (`extension_id`, `type`, `code`) VALUES
(23, 'payment', 'cod'),
(22, 'total', 'shipping'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(410, 'module', 'banner'),
(426, 'module', 'carousel'),
(390, 'total', 'credit'),
(387, 'shipping', 'flat'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(389, 'total', 'coupon'),
(413, 'module', 'category'),
(408, 'module', 'account'),
(393, 'total', 'reward'),
(398, 'total', 'voucher'),
(407, 'payment', 'free_checkout'),
(427, 'module', 'featured'),
(419, 'module', 'slideshow'),
(431, 'module', 'simple_blog'),
(432, 'module', 'simple_blog_category'),
(434, 'module', 'banner_left'),
(435, 'module', 'banner_right'),
(447, 'module', 'accountright'),
(444, 'module', 'accountleft');

-- --------------------------------------------------------

--
-- Structure de la table `sm_filter`
--

CREATE TABLE IF NOT EXISTS `sm_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_filter_description`
--

CREATE TABLE IF NOT EXISTS `sm_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sm_filter_group`
--

CREATE TABLE IF NOT EXISTS `sm_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_filter_group_description`
--

CREATE TABLE IF NOT EXISTS `sm_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sm_geo_zone`
--

CREATE TABLE IF NOT EXISTS `sm_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `sm_geo_zone`
--

INSERT INTO `sm_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- Structure de la table `sm_information`
--

CREATE TABLE IF NOT EXISTS `sm_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `sm_information`
--

INSERT INTO `sm_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(7, 0, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `sm_information_description`
--

CREATE TABLE IF NOT EXISTS `sm_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sm_information_description`
--

INSERT INTO `sm_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(7, 1, 'Thông báo', '&lt;p&gt;Nội dung thông báo&lt;/p&gt;', 'Thông báo', '', ''),
(7, 2, 'Thông báo', '&lt;h5 style=&quot;font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; margin: 5px 0px 0px; font-size: 18px; line-height: 1;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;Quý Hội viên kính yêu!&lt;/span&gt;&lt;/h5&gt;&lt;h3 style=&quot;font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; margin: 5px 0px 0px; font-size: 18px; line-height: 1;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/h3&gt;&lt;h3 style=&quot;font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; margin: 5px 0px 0px; font-size: 18px; line-height: 1;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;Tháng 4/2016 là tháng bản lề để chúng ta bắt đầu công việc tại CLB. Sự thành công của quý hội viên là thành công của CLB.&lt;/span&gt;&lt;/h3&gt;&lt;h3 style=&quot;font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; margin: 5px 0px 0px; font-size: 18px; line-height: 1;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/h3&gt;&lt;h3 style=&quot;font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; margin: 5px 0px 0px; font-size: 18px; line-height: 1;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;Khi gặp khó khăn vướng mắc, vui lòng liên hệ với người giới thiệu mình để được giúp đỡ hoặc liên hệ chủ nhiệm theo số 0909311012.&lt;/span&gt;&lt;/h3&gt;&lt;h3 style=&quot;font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; margin: 5px 0px 0px; font-size: 18px; line-height: 1;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/h3&gt;&lt;h3 style=&quot;font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; margin: 5px 0px 0px; font-size: 18px; line-height: 1;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;Chân thành cám ơn!&lt;/span&gt;&lt;/h3&gt;&lt;h3 style=&quot;font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; margin: 5px 0px 0px; font-size: 18px; line-height: 1;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;Lâm Minh Nguyên&lt;/span&gt;&lt;/h3&gt;&lt;h3 style=&quot;font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; margin: 5px 0px 0px; font-size: 18px; line-height: 1;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 255);&quot;&gt;Chủ nhiệm&lt;/span&gt;&lt;/h3&gt;', 'Thông báo', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `sm_information_to_layout`
--

CREATE TABLE IF NOT EXISTS `sm_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sm_information_to_layout`
--

INSERT INTO `sm_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(7, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `sm_information_to_store`
--

CREATE TABLE IF NOT EXISTS `sm_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sm_information_to_store`
--

INSERT INTO `sm_information_to_store` (`information_id`, `store_id`) VALUES
(7, 0);

-- --------------------------------------------------------

--
-- Structure de la table `sm_language`
--

CREATE TABLE IF NOT EXISTS `sm_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `sm_language`
--

INSERT INTO `sm_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'English', 'en', 'en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 1, 1),
(2, 'Việt Nam', 'vi', 'vi_VN.UTF-8,vi_VN,vi-vn,vietnamese', 'vn.png', 'vietnamese', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `sm_layout`
--

CREATE TABLE IF NOT EXISTS `sm_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Contenu de la table `sm_layout`
--

INSERT INTO `sm_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search'),
(16, 'SimpleBlog category'),
(17, 'SimpleBlog artical');

-- --------------------------------------------------------

--
-- Structure de la table `sm_layout_module`
--

CREATE TABLE IF NOT EXISTS `sm_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=165 ;

--
-- Contenu de la table `sm_layout_module`
--

INSERT INTO `sm_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(69, 10, 'affiliate', 'column_right', 1),
(72, 3, 'category', 'column_left', 1),
(73, 3, 'banner.30', 'column_left', 2),
(164, 11, 'accountleft.36', 'column_left', 0),
(161, 6, 'accountleft.36', 'column_left', 0),
(157, 16, 'simple_blog_category', 'column_right', 0),
(160, 17, 'simple_blog_category', 'column_right', 0);

-- --------------------------------------------------------

--
-- Structure de la table `sm_layout_route`
--

CREATE TABLE IF NOT EXISTS `sm_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=95 ;

--
-- Contenu de la table `sm_layout_route`
--

INSERT INTO `sm_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(89, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(44, 3, 0, 'product/category'),
(93, 1, 0, 'account/register'),
(20, 2, 0, 'product/product'),
(94, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(83, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search'),
(85, 16, 0, 'simple_blog/category'),
(88, 17, 0, 'simple_blog/article/view');

-- --------------------------------------------------------

--
-- Structure de la table `sm_length_class`
--

CREATE TABLE IF NOT EXISTS `sm_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `sm_length_class`
--

INSERT INTO `sm_length_class` (`length_class_id`, `value`) VALUES
(1, 1.00000000),
(2, 10.00000000),
(3, 0.39370000);

-- --------------------------------------------------------

--
-- Structure de la table `sm_length_class_description`
--

CREATE TABLE IF NOT EXISTS `sm_length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `sm_length_class_description`
--

INSERT INTO `sm_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in'),
(1, 2, 'Centimeter', 'cm'),
(2, 2, 'Millimeter', 'mm'),
(3, 2, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Structure de la table `sm_location`
--

CREATE TABLE IF NOT EXISTS `sm_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_manufacturer`
--

CREATE TABLE IF NOT EXISTS `sm_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `sm_manufacturer`
--

INSERT INTO `sm_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 0),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 0),
(8, 'Apple', 'catalog/demo/apple_logo.jpg', 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 0),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 0);

-- --------------------------------------------------------

--
-- Structure de la table `sm_manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `sm_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sm_manufacturer_to_store`
--

INSERT INTO `sm_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Structure de la table `sm_marketing`
--

CREATE TABLE IF NOT EXISTS `sm_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_member_level`
--

CREATE TABLE IF NOT EXISTS `sm_member_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_vn` varchar(255) NOT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `sm_member_level`
--

INSERT INTO `sm_member_level` (`id`, `name_vn`, `name_en`) VALUES
(1, 'Hội viên', 'Hội viên');

-- --------------------------------------------------------

--
-- Structure de la table `sm_modification`
--

CREATE TABLE IF NOT EXISTS `sm_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_module`
--

CREATE TABLE IF NOT EXISTS `sm_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Contenu de la table `sm_module`
--

INSERT INTO `sm_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Banner - Category', 'banner', 'a:5:{s:4:"name";s:17:"Banner - Category";s:9:"banner_id";s:2:"10";s:5:"width";s:3:"385";s:6:"height";s:2:"85";s:6:"status";s:1:"1";}'),
(29, 'Home Page', 'carousel', 'a:5:{s:4:"name";s:20:"Carousel - Home Page";s:9:"banner_id";s:1:"8";s:5:"width";s:3:"130";s:6:"height";s:3:"100";s:6:"status";s:1:"1";}'),
(28, 'Home Page', 'featured', 'a:6:{s:4:"name";s:20:"Featured - Home Page";s:7:"product";a:4:{i:0;s:2:"43";i:1;s:2:"40";i:2;s:2:"42";i:3;s:2:"30";}s:5:"limit";s:1:"4";s:5:"width";s:3:"200";s:6:"height";s:3:"200";s:6:"status";s:1:"1";}'),
(27, 'Slideshow - Home Page', 'slideshow', 'a:5:{s:4:"name";s:21:"Slideshow - Home Page";s:9:"banner_id";s:1:"7";s:5:"width";s:4:"1400";s:6:"height";s:3:"400";s:6:"status";s:1:"1";}'),
(31, 'Banner Left', 'banner', 'a:5:{s:4:"name";s:11:"Banner Left";s:9:"banner_id";s:1:"9";s:5:"width";s:3:"350";s:6:"height";s:2:"80";s:6:"status";s:1:"1";}'),
(32, 'Banner right', 'banner', 'a:5:{s:4:"name";s:12:"Banner right";s:9:"banner_id";s:2:"11";s:5:"width";s:3:"350";s:6:"height";s:2:"80";s:6:"status";s:1:"1";}'),
(36, 'Account left', 'accountleft', 'a:2:{s:4:"name";s:12:"Account left";s:6:"status";s:1:"1";}'),
(37, 'Account right', 'accountright', 'a:2:{s:4:"name";s:13:"Account right";s:6:"status";s:1:"1";}');

-- --------------------------------------------------------

--
-- Structure de la table `sm_option`
--

CREATE TABLE IF NOT EXISTS `sm_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Contenu de la table `sm_option`
--

INSERT INTO `sm_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11);

-- --------------------------------------------------------

--
-- Structure de la table `sm_option_description`
--

CREATE TABLE IF NOT EXISTS `sm_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sm_option_description`
--

INSERT INTO `sm_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size'),
(1, 2, 'Radio'),
(2, 2, 'Checkbox'),
(4, 2, 'Text'),
(6, 2, 'Textarea'),
(8, 2, 'Date'),
(7, 2, 'File'),
(5, 2, 'Select'),
(9, 2, 'Time'),
(10, 2, 'Date &amp; Time'),
(12, 2, 'Delivery Date'),
(11, 2, 'Size');

-- --------------------------------------------------------

--
-- Structure de la table `sm_option_value`
--

CREATE TABLE IF NOT EXISTS `sm_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Contenu de la table `sm_option_value`
--

INSERT INTO `sm_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- Structure de la table `sm_option_value_description`
--

CREATE TABLE IF NOT EXISTS `sm_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sm_option_value_description`
--

INSERT INTO `sm_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small'),
(43, 2, 1, 'Large'),
(32, 2, 1, 'Small'),
(45, 2, 2, 'Checkbox 4'),
(44, 2, 2, 'Checkbox 3'),
(31, 2, 1, 'Medium'),
(42, 2, 5, 'Yellow'),
(41, 2, 5, 'Green'),
(39, 2, 5, 'Red'),
(40, 2, 5, 'Blue'),
(23, 2, 2, 'Checkbox 1'),
(24, 2, 2, 'Checkbox 2'),
(48, 2, 11, 'Large'),
(47, 2, 11, 'Medium'),
(46, 2, 11, 'Small');

-- --------------------------------------------------------

--
-- Structure de la table `sm_order`
--

CREATE TABLE IF NOT EXISTS `sm_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(40) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_order_custom_field`
--

CREATE TABLE IF NOT EXISTS `sm_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL,
  PRIMARY KEY (`order_custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_order_history`
--

CREATE TABLE IF NOT EXISTS `sm_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_order_option`
--

CREATE TABLE IF NOT EXISTS `sm_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_order_product`
--

CREATE TABLE IF NOT EXISTS `sm_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_order_recurring`
--

CREATE TABLE IF NOT EXISTS `sm_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_order_recurring_transaction`
--

CREATE TABLE IF NOT EXISTS `sm_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_order_status`
--

CREATE TABLE IF NOT EXISTS `sm_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `sm_order_status`
--

INSERT INTO `sm_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'Processing'),
(3, 1, 'Shipped'),
(7, 1, 'Canceled'),
(5, 1, 'Complete'),
(8, 1, 'Denied'),
(9, 1, 'Canceled Reversal'),
(10, 1, 'Failed'),
(11, 1, 'Refunded'),
(12, 1, 'Reversed'),
(13, 1, 'Chargeback'),
(1, 1, 'Pending'),
(16, 1, 'Voided'),
(15, 1, 'Processed'),
(14, 1, 'Expired'),
(2, 2, 'Processing'),
(3, 2, 'Shipped'),
(7, 2, 'Canceled'),
(5, 2, 'Complete'),
(8, 2, 'Denied'),
(9, 2, 'Canceled Reversal'),
(10, 2, 'Failed'),
(11, 2, 'Refunded'),
(12, 2, 'Reversed'),
(13, 2, 'Chargeback'),
(1, 2, 'Pending'),
(16, 2, 'Voided'),
(15, 2, 'Processed'),
(14, 2, 'Expired');

-- --------------------------------------------------------

--
-- Structure de la table `sm_order_total`
--

CREATE TABLE IF NOT EXISTS `sm_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_order_voucher`
--

CREATE TABLE IF NOT EXISTS `sm_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_pd_hh`
--

CREATE TABLE IF NOT EXISTS `sm_pd_hh` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_ping_history`
--

CREATE TABLE IF NOT EXISTS `sm_ping_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer` int(11) NOT NULL,
  `amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `user_description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `system_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=522 ;

--
-- Contenu de la table `sm_ping_history`
--

INSERT INTO `sm_ping_history` (`id`, `id_customer`, `amount`, `date_added`, `user_description`, `type`, `system_description`) VALUES
(454, 3, '- 1', '2016-05-20 17:22:46', 'dfds fsd sda fsd ', 'Transfer', '0902188012'),
(455, 18, '+ 1', '2016-05-20 17:22:46', 'dfds fsd sda fsd ', 'Transfer', '0909311012'),
(456, 3, '- 1', '2016-05-20 17:23:37', 'sdfs dsf da fd fdsa', 'Transfer', '0902188012'),
(457, 18, '+ 1', '2016-05-20 17:23:37', 'sdfs dsf da fd fdsa', 'Transfer', '0909311012'),
(458, 3, '- 0', '2016-05-20 17:24:04', '', 'Transfer', '0902188012'),
(459, 18, '+ 0', '2016-05-20 17:24:04', '', 'Transfer', '0909311012'),
(460, 3, '- 1', '2016-05-20 17:24:39', '', 'Transfer', '0902188012'),
(461, 18, '+ 1', '2016-05-20 17:24:39', '', 'Transfer', '0909311012'),
(462, 3, '- 1', '2016-05-20 17:30:39', '123', 'Transfer', '0902188012'),
(463, 18, '+ 1', '2016-05-20 17:30:39', '123', 'Transfer', '0909311012'),
(464, 3, '- 1', '2016-05-23 13:12:26', '', 'Transfer', 'test'),
(465, 18, '+ 1', '2016-05-23 13:12:26', '', 'Transfer', '0902188012'),
(466, 3, '- 1', '2016-05-24 17:53:18', '', 'Transfer', 'test'),
(467, 18, '+ 1', '2016-05-24 17:53:18', '', 'Transfer', '0902188012'),
(468, 3, '- 1', '2016-05-25 10:31:33', 'Used pin for PD164372742945', 'PD', 'Used pin for PD164372742945'),
(469, 3, '- 1', '2016-05-25 10:34:34', 'Used PIN for [PD245745479953]', 'PD', 'Used PIN for [PD245745479953]'),
(470, 3, '- 1', '2016-05-25 10:35:51', '3245154', 'Transfer', '0909311012'),
(471, 1, '+ 1', '2016-05-25 10:35:51', '3245154', 'Transfer', '0902188012'),
(472, 3, '- 1', '2016-05-25 10:36:20', 'sdfasdffsd', 'Transfer', '0909311012'),
(473, 1, '+ 1', '2016-05-25 10:36:20', 'sdfasdffsd', 'Transfer', '0902188012'),
(474, 3, '- 1', '2016-05-25 10:36:38', '1', 'Transfer', '0909311012'),
(475, 1, '+ 1', '2016-05-25 10:36:38', '1', 'Transfer', '0902188012'),
(476, 3, '- 1', '2016-05-25 11:12:33', 'Used PIN for [PD146333582723]', 'PD', 'Used PIN for [PD146333582723]'),
(477, 3, '- 1', '2016-05-25 13:26:22', 'Used PIN for [PD18524230711]', 'PD', 'Used PIN for [PD18524230711]'),
(478, 3, '- 1', '2016-05-26 13:15:00', 'Used PIN for [PD104191841809]', 'PD', 'Used PIN for [PD104191841809]'),
(479, 3, '- 1', '2016-05-27 15:37:23', 'sdafsd', 'Transfer', 'test'),
(480, 18, '+ 1', '2016-05-27 15:37:23', 'sdafsd', 'Transfer', '0902188012'),
(481, 3, '- 1', '2016-05-27 15:58:42', 'chuyen pin', 'Transfer', 'test15'),
(482, 3, '- 1', '2016-05-27 16:03:04', '1', 'Transfer', 'test15'),
(483, 20, '+ 1', '2016-05-27 16:03:04', '1', 'Transfer', '0902188012'),
(484, 3, '- 1', '2016-05-27 16:05:25', '1', 'Transfer', 'test15'),
(485, 20, '+ 1', '2016-05-27 16:05:25', '1', 'Transfer', '0902188012'),
(486, 3, '- 1', '2016-05-27 16:06:29', '1', 'Transfer', 'test15'),
(487, 20, '+ 1', '2016-05-27 16:06:29', '1', 'Transfer', '0902188012'),
(488, 3, '- 1', '2016-05-27 16:06:49', 'sdafdsa', 'Transfer', 'test15'),
(489, 20, '+ 1', '2016-05-27 16:06:49', 'sdafdsa', 'Transfer', '0902188012'),
(490, 3, '- 1', '2016-05-27 16:07:24', '123', 'Transfer', 'test15'),
(491, 20, '+ 1', '2016-05-27 16:07:24', '123', 'Transfer', '0902188012'),
(492, 3, '- 1', '2016-05-27 16:10:05', '123', 'Transfer', 'test15'),
(493, 20, '+ 1', '2016-05-27 16:10:05', '123', 'Transfer', '0902188012'),
(494, 45, '- 71', '2016-06-06 11:45:56', 'Chuen cho anh hung', 'Transfer', 'doanhnhantre'),
(495, 64, '+ 71', '2016-06-06 11:45:56', 'Chuen cho anh hung', 'Transfer', 'tunglam'),
(496, 45, '- 22', '2016-06-06 11:47:14', 'Chuyen cho anh trung ', 'Transfer', 'Letrung'),
(497, 145, '+ 22', '2016-06-06 11:47:14', 'Chuyen cho anh trung ', 'Transfer', 'tunglam'),
(498, 45, '- 40', '2016-06-06 11:48:26', 'Chuyen cho thien', 'Transfer', 'chithiensg'),
(499, 68, '+ 40', '2016-06-06 11:48:26', 'Chuyen cho thien', 'Transfer', 'tunglam'),
(500, 68, '- 4', '2016-06-06 11:50:25', 'Chuyen pin cho Mr Loi', 'Transfer', 'nguyenloi.lt'),
(501, 182, '+ 4', '2016-06-06 11:50:25', 'Chuyen pin cho Mr Loi', 'Transfer', 'chithiensg'),
(502, 145, '- 2', '2016-06-06 11:51:31', '', 'Transfer', 'letrung1'),
(503, 286, '+ 2', '2016-06-06 11:51:31', '', 'Transfer', 'Letrung'),
(504, 68, '- 4', '2016-06-06 11:51:50', 'Chuyen pin cho Nguyen Viet Tien', 'Transfer', 'tiennguyen'),
(505, 247, '+ 4', '2016-06-06 11:51:50', 'Chuyen pin cho Nguyen Viet Tien', 'Transfer', 'chithiensg'),
(506, 45, '- 20', '2016-06-06 11:53:05', 'Anh Lam chuyen 20 PIN', 'Transfer', 'QuangMinh'),
(507, 61, '+ 20', '2016-06-06 11:53:05', 'Anh Lam chuyen 20 PIN', 'Transfer', 'tunglam'),
(508, 68, '- 4', '2016-06-06 11:53:09', 'Chuyen pin Nguyen Thanh Chinh', 'Transfer', 'thanhchinh'),
(509, 344, '+ 4', '2016-06-06 11:53:10', 'Chuyen pin Nguyen Thanh Chinh', 'Transfer', 'chithiensg'),
(510, 45, '- 130', '2016-06-06 11:53:47', 'Lam chuyen cho anh 130 PIN', 'Transfer', 'ThanhHai'),
(511, 53, '+ 130', '2016-06-06 11:53:48', 'Lam chuyen cho anh 130 PIN', 'Transfer', 'tunglam'),
(512, 68, '- 14', '2016-06-06 11:56:15', 'Chuyen pin cho Nguyen Van Loi', 'Transfer', 'loinguyen'),
(513, 92, '+ 14', '2016-06-06 11:56:15', 'Chuyen pin cho Nguyen Van Loi', 'Transfer', 'chithiensg'),
(514, 145, '- 2', '2016-06-06 11:57:28', '', 'Transfer', 'letrung2'),
(515, 287, '+ 2', '2016-06-06 11:57:29', '', 'Transfer', 'Letrung'),
(516, 45, '- 1', '2016-06-06 15:26:42', '1', 'Transfer', 'truc1987'),
(517, 83, '+ 1', '2016-06-06 15:26:42', '1', 'Transfer', 'tunglam'),
(518, 45, '- 1', '2016-06-08 10:51:31', 'tunglam0976183818', 'Transfer', 'tunglam1'),
(519, 353, '+ 1', '2016-06-08 10:51:31', 'tunglam0976183818', 'Transfer', 'tunglam'),
(520, 45, '- 1', '2016-06-08 10:54:21', '', 'Transfer', 'tunglam2'),
(521, 354, '+ 1', '2016-06-08 10:54:21', '', 'Transfer', 'tunglam');

-- --------------------------------------------------------

--
-- Structure de la table `sm_product`
--

CREATE TABLE IF NOT EXISTS `sm_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- Contenu de la table `sm_product`
--

INSERT INTO `sm_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(28, 'Product 1', '', '', '', '', '', '', '', 939, 7, 'catalog/demo/htc_touch_hd_1.jpg', 5, 1, 100.0000, 200, 9, '2009-02-03', 146.40000000, 2, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, 0, '2009-02-03 16:06:50', '2011-09-30 01:05:39'),
(29, 'Product 2', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/palm_treo_pro_1.jpg', 6, 1, 279.9900, 0, 9, '2009-02-03', 133.00000000, 2, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 0, 1, 0, '2009-02-03 16:42:17', '2011-09-30 01:06:08'),
(30, 'Product 3', '', '', '', '', '', '', '', 7, 6, 'catalog/demo/canon_eos_5d_1.jpg', 9, 1, 100.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, 0, '2009-02-03 16:59:00', '2011-09-30 01:05:23'),
(31, 'Product 4', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/nikon_d300_1.jpg', 0, 1, 80.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 0, 1, 0, '2009-02-03 17:00:10', '2011-09-30 01:06:00'),
(32, 'Product 5', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/ipod_touch_1.jpg', 8, 1, 100.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, 0, '2009-02-03 17:07:26', '2011-09-30 01:07:22'),
(33, 'Product 6', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/samsung_syncmaster_941bw.jpg', 0, 1, 200.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, 0, '2009-02-03 17:08:31', '2011-09-30 01:06:29'),
(34, 'Product 7', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/ipod_shuffle_1.jpg', 8, 1, 100.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, 0, '2009-02-03 18:07:54', '2011-09-30 01:07:17'),
(35, 'Product 8', '', '', '', '', '', '', '', 1000, 5, '', 0, 0, 100.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, 0, '2009-02-03 18:08:31', '2011-09-30 01:06:17'),
(36, 'Product 9', '', '', '', '', '', '', '', 994, 6, 'catalog/demo/ipod_nano_1.jpg', 8, 0, 100.0000, 100, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, 0, '2009-02-03 18:09:19', '2011-09-30 01:07:12'),
(40, 'product 11', '', '', '', '', '', '', '', 970, 5, 'catalog/demo/iphone_1.jpg', 8, 1, 101.0000, 0, 9, '2009-02-03', 10.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, 0, '2009-02-03 21:07:12', '2011-09-30 01:06:53'),
(41, 'Product 14', '', '', '', '', '', '', '', 977, 5, 'catalog/demo/imac_1.jpg', 8, 1, 100.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, 0, '2009-02-03 21:07:26', '2011-09-30 01:06:44'),
(42, 'Product 15', '', '', '', '', '', '', '', 990, 5, 'catalog/demo/apple_cinema_30.jpg', 8, 1, 100.0000, 400, 9, '2009-02-04', 12.50000000, 1, 1.00000000, 2.00000000, 3.00000000, 1, 1, 2, 0, 1, 0, '2009-02-03 21:07:37', '2011-09-30 00:46:19'),
(43, 'Product 16', '', '', '', '', '', '', '', 929, 5, 'catalog/demo/macbook_1.jpg', 8, 0, 500.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, 0, '2009-02-03 21:07:49', '2011-09-30 01:05:46'),
(44, 'Product 17', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/macbook_air_1.jpg', 8, 1, 1000.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:00', '2011-09-30 01:05:53'),
(45, 'Product 18', '', '', '', '', '', '', '', 998, 5, 'catalog/demo/macbook_pro_1.jpg', 8, 1, 2000.0000, 0, 100, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:17', '2011-09-15 22:22:01'),
(46, 'Product 19', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/sony_vaio_1.jpg', 10, 1, 1000.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:29', '2011-09-30 01:06:39'),
(47, 'Product 21', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/hp_1.jpg', 7, 1, 100.0000, 400, 9, '2009-02-03', 1.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 0, 1, 0, 1, 0, '2009-02-03 21:08:40', '2011-09-30 01:05:28'),
(48, 'product 20', 'test 1', '', '', '', '', '', 'test 2', 995, 5, 'catalog/demo/ipod_classic_1.jpg', 8, 1, 100.0000, 0, 9, '2009-02-08', 1.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, 0, '2009-02-08 17:21:51', '2011-09-30 01:07:06'),
(49, 'SAM1', '', '', '', '', '', '', '', 0, 8, 'catalog/demo/samsung_tab_1.jpg', 0, 1, 199.9900, 0, 9, '2011-04-25', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, 0, '2011-04-26 08:57:34', '2011-09-30 01:06:23');

-- --------------------------------------------------------

--
-- Structure de la table `sm_product_attribute`
--

CREATE TABLE IF NOT EXISTS `sm_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sm_product_attribute`
--

INSERT INTO `sm_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(43, 2, 1, '1'),
(47, 4, 1, '16GB'),
(43, 4, 1, '8gb'),
(42, 3, 1, '100mhz'),
(47, 2, 1, '4'),
(43, 2, 2, '1'),
(47, 4, 2, '16GB'),
(43, 4, 2, '8gb'),
(42, 3, 2, '100mhz'),
(47, 2, 2, '4');

-- --------------------------------------------------------

--
-- Structure de la table `sm_product_description`
--

CREATE TABLE IF NOT EXISTS `sm_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sm_product_description`
--

INSERT INTO `sm_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(35, 1, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', '', '', ''),
(48, 1, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', ''),
(40, 1, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', '', '', ''),
(28, 1, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', ''),
(44, 1, 'MacBook Air', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', '', '', ''),
(45, 1, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', ''),
(29, 1, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', ''),
(36, 1, 'iPod Nano', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', ''),
(46, 1, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', '', '', ''),
(47, 1, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', '', '', ''),
(32, 1, 'iPod Touch', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', '', '', ''),
(41, 1, 'iMac', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there&acute;s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife &acute;08, and it&acute;s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', '', '', ''),
(33, 1, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', '', '', ''),
(34, 1, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', ''),
(43, 1, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', ''),
(31, 1, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', ''),
(49, 1, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', '', '', ''),
(42, 1, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there&amp;#39;s no limit to what you can achieve. &lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it&amp;#39;s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple&amp;#39;s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br /&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170&amp;deg; horizontal; 170&amp;deg; vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br /&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br /&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50&amp;deg; to 95&amp;deg; F (10&amp;deg; to 35&amp;deg; C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40&amp;deg; to 116&amp;deg; F (-40&amp;deg; to 47&amp;deg; C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO &amp;#39;03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br /&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', ''),
(30, 1, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon''s press material for the EOS 5D states that it ''defines (a) new D-SLR category'', while we''re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably ''chunkier''). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR''s, an important difference when compared to the latter is that the EOS 5D doesn''t have any environmental seals. While Canon don''t specifically refer to the EOS 5D as a ''professional'' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they''ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', '', '', ''),
(35, 2, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', '', '', ''),
(48, 2, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', ''),
(40, 2, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', '', '', ''),
(28, 2, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', ''),
(44, 2, 'MacBook Air', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', '', '', ''),
(45, 2, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', ''),
(29, 2, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', ''),
(36, 2, 'iPod Nano', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', ''),
(46, 2, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', '', '', ''),
(47, 2, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', '', '', ''),
(32, 2, 'iPod Touch', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', '', '', ''),
(41, 2, 'iMac', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there&acute;s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife &acute;08, and it&acute;s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', '', '', ''),
(33, 2, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', '', '', ''),
(34, 2, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', ''),
(43, 2, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', ''),
(31, 2, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', ''),
(49, 2, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', '', '', '');
INSERT INTO `sm_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(42, 2, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there&amp;#39;s no limit to what you can achieve. &lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it&amp;#39;s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple&amp;#39;s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br /&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170&amp;deg; horizontal; 170&amp;deg; vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br /&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br /&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50&amp;deg; to 95&amp;deg; F (10&amp;deg; to 35&amp;deg; C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40&amp;deg; to 116&amp;deg; F (-40&amp;deg; to 47&amp;deg; C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO &amp;#39;03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br /&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', ''),
(30, 2, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon''s press material for the EOS 5D states that it ''defines (a) new D-SLR category'', while we''re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably ''chunkier''). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR''s, an important difference when compared to the latter is that the EOS 5D doesn''t have any environmental seals. While Canon don''t specifically refer to the EOS 5D as a ''professional'' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they''ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `sm_product_discount`
--

CREATE TABLE IF NOT EXISTS `sm_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=441 ;

--
-- Contenu de la table `sm_product_discount`
--

INSERT INTO `sm_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(440, 42, 1, 30, 1, 66.0000, '0000-00-00', '0000-00-00'),
(439, 42, 1, 20, 1, 77.0000, '0000-00-00', '0000-00-00'),
(438, 42, 1, 10, 1, 88.0000, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `sm_product_filter`
--

CREATE TABLE IF NOT EXISTS `sm_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sm_product_image`
--

CREATE TABLE IF NOT EXISTS `sm_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2352 ;

--
-- Contenu de la table `sm_product_image`
--

INSERT INTO `sm_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2345, 30, 'catalog/demo/canon_eos_5d_2.jpg', 0),
(2321, 47, 'catalog/demo/hp_3.jpg', 0),
(2035, 28, 'catalog/demo/htc_touch_hd_2.jpg', 0),
(2351, 41, 'catalog/demo/imac_3.jpg', 0),
(1982, 40, 'catalog/demo/iphone_6.jpg', 0),
(2001, 36, 'catalog/demo/ipod_nano_5.jpg', 0),
(2000, 36, 'catalog/demo/ipod_nano_4.jpg', 0),
(2005, 34, 'catalog/demo/ipod_shuffle_5.jpg', 0),
(2004, 34, 'catalog/demo/ipod_shuffle_4.jpg', 0),
(2011, 32, 'catalog/demo/ipod_touch_7.jpg', 0),
(2010, 32, 'catalog/demo/ipod_touch_6.jpg', 0),
(2009, 32, 'catalog/demo/ipod_touch_5.jpg', 0),
(1971, 43, 'catalog/demo/macbook_5.jpg', 0),
(1970, 43, 'catalog/demo/macbook_4.jpg', 0),
(1974, 44, 'catalog/demo/macbook_air_4.jpg', 0),
(1973, 44, 'catalog/demo/macbook_air_2.jpg', 0),
(1977, 45, 'catalog/demo/macbook_pro_2.jpg', 0),
(1976, 45, 'catalog/demo/macbook_pro_3.jpg', 0),
(1986, 31, 'catalog/demo/nikon_d300_3.jpg', 0),
(1985, 31, 'catalog/demo/nikon_d300_2.jpg', 0),
(1988, 29, 'catalog/demo/palm_treo_pro_3.jpg', 0),
(1995, 46, 'catalog/demo/sony_vaio_5.jpg', 0),
(1994, 46, 'catalog/demo/sony_vaio_4.jpg', 0),
(1991, 48, 'catalog/demo/ipod_classic_4.jpg', 0),
(1990, 48, 'catalog/demo/ipod_classic_3.jpg', 0),
(1981, 40, 'catalog/demo/iphone_2.jpg', 0),
(1980, 40, 'catalog/demo/iphone_5.jpg', 0),
(2344, 30, 'catalog/demo/canon_eos_5d_3.jpg', 0),
(2320, 47, 'catalog/demo/hp_2.jpg', 0),
(2034, 28, 'catalog/demo/htc_touch_hd_3.jpg', 0),
(2350, 41, 'catalog/demo/imac_2.jpg', 0),
(1979, 40, 'catalog/demo/iphone_3.jpg', 0),
(1978, 40, 'catalog/demo/iphone_4.jpg', 0),
(1989, 48, 'catalog/demo/ipod_classic_2.jpg', 0),
(1999, 36, 'catalog/demo/ipod_nano_2.jpg', 0),
(1998, 36, 'catalog/demo/ipod_nano_3.jpg', 0),
(2003, 34, 'catalog/demo/ipod_shuffle_2.jpg', 0),
(2002, 34, 'catalog/demo/ipod_shuffle_3.jpg', 0),
(2008, 32, 'catalog/demo/ipod_touch_2.jpg', 0),
(2007, 32, 'catalog/demo/ipod_touch_3.jpg', 0),
(2006, 32, 'catalog/demo/ipod_touch_4.jpg', 0),
(1969, 43, 'catalog/demo/macbook_2.jpg', 0),
(1968, 43, 'catalog/demo/macbook_3.jpg', 0),
(1972, 44, 'catalog/demo/macbook_air_3.jpg', 0),
(1975, 45, 'catalog/demo/macbook_pro_4.jpg', 0),
(1984, 31, 'catalog/demo/nikon_d300_4.jpg', 0),
(1983, 31, 'catalog/demo/nikon_d300_5.jpg', 0),
(1987, 29, 'catalog/demo/palm_treo_pro_2.jpg', 0),
(1993, 46, 'catalog/demo/sony_vaio_2.jpg', 0),
(1992, 46, 'catalog/demo/sony_vaio_3.jpg', 0),
(2327, 49, 'catalog/demo/samsung_tab_7.jpg', 0),
(2326, 49, 'catalog/demo/samsung_tab_6.jpg', 0),
(2325, 49, 'catalog/demo/samsung_tab_5.jpg', 0),
(2324, 49, 'catalog/demo/samsung_tab_4.jpg', 0),
(2323, 49, 'catalog/demo/samsung_tab_3.jpg', 0),
(2322, 49, 'catalog/demo/samsung_tab_2.jpg', 0),
(2317, 42, 'catalog/demo/canon_logo.jpg', 0),
(2316, 42, 'catalog/demo/hp_1.jpg', 0),
(2315, 42, 'catalog/demo/compaq_presario.jpg', 0),
(2314, 42, 'catalog/demo/canon_eos_5d_1.jpg', 0),
(2313, 42, 'catalog/demo/canon_eos_5d_2.jpg', 0);

-- --------------------------------------------------------

--
-- Structure de la table `sm_product_option`
--

CREATE TABLE IF NOT EXISTS `sm_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=227 ;

--
-- Contenu de la table `sm_product_option`
--

INSERT INTO `sm_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(224, 35, 11, '', 1),
(225, 47, 12, '2011-04-22', 1),
(223, 42, 2, '', 1),
(217, 42, 5, '', 1),
(209, 42, 6, '', 1),
(218, 42, 1, '', 1),
(208, 42, 4, 'test', 1),
(219, 42, 8, '2011-02-20', 1),
(222, 42, 7, '', 1),
(221, 42, 9, '22:25', 1),
(220, 42, 10, '2011-02-20 22:25', 1),
(226, 30, 5, '', 1);

-- --------------------------------------------------------

--
-- Structure de la table `sm_product_option_value`
--

CREATE TABLE IF NOT EXISTS `sm_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `sm_product_option_value`
--

INSERT INTO `sm_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(1, 217, 42, 5, 41, 100, 0, 1.0000, '+', 0, '+', 1.00000000, '+'),
(6, 218, 42, 1, 31, 146, 1, 20.0000, '+', 2, '-', 20.00000000, '+'),
(7, 218, 42, 1, 43, 300, 1, 30.0000, '+', 3, '+', 30.00000000, '+'),
(5, 218, 42, 1, 32, 96, 1, 10.0000, '+', 1, '+', 10.00000000, '+'),
(4, 217, 42, 5, 39, 92, 1, 4.0000, '+', 0, '+', 4.00000000, '+'),
(2, 217, 42, 5, 42, 200, 1, 2.0000, '+', 0, '+', 2.00000000, '+'),
(3, 217, 42, 5, 40, 300, 0, 3.0000, '+', 0, '+', 3.00000000, '+'),
(8, 223, 42, 2, 23, 48, 1, 10.0000, '+', 0, '+', 10.00000000, '+'),
(10, 223, 42, 2, 44, 2696, 1, 30.0000, '+', 0, '+', 30.00000000, '+'),
(9, 223, 42, 2, 24, 194, 1, 20.0000, '+', 0, '+', 20.00000000, '+'),
(11, 223, 42, 2, 45, 3998, 1, 40.0000, '+', 0, '+', 40.00000000, '+'),
(12, 224, 35, 11, 46, 0, 1, 5.0000, '+', 0, '+', 0.00000000, '+'),
(13, 224, 35, 11, 47, 10, 1, 10.0000, '+', 0, '+', 0.00000000, '+'),
(14, 224, 35, 11, 48, 15, 1, 15.0000, '+', 0, '+', 0.00000000, '+'),
(16, 226, 30, 5, 40, 5, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(15, 226, 30, 5, 39, 2, 1, 0.0000, '+', 0, '+', 0.00000000, '+');

-- --------------------------------------------------------

--
-- Structure de la table `sm_product_recurring`
--

CREATE TABLE IF NOT EXISTS `sm_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sm_product_related`
--

CREATE TABLE IF NOT EXISTS `sm_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sm_product_related`
--

INSERT INTO `sm_product_related` (`product_id`, `related_id`) VALUES
(40, 42),
(41, 42),
(42, 40),
(42, 41);

-- --------------------------------------------------------

--
-- Structure de la table `sm_product_reward`
--

CREATE TABLE IF NOT EXISTS `sm_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=546 ;

--
-- Contenu de la table `sm_product_reward`
--

INSERT INTO `sm_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(515, 42, 1, 100),
(519, 47, 1, 300),
(379, 28, 1, 400),
(329, 43, 1, 600),
(339, 29, 1, 0),
(343, 48, 1, 0),
(335, 40, 1, 0),
(539, 30, 1, 200),
(331, 44, 1, 700),
(333, 45, 1, 800),
(337, 31, 1, 0),
(425, 35, 1, 0),
(345, 33, 1, 0),
(347, 46, 1, 0),
(545, 41, 1, 0),
(351, 36, 1, 0),
(353, 34, 1, 0),
(355, 32, 1, 0),
(521, 49, 1, 1000);

-- --------------------------------------------------------

--
-- Structure de la table `sm_product_special`
--

CREATE TABLE IF NOT EXISTS `sm_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=440 ;

--
-- Contenu de la table `sm_product_special`
--

INSERT INTO `sm_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(419, 42, 1, 1, 90.0000, '0000-00-00', '0000-00-00'),
(439, 30, 1, 2, 90.0000, '0000-00-00', '0000-00-00'),
(438, 30, 1, 1, 80.0000, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `sm_product_to_category`
--

CREATE TABLE IF NOT EXISTS `sm_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sm_product_to_category`
--

INSERT INTO `sm_product_to_category` (`product_id`, `category_id`) VALUES
(28, 20),
(28, 24),
(29, 20),
(29, 24),
(30, 20),
(30, 33),
(31, 33),
(32, 34),
(33, 20),
(33, 28),
(34, 34),
(35, 20),
(36, 34),
(40, 20),
(40, 24),
(41, 27),
(42, 20),
(42, 28),
(43, 18),
(43, 20),
(44, 18),
(44, 20),
(45, 18),
(46, 18),
(46, 20),
(47, 18),
(47, 20),
(48, 20),
(48, 34),
(49, 57);

-- --------------------------------------------------------

--
-- Structure de la table `sm_product_to_download`
--

CREATE TABLE IF NOT EXISTS `sm_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sm_product_to_layout`
--

CREATE TABLE IF NOT EXISTS `sm_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sm_product_to_store`
--

CREATE TABLE IF NOT EXISTS `sm_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sm_product_to_store`
--

INSERT INTO `sm_product_to_store` (`product_id`, `store_id`) VALUES
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0);

-- --------------------------------------------------------

--
-- Structure de la table `sm_profit`
--

CREATE TABLE IF NOT EXISTS `sm_profit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `receive` float NOT NULL,
  `type_profit` int(11) NOT NULL,
  `description` text NOT NULL,
  `from_userid` int(11) NOT NULL,
  `hp_from_ctp` tinyint(1) DEFAULT '0',
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `date` int(11) NOT NULL,
  `date_hpdk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100 ;

--
-- Contenu de la table `sm_profit`
--

INSERT INTO `sm_profit` (`id`, `user_id`, `receive`, `type_profit`, `description`, `from_userid`, `hp_from_ctp`, `month`, `year`, `date`, `date_hpdk`) VALUES
(1, 1, 1500000, 1, 'Đóng hội phí lần 1', 1, 0, 3, 2016, 1458950400, NULL),
(2, 2, 1500000, 1, 'Đóng hội phí lần 1', 2, 0, 3, 2016, 1456876800, NULL),
(3, 1, 1000000, 2, 'công tác phí tháng 03 năm:2016', 2, 0, NULL, NULL, 1458950400, NULL),
(4, 3, 1500000, 1, 'Đóng hội phí lần 1', 3, 0, 3, 2016, 1456876800, NULL),
(5, 1, 1000000, 2, 'công tác phí tháng 03 năm:2016', 3, 0, NULL, NULL, 1458950400, NULL),
(6, 4, 1500000, 1, 'Đóng hội phí lần 1', 4, 0, 3, 2016, 1458950400, NULL),
(7, 2, 1000000, 2, 'công tác phí tháng 03 năm:2016', 4, 0, NULL, NULL, 1458950400, NULL),
(8, 1, 1000000, 2, 'công tác phí tháng 03 năm:2016', 4, 0, NULL, NULL, 1458950400, NULL),
(9, 5, 1500000, 1, 'Đóng hội phí lần 1', 5, 0, 3, 2016, 1456963200, NULL),
(10, 2, 1000000, 2, 'công tác phí tháng 03 năm:2016', 5, 0, NULL, NULL, 1458950400, NULL),
(11, 1, 1000000, 2, 'công tác phí tháng 03 năm:2016', 5, 0, NULL, NULL, 1458950400, NULL),
(12, 6, 1500000, 1, 'Đóng hội phí lần 1', 6, 0, 3, 2016, 1456963200, NULL),
(13, 3, 1000000, 2, 'công tác phí tháng 03 năm:2016', 6, 0, NULL, NULL, 1458950400, NULL),
(14, 1, 1000000, 2, 'công tác phí tháng 03 năm:2016', 6, 0, NULL, NULL, 1458950400, NULL),
(15, 7, 1500000, 1, 'Đóng hội phí lần 1', 7, 0, 3, 2016, 1456963200, NULL),
(16, 3, 1000000, 2, 'công tác phí tháng 03 năm:2016', 7, 0, NULL, NULL, 1458950400, NULL),
(17, 1, 1000000, 2, 'công tác phí tháng 03 năm:2016', 7, 0, NULL, NULL, 1458950400, NULL),
(18, 8, 1500000, 1, 'Đóng hội phí lần 1', 8, 0, 3, 2016, 1457049600, NULL),
(19, 6, 1000000, 2, 'công tác phí tháng 03 năm:2016', 8, 0, NULL, NULL, 1458950400, NULL),
(20, 3, 1000000, 2, 'công tác phí tháng 03 năm:2016', 8, 0, NULL, NULL, 1458950400, NULL),
(21, 1, 1000000, 2, 'công tác phí tháng 03 năm:2016', 8, 0, NULL, NULL, 1458950400, NULL),
(22, 9, 1500000, 1, 'Đóng hội phí lần 1', 9, 0, 3, 2016, 1457049600, NULL),
(23, 6, 1000000, 2, 'công tác phí tháng 03 năm:2016', 9, 0, NULL, NULL, 1458950400, NULL),
(24, 3, 1000000, 2, 'công tác phí tháng 03 năm:2016', 9, 0, NULL, NULL, 1458950400, NULL),
(25, 1, 1000000, 2, 'công tác phí tháng 03 năm:2016', 9, 0, NULL, NULL, 1458950400, NULL),
(26, 10, 1500000, 1, 'Đóng hội phí lần 1', 10, 0, 3, 2016, 1457136000, NULL),
(27, 8, 1000000, 2, 'công tác phí tháng 03 năm:2016', 10, 0, NULL, NULL, 1458950400, NULL),
(28, 6, 1000000, 2, 'công tác phí tháng 03 năm:2016', 10, 0, NULL, NULL, 1458950400, NULL),
(29, 3, 1000000, 2, 'công tác phí tháng 03 năm:2016', 10, 0, NULL, NULL, 1458950400, NULL),
(30, 1, 1000000, 2, 'công tác phí tháng 03 năm:2016', 10, 0, NULL, NULL, 1458950400, NULL),
(31, 11, 1500000, 1, 'Đóng hội phí lần 1', 11, 0, 3, 2016, 1457136000, NULL),
(32, 8, 1000000, 2, 'công tác phí tháng 03 năm:2016', 11, 0, NULL, NULL, 1458950400, NULL),
(33, 6, 1000000, 2, 'công tác phí tháng 03 năm:2016', 11, 0, NULL, NULL, 1458950400, NULL),
(34, 3, 1000000, 2, 'công tác phí tháng 03 năm:2016', 11, 0, NULL, NULL, 1458950400, NULL),
(35, 1, 1000000, 2, 'công tác phí tháng 03 năm:2016', 11, 0, NULL, NULL, 1458950400, NULL),
(36, 12, 1500000, 1, 'Đóng hội phí lần 1', 12, 0, 3, 2016, 1457222400, NULL),
(37, 5, 1000000, 2, 'công tác phí tháng 03 năm:2016', 12, 0, NULL, NULL, 1458950400, NULL),
(38, 2, 1000000, 2, 'công tác phí tháng 03 năm:2016', 12, 0, NULL, NULL, 1458950400, NULL),
(39, 1, 1000000, 2, 'công tác phí tháng 03 năm:2016', 12, 0, NULL, NULL, 1458950400, NULL),
(40, 13, 1500000, 1, 'Đóng hội phí lần 1', 13, 0, 3, 2016, 1457308800, NULL),
(41, 5, 1000000, 2, 'công tác phí tháng 03 năm:2016', 13, 0, NULL, NULL, 1458950400, NULL),
(42, 2, 1000000, 2, 'công tác phí tháng 03 năm:2016', 13, 0, NULL, NULL, 1458950400, NULL),
(43, 1, 1000000, 2, 'công tác phí tháng 03 năm:2016', 13, 0, NULL, NULL, 1458950400, NULL),
(44, 14, 1500000, 1, 'Đóng hội phí lần 1', 14, 0, 3, 2016, 1457481600, NULL),
(45, 10, 1000000, 2, 'công tác phí tháng 03 năm:2016', 14, 0, NULL, NULL, 1459036800, NULL),
(46, 8, 1000000, 2, 'công tác phí tháng 03 năm:2016', 14, 0, NULL, NULL, 1459036800, NULL),
(47, 6, 1000000, 2, 'công tác phí tháng 03 năm:2016', 14, 0, NULL, NULL, 1459036800, NULL),
(48, 3, 1000000, 2, 'công tác phí tháng 03 năm:2016', 14, 0, NULL, NULL, 1459036800, NULL),
(57, 12, 1000000, 2, 'công tác phí tháng 04 năm:2016', 16, 0, NULL, NULL, 1459814400, NULL),
(50, 15, 1500000, 1, 'Đóng hội phí lần 1', 15, 0, 3, 2016, 1457481600, NULL),
(51, 11, 1000000, 2, 'công tác phí tháng 03 năm:2016', 15, 0, NULL, NULL, 1459036800, NULL),
(52, 8, 1000000, 2, 'công tác phí tháng 03 năm:2016', 15, 0, NULL, NULL, 1459036800, NULL),
(53, 6, 1000000, 2, 'công tác phí tháng 03 năm:2016', 15, 0, NULL, NULL, 1459036800, NULL),
(54, 3, 1000000, 2, 'công tác phí tháng 03 năm:2016', 15, 0, NULL, NULL, 1459036800, NULL),
(56, 16, 1500000, 1, 'Đóng hội phí lần 1', 16, 0, 4, 2016, 1459814400, NULL),
(58, 5, 1000000, 2, 'công tác phí tháng 04 năm:2016', 16, 0, NULL, NULL, 1459814400, NULL),
(59, 2, 1000000, 2, 'công tác phí tháng 04 năm:2016', 16, 0, NULL, NULL, 1459814400, NULL),
(60, 1, 1000000, 2, 'công tác phí tháng 04 năm:2016', 16, 0, NULL, NULL, 1459814400, NULL),
(61, 2, 1500000, 1, 'Đóng hội phí lần 2', 2, 0, 4, 2016, 1459814400, NULL),
(62, 3, 1500000, 1, 'Đóng hội phí lần 2', 3, 0, 4, 2016, 1459814400, NULL),
(63, 9, 1500000, 1, 'Đóng hội phí lần 2', 9, 0, 4, 2016, 1459814400, NULL),
(64, 6, 1500000, 1, 'Đóng hội phí lần 2', 6, 0, 4, 2016, 1459814400, NULL),
(65, 8, 1500000, 1, 'Đóng hội phí lần 2', 8, 0, 4, 2016, 1459814400, NULL),
(66, 14, 1500000, 1, 'Đóng hội phí lần 2', 14, 0, 4, 2016, 1459814400, NULL),
(67, 15, 1500000, 1, 'Đóng hội phí lần 2', 15, 0, 4, 2016, 1459814400, NULL),
(68, 1, 0, 2, '', 15, 0, 0, NULL, 1457481600, NULL),
(69, 1, 0, 2, '', 14, 0, 0, NULL, 1457481600, NULL),
(70, 4, 1500000, 1, 'Đóng hội phí lần 2', 4, 0, 4, 2016, 1459900800, NULL),
(71, 1, 1500000, 1, 'Đóng hội phí lần 2', 1, 0, 4, 2016, 1459900800, NULL),
(72, 7, 1500000, 1, 'Đóng hội phí lần 2', 7, 0, 4, 2016, 1459900800, NULL),
(73, 11, 1500000, 1, 'Đóng hội phí lần 2', 11, 0, 4, 2016, 1459900800, NULL),
(74, 10, 1500000, 1, 'Đóng hội phí lần 2', 10, 0, 4, 2016, 1459900800, NULL),
(75, 5, 1500000, 1, 'Đóng hội phí lần 2', 5, 0, 4, 2016, 1459900800, NULL),
(76, 12, 1500000, 1, 'Đóng hội phí lần 2', 12, 0, 4, 2016, 1459900800, NULL),
(93, 5, 1500000, 1, 'Đóng hội phí lần 3', 5, 1, 5, 2016, 1460412000, 1459375200),
(92, 3, 1500000, 1, 'Đóng hội phí lần 3', 3, 1, 5, 2016, 1460412000, 1459375200),
(91, 2, 1500000, 1, 'Đóng hội phí lần 3', 2, 1, 5, 2016, 1460412000, 1459375200),
(90, 1, 1500000, 1, 'Đóng hội phí lần 4', 1, 1, 6, 2016, 1460412001, 1459375200),
(89, 1, 1500000, 1, 'Đóng hội phí lần 3', 1, 1, 5, 2016, 1460412000, 1459375200),
(84, 17, 1500000, 1, 'Đóng hội phí lần 1', 17, 0, 4, 2016, 1460851200, NULL),
(85, 12, 1000000, 2, 'công tác phí tháng 04 năm:2016', 17, 0, NULL, NULL, 1460851200, NULL),
(86, 5, 1000000, 2, 'công tác phí tháng 04 năm:2016', 17, 0, NULL, NULL, 1460851200, NULL),
(87, 2, 1000000, 2, 'công tác phí tháng 04 năm:2016', 17, 0, NULL, NULL, 1460851200, NULL),
(88, 1, 1000000, 2, 'công tác phí tháng 04 năm:2016', 17, 0, NULL, NULL, 1460851200, NULL),
(94, 6, 1500000, 1, 'Đóng hội phí lần 3', 6, 1, 5, 2016, 1460412000, 1459375200),
(95, 8, 1500000, 1, 'Đóng hội phí lần 3', 8, 1, 5, 2016, 1460412000, 1459375200),
(96, 18, 1500000, 1, 'Đóng hội phí lần 1', 18, 0, 5, 2016, 1463097600, NULL),
(97, 4, 1000000, 2, 'công tác phí tháng 05 năm:2016', 18, 0, NULL, NULL, 1463097600, NULL),
(98, 2, 1000000, 2, 'công tác phí tháng 05 năm:2016', 18, 0, NULL, NULL, 1463097600, NULL),
(99, 1, 1000000, 2, 'công tác phí tháng 05 năm:2016', 18, 0, NULL, NULL, 1463097600, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `sm_recurring`
--

CREATE TABLE IF NOT EXISTS `sm_recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_recurring_description`
--

CREATE TABLE IF NOT EXISTS `sm_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sm_return`
--

CREATE TABLE IF NOT EXISTS `sm_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_return_action`
--

CREATE TABLE IF NOT EXISTS `sm_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `sm_return_action`
--

INSERT INTO `sm_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent'),
(1, 2, 'Refunded'),
(2, 2, 'Credit Issued'),
(3, 2, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Structure de la table `sm_return_history`
--

CREATE TABLE IF NOT EXISTS `sm_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_return_reason`
--

CREATE TABLE IF NOT EXISTS `sm_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `sm_return_reason`
--

INSERT INTO `sm_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details'),
(1, 2, 'Dead On Arrival'),
(2, 2, 'Received Wrong Item'),
(3, 2, 'Order Error'),
(4, 2, 'Faulty, please supply details'),
(5, 2, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Structure de la table `sm_return_status`
--

CREATE TABLE IF NOT EXISTS `sm_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `sm_return_status`
--

INSERT INTO `sm_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products'),
(1, 2, 'Pending'),
(3, 2, 'Complete'),
(2, 2, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Structure de la table `sm_review`
--

CREATE TABLE IF NOT EXISTS `sm_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_setting`
--

CREATE TABLE IF NOT EXISTS `sm_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10346 ;

--
-- Contenu de la table `sm_setting`
--

INSERT INTO `sm_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(34, 0, 'flat', 'flat_sort_order', '1', 0),
(35, 0, 'flat', 'flat_status', '1', 0),
(36, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(37, 0, 'flat', 'flat_tax_class_id', '9', 0),
(41, 0, 'flat', 'flat_cost', '5.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(146, 0, 'category', 'category_status', '1', 0),
(159, 0, 'affiliate', 'affiliate_status', '1', 0),
(4210, 0, 'simple_blog', 'simple_blog_module', 'a:1:{s:16:"58e5exdzbdb73nmi";a:4:{s:13:"article_limit";s:1:"1";s:11:"category_id";s:1:"2";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(94, 0, 'voucher', 'voucher_sort_order', '8', 0),
(95, 0, 'voucher', 'voucher_status', '1', 0),
(103, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(104, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(4207, 0, 'simple_blog', 'simple_blog_author_information', '1', 0),
(4208, 0, 'simple_blog', 'simple_blog_related_articles', '1', 0),
(4209, 0, 'simple_blog', 'simple_blog_share_social_site', '1', 0),
(520, 0, 'news', 'news_status', '1', 0),
(4206, 0, 'simple_blog', 'simple_blog_comment_auto_approval', '1', 0),
(4205, 0, 'simple_blog', 'simple_blog_display_category', '1', 0),
(4204, 0, 'simple_blog', 'simple_blog_comment_related_heading', '', 0),
(4203, 0, 'simple_blog', 'simple_blog_product_related_heading', '', 0),
(4202, 0, 'simple_blog', 'simple_blog_heading', '', 0),
(4201, 0, 'simple_blog', 'simple_blog_footer_heading', '', 0),
(4200, 0, 'simple_blog', 'simple_blog_seo_keyword', '', 0),
(4199, 0, 'simple_blog', 'simple_blog_status', '1', 0),
(796, 0, 'simple_blog_category', 'simple_blog_category_module', 'a:2:{s:15:"g5ib2kt4276i529";a:2:{s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}s:16:"icyjjgkoy7bbuik9";a:2:{s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(794, 0, 'simple_blog_category', 'simple_blog_category_status', '1', 0),
(795, 0, 'simple_blog_category', 'simple_blog_category_search_article', '1', 0),
(10333, 0, 'config', 'config_donghoiphitruoc4', '20000000', 0),
(10334, 0, 'config', 'config_donghoiphitruoc5', '24000000', 0),
(10332, 0, 'config', 'config_donghoiphitruoc3', '16000000', 0),
(10329, 0, 'config', 'config_congtacphi', '1000000', 0),
(10330, 0, 'config', 'config_donghoiphitruoc1', '2000000', 0),
(10331, 0, 'config', 'config_donghoiphitruoc2', '10000000', 0),
(10328, 0, 'config', 'config_ngaydongphi', '11', 0),
(10327, 0, 'config', 'config_hoiphi', '1500000', 0),
(10323, 0, 'config', 'config_google_analytics_status', '0', 0),
(10324, 0, 'config', 'config_google_captcha_public', '', 0),
(10325, 0, 'config', 'config_google_captcha_secret', '', 0),
(10326, 0, 'config', 'config_google_captcha_status', '0', 0),
(10311, 0, 'config', 'config_seo_url', '0', 0),
(10312, 0, 'config', 'config_file_max_size', '300000', 0),
(10313, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(10314, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(10315, 0, 'config', 'config_maintenance', '0', 0),
(10316, 0, 'config', 'config_password', '1', 0),
(10317, 0, 'config', 'config_encryption', '743c2015d8ee799740c31cab88e70e14', 0),
(10318, 0, 'config', 'config_compression', '0', 0),
(10319, 0, 'config', 'config_error_display', '1', 0),
(10320, 0, 'config', 'config_error_log', '1', 0),
(10321, 0, 'config', 'config_error_filename', 'error.log', 0),
(10322, 0, 'config', 'config_google_analytics', 'Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;Đăng nhập của bạn &lt;a onclick=&quot;window.open(''http://www.google.com/analytics/'');&quot;&gt;&lt;u&gt;Google Analytics&lt;/u&gt;&lt;/a&gt; tài khoản và sau khi tạo bản sao hồ sơ web site của bạn và dán mã phân tích vào lĩnh vực này.&lt;/span&gt;&quot; id=&quot;input-google-analytics&quot; class=&quot;form-control&quot;&gt;', 0),
(10310, 0, 'config', 'config_robots', 'A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;A list of web crawler user agents that shared sessions will not be used with. Use separate lines for each user agent.&lt;/span&gt;&quot; id=&quot;input-robots&quot; class=&quot;form-control&quot;&gt;abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(10309, 0, 'config', 'config_shared', '0', 0),
(10308, 0, 'config', 'config_secure', '1', 0),
(10307, 0, 'config', 'config_mail_alert', '', 0),
(10306, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(10305, 0, 'config', 'config_mail_smtp_port', '465', 0),
(10304, 0, 'config', 'config_mail_smtp_password', 'admin@tungnguyen', 0),
(10303, 0, 'config', 'config_mail_smtp_username', 'tungnguyenicsc@gmail.com', 0),
(10302, 0, 'config', 'config_mail_smtp_hostname', 'ssl://smtp.gmail.com', 0),
(10298, 0, 'config', 'config_ftp_root', '', 0),
(10301, 0, 'config', 'config_mail_parameter', 'tungnguyenicsc@gmail.com', 0),
(10300, 0, 'config', 'config_mail_protocol', 'smtp', 0),
(10299, 0, 'config', 'config_ftp_status', '0', 0),
(10295, 0, 'config', 'config_ftp_port', '21', 0),
(10296, 0, 'config', 'config_ftp_username', '', 0),
(10297, 0, 'config', 'config_ftp_password', '', 0),
(10294, 0, 'config', 'config_ftp_hostname', 'localhost', 0),
(10293, 0, 'config', 'config_image_location_height', '50', 0),
(10292, 0, 'config', 'config_image_location_width', '268', 0),
(10291, 0, 'config', 'config_image_cart_height', '47', 0),
(10290, 0, 'config', 'config_image_cart_width', '47', 0),
(10289, 0, 'config', 'config_image_wishlist_height', '47', 0),
(10287, 0, 'config', 'config_image_compare_height', '90', 0),
(10288, 0, 'config', 'config_image_wishlist_width', '47', 0),
(10286, 0, 'config', 'config_image_compare_width', '90', 0),
(10285, 0, 'config', 'config_image_related_height', '80', 0),
(10284, 0, 'config', 'config_image_related_width', '80', 0),
(10283, 0, 'config', 'config_image_additional_height', '74', 0),
(10282, 0, 'config', 'config_image_additional_width', '74', 0),
(10281, 0, 'config', 'config_image_product_height', '228', 0),
(10280, 0, 'config', 'config_image_product_width', '228', 0),
(10279, 0, 'config', 'config_image_popup_height', '500', 0),
(10278, 0, 'config', 'config_image_popup_width', '500', 0),
(10277, 0, 'config', 'config_image_thumb_height', '228', 0),
(10276, 0, 'config', 'config_image_thumb_width', '228', 0),
(10275, 0, 'config', 'config_image_category_height', '80', 0),
(10274, 0, 'config', 'config_image_category_width', '80', 0),
(10273, 0, 'config', 'config_icon', 'catalog/logo.png', 0),
(10272, 0, 'config', 'config_logo', 'catalog/logo.png', 0),
(10270, 0, 'config', 'config_return_id', '0', 0),
(10271, 0, 'config', 'config_return_status_id', '2', 0),
(10269, 0, 'config', 'config_affiliate_mail', '0', 0),
(10268, 0, 'config', 'config_affiliate_id', '0', 0),
(10267, 0, 'config', 'config_affiliate_commission', '5', 0),
(10266, 0, 'config', 'config_affiliate_auto', '0', 0),
(10265, 0, 'config', 'config_affiliate_approval', '0', 0),
(10261, 0, 'config', 'config_order_mail', '0', 0),
(10262, 0, 'config', 'config_stock_display', '0', 0),
(10263, 0, 'config', 'config_stock_warning', '0', 0),
(10264, 0, 'config', 'config_stock_checkout', '0', 0),
(10260, 0, 'config', 'config_complete_status', 'a:1:{i:0;s:1:"5";}', 1),
(10258, 0, 'config', 'config_order_status_id', '1', 0),
(10259, 0, 'config', 'config_processing_status', 'a:1:{i:0;s:1:"2";}', 1),
(10257, 0, 'config', 'config_checkout_id', '0', 0),
(10256, 0, 'config', 'config_checkout_guest', '1', 0),
(10254, 0, 'config', 'config_api_id', '1', 0),
(10255, 0, 'config', 'config_cart_weight', '1', 0),
(10253, 0, 'config', 'config_invoice_prefix', 'INV-2013-00', 0),
(10252, 0, 'config', 'config_account_mail', '0', 0),
(10251, 0, 'config', 'config_account_id', '0', 0),
(10250, 0, 'config', 'config_login_attempts', '5', 0),
(10249, 0, 'config', 'config_customer_price', '0', 0),
(10248, 0, 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:"1";}', 1),
(10247, 0, 'config', 'config_customer_group_id', '1', 0),
(10245, 0, 'config', 'config_tax_customer', 'shipping', 0),
(10246, 0, 'config', 'config_customer_online', '0', 0),
(10244, 0, 'config', 'config_tax_default', 'shipping', 0),
(10243, 0, 'config', 'config_tax', '1', 0),
(10242, 0, 'config', 'config_voucher_max', '1000', 0),
(10241, 0, 'config', 'config_voucher_min', '1', 0),
(10237, 0, 'config', 'config_limit_admin', '20', 0),
(10240, 0, 'config', 'config_review_mail', '0', 0),
(10239, 0, 'config', 'config_review_guest', '1', 0),
(10238, 0, 'config', 'config_review_status', '1', 0),
(10236, 0, 'config', 'config_product_description_length', '100', 0),
(10235, 0, 'config', 'config_product_limit', '15', 0),
(10234, 0, 'config', 'config_product_count', '1', 0),
(10232, 0, 'config', 'config_length_class_id', '1', 0),
(10233, 0, 'config', 'config_weight_class_id', '1', 0),
(10230, 0, 'config', 'config_currency', 'USD', 0),
(10231, 0, 'config', 'config_currency_auto', '0', 0),
(10229, 0, 'config', 'config_admin_language', 'vi', 0),
(10228, 0, 'config', 'config_language', 'vi', 0),
(10227, 0, 'config', 'config_zone_id', '', 0),
(10226, 0, 'config', 'config_country_id', '230', 0),
(10225, 0, 'config', 'config_layout_id', '1', 0),
(10224, 0, 'config', 'config_template', 'default', 0),
(10223, 0, 'config', 'config_meta_keyword', 'Hội viên', 0),
(10222, 0, 'config', 'config_meta_description', 'Hội viên', 0),
(10221, 0, 'config', 'config_meta_title', 'Hội viên', 0),
(10220, 0, 'config', 'config_comment', '', 0),
(10219, 0, 'config', 'config_open', '', 0),
(10218, 0, 'config', 'config_image', 'catalog/logo.png', 0),
(10217, 0, 'config', 'config_fax', '', 0),
(10216, 0, 'config', 'config_googleplus', 'Google plus', 0),
(10215, 0, 'config', 'config_flickr', 'Flickr', 0),
(10213, 0, 'config', 'config_twitter', 'Twitter', 0),
(10214, 0, 'config', 'config_instagram', 'Instagram', 0),
(10211, 0, 'config', 'config_skype', 'Skype', 0),
(10212, 0, 'config', 'config_facebook', 'Facebook', 0),
(10209, 0, 'config', 'config_telephone', '(08)123456', 0),
(10210, 0, 'config', 'config_zalo', 'zalo', 0),
(10208, 0, 'config', 'config_email', 'info@nguyen.com', 0),
(10207, 0, 'config', 'config_geocode', '', 0),
(10206, 0, 'config', 'config_address', 'Địa chỉ công ty\r\n', 0),
(10205, 0, 'config', 'config_owner', 'PHẦN MỀM QUẢN LÝ HỘI VIÊN', 0),
(10204, 0, 'config', 'config_name', 'PHẦN MỀM QUẢN LÝ HỘI VIÊN', 0),
(10335, 0, 'config', 'config_donghoiphitruoc6', '27000000', 0),
(10336, 0, 'config', 'config_donghoiphitruoc7', '30000000', 0),
(10337, 0, 'config', 'config_donghoiphitruoc8', '33000000', 0),
(10338, 0, 'config', 'config_donghoiphitruoc10', '36000000', 0),
(10339, 0, 'config', 'config_tangthang1', '4', 0),
(10340, 0, 'config', 'config_tangthang2', '8', 0),
(10341, 0, 'config', 'config_tangthang3', '11', 0),
(10343, 0, 'config', 'config_pd_profit', '40', 0),
(10344, 0, 'config', 'config_wallet', '1838Hr9k8sbsxsuAxrRfHUEdMeuDmJxxpB', 0),
(10345, 0, 'config', 'config_email_received', 'phucnguyen@icsc.vn', 0);

-- --------------------------------------------------------

--
-- Structure de la table `sm_simple_blog_article`
--

CREATE TABLE IF NOT EXISTS `sm_simple_blog_article` (
  `simple_blog_article_id` int(16) NOT NULL AUTO_INCREMENT,
  `simple_blog_author_id` int(16) NOT NULL,
  `allow_comment` tinyint(1) NOT NULL,
  `image` text CHARACTER SET utf8 NOT NULL,
  `featured_image` text CHARACTER SET utf8 NOT NULL,
  `article_related_method` varchar(64) CHARACTER SET utf8 NOT NULL,
  `article_related_option` text CHARACTER SET utf8 NOT NULL,
  `sort_order` int(8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`simple_blog_article_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Contenu de la table `sm_simple_blog_article`
--

INSERT INTO `sm_simple_blog_article` (`simple_blog_article_id`, `simple_blog_author_id`, `allow_comment`, `image`, `featured_image`, `article_related_method`, `article_related_option`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(4, 1, 0, '', 'catalog/5f.png', '', '', 1, 1, '2015-11-07 07:29:07', '2015-12-01 11:52:58'),
(5, 1, 0, '', 'catalog/5f.png', 'product_wise', '', 2, 1, '2015-11-07 07:30:17', '2015-11-11 09:50:47'),
(6, 1, 0, '', 'catalog/5f.png', 'product_wise', '', 3, 1, '2015-11-07 07:31:30', '2015-11-11 09:50:56'),
(7, 1, 0, '', 'catalog/5f.png', 'product_wise', '', 4, 1, '2015-11-07 07:32:15', '2015-11-11 09:51:04'),
(41, 1, 0, '', 'catalog/news/entre500-6186-1455215211.jpg', '', '', 0, 1, '2016-02-16 11:52:54', '2016-02-16 11:52:54'),
(40, 1, 0, '', 'catalog/news/a-tb-4-kenh-bat-dong-san-day-t-3957-7022-1455081761.jpg', '', '', 0, 1, '2016-02-16 11:34:12', '2016-02-16 11:34:12');

-- --------------------------------------------------------

--
-- Structure de la table `sm_simple_blog_article_description`
--

CREATE TABLE IF NOT EXISTS `sm_simple_blog_article_description` (
  `simple_blog_article_description_id` int(16) NOT NULL AUTO_INCREMENT,
  `simple_blog_article_id` int(16) NOT NULL,
  `language_id` int(16) NOT NULL,
  `article_title` varchar(256) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `meta_description` varchar(256) CHARACTER SET utf8 NOT NULL,
  `meta_keyword` varchar(256) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`simple_blog_article_description_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=279 ;

--
-- Contenu de la table `sm_simple_blog_article_description`
--

INSERT INTO `sm_simple_blog_article_description` (`simple_blog_article_description_id`, `simple_blog_article_id`, `language_id`, `article_title`, `description`, `meta_description`, `meta_keyword`) VALUES
(41, 5, 1, 'Cơ cấu tổ chức', '&lt;p&gt;&lt;span style=&quot;color: rgb(4, 75, 165); font-family: Verdana, Arial, sans-serif; font-size: 16px; font-weight: bold; line-height: 22.3999996185303px;&quot;&gt;Cơ cấu tổ chức&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(42, 5, 2, 'Cơ cấu tổ chức', '&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; font-family: Verdana, Arial, sans-serif; line-height: 22.3999996185303px; color: rgb(0, 0, 0); background: transparent;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; background: transparent;&quot;&gt;- Hội đồng quản trị&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; font-family: Verdana, Arial, sans-serif; line-height: 22.3999996185303px; color: rgb(0, 0, 0); background: transparent;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; background: transparent;&quot;&gt;- Ban Giám đốc&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; font-family: Verdana, Arial, sans-serif; line-height: 22.3999996185303px; color: rgb(0, 0, 0); background: transparent;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; background: transparent;&quot;&gt;- Ban hoạch định chiến lược - Marketing&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; font-family: Verdana, Arial, sans-serif; line-height: 22.3999996185303px; color: rgb(0, 0, 0); background: transparent;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; background: transparent;&quot;&gt;- Ban Xúc tiến Đầu tư&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; font-family: Verdana, Arial, sans-serif; line-height: 22.3999996185303px; color: rgb(0, 0, 0); background: transparent;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; background: transparent;&quot;&gt;- Bộ phận Hành chính - Kế toán&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; font-family: Verdana, Arial, sans-serif; line-height: 22.3999996185303px; color: rgb(0, 0, 0); background: transparent;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; background: transparent;&quot;&gt;- Các bộ phận thực hiện dự án&lt;/strong&gt;&lt;/p&gt;', '', ''),
(43, 6, 1, 'Ban lãnh đạo', '&lt;p&gt;&lt;span style=&quot;color: rgb(4, 75, 165); font-family: Verdana, Arial, sans-serif; font-size: 16px; font-weight: bold; line-height: 22.3999996185303px;&quot;&gt;Ban lãnh đạo&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(44, 6, 2, 'Ban lãnh đạo', '&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; font-family: Verdana, Arial, sans-serif; line-height: 22.3999996185303px; color: rgb(0, 0, 0); text-align: center; background: transparent;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; background: transparent;&quot;&gt;BAN LÃNH ĐẠO&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; font-family: Verdana, Arial, sans-serif; line-height: 22.3999996185303px; color: rgb(0, 0, 0); text-align: center; background: transparent;&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; font-family: Verdana, Arial, sans-serif; list-style: none; color: rgb(0, 0, 0); line-height: 22.3999996185303px; background: transparent;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; background: transparent;&quot;&gt;Chủ tịch hội đồng quản trị&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; background: transparent;&quot;&gt;Tổng giám đốc&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; background: transparent;&quot;&gt;Giám đốc phát triển dự án&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; background: transparent;&quot;&gt;Giám đốc marketing&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; background: transparent;&quot;&gt;Giám đốc nhân sự&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; background: transparent;&quot;&gt;Giám đốc đối ngoại&lt;/li&gt;&lt;/ul&gt;', '', ''),
(45, 7, 1, 'Đối tác chiến lược', '&lt;p&gt;Đối tác chiến lược&lt;br&gt;&lt;/p&gt;', '', ''),
(46, 7, 2, 'Đối tác chiến lược', '&lt;p&gt;Đối tác chiến lược&lt;br&gt;&lt;/p&gt;', '', ''),
(112, 4, 2, 'Giới thiệu chung', '&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 12.8000001907349px; vertical-align: baseline; font-family: Verdana, Arial, sans-serif; line-height: 22.3999996185303px; color: rgb(0, 0, 0); text-align: justify; background: transparent;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; font-family: tahoma, arial; background: transparent;&quot;&gt;Công ty cổ phần tư vấn và quản lý Đầu tư 5F Capital (tên giao dịch 5F Capital JSC) được thành lập ngày 10/7/2015 theo giấy phép kinh doanh số 0313344224 do Sở Kế hoạch Đầu tư Tphcm cấp, vốn điều lệ 377.000.000.000 (BA TRĂM BẢY MƯƠI BẢY TỶ ĐỒNG). Chúng tôi hoạt động trong lĩnh vực đầu tư bất động sản cao cấp, kinh doanh dịch vụ khách sạn, resort du lịch, tư vấn, quản lý quỹ tài chính, tư vấn &amp;nbsp;hỗ trợ chiến lược đầu tư &amp;nbsp;cho khách hàng&amp;nbsp;vào các dự án tiềm năng.&lt;/span&gt;&lt;/p&gt;&lt;div style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; font-family: Tahoma, Arial; color: rgb(0, 0, 0); line-height: 20px; background: transparent;&quot;&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; font-family: Verdana, Arial, sans-serif; line-height: 24.5px; background: transparent;&quot;&gt;&lt;br&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent;&quot;&gt;Sứ mệnh&lt;/strong&gt;&lt;br&gt;&lt;br&gt;Mang đến cuộc sống hoàn hảo cho mỗi cá nhân và cộng đồng.&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; font-family: Verdana, Arial, sans-serif; line-height: 24.5px; background: transparent;&quot;&gt;&lt;br&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent;&quot;&gt;Tầm nhìn&lt;/strong&gt;&lt;br&gt;&lt;br&gt;Trở thành một tổ chức tiên phong trong việc kết hợp sáng tạo các công cụ tài chính, đào tạo và công nghệ nhằm tạo ra những giá trị mới, ưu việt và bền vững cho xã hội.&lt;/p&gt;&lt;/div&gt;', '', ''),
(111, 4, 1, 'Giới thiệu chung', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial; font-size: 14px; line-height: 22.3999996185303px; text-align: justify;&quot;&gt;Công ty tư vấn và quản lý Đầu tư 5F Capital (tên giao dịch 5F Capital Co. LTD) được thành lập ngày 10/7/2015 theo giấy phép kinh doanh số 0313344224&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(278, 41, 2, '8 thách thức lớn với doanh nhân khởi nghiệp', '&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Nếu bạn vừa bắt đầu tham gia kinh doanh, hay bạn đang có ý định trở thành một doanh nhân, hãy chú ý tới 8 thách thức được&amp;nbsp;&lt;em style=&quot;margin: 0px; padding: 0px;&quot;&gt;Entrepreneur&lt;/em&gt;&amp;nbsp;liệt kê dưới đây:&lt;/p&gt;&lt;p class=&quot;subtitle&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; font-weight: 700; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Từ bỏ những sự nghiệp khác&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Nếu bạn đang có ý định tự mình xây dựng và phát triển sự nghiệp để đi đến thành công, bạn gần như không thể đồng thời quản lý một công việc khác. Bạn cũng có thể chỉ cần quản lý việc kinh doanh còn trong trứng nước của mình vào khoảng thời gian cuối tuần, nhưng nếu muốn có một sự nghiệp thật sự thành công, bạn cần phải từ bỏ công việc đang làm hằng ngày.&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Không dễ dàng gì đạt được cơ hội dài hạn đầy triển vọng một cách ngẫu nhiên – nhất là khi bạn chưa từng khởi nghiệp kinh doanh. Thật không may, bạn không còn cách nào khác để đi đến thành công. Hãy suy nghĩ và ra quyết định một cách hợp lý và đừng bỏ qua bản năng.&lt;/p&gt;&lt;p class=&quot;subtitle&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; font-weight: 700; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Huy động vốn&lt;/p&gt;&lt;p class=&quot;subtitle&quot; style=&quot;text-align: center; margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; font-weight: 700; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;&lt;img src=&quot;http://localhost/hitas/image/catalog/news/entre500-6186-1455215211.jpg&quot;&gt;&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Những doanh nhân có kinh nghiệm không dễ dàng gì để huy động vốn khi họ muốn tham gia vào một lĩnh vực kinh doanh mới, nhưng họ có một vài lợi thế so với những người khởi nghiệp. Đó là vốn đóng góp từ việc kinh doanh trước đó hoặc nguồn doanh thu ổn định dùng làm vốn cho hoạt động kinh doanh mới.&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Thậm chí cả khi việc kinh doanh đầu tiên của họ bị thua lỗ, họ vẫn có thể góp vốn đầu tư hoặc kết nối với những khách hàng cần thiết để tìm một vị trí trong doanh nghiệp mới. Là một doanh nhân mới, bạn sẽ bắt đầu từ vạch xuất phát, điều này có nghĩa là bạn cần phải thiết lập mạng công việc một cách điên cuồng và tính đến tất cả những lựa chọn vay vốn có thể có trước khi lựa chọn lấy một trong số đó.&lt;/p&gt;&lt;p class=&quot;subtitle&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; font-weight: 700; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Xây dựng đội nhóm&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Điều này sẽ đặc biệt khó khăn nếu như trước đây bạn chưa từng làm việc theo nhóm hoặc quản lý nhóm, nhưng kể cả khi bạn đã có kinh nghiệm quản lý, việc thiết lập một nhóm thích hợp để khởi nghiệp cũng vô cùng áp lực và khó khăn. Ngoại việc phải lựa chọn những ứng viên có vai trò thích hợp, bạn cũng cần phải tính đến chi phí thuê nhân công, sự phù hợp về văn hóa và làm thế nào để họ có thể làm việc như một phần trong tập thể của bạn. Việc xây dựng nhóm càng trở nên khó khăn hơn khi bạn phải chịu áp lực lấp đầy những vị trí này sớm nhất có thể.&lt;/p&gt;&lt;p class=&quot;subtitle&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; font-weight: 700; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Phải biết nhìn xa trông rộng&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Là một nhà sáng lập, bạn được kỳ vọng là người đưa ra những ý tưởng kinh doanh. Khi một đối thủ kinh doanh xuất hiện, trách nhiệm của bạn là phải tìm ra kế hoạch ứng phó. Khi nhóm của bạn vấp phải một trở ngại không thể vượt qua, cũng chính bạn là người phải tìm ra được đường đi nước bước giúp cho nhóm của mình có thể tiến về phía trước.&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Điều này đòi hỏi bạn cần phải có tư duy sáng tạo ngay lập tức, nó khiến cho một doanh nhân khởi nghiệp hiếm khi có thời gian để thư giãn. Bạn có càng ít kinh nghiệm thì càng cảm thấy áp lực hơn, và thời gian càng khó khăn sẽ đến cùng với một kế hoạch khả thi.&lt;/p&gt;&lt;p class=&quot;subtitle&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; font-weight: 700; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Đối mặt với cái chưa biết&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Doanh nghiệp của bạn sẽ tồn tại trong bao lâu? Nó đạt được bao nhiêu lợi nhuận? Khách hàng có thích sản phẩm của bạn không? Bạn có thể tự tạo ra cho mình một nguồn thu nhập ổn định? Không có câu hỏi nào ở trên có được câu trả lời chắc chắn, kể cả khi bạn khởi nghiệp trong một điều kiện tuyệt vời với đầy đủ những nguồn lực mà bạn cần về mặt lý thuyết.&lt;/p&gt;&lt;p class=&quot;subtitle&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; font-weight: 700; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Sự cô độc&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Đây là vấn đề hiếm khi được đề cập đến, và nhiều chủ doanh nghiệp mới đã không chuẩn bị tinh thần cho điều này cho đến khi nó xảy ra. Là nhà lãnh đạo là trở thành một người cô độc vì đó là vị trí mà bạn không có người đồng hành để dựa vào. Bạn sẽ phải làm việc trong nhiều giờ và không thể gặp gỡ gia đình của mình một cách thường xuyên, còn nhân viên của bạn buộc phải duy trì một khoảng cách nhất định với ông chủ của mình.&lt;/p&gt;&lt;p class=&quot;subtitle&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; font-weight: 700; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Xây dựng quy tắc công ty&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Thật vui vẻ khi trở thành ông chủ cho đến khi bạn phải đề ra điều gì đó bắt buộc. Sớm hay muộn, bạn cũng phải đưa ra các quy tắc kinh doanh trong công ty mình, từ việc nhân viên được nghỉ bao nhiêu ngày cho đến việc giải quyết những đơn thư khiếu nại. Không vui gì khi bạn phải nghĩ và tạo ra những quy tắc này, nhưng điều này rất cần thiết đối với mọi doanh nghiệp.&lt;/p&gt;&lt;p class=&quot;subtitle&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; font-weight: 700; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Ra quyết định&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Bạn có thể tin hay không, nhưng điều này là thách thức khó khăn nhất trong số những điều được nêu ra. Mỗi người chủ doanh nghiệp buộc phải có hàng trăm quyết định mỗi ngày từ lớn tới nhỏ, ví dụ như từ quyết định cơ cấu công ty cho đến giờ làm việc. Mệt mỏi vì ra quyết định là một hiện tượng có thật mà hầu hết những doanh nhân khởi nghiệp đều phải trải qua nếu họ không chuẩn bị cho những mức độ áp lực mới.&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Nếu bạn có thể vượt qua những thách thức này, bạn sẽ thành công trên con đường xây dựng sự nghiệp riêng. Nói như vậy không có nghĩa là những thách thức này sẽ không làm phiền bạn trong những năm tới, hoặc thay vào đó sẽ có nhiều thách thức mới phát sinh. Nhưng vì bạn đã được chuẩn bị để tự mình đối mặt và vượt qua những khó khăn trong những tháng đầu khởi nghiệp, điều này sẽ giúp bạn tiến lên vượt xa các đối thủ cạnh tranh.&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial; text-align: right;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px;&quot;&gt;Minh Châu&lt;/strong&gt;&lt;/p&gt;', '', ''),
(277, 41, 1, '8 thách thức lớn với doanh nhân khởi nghiệp', '&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Nếu bạn vừa bắt đầu tham gia kinh doanh, hay bạn đang có ý định trở thành một doanh nhân, hãy chú ý tới 8 thách thức được&amp;nbsp;&lt;em style=&quot;margin: 0px; padding: 0px;&quot;&gt;Entrepreneur&lt;/em&gt;&amp;nbsp;liệt kê dưới đây:&lt;/p&gt;&lt;p class=&quot;subtitle&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; font-weight: 700; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Từ bỏ những sự nghiệp khác&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Nếu bạn đang có ý định tự mình xây dựng và phát triển sự nghiệp để đi đến thành công, bạn gần như không thể đồng thời quản lý một công việc khác. Bạn cũng có thể chỉ cần quản lý việc kinh doanh còn trong trứng nước của mình vào khoảng thời gian cuối tuần, nhưng nếu muốn có một sự nghiệp thật sự thành công, bạn cần phải từ bỏ công việc đang làm hằng ngày.&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Không dễ dàng gì đạt được cơ hội dài hạn đầy triển vọng một cách ngẫu nhiên – nhất là khi bạn chưa từng khởi nghiệp kinh doanh. Thật không may, bạn không còn cách nào khác để đi đến thành công. Hãy suy nghĩ và ra quyết định một cách hợp lý và đừng bỏ qua bản năng.&lt;/p&gt;&lt;p class=&quot;subtitle&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; font-weight: 700; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Huy động vốn&lt;/p&gt;&lt;p class=&quot;subtitle&quot; style=&quot;margin-bottom: 1em; text-align: center; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; font-weight: 700; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;&lt;img src=&quot;http://localhost/hitas/image/catalog/news/entre500-6186-1455215211.jpg&quot;&gt;&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Những doanh nhân có kinh nghiệm không dễ dàng gì để huy động vốn khi họ muốn tham gia vào một lĩnh vực kinh doanh mới, nhưng họ có một vài lợi thế so với những người khởi nghiệp. Đó là vốn đóng góp từ việc kinh doanh trước đó hoặc nguồn doanh thu ổn định dùng làm vốn cho hoạt động kinh doanh mới.&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Thậm chí cả khi việc kinh doanh đầu tiên của họ bị thua lỗ, họ vẫn có thể góp vốn đầu tư hoặc kết nối với những khách hàng cần thiết để tìm một vị trí trong doanh nghiệp mới. Là một doanh nhân mới, bạn sẽ bắt đầu từ vạch xuất phát, điều này có nghĩa là bạn cần phải thiết lập mạng công việc một cách điên cuồng và tính đến tất cả những lựa chọn vay vốn có thể có trước khi lựa chọn lấy một trong số đó.&lt;/p&gt;&lt;p class=&quot;subtitle&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; font-weight: 700; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Xây dựng đội nhóm&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Điều này sẽ đặc biệt khó khăn nếu như trước đây bạn chưa từng làm việc theo nhóm hoặc quản lý nhóm, nhưng kể cả khi bạn đã có kinh nghiệm quản lý, việc thiết lập một nhóm thích hợp để khởi nghiệp cũng vô cùng áp lực và khó khăn. Ngoại việc phải lựa chọn những ứng viên có vai trò thích hợp, bạn cũng cần phải tính đến chi phí thuê nhân công, sự phù hợp về văn hóa và làm thế nào để họ có thể làm việc như một phần trong tập thể của bạn. Việc xây dựng nhóm càng trở nên khó khăn hơn khi bạn phải chịu áp lực lấp đầy những vị trí này sớm nhất có thể.&lt;/p&gt;&lt;p class=&quot;subtitle&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; font-weight: 700; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Phải biết nhìn xa trông rộng&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Là một nhà sáng lập, bạn được kỳ vọng là người đưa ra những ý tưởng kinh doanh. Khi một đối thủ kinh doanh xuất hiện, trách nhiệm của bạn là phải tìm ra kế hoạch ứng phó. Khi nhóm của bạn vấp phải một trở ngại không thể vượt qua, cũng chính bạn là người phải tìm ra được đường đi nước bước giúp cho nhóm của mình có thể tiến về phía trước.&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Điều này đòi hỏi bạn cần phải có tư duy sáng tạo ngay lập tức, nó khiến cho một doanh nhân khởi nghiệp hiếm khi có thời gian để thư giãn. Bạn có càng ít kinh nghiệm thì càng cảm thấy áp lực hơn, và thời gian càng khó khăn sẽ đến cùng với một kế hoạch khả thi.&lt;/p&gt;&lt;p class=&quot;subtitle&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; font-weight: 700; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Đối mặt với cái chưa biết&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Doanh nghiệp của bạn sẽ tồn tại trong bao lâu? Nó đạt được bao nhiêu lợi nhuận? Khách hàng có thích sản phẩm của bạn không? Bạn có thể tự tạo ra cho mình một nguồn thu nhập ổn định? Không có câu hỏi nào ở trên có được câu trả lời chắc chắn, kể cả khi bạn khởi nghiệp trong một điều kiện tuyệt vời với đầy đủ những nguồn lực mà bạn cần về mặt lý thuyết.&lt;/p&gt;&lt;p class=&quot;subtitle&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; font-weight: 700; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Sự cô độc&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Đây là vấn đề hiếm khi được đề cập đến, và nhiều chủ doanh nghiệp mới đã không chuẩn bị tinh thần cho điều này cho đến khi nó xảy ra. Là nhà lãnh đạo là trở thành một người cô độc vì đó là vị trí mà bạn không có người đồng hành để dựa vào. Bạn sẽ phải làm việc trong nhiều giờ và không thể gặp gỡ gia đình của mình một cách thường xuyên, còn nhân viên của bạn buộc phải duy trì một khoảng cách nhất định với ông chủ của mình.&lt;/p&gt;&lt;p class=&quot;subtitle&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; font-weight: 700; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Xây dựng quy tắc công ty&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Thật vui vẻ khi trở thành ông chủ cho đến khi bạn phải đề ra điều gì đó bắt buộc. Sớm hay muộn, bạn cũng phải đưa ra các quy tắc kinh doanh trong công ty mình, từ việc nhân viên được nghỉ bao nhiêu ngày cho đến việc giải quyết những đơn thư khiếu nại. Không vui gì khi bạn phải nghĩ và tạo ra những quy tắc này, nhưng điều này rất cần thiết đối với mọi doanh nghiệp.&lt;/p&gt;&lt;p class=&quot;subtitle&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; font-weight: 700; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Ra quyết định&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Bạn có thể tin hay không, nhưng điều này là thách thức khó khăn nhất trong số những điều được nêu ra. Mỗi người chủ doanh nghiệp buộc phải có hàng trăm quyết định mỗi ngày từ lớn tới nhỏ, ví dụ như từ quyết định cơ cấu công ty cho đến giờ làm việc. Mệt mỏi vì ra quyết định là một hiện tượng có thật mà hầu hết những doanh nhân khởi nghiệp đều phải trải qua nếu họ không chuẩn bị cho những mức độ áp lực mới.&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial;&quot;&gt;Nếu bạn có thể vượt qua những thách thức này, bạn sẽ thành công trên con đường xây dựng sự nghiệp riêng. Nói như vậy không có nghĩa là những thách thức này sẽ không làm phiền bạn trong những năm tới, hoặc thay vào đó sẽ có nhiều thách thức mới phát sinh. Nhưng vì bạn đã được chuẩn bị để tự mình đối mặt và vượt qua những khó khăn trong những tháng đầu khởi nghiệp, điều này sẽ giúp bạn tiến lên vượt xa các đối thủ cạnh tranh.&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; line-height: 22px; text-rendering: geometricPrecision; font-size: 16px; color: rgb(51, 51, 51); font-family: arial; text-align: right;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px;&quot;&gt;Minh Châu&lt;/strong&gt;&lt;/p&gt;', '', ''),
(276, 40, 2, '4 kênh bất động sản tiềm năng năm Bính Thân', '&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; text-rendering: geometricPrecision;&quot;&gt;Chuyên gia tư vấn cấp cao Công ty Tư vấn Kinh doanh hội nhập Toàn Cầu (GIBC), Huỳnh Phước Nghĩa đánh giá, bức tranh bất động sản năm 2016 vẫn có nhiều cơ hội tiếp tục đà tăng trưởng của các năm 2014-2015. Tuy nhiên dòng chảy thị trường có một vài sự dịch chuyển nhẹ vào 4 phân khúc bất động sản sau.&amp;nbsp;&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; text-rendering: geometricPrecision;&quot;&gt;Thứ nhất: Nhà ở diện tích nhỏ, giá rẻ sẽ trở lại mạnh mẽ. Sau 2 năm, các doanh nghiệp, nhà đầu tư và giới đầu cơ dồn lực vào thị trường nhà cao cấp, từ cuối năm Ất Mùi, tức tháng 1/2016 thị trường bắt đầu xuất hiện xu hướng dịch chuyển sang phân khúc nhà ở bình dân. Các quỹ đất rẻ đang được săn lùng ráo riết để chuẩn bị cho chiến lược cân bằng rổ hàng hoá ở phân khúc thấp hơn. Bất động sản giá rẻ sẽ đứng trước cơ hội tăng tốc trở lại nhờ nguồn cung hiện hữu chưa đủ đáp ứng nhu cầu to lớn của người dân. Khả năng chi trả của phần lớn người dân cho kênh nhà ở này cũng cao hơn phần còn lại thị trường.&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;text-align: center; margin-bottom: 1em; padding: 0px; text-rendering: geometricPrecision;&quot;&gt;&lt;img src=&quot;http://localhost/hitas/image/catalog/news/a-tb-4-kenh-bat-dong-san-day-t-3957-7022-1455081761.jpg&quot;&gt;&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; text-rendering: geometricPrecision;&quot;&gt;Thứ hai: Bất động sản nông nghiệp (đất canh tác thửa lớn) đang được săn lùng ráo riết. Nỗ lực hội nhập sâu rộng của Việt Nam trong năm 2015 đã mang lại làn gió mới cho thị trường bất động sản nông nghiệp. Bức tranh toàn cảnh của thị trường này đã dịch chuyển từ quy mô vừa và nhỏ, canh tác truyền thống sang quy mô lớn, canh tác hiện đại bằng công nghệ cao. Nhiều nhà đầu tư cá nhân và tổ chức đã bắt đầu thu gom quỹ đất lớn tại nhiều tỉnh thành trên cả nước, các khu vực được quan tâm phải có khả năng trồng trọt tốt. Từ năm 2016 trở đi, bất động sản nông nghiệp không chỉ thay đổi về quy mô và hình thức canh tác mà có thể còn hình thành chuỗi cung ứng, tăng năng lực thương mại.&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; text-rendering: geometricPrecision;&quot;&gt;Thứ ba: Bất động sản nghỉ dưỡng có khu vui chơi giải trí khép kín trở thành xu hướng thời thượng. Thị trường bất động sản nghỉ dưỡng Việt Nam vẫn còn non trẻ so với thế giới và khu vực. Tuy nhiên, trong 2 năm qua, các dự án khu resort mới được đầu tư bài bản có khu vui chơi giải trí kèm theo đang tạo nên những điển hình tích cực thúc đẩy thị trường second home sôi động nhất trong vòng 7-8 năm qua. Làn sóng này nhiều khả năng vẫn tiếp tục thống trị thị trường bất động sản nghỉ dưỡng năm 2016, thậm chí tăng độ hấp dẫn nhờ ngày càng hoàn thiện các sản phẩm đa dạng. Những khu resort có sân golf, khu vui chơi trong nhà, dưới nước và ngoài trời, thậm chí là có sòng bạc sẽ khuấy động thị trường đầu tư và tiêu dùng cá biệt này trong năm Bính Thân.&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; text-rendering: geometricPrecision;&quot;&gt;Thứ tư: Kho vận, khu công nghiệp tiếp tục sôi động năm thứ hai liên tiếp với tốc độ tăng trưởng bằng hoặc cao hơn năm 2015. Đây là hệ quả tất yếu khi Việt Nam hội nhập sâu rộng, tham gia các hiệp định thương mại TPP, FTA. Những chuyển biến này có thể từng bước thúc đẩy quá trình mua bán sáp nhập, giúp tăng sự hiện diện của nhiều thương hiệu mới hoặc tạo động lực thâm nhập thị trường mới của các tổ chức đầu tư quy mô lớn. Năm 2016 các khu công nghiệp, cảng, logictic có cơ hội bứt phá trên đà tăng trưởng tốt của năm 2015 khi các hoạt động kinh doanh, sản xuất, giao thương được khối ngoại quan tâm ngày càng nhiều.&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; text-rendering: geometricPrecision;&quot;&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: arial; font-size: 16px; line-height: 22px;&quot;&gt;Vũ Lê&amp;nbsp;ghi&lt;/span&gt;&lt;/p&gt;', '', ''),
(275, 40, 1, '4 kênh bất động sản tiềm năng năm Bính Thân', '&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; text-rendering: geometricPrecision;&quot;&gt;Chuyên gia tư vấn cấp cao Công ty Tư vấn Kinh doanh hội nhập Toàn Cầu (GIBC), Huỳnh Phước Nghĩa đánh giá, bức tranh bất động sản năm 2016 vẫn có nhiều cơ hội tiếp tục đà tăng trưởng của các năm 2014-2015. Tuy nhiên dòng chảy thị trường có một vài sự dịch chuyển nhẹ vào 4 phân khúc bất động sản sau.&amp;nbsp;&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; text-rendering: geometricPrecision;&quot;&gt;Thứ nhất: Nhà ở diện tích nhỏ, giá rẻ sẽ trở lại mạnh mẽ. Sau 2 năm, các doanh nghiệp, nhà đầu tư và giới đầu cơ dồn lực vào thị trường nhà cao cấp, từ cuối năm Ất Mùi, tức tháng 1/2016 thị trường bắt đầu xuất hiện xu hướng dịch chuyển sang phân khúc nhà ở bình dân. Các quỹ đất rẻ đang được săn lùng ráo riết để chuẩn bị cho chiến lược cân bằng rổ hàng hoá ở phân khúc thấp hơn. Bất động sản giá rẻ sẽ đứng trước cơ hội tăng tốc trở lại nhờ nguồn cung hiện hữu chưa đủ đáp ứng nhu cầu to lớn của người dân. Khả năng chi trả của phần lớn người dân cho kênh nhà ở này cũng cao hơn phần còn lại thị trường.&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; text-align: center; padding: 0px; text-rendering: geometricPrecision;&quot;&gt;&lt;img src=&quot;http://localhost/hitas/image/catalog/news/a-tb-4-kenh-bat-dong-san-day-t-3957-7022-1455081761.jpg&quot;&gt;&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; text-rendering: geometricPrecision;&quot;&gt;Thứ hai: Bất động sản nông nghiệp (đất canh tác thửa lớn) đang được săn lùng ráo riết. Nỗ lực hội nhập sâu rộng của Việt Nam trong năm 2015 đã mang lại làn gió mới cho thị trường bất động sản nông nghiệp. Bức tranh toàn cảnh của thị trường này đã dịch chuyển từ quy mô vừa và nhỏ, canh tác truyền thống sang quy mô lớn, canh tác hiện đại bằng công nghệ cao. Nhiều nhà đầu tư cá nhân và tổ chức đã bắt đầu thu gom quỹ đất lớn tại nhiều tỉnh thành trên cả nước, các khu vực được quan tâm phải có khả năng trồng trọt tốt. Từ năm 2016 trở đi, bất động sản nông nghiệp không chỉ thay đổi về quy mô và hình thức canh tác mà có thể còn hình thành chuỗi cung ứng, tăng năng lực thương mại.&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; text-rendering: geometricPrecision;&quot;&gt;Thứ ba: Bất động sản nghỉ dưỡng có khu vui chơi giải trí khép kín trở thành xu hướng thời thượng. Thị trường bất động sản nghỉ dưỡng Việt Nam vẫn còn non trẻ so với thế giới và khu vực. Tuy nhiên, trong 2 năm qua, các dự án khu resort mới được đầu tư bài bản có khu vui chơi giải trí kèm theo đang tạo nên những điển hình tích cực thúc đẩy thị trường second home sôi động nhất trong vòng 7-8 năm qua. Làn sóng này nhiều khả năng vẫn tiếp tục thống trị thị trường bất động sản nghỉ dưỡng năm 2016, thậm chí tăng độ hấp dẫn nhờ ngày càng hoàn thiện các sản phẩm đa dạng. Những khu resort có sân golf, khu vui chơi trong nhà, dưới nước và ngoài trời, thậm chí là có sòng bạc sẽ khuấy động thị trường đầu tư và tiêu dùng cá biệt này trong năm Bính Thân.&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; text-rendering: geometricPrecision;&quot;&gt;Thứ tư: Kho vận, khu công nghiệp tiếp tục sôi động năm thứ hai liên tiếp với tốc độ tăng trưởng bằng hoặc cao hơn năm 2015. Đây là hệ quả tất yếu khi Việt Nam hội nhập sâu rộng, tham gia các hiệp định thương mại TPP, FTA. Những chuyển biến này có thể từng bước thúc đẩy quá trình mua bán sáp nhập, giúp tăng sự hiện diện của nhiều thương hiệu mới hoặc tạo động lực thâm nhập thị trường mới của các tổ chức đầu tư quy mô lớn. Năm 2016 các khu công nghiệp, cảng, logictic có cơ hội bứt phá trên đà tăng trưởng tốt của năm 2015 khi các hoạt động kinh doanh, sản xuất, giao thương được khối ngoại quan tâm ngày càng nhiều.&lt;/p&gt;&lt;p class=&quot;Normal&quot; style=&quot;margin-bottom: 1em; padding: 0px; text-rendering: geometricPrecision;&quot;&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: arial; font-size: 16px; line-height: 22px;&quot;&gt;Vũ Lê&amp;nbsp;ghi&lt;/span&gt;&lt;/p&gt;', '4 kênh bất động sản tiềm năng năm Bính Thân', '');

-- --------------------------------------------------------

--
-- Structure de la table `sm_simple_blog_article_description_additional`
--

CREATE TABLE IF NOT EXISTS `sm_simple_blog_article_description_additional` (
  `simple_blog_article_id` int(16) NOT NULL,
  `language_id` int(16) NOT NULL,
  `additional_description` text CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sm_simple_blog_article_description_additional`
--

INSERT INTO `sm_simple_blog_article_description_additional` (`simple_blog_article_id`, `language_id`, `additional_description`) VALUES
(5, 1, '&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;&quot;&gt;Cơ cấu tổ chức&lt;br&gt;&lt;/p&gt;'),
(5, 2, '&lt;p&gt;&lt;span style=&quot;line-height: 17.142858505249px;&quot;&gt;Cơ cấu tổ chức&lt;/span&gt;&lt;br&gt;&lt;/p&gt;'),
(6, 1, '&lt;p&gt;Ban lãnh đạo&lt;br&gt;&lt;/p&gt;'),
(6, 2, '&lt;p&gt;&lt;span style=&quot;line-height: 17.142858505249px;&quot;&gt;Ban lãnh đạo&lt;/span&gt;&lt;br&gt;&lt;/p&gt;'),
(7, 1, '&lt;p&gt;&lt;span style=&quot;line-height: 18px; background-color: rgb(255, 255, 255);&quot;&gt;Đối tác chiến lược&lt;/span&gt;&lt;br&gt;&lt;/p&gt;'),
(7, 2, '&lt;p&gt;&lt;span style=&quot;line-height: 18px; background-color: rgb(255, 255, 255);&quot;&gt;Đối tác chiến lược&lt;/span&gt;&lt;br&gt;&lt;/p&gt;'),
(41, 2, '&lt;p&gt;Bắt đầu công việc kinh doanh luôn đi kèm một loạt thách thức, dù bổ ích nhưng dù sao cũng rất khắc nghiệt và đôi khi rất khó vượt qua đối với những doanh nhân mới khởi nghiệp và trẻ tuổi.&lt;br&gt;&lt;/p&gt;'),
(4, 2, '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial; font-size: 14px; line-height: 22.3999996185303px; text-align: justify;&quot;&gt;Công ty tư vấn và quản lý Đầu tư 5F Capital (tên giao dịch 5F Capital Co. LTD) được thành lập ngày 10/7/2015 theo giấy phép kinh doanh số 0313344224&lt;/span&gt;&lt;br&gt;&lt;/p&gt;'),
(4, 1, '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: tahoma, arial; font-size: 14px; line-height: 22.3999996185303px; text-align: justify;&quot;&gt;Công ty tư vấn và quản lý Đầu tư 5F Capital (tên giao dịch 5F Capital Co. LTD) được thành lập ngày 10/7/2015 theo giấy phép kinh doanh số 0313344224&lt;/span&gt;&lt;br&gt;&lt;/p&gt;'),
(41, 1, '&lt;p&gt;Bắt đầu công việc kinh doanh luôn đi kèm một loạt thách thức, dù bổ ích nhưng dù sao cũng rất khắc nghiệt và đôi khi rất khó vượt qua đối với những doanh nhân mới khởi nghiệp và trẻ tuổi.&lt;br&gt;&lt;/p&gt;'),
(40, 2, '&lt;p&gt;Bắt đầu công việc kinh doanh luôn đi kèm một loạt thách thức, dù bổ ích nhưng dù sao cũng rất khắc nghiệt và đôi khi rất khó vượt qua đối với những doanh nhân mới khởi nghiệp và trẻ tuổi.&lt;br&gt;&lt;/p&gt;'),
(40, 1, '&lt;p&gt;Bắt đầu công việc kinh doanh luôn đi kèm một loạt thách thức, dù bổ ích nhưng dù sao cũng rất khắc nghiệt và đôi khi rất khó vượt qua đối với những doanh nhân mới khởi nghiệp và trẻ tuổi.&lt;br&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Structure de la table `sm_simple_blog_article_product_related`
--

CREATE TABLE IF NOT EXISTS `sm_simple_blog_article_product_related` (
  `simple_blog_article_id` int(16) NOT NULL,
  `product_id` int(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sm_simple_blog_article_to_category`
--

CREATE TABLE IF NOT EXISTS `sm_simple_blog_article_to_category` (
  `simple_blog_article_id` int(16) NOT NULL,
  `simple_blog_category_id` int(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sm_simple_blog_article_to_category`
--

INSERT INTO `sm_simple_blog_article_to_category` (`simple_blog_article_id`, `simple_blog_category_id`) VALUES
(5, 2),
(6, 2),
(7, 2),
(4, 2),
(41, 1),
(41, 3),
(40, 3);

-- --------------------------------------------------------

--
-- Structure de la table `sm_simple_blog_article_to_layout`
--

CREATE TABLE IF NOT EXISTS `sm_simple_blog_article_to_layout` (
  `simple_blog_article_id` int(16) NOT NULL,
  `store_id` int(16) NOT NULL,
  `layout_id` int(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sm_simple_blog_article_to_store`
--

CREATE TABLE IF NOT EXISTS `sm_simple_blog_article_to_store` (
  `simple_blog_article_id` int(16) NOT NULL,
  `store_id` int(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sm_simple_blog_article_to_store`
--

INSERT INTO `sm_simple_blog_article_to_store` (`simple_blog_article_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(4, 0),
(41, 0),
(40, 0);

-- --------------------------------------------------------

--
-- Structure de la table `sm_simple_blog_author`
--

CREATE TABLE IF NOT EXISTS `sm_simple_blog_author` (
  `simple_blog_author_id` int(16) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `image` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`simple_blog_author_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `sm_simple_blog_author`
--

INSERT INTO `sm_simple_blog_author` (`simple_blog_author_id`, `name`, `image`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Hitas', '', 1, '2015-10-10 11:08:16', '2016-02-16 11:33:59');

-- --------------------------------------------------------

--
-- Structure de la table `sm_simple_blog_author_description`
--

CREATE TABLE IF NOT EXISTS `sm_simple_blog_author_description` (
  `simple_blog_author_description_id` int(16) NOT NULL AUTO_INCREMENT,
  `simple_blog_author_id` int(16) NOT NULL,
  `language_id` int(16) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(256) NOT NULL,
  `meta_keyword` varchar(256) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`simple_blog_author_description_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Contenu de la table `sm_simple_blog_author_description`
--

INSERT INTO `sm_simple_blog_author_description` (`simple_blog_author_description_id`, `simple_blog_author_id`, `language_id`, `description`, `meta_description`, `meta_keyword`, `date_added`) VALUES
(21, 1, 1, '&lt;p&gt;Hitas&lt;/p&gt;', '', '', '0000-00-00 00:00:00'),
(22, 1, 2, '&lt;p&gt;Hitas&lt;/p&gt;', '', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `sm_simple_blog_category`
--

CREATE TABLE IF NOT EXISTS `sm_simple_blog_category` (
  `simple_blog_category_id` int(16) NOT NULL AUTO_INCREMENT,
  `image` text NOT NULL,
  `parent_id` int(16) NOT NULL,
  `top` tinyint(1) NOT NULL,
  `blog_category_column` int(16) NOT NULL,
  `column` int(8) NOT NULL,
  `sort_order` int(8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`simple_blog_category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `sm_simple_blog_category`
--

INSERT INTO `sm_simple_blog_category` (`simple_blog_category_id`, `image`, `parent_id`, `top`, `blog_category_column`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(1, '', 0, 0, 0, 10, 2, 1, '2015-10-10 11:00:09', '2015-11-06 14:52:18'),
(2, '', 0, 0, 0, 10, 1, 1, '2015-10-13 09:17:18', '2015-11-06 14:51:32'),
(3, '', 0, 0, 0, 10, 4, 1, '2015-10-13 09:18:06', '2015-11-13 14:59:55'),
(4, '', 0, 0, 0, 10, 3, 1, '2015-10-13 09:18:50', '2015-11-30 14:08:12'),
(5, '', 4, 0, 0, 10, 0, 1, '2015-11-13 14:35:56', '2015-11-13 14:41:12');

-- --------------------------------------------------------

--
-- Structure de la table `sm_simple_blog_category_description`
--

CREATE TABLE IF NOT EXISTS `sm_simple_blog_category_description` (
  `simple_blog_category_description_id` int(16) NOT NULL AUTO_INCREMENT,
  `simple_blog_category_id` int(16) NOT NULL,
  `language_id` int(16) NOT NULL,
  `name` varchar(256) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `meta_description` varchar(256) CHARACTER SET utf8 NOT NULL,
  `meta_keyword` varchar(256) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`simple_blog_category_description_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

--
-- Contenu de la table `sm_simple_blog_category_description`
--

INSERT INTO `sm_simple_blog_category_description` (`simple_blog_category_description_id`, `simple_blog_category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES
(46, 4, 2, 'Danh mục đầu tư', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(45, 4, 1, 'Project', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(25, 2, 1, 'About us', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(26, 2, 2, 'Giới thiệu', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(29, 1, 1, 'News', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(30, 1, 2, 'Tin tức', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(35, 5, 1, 'Kinh doanh khách sạn', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(36, 5, 2, 'Kinh doanh khách sạn', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(43, 3, 1, 'Press corner', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(44, 3, 2, 'Góc báo chí', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `sm_simple_blog_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `sm_simple_blog_category_to_layout` (
  `simple_blog_category_id` int(16) NOT NULL,
  `store_id` int(16) NOT NULL,
  `layout_id` int(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sm_simple_blog_category_to_store`
--

CREATE TABLE IF NOT EXISTS `sm_simple_blog_category_to_store` (
  `simple_blog_category_id` int(16) NOT NULL,
  `store_id` int(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sm_simple_blog_category_to_store`
--

INSERT INTO `sm_simple_blog_category_to_store` (`simple_blog_category_id`, `store_id`) VALUES
(4, 0),
(2, 0),
(1, 0),
(5, 0),
(3, 0);

-- --------------------------------------------------------

--
-- Structure de la table `sm_simple_blog_comment`
--

CREATE TABLE IF NOT EXISTS `sm_simple_blog_comment` (
  `simple_blog_comment_id` int(16) NOT NULL AUTO_INCREMENT,
  `simple_blog_article_id` int(16) NOT NULL,
  `simple_blog_article_reply_id` int(16) NOT NULL,
  `author` varchar(64) NOT NULL,
  `comment` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`simple_blog_comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_simple_blog_related_article`
--

CREATE TABLE IF NOT EXISTS `sm_simple_blog_related_article` (
  `simple_blog_related_article_id` int(16) NOT NULL AUTO_INCREMENT,
  `simple_blog_article_id` int(16) NOT NULL,
  `simple_blog_article_related_id` int(16) NOT NULL,
  `sort_order` int(8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`simple_blog_related_article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_simple_blog_view`
--

CREATE TABLE IF NOT EXISTS `sm_simple_blog_view` (
  `simple_blog_view_id` int(16) NOT NULL AUTO_INCREMENT,
  `simple_blog_article_id` int(16) NOT NULL,
  `view` int(16) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`simple_blog_view_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Contenu de la table `sm_simple_blog_view`
--

INSERT INTO `sm_simple_blog_view` (`simple_blog_view_id`, `simple_blog_article_id`, `view`, `date_added`, `date_modified`) VALUES
(4, 6, 1, '2015-11-07 09:07:53', '2015-11-07 09:07:53'),
(5, 7, 1, '2015-11-07 09:35:42', '2015-11-07 09:35:42'),
(6, 4, 14, '2015-11-11 09:33:34', '2015-11-11 10:25:05');

-- --------------------------------------------------------

--
-- Structure de la table `sm_stock_status`
--

CREATE TABLE IF NOT EXISTS `sm_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `sm_stock_status`
--

INSERT INTO `sm_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order'),
(5, 1, 'Out Of Stock'),
(6, 1, '2-3 Days'),
(7, 2, 'In Stock'),
(8, 2, 'Pre-Order'),
(5, 2, 'Out Of Stock'),
(6, 2, '2-3 Days');

-- --------------------------------------------------------

--
-- Structure de la table `sm_store`
--

CREATE TABLE IF NOT EXISTS `sm_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_tax_class`
--

CREATE TABLE IF NOT EXISTS `sm_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `sm_tax_class`
--

INSERT INTO `sm_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Structure de la table `sm_tax_rate`
--

CREATE TABLE IF NOT EXISTS `sm_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- Contenu de la table `sm_tax_rate`
--

INSERT INTO `sm_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', 20.0000, 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', 2.0000, 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Structure de la table `sm_tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `sm_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sm_tax_rate_to_customer_group`
--

INSERT INTO `sm_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Structure de la table `sm_tax_rule`
--

CREATE TABLE IF NOT EXISTS `sm_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

--
-- Contenu de la table `sm_tax_rule`
--

INSERT INTO `sm_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Structure de la table `sm_type_money`
--

CREATE TABLE IF NOT EXISTS `sm_type_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_vn` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `sm_type_money`
--

INSERT INTO `sm_type_money` (`id`, `name_vn`, `name_en`) VALUES
(1, 'Hội viên phí', 'Hội viên phí'),
(2, 'Cộng tác phí', 'Cộng tác phí'),
(3, 'Thanh toán', 'Thanh toán');

-- --------------------------------------------------------

--
-- Structure de la table `sm_upload`
--

CREATE TABLE IF NOT EXISTS `sm_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Contenu de la table `sm_upload`
--

INSERT INTO `sm_upload` (`upload_id`, `name`, `filename`, `code`, `date_added`) VALUES
(1, 'img1.png', 'img1.png.eb630d76d0652321350c8ed5555746b1', '26af8eba6e9adbadd358ee4a4aa0d4149f25b5c7', '2015-11-02 11:03:46'),
(2, 'img1.png', 'img1.png.a09dea8221bdcbc55e5f5df8862a4ae6', '8f4d9d9aea8cfea84c13ac2511a3427dd089710b', '2015-11-02 11:04:22'),
(3, 'img1.png', 'img1.png.1a79fb82d4cef3bc2f92fa487aad7497', '0758e3e3231be06f3ffe26203fa0c779f72e8e00', '2015-11-02 11:04:37'),
(4, 'img1.png', 'img1.png.b5f8df98a9b607be1468306781009df8', '930f45fbbd30f8f6e0185775ac7b543e12d52678', '2015-11-02 11:06:05'),
(5, 'img1.png', 'img1.png.ce12424453cdacde989732f93109c175', '481174f397709b3417953f933564f893243ce36c', '2015-11-02 11:06:38'),
(6, 'img1.png', 'img1.png', 'b2e2142559ac57e6ba0948ebe6bf84ed6391462c', '2015-11-02 11:17:37'),
(7, 'img1.png', 'img1.png', 'e6c2b7c6eac553303b85ebfb3a288f1ef97355b1', '2015-11-02 11:18:00'),
(8, 'img1.png', 'img1.png', 'b998c192713b944e67f69b66d5b0738a0d75f241', '2015-11-02 13:42:47'),
(9, 'i.png', 'i.png', 'd0a1df8a9ebd6a6f93b84a73ea8bf8f7796f8e39', '2015-11-02 13:49:26'),
(10, 'i.png', 'i.png', '03b6d2a4af971c512e263a8d7239761a1b6306f6', '2015-11-02 13:51:55'),
(11, 'i.png', 'i.png', '2a79e0f49f2ce296af1f4841c2730282e53c89ef', '2015-11-02 13:51:56'),
(12, 'i.png', 'i.png', '1d9131809c144b81f8c51cabf072769bb717a2af', '2015-11-02 13:52:07'),
(13, 'i.png', 'i.png', 'a1e2fa987879b837250add598049283246cbce97', '2015-11-02 13:52:08'),
(14, 'i.png', 'i.png', '73e038d05411890e5d0b6f05518a174ccf728586', '2015-11-02 13:52:11'),
(15, 'i.png', 'i.png', 'e4dfd370f432f58d44c3c66747c7527b4284cde8', '2015-11-02 13:52:16'),
(16, 'heath-beauty-5.png', 'heath-beauty-5.png', 'e2f42e669589d4f01d3a4c4acd498ebbc9df7f49', '2015-11-02 13:52:42'),
(17, 'heath-beauty-5.png', 'heath-beauty-5.png', 'eb2c9a06b9192095006c28ef0b534b762c14f5fc', '2015-11-02 14:01:59'),
(18, 'i.png', 'i.png', 'a2edb0d5c92b319f4ae4d58f74215fdfd00dc181', '2015-11-02 14:03:50'),
(19, 'i.png', 'i.png', 'd85aaea94e52dd423a09a44c944da4b3a7d9415c', '2015-11-02 14:17:57');

-- --------------------------------------------------------

--
-- Structure de la table `sm_url_alias`
--

CREATE TABLE IF NOT EXISTS `sm_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1027 ;

--
-- Contenu de la table `sm_url_alias`
--

INSERT INTO `sm_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(824, 'product_id=48', 'ipod-classic'),
(836, 'category_id=20', 'desktops'),
(834, 'category_id=26', 'pc'),
(835, 'category_id=27', 'mac'),
(730, 'manufacturer_id=8', 'apple'),
(768, 'product_id=42', 'test'),
(789, 'category_id=34', 'mp3-players'),
(781, 'category_id=36', 'test2'),
(774, 'category_id=18', 'laptop-notebook'),
(775, 'category_id=46', 'macs'),
(776, 'category_id=45', 'windows'),
(777, 'category_id=25', 'component'),
(778, 'category_id=29', 'mouse'),
(779, 'category_id=28', 'monitor'),
(780, 'category_id=35', 'test1'),
(782, 'category_id=30', 'printer'),
(783, 'category_id=31', 'scanner'),
(784, 'category_id=32', 'web-camera'),
(785, 'category_id=57', 'tablet'),
(786, 'category_id=17', 'software'),
(787, 'category_id=24', 'smartphone'),
(788, 'category_id=33', 'camera'),
(790, 'category_id=43', 'test11'),
(791, 'category_id=44', 'test12'),
(792, 'category_id=47', 'test15'),
(793, 'category_id=48', 'test16'),
(794, 'category_id=49', 'test17'),
(795, 'category_id=50', 'test18'),
(796, 'category_id=51', 'test19'),
(797, 'category_id=52', 'test20'),
(798, 'category_id=58', 'test25'),
(799, 'category_id=53', 'test21'),
(800, 'category_id=54', 'test22'),
(801, 'category_id=55', 'test23'),
(802, 'category_id=56', 'test24'),
(803, 'category_id=38', 'test4'),
(804, 'category_id=37', 'test5'),
(805, 'category_id=39', 'test6'),
(806, 'category_id=40', 'test7'),
(807, 'category_id=41', 'test8'),
(808, 'category_id=42', 'test9'),
(809, 'product_id=30', 'canon-eos-5d'),
(840, 'product_id=47', 'hp-lp3065'),
(811, 'product_id=28', 'htc-touch-hd'),
(812, 'product_id=43', 'macbook'),
(813, 'product_id=44', 'macbook-air'),
(814, 'product_id=45', 'macbook-pro'),
(816, 'product_id=31', 'nikon-d300'),
(817, 'product_id=29', 'palm-treo-pro'),
(818, 'product_id=35', 'product-8'),
(819, 'product_id=49', 'samsung-galaxy-tab-10-1'),
(820, 'product_id=33', 'samsung-syncmaster-941bw'),
(821, 'product_id=46', 'sony-vaio'),
(837, 'product_id=41', 'imac'),
(823, 'product_id=40', 'iphone'),
(825, 'product_id=36', 'ipod-nano'),
(826, 'product_id=34', 'ipod-shuffle'),
(827, 'product_id=32', 'ipod-touch'),
(828, 'manufacturer_id=9', 'canon'),
(829, 'manufacturer_id=5', 'htc'),
(830, 'manufacturer_id=7', 'hewlett-packard'),
(831, 'manufacturer_id=6', 'palm'),
(832, 'manufacturer_id=10', 'sony'),
(870, 'simple_blog_category_id=2', '5f-capital'),
(899, 'simple_blog_category_id=3', 'sumy'),
(918, 'simple_blog_category_id=4', 'sumy'),
(1023, 'simple_blog_author_id=1', 'Hitas'),
(872, 'simple_blog_category_id=1', '5f-capital'),
(934, 'simple_blog_article_id=4', '5f-capital'),
(887, 'simple_blog_article_id=5', '5f-capital'),
(888, 'simple_blog_article_id=6', '5f-capital'),
(889, 'simple_blog_article_id=7', '5f-capital'),
(894, 'simple_blog_category_id=5', 'KINH DOANH KHÁCH SẠN'),
(1024, 'simple_blog_article_id=40', 'Hitas'),
(1025, 'simple_blog_article_id=41', 'Hitas');

-- --------------------------------------------------------

--
-- Structure de la table `sm_user`
--

CREATE TABLE IF NOT EXISTS `sm_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `sm_user`
--

INSERT INTO `sm_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', 'aee59be4256b84bdbef72905a5b4c46c0ffa5d15', '27ce70995', 'Hitas', 'admin', 'dungtran@icsc.vn', 'catalog/hitas.png', '', '192.168.0.10', 1, '2015-10-09 16:18:28'),
(5, 10, 'ketoan', '0c216733e71fb4cd28725643a3f7d9807d6fc880', 'e9e3e025b', 'Nguyễn Thị ', 'Thùy Linh', '', '', '', '1.54.232.110', 1, '2016-03-16 15:35:10');

-- --------------------------------------------------------

--
-- Structure de la table `sm_user_group`
--

CREATE TABLE IF NOT EXISTS `sm_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `sm_user_group`
--

INSERT INTO `sm_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Quản trị (admin)', 'a:2:{s:6:"access";a:205:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:14:"catalog/filter";i:5;s:19:"catalog/information";i:6;s:20:"catalog/manufacturer";i:7;s:14:"catalog/option";i:8;s:15:"catalog/product";i:9;s:17:"catalog/recurring";i:10;s:14:"catalog/review";i:11;s:18:"common/column_left";i:12;s:18:"common/filemanager";i:13;s:11:"common/menu";i:14;s:14:"common/profile";i:15;s:12:"common/stats";i:16;s:16:"dashboard/banner";i:17;s:23:"dashboard/banner_config";i:18;s:14:"dashboard/cart";i:19;s:26:"dashboard/customer_account";i:20;s:13:"design/banner";i:21;s:13:"design/layout";i:22;s:14:"extension/feed";i:23;s:15:"extension/fraud";i:24;s:19:"extension/installer";i:25;s:22:"extension/modification";i:26;s:16:"extension/module";i:27;s:17:"extension/openbay";i:28;s:17:"extension/payment";i:29;s:18:"extension/shipping";i:30;s:15:"extension/total";i:31;s:16:"feed/google_base";i:32;s:19:"feed/google_sitemap";i:33;s:15:"feed/openbaypro";i:34;s:18:"fraud/fraudlabspro";i:35;s:13:"fraud/maxmind";i:36;s:20:"localisation/country";i:37;s:21:"localisation/currency";i:38;s:21:"localisation/geo_zone";i:39;s:21:"localisation/language";i:40;s:25:"localisation/length_class";i:41;s:21:"localisation/location";i:42;s:25:"localisation/order_status";i:43;s:26:"localisation/return_action";i:44;s:26:"localisation/return_reason";i:45;s:26:"localisation/return_status";i:46;s:25:"localisation/stock_status";i:47;s:22:"localisation/tax_class";i:48;s:21:"localisation/tax_rate";i:49;s:25:"localisation/weight_class";i:50;s:17:"localisation/zone";i:51;s:19:"marketing/affiliate";i:52;s:17:"marketing/contact";i:53;s:16:"marketing/coupon";i:54;s:19:"marketing/marketing";i:55;s:14:"module/account";i:56;s:18:"module/accountleft";i:57;s:19:"module/accountright";i:58;s:16:"module/affiliate";i:59;s:20:"module/amazon_button";i:60;s:19:"module/amazon_login";i:61;s:17:"module/amazon_pay";i:62;s:13:"module/banner";i:63;s:18:"module/banner_left";i:64;s:19:"module/banner_right";i:65;s:17:"module/bestseller";i:66;s:15:"module/carousel";i:67;s:15:"module/category";i:68;s:19:"module/ebay_listing";i:69;s:15:"module/featured";i:70;s:13:"module/filter";i:71;s:22:"module/google_hangouts";i:72;s:11:"module/html";i:73;s:18:"module/information";i:74;s:13:"module/latest";i:75;s:16:"module/pp_button";i:76;s:15:"module/pp_login";i:77;s:18:"module/simple_blog";i:78;s:27:"module/simple_blog_category";i:79;s:16:"module/slideshow";i:80;s:14:"module/special";i:81;s:12:"module/store";i:82;s:14:"openbay/amazon";i:83;s:22:"openbay/amazon_listing";i:84;s:22:"openbay/amazon_product";i:85;s:16:"openbay/amazonus";i:86;s:24:"openbay/amazonus_listing";i:87;s:24:"openbay/amazonus_product";i:88;s:12:"openbay/ebay";i:89;s:20:"openbay/ebay_profile";i:90;s:21:"openbay/ebay_template";i:91;s:12:"openbay/etsy";i:92;s:20:"openbay/etsy_product";i:93;s:21:"openbay/etsy_shipping";i:94;s:17:"openbay/etsy_shop";i:95;s:23:"payment/amazon_checkout";i:96;s:24:"payment/amazon_login_pay";i:97;s:24:"payment/authorizenet_aim";i:98;s:24:"payment/authorizenet_sim";i:99;s:21:"payment/bank_transfer";i:100;s:22:"payment/bluepay_hosted";i:101;s:24:"payment/bluepay_redirect";i:102;s:14:"payment/cheque";i:103;s:11:"payment/cod";i:104;s:17:"payment/firstdata";i:105;s:24:"payment/firstdata_remote";i:106;s:21:"payment/free_checkout";i:107;s:14:"payment/g2apay";i:108;s:17:"payment/globalpay";i:109;s:24:"payment/globalpay_remote";i:110;s:22:"payment/klarna_account";i:111;s:22:"payment/klarna_invoice";i:112;s:14:"payment/liqpay";i:113;s:14:"payment/nochex";i:114;s:15:"payment/paymate";i:115;s:16:"payment/paypoint";i:116;s:13:"payment/payza";i:117;s:26:"payment/perpetual_payments";i:118;s:18:"payment/pp_express";i:119;s:18:"payment/pp_payflow";i:120;s:25:"payment/pp_payflow_iframe";i:121;s:14:"payment/pp_pro";i:122;s:21:"payment/pp_pro_iframe";i:123;s:19:"payment/pp_standard";i:124;s:14:"payment/realex";i:125;s:21:"payment/realex_remote";i:126;s:22:"payment/sagepay_direct";i:127;s:22:"payment/sagepay_server";i:128;s:18:"payment/sagepay_us";i:129;s:24:"payment/securetrading_pp";i:130;s:24:"payment/securetrading_ws";i:131;s:14:"payment/skrill";i:132;s:19:"payment/twocheckout";i:133;s:28:"payment/web_payment_software";i:134;s:16:"payment/worldpay";i:135;s:15:"report/PHPExcel";i:136;s:16:"report/affiliate";i:137;s:25:"report/affiliate_activity";i:138;s:22:"report/affiliate_login";i:139;s:24:"report/customer_activity";i:140;s:22:"report/customer_credit";i:141;s:21:"report/customer_login";i:142;s:22:"report/customer_online";i:143;s:21:"report/customer_order";i:144;s:23:"report/customer_package";i:145;s:22:"report/customer_profit";i:146;s:22:"report/customer_reward";i:147;s:23:"report/exportCommission";i:148;s:21:"report/exportCustomer";i:149;s:20:"report/exportPackage";i:150;s:19:"report/exportProfit";i:151;s:16:"report/marketing";i:152;s:24:"report/product_purchased";i:153;s:21:"report/product_viewed";i:154;s:18:"report/sale_coupon";i:155;s:17:"report/sale_order";i:156;s:18:"report/sale_return";i:157;s:20:"report/sale_shipping";i:158;s:15:"report/sale_tax";i:159;s:17:"sale/custom_field";i:160;s:13:"sale/customer";i:161;s:20:"sale/customer_ban_ip";i:162;s:19:"sale/customer_group";i:163;s:10:"sale/order";i:164;s:14:"sale/recurring";i:165;s:11:"sale/return";i:166;s:12:"sale/voucher";i:167;s:18:"sale/voucher_theme";i:168;s:15:"setting/setting";i:169;s:13:"setting/store";i:170;s:16:"shipping/auspost";i:171;s:17:"shipping/citylink";i:172;s:14:"shipping/fedex";i:173;s:13:"shipping/flat";i:174;s:13:"shipping/free";i:175;s:13:"shipping/item";i:176;s:23:"shipping/parcelforce_48";i:177;s:15:"shipping/pickup";i:178;s:19:"shipping/royal_mail";i:179;s:12:"shipping/ups";i:180;s:13:"shipping/usps";i:181;s:15:"shipping/weight";i:182;s:19:"simple_blog/article";i:183;s:18:"simple_blog/author";i:184;s:20:"simple_blog/category";i:185;s:19:"simple_blog/comment";i:186;s:19:"simple_blog/install";i:187;s:18:"simple_blog/report";i:188;s:11:"tool/backup";i:189;s:14:"tool/error_log";i:190;s:11:"tool/upload";i:191;s:12:"total/coupon";i:192;s:12:"total/credit";i:193;s:14:"total/handling";i:194;s:16:"total/klarna_fee";i:195;s:19:"total/low_order_fee";i:196;s:12:"total/reward";i:197;s:14:"total/shipping";i:198;s:15:"total/sub_total";i:199;s:9:"total/tax";i:200;s:11:"total/total";i:201;s:13:"total/voucher";i:202;s:8:"user/api";i:203;s:9:"user/user";i:204;s:20:"user/user_permission";}s:6:"modify";a:205:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:14:"catalog/filter";i:5;s:19:"catalog/information";i:6;s:20:"catalog/manufacturer";i:7;s:14:"catalog/option";i:8;s:15:"catalog/product";i:9;s:17:"catalog/recurring";i:10;s:14:"catalog/review";i:11;s:18:"common/column_left";i:12;s:18:"common/filemanager";i:13;s:11:"common/menu";i:14;s:14:"common/profile";i:15;s:12:"common/stats";i:16;s:16:"dashboard/banner";i:17;s:23:"dashboard/banner_config";i:18;s:14:"dashboard/cart";i:19;s:26:"dashboard/customer_account";i:20;s:13:"design/banner";i:21;s:13:"design/layout";i:22;s:14:"extension/feed";i:23;s:15:"extension/fraud";i:24;s:19:"extension/installer";i:25;s:22:"extension/modification";i:26;s:16:"extension/module";i:27;s:17:"extension/openbay";i:28;s:17:"extension/payment";i:29;s:18:"extension/shipping";i:30;s:15:"extension/total";i:31;s:16:"feed/google_base";i:32;s:19:"feed/google_sitemap";i:33;s:15:"feed/openbaypro";i:34;s:18:"fraud/fraudlabspro";i:35;s:13:"fraud/maxmind";i:36;s:20:"localisation/country";i:37;s:21:"localisation/currency";i:38;s:21:"localisation/geo_zone";i:39;s:21:"localisation/language";i:40;s:25:"localisation/length_class";i:41;s:21:"localisation/location";i:42;s:25:"localisation/order_status";i:43;s:26:"localisation/return_action";i:44;s:26:"localisation/return_reason";i:45;s:26:"localisation/return_status";i:46;s:25:"localisation/stock_status";i:47;s:22:"localisation/tax_class";i:48;s:21:"localisation/tax_rate";i:49;s:25:"localisation/weight_class";i:50;s:17:"localisation/zone";i:51;s:19:"marketing/affiliate";i:52;s:17:"marketing/contact";i:53;s:16:"marketing/coupon";i:54;s:19:"marketing/marketing";i:55;s:14:"module/account";i:56;s:18:"module/accountleft";i:57;s:19:"module/accountright";i:58;s:16:"module/affiliate";i:59;s:20:"module/amazon_button";i:60;s:19:"module/amazon_login";i:61;s:17:"module/amazon_pay";i:62;s:13:"module/banner";i:63;s:18:"module/banner_left";i:64;s:19:"module/banner_right";i:65;s:17:"module/bestseller";i:66;s:15:"module/carousel";i:67;s:15:"module/category";i:68;s:19:"module/ebay_listing";i:69;s:15:"module/featured";i:70;s:13:"module/filter";i:71;s:22:"module/google_hangouts";i:72;s:11:"module/html";i:73;s:18:"module/information";i:74;s:13:"module/latest";i:75;s:16:"module/pp_button";i:76;s:15:"module/pp_login";i:77;s:18:"module/simple_blog";i:78;s:27:"module/simple_blog_category";i:79;s:16:"module/slideshow";i:80;s:14:"module/special";i:81;s:12:"module/store";i:82;s:14:"openbay/amazon";i:83;s:22:"openbay/amazon_listing";i:84;s:22:"openbay/amazon_product";i:85;s:16:"openbay/amazonus";i:86;s:24:"openbay/amazonus_listing";i:87;s:24:"openbay/amazonus_product";i:88;s:12:"openbay/ebay";i:89;s:20:"openbay/ebay_profile";i:90;s:21:"openbay/ebay_template";i:91;s:12:"openbay/etsy";i:92;s:20:"openbay/etsy_product";i:93;s:21:"openbay/etsy_shipping";i:94;s:17:"openbay/etsy_shop";i:95;s:23:"payment/amazon_checkout";i:96;s:24:"payment/amazon_login_pay";i:97;s:24:"payment/authorizenet_aim";i:98;s:24:"payment/authorizenet_sim";i:99;s:21:"payment/bank_transfer";i:100;s:22:"payment/bluepay_hosted";i:101;s:24:"payment/bluepay_redirect";i:102;s:14:"payment/cheque";i:103;s:11:"payment/cod";i:104;s:17:"payment/firstdata";i:105;s:24:"payment/firstdata_remote";i:106;s:21:"payment/free_checkout";i:107;s:14:"payment/g2apay";i:108;s:17:"payment/globalpay";i:109;s:24:"payment/globalpay_remote";i:110;s:22:"payment/klarna_account";i:111;s:22:"payment/klarna_invoice";i:112;s:14:"payment/liqpay";i:113;s:14:"payment/nochex";i:114;s:15:"payment/paymate";i:115;s:16:"payment/paypoint";i:116;s:13:"payment/payza";i:117;s:26:"payment/perpetual_payments";i:118;s:18:"payment/pp_express";i:119;s:18:"payment/pp_payflow";i:120;s:25:"payment/pp_payflow_iframe";i:121;s:14:"payment/pp_pro";i:122;s:21:"payment/pp_pro_iframe";i:123;s:19:"payment/pp_standard";i:124;s:14:"payment/realex";i:125;s:21:"payment/realex_remote";i:126;s:22:"payment/sagepay_direct";i:127;s:22:"payment/sagepay_server";i:128;s:18:"payment/sagepay_us";i:129;s:24:"payment/securetrading_pp";i:130;s:24:"payment/securetrading_ws";i:131;s:14:"payment/skrill";i:132;s:19:"payment/twocheckout";i:133;s:28:"payment/web_payment_software";i:134;s:16:"payment/worldpay";i:135;s:15:"report/PHPExcel";i:136;s:16:"report/affiliate";i:137;s:25:"report/affiliate_activity";i:138;s:22:"report/affiliate_login";i:139;s:24:"report/customer_activity";i:140;s:22:"report/customer_credit";i:141;s:21:"report/customer_login";i:142;s:22:"report/customer_online";i:143;s:21:"report/customer_order";i:144;s:23:"report/customer_package";i:145;s:22:"report/customer_profit";i:146;s:22:"report/customer_reward";i:147;s:23:"report/exportCommission";i:148;s:21:"report/exportCustomer";i:149;s:20:"report/exportPackage";i:150;s:19:"report/exportProfit";i:151;s:16:"report/marketing";i:152;s:24:"report/product_purchased";i:153;s:21:"report/product_viewed";i:154;s:18:"report/sale_coupon";i:155;s:17:"report/sale_order";i:156;s:18:"report/sale_return";i:157;s:20:"report/sale_shipping";i:158;s:15:"report/sale_tax";i:159;s:17:"sale/custom_field";i:160;s:13:"sale/customer";i:161;s:20:"sale/customer_ban_ip";i:162;s:19:"sale/customer_group";i:163;s:10:"sale/order";i:164;s:14:"sale/recurring";i:165;s:11:"sale/return";i:166;s:12:"sale/voucher";i:167;s:18:"sale/voucher_theme";i:168;s:15:"setting/setting";i:169;s:13:"setting/store";i:170;s:16:"shipping/auspost";i:171;s:17:"shipping/citylink";i:172;s:14:"shipping/fedex";i:173;s:13:"shipping/flat";i:174;s:13:"shipping/free";i:175;s:13:"shipping/item";i:176;s:23:"shipping/parcelforce_48";i:177;s:15:"shipping/pickup";i:178;s:19:"shipping/royal_mail";i:179;s:12:"shipping/ups";i:180;s:13:"shipping/usps";i:181;s:15:"shipping/weight";i:182;s:19:"simple_blog/article";i:183;s:18:"simple_blog/author";i:184;s:20:"simple_blog/category";i:185;s:19:"simple_blog/comment";i:186;s:19:"simple_blog/install";i:187;s:18:"simple_blog/report";i:188;s:11:"tool/backup";i:189;s:14:"tool/error_log";i:190;s:11:"tool/upload";i:191;s:12:"total/coupon";i:192;s:12:"total/credit";i:193;s:14:"total/handling";i:194;s:16:"total/klarna_fee";i:195;s:19:"total/low_order_fee";i:196;s:12:"total/reward";i:197;s:14:"total/shipping";i:198;s:15:"total/sub_total";i:199;s:9:"total/tax";i:200;s:11:"total/total";i:201;s:13:"total/voucher";i:202;s:8:"user/api";i:203;s:9:"user/user";i:204;s:20:"user/user_permission";}}'),
(10, 'Kế toán (account)', 'a:2:{s:6:"access";a:3:{i:0;s:19:"catalog/information";i:1;s:21:"report/exportCustomer";i:2;s:13:"sale/customer";}s:6:"modify";a:3:{i:0;s:19:"catalog/information";i:1;s:21:"report/exportCustomer";i:2;s:13:"sale/customer";}}');

-- --------------------------------------------------------

--
-- Structure de la table `sm_voucher`
--

CREATE TABLE IF NOT EXISTS `sm_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_voucher_history`
--

CREATE TABLE IF NOT EXISTS `sm_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sm_voucher_theme`
--

CREATE TABLE IF NOT EXISTS `sm_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `sm_voucher_theme`
--

INSERT INTO `sm_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `sm_voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `sm_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sm_voucher_theme_description`
--

INSERT INTO `sm_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General'),
(6, 2, 'Christmas'),
(7, 2, 'Birthday'),
(8, 2, 'General');

-- --------------------------------------------------------

--
-- Structure de la table `sm_weight_class`
--

CREATE TABLE IF NOT EXISTS `sm_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `sm_weight_class`
--

INSERT INTO `sm_weight_class` (`weight_class_id`, `value`) VALUES
(1, 1.00000000),
(2, 1000.00000000),
(5, 2.20460000),
(6, 35.27400000);

-- --------------------------------------------------------

--
-- Structure de la table `sm_weight_class_description`
--

CREATE TABLE IF NOT EXISTS `sm_weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `sm_weight_class_description`
--

INSERT INTO `sm_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz'),
(1, 2, 'Kilogram', 'kg'),
(2, 2, 'Gram', 'g'),
(5, 2, 'Pound ', 'lb'),
(6, 2, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Structure de la table `sm_zone`
--

CREATE TABLE IF NOT EXISTS `sm_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4231 ;

--
-- Contenu de la table `sm_zone`
--

INSERT INTO `sm_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M''Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu''a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Aragatsotn', 'AGT', 1),
(181, 11, 'Ararat', 'ARR', 1),
(182, 11, 'Armavir', 'ARM', 1),
(183, 11, 'Geghark''unik''', 'GEG', 1),
(184, 11, 'Kotayk''', 'KOT', 1),
(185, 11, 'Lorri', 'LOR', 1),
(186, 11, 'Shirak', 'SHI', 1),
(187, 11, 'Syunik''', 'SYU', 1),
(188, 11, 'Tavush', 'TAV', 1),
(189, 11, 'Vayots'' Dzor', 'VAY', 1),
(190, 11, 'Yerevan', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Nieder&ouml;sterreich', 'NOS', 1),
(202, 14, 'Ober&ouml;sterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore''s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Brestskaya (Brest)', 'BR', 1),
(338, 20, 'Homyel''skaya (Homyel'')', 'HO', 1),
(339, 20, 'Horad Minsk', 'HM', 1),
(340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 1),
(341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 1),
(342, 20, 'Minskaya', 'MI', 1),
(343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George''s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith''s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M''Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O''Higgins', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chilena', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovarsko-bilogorska', 'BB', 1),
(848, 53, 'Grad Zagreb', 'GZ', 1),
(849, 53, 'Dubrovačko-neretvanska', 'DN', 1),
(850, 53, 'Istarska', 'IS', 1),
(851, 53, 'Karlovačka', 'KA', 1),
(852, 53, 'Koprivničko-križevačka', 'KK', 1),
(853, 53, 'Krapinsko-zagorska', 'KZ', 1),
(854, 53, 'Ličko-senjska', 'LS', 1),
(855, 53, 'Međimurska', 'ME', 1),
(856, 53, 'Osječko-baranjska', 'OB', 1),
(857, 53, 'Požeško-slavonska', 'PS', 1),
(858, 53, 'Primorsko-goranska', 'PG', 1),
(859, 53, 'Šibensko-kninska', 'SK', 1),
(860, 53, 'Sisačko-moslavačka', 'SM', 1),
(861, 53, 'Brodsko-posavska', 'BP', 1),
(862, 53, 'Splitsko-dalmatinska', 'SD', 1),
(863, 53, 'Varaždinska', 'VA', 1),
(864, 53, 'Virovitičko-podravska', 'VP', 1),
(865, 53, 'Vukovarsko-srijemska', 'VS', 1),
(866, 53, 'Zadarska', 'ZA', 1),
(867, 53, 'Zagrebačka', 'ZG', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '''Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma''iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa''id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina''', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina''', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 1),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 1),
(1087, 72, 'Itä-Suomen lääni', 'IS', 1),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 1),
(1089, 72, 'Lapin lääni', 'LA', 1),
(1090, 72, 'Oulun lääni', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d''Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-W&uuml;rttemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Th&uuml;ringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand''Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Pondicherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'BoDeTaBek', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta Raya', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1),
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta''mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1);
INSERT INTO `sm_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be''er Sheva', 'BS', 1),
(1613, 104, 'Bika''at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '''Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al ''Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa''', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa''', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma''an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Almaty', 'AL', 1),
(1717, 109, 'Almaty City', 'AC', 1),
(1718, 109, 'Aqmola', 'AM', 1),
(1719, 109, 'Aqtobe', 'AQ', 1),
(1720, 109, 'Astana City', 'AS', 1),
(1721, 109, 'Atyrau', 'AT', 1),
(1722, 109, 'Batys Qazaqstan', 'BA', 1),
(1723, 109, 'Bayqongyr City', 'BY', 1),
(1724, 109, 'Mangghystau', 'MA', 1),
(1725, 109, 'Ongtustik Qazaqstan', 'ON', 1),
(1726, 109, 'Pavlodar', 'PA', 1),
(1727, 109, 'Qaraghandy', 'QA', 1),
(1728, 109, 'Qostanay', 'QO', 1),
(1729, 109, 'Qyzylorda', 'QY', 1),
(1730, 109, 'Shyghys Qazaqstan', 'SH', 1),
(1731, 109, 'Soltustik Qazaqstan', 'SO', 1),
(1732, 109, 'Zhambyl', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P''yongan-bukto', 'PYB', 1),
(1769, 112, 'P''yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P''yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch''ungch''ong-bukto', 'CO', 1),
(1774, 113, 'Ch''ungch''ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch''on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t''ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al ''Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra''', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale''s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha''s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al ''Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati''', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'MY-01', 1),
(1972, 129, 'Kedah', 'MY-02', 1),
(1973, 129, 'Kelantan', 'MY-03', 1),
(1974, 129, 'Labuan', 'MY-15', 1),
(1975, 129, 'Melaka', 'MY-04', 1),
(1976, 129, 'Negeri Sembilan', 'MY-05', 1),
(1977, 129, 'Pahang', 'MY-06', 1),
(1978, 129, 'Perak', 'MY-08', 1),
(1979, 129, 'Perlis', 'MY-09', 1),
(1980, 129, 'Pulau Pinang', 'MY-07', 1),
(1981, 129, 'Sabah', 'MY-12', 1),
(1982, 129, 'Sarawak', 'MY-13', 1),
(1983, 129, 'Selangor', 'MY-10', 1),
(1984, 129, 'Terengganu', 'MY-11', 1),
(1985, 129, 'Kuala Lumpur', 'MY-14', 1),
(4035, 129, 'Putrajaya', 'MY-16', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord Brabant', 'NB', 1),
(2336, 150, 'Noord Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke''s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa''id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Abakan', 'AB', 1),
(2722, 176, 'Aginskoye', 'AG', 1),
(2723, 176, 'Anadyr', 'AN', 1),
(2724, 176, 'Arkahangelsk', 'AR', 1),
(2725, 176, 'Astrakhan', 'AS', 1),
(2726, 176, 'Barnaul', 'BA', 1),
(2727, 176, 'Belgorod', 'BE', 1),
(2728, 176, 'Birobidzhan', 'BI', 1),
(2729, 176, 'Blagoveshchensk', 'BL', 1),
(2730, 176, 'Bryansk', 'BR', 1),
(2731, 176, 'Cheboksary', 'CH', 1),
(2732, 176, 'Chelyabinsk', 'CL', 1),
(2733, 176, 'Cherkessk', 'CR', 1),
(2734, 176, 'Chita', 'CI', 1),
(2735, 176, 'Dudinka', 'DU', 1),
(2736, 176, 'Elista', 'EL', 1),
(2737, 176, 'Gomo-Altaysk', 'GO', 1),
(2738, 176, 'Gorno-Altaysk', 'GA', 1),
(2739, 176, 'Groznyy', 'GR', 1),
(2740, 176, 'Irkutsk', 'IR', 1),
(2741, 176, 'Ivanovo', 'IV', 1),
(2742, 176, 'Izhevsk', 'IZ', 1),
(2743, 176, 'Kalinigrad', 'KA', 1),
(2744, 176, 'Kaluga', 'KL', 1),
(2745, 176, 'Kasnodar', 'KS', 1),
(2746, 176, 'Kazan', 'KZ', 1),
(2747, 176, 'Kemerovo', 'KE', 1),
(2748, 176, 'Khabarovsk', 'KH', 1),
(2749, 176, 'Khanty-Mansiysk', 'KM', 1),
(2750, 176, 'Kostroma', 'KO', 1),
(2751, 176, 'Krasnodar', 'KR', 1),
(2752, 176, 'Krasnoyarsk', 'KN', 1),
(2753, 176, 'Kudymkar', 'KU', 1),
(2754, 176, 'Kurgan', 'KG', 1),
(2755, 176, 'Kursk', 'KK', 1),
(2756, 176, 'Kyzyl', 'KY', 1),
(2757, 176, 'Lipetsk', 'LI', 1),
(2758, 176, 'Magadan', 'MA', 1),
(2759, 176, 'Makhachkala', 'MK', 1),
(2760, 176, 'Maykop', 'MY', 1),
(2761, 176, 'Moscow', 'MO', 1),
(2762, 176, 'Murmansk', 'MU', 1),
(2763, 176, 'Nalchik', 'NA', 1),
(2764, 176, 'Naryan Mar', 'NR', 1),
(2765, 176, 'Nazran', 'NZ', 1),
(2766, 176, 'Nizhniy Novgorod', 'NI', 1),
(2767, 176, 'Novgorod', 'NO', 1),
(2768, 176, 'Novosibirsk', 'NV', 1),
(2769, 176, 'Omsk', 'OM', 1),
(2770, 176, 'Orel', 'OR', 1),
(2771, 176, 'Orenburg', 'OE', 1),
(2772, 176, 'Palana', 'PA', 1),
(2773, 176, 'Penza', 'PE', 1),
(2774, 176, 'Perm', 'PR', 1),
(2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 1),
(2776, 176, 'Petrozavodsk', 'PT', 1),
(2777, 176, 'Pskov', 'PS', 1),
(2778, 176, 'Rostov-na-Donu', 'RO', 1),
(2779, 176, 'Ryazan', 'RY', 1),
(2780, 176, 'Salekhard', 'SL', 1),
(2781, 176, 'Samara', 'SA', 1),
(2782, 176, 'Saransk', 'SR', 1),
(2783, 176, 'Saratov', 'SV', 1),
(2784, 176, 'Smolensk', 'SM', 1),
(2785, 176, 'St. Petersburg', 'SP', 1),
(2786, 176, 'Stavropol', 'ST', 1),
(2787, 176, 'Syktyvkar', 'SY', 1),
(2788, 176, 'Tambov', 'TA', 1),
(2789, 176, 'Tomsk', 'TO', 1),
(2790, 176, 'Tula', 'TU', 1),
(2791, 176, 'Tura', 'TR', 1),
(2792, 176, 'Tver', 'TV', 1),
(2793, 176, 'Tyumen', 'TY', 1),
(2794, 176, 'Ufa', 'UF', 1),
(2795, 176, 'Ul''yanovsk', 'UL', 1),
(2796, 176, 'Ulan-Ude', 'UU', 1),
(2797, 176, 'Ust''-Ordynskiy', 'US', 1),
(2798, 176, 'Vladikavkaz', 'VL', 1),
(2799, 176, 'Vladimir', 'VA', 1),
(2800, 176, 'Vladivostok', 'VV', 1),
(2801, 176, 'Volgograd', 'VG', 1),
(2802, 176, 'Vologda', 'VD', 1),
(2803, 176, 'Voronezh', 'VO', 1),
(2804, 176, 'Vyatka', 'VY', 1),
(2805, 176, 'Yakutsk', 'YA', 1),
(2806, 176, 'Yaroslavl', 'YR', 1),
(2807, 176, 'Yekaterinburg', 'YE', 1),
(2808, 176, 'Yoshkar-Ola', 'YO', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A''ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa''asaleleaga', 'FA', 1),
(2856, 181, 'Gaga''emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa''itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va''a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '''Asir', 'AS', 1),
(2882, 184, 'Ha''il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand'' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand'' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3034, 199, 'A''ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa''iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa''iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'G&auml;vleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'J&auml;mtland', 'Z', 1),
(3080, 203, 'J&ouml;nk&ouml;ping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, '&Ouml;rebro', 'T', 1),
(3085, 203, '&Ouml;sterg&ouml;tland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'S&ouml;dermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'V&auml;rmland', 'S', 1),
(3091, 203, 'V&auml;sterbotten', 'AC', 1),
(3092, 203, 'V&auml;sternorrland', 'Y', 1),
(3093, 203, 'V&auml;stmanland', 'U', 1),
(3094, 203, 'V&auml;stra G&ouml;taland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graub&uuml;nden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Z&uuml;rich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1);
INSERT INTO `sm_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1),
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t''ou', 'NT', 1),
(3145, 206, 'P''eng-hu', 'PH', 1),
(3146, 206, 'P''ing-tung', 'PT', 1),
(3147, 206, 'T''ai-chung', 'TG', 1),
(3148, 206, 'T''ai-nan', 'TA', 1),
(3149, 206, 'T''ai-pei county', 'TP', 1),
(3150, 206, 'T''ai-tung', 'TT', 1),
(3151, 206, 'T''ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T''ai-chung', 'TH', 1),
(3157, 206, 'T''ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T''ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha''apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava''u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakır', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Cherkas''ka Oblast''', '71', 1),
(3481, 220, 'Chernihivs''ka Oblast''', '74', 1),
(3482, 220, 'Chernivets''ka Oblast''', '77', 1),
(3483, 220, 'Crimea', '43', 1),
(3484, 220, 'Dnipropetrovs''ka Oblast''', '12', 1),
(3485, 220, 'Donets''ka Oblast''', '14', 1),
(3486, 220, 'Ivano-Frankivs''ka Oblast''', '26', 1),
(3487, 220, 'Khersons''ka Oblast''', '65', 1),
(3488, 220, 'Khmel''nyts''ka Oblast''', '68', 1),
(3489, 220, 'Kirovohrads''ka Oblast''', '35', 1),
(3490, 220, 'Kyiv', '30', 1),
(3491, 220, 'Kyivs''ka Oblast''', '32', 1),
(3492, 220, 'Luhans''ka Oblast''', '09', 1),
(3493, 220, 'L''vivs''ka Oblast''', '46', 1),
(3494, 220, 'Mykolayivs''ka Oblast''', '48', 1),
(3495, 220, 'Odes''ka Oblast''', '51', 1),
(3496, 220, 'Poltavs''ka Oblast''', '53', 1),
(3497, 220, 'Rivnens''ka Oblast''', '56', 1),
(3498, 220, 'Sevastopol''', '40', 1),
(3499, 220, 'Sums''ka Oblast''', '59', 1),
(3500, 220, 'Ternopil''s''ka Oblast''', '61', 1),
(3501, 220, 'Vinnyts''ka Oblast''', '05', 1),
(3502, 220, 'Volyns''ka Oblast''', '07', 1),
(3503, 220, 'Zakarpats''ka Oblast''', '21', 1),
(3504, 220, 'Zaporiz''ka Oblast''', '23', 1),
(3505, 220, 'Zhytomyrs''ka oblast''', '18', 1),
(3506, 221, 'Abu Dhabi', 'ADH', 1),
(3507, 221, '''Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubai', 'DU', 1),
(3511, 221, 'R''as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg''ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog''iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma''rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa''dah', 'SD', 1),
(3805, 235, 'San''a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta''izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 1),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 1),
(4038, 117, 'Aizkraukles novads', '0320200', 1),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 1),
(4040, 117, 'Aizputes novads', '0640600', 1),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 1),
(4042, 117, 'Aknīstes novads', '0560800', 1),
(4043, 117, 'Aloja, Alojas novads', '0661007', 1),
(4044, 117, 'Alojas novads', '0661000', 1),
(4045, 117, 'Alsungas novads', '0624200', 1),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 1),
(4047, 117, 'Alūksnes novads', '0360200', 1),
(4048, 117, 'Amatas novads', '0424701', 1),
(4049, 117, 'Ape, Apes novads', '0360805', 1),
(4050, 117, 'Apes novads', '0360800', 1),
(4051, 117, 'Auce, Auces novads', '0460805', 1),
(4052, 117, 'Auces novads', '0460800', 1),
(4053, 117, 'Ādažu novads', '0804400', 1),
(4054, 117, 'Babītes novads', '0804900', 1),
(4055, 117, 'Baldone, Baldones novads', '0800605', 1),
(4056, 117, 'Baldones novads', '0800600', 1),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 1),
(4058, 117, 'Baltinavas novads', '0384400', 1),
(4059, 117, 'Balvi, Balvu novads', '0380201', 1),
(4060, 117, 'Balvu novads', '0380200', 1),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 1),
(4062, 117, 'Bauskas novads', '0400200', 1),
(4063, 117, 'Beverīnas novads', '0964700', 1),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 1),
(4065, 117, 'Brocēnu novads', '0840601', 1),
(4066, 117, 'Burtnieku novads', '0967101', 1),
(4067, 117, 'Carnikavas novads', '0805200', 1),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 1),
(4069, 117, 'Cesvaines novads', '0700800', 1),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 1),
(4071, 117, 'Cēsu novads', '0420200', 1),
(4072, 117, 'Ciblas novads', '0684901', 1),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 1),
(4074, 117, 'Dagdas novads', '0601000', 1),
(4075, 117, 'Daugavpils', '0050000', 1),
(4076, 117, 'Daugavpils novads', '0440200', 1),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 1),
(4078, 117, 'Dobeles novads', '0460200', 1),
(4079, 117, 'Dundagas novads', '0885100', 1),
(4080, 117, 'Durbe, Durbes novads', '0640807', 1),
(4081, 117, 'Durbes novads', '0640801', 1),
(4082, 117, 'Engures novads', '0905100', 1),
(4083, 117, 'Ērgļu novads', '0705500', 1),
(4084, 117, 'Garkalnes novads', '0806000', 1),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 1),
(4086, 117, 'Grobiņas novads', '0641000', 1),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 1),
(4088, 117, 'Gulbenes novads', '0500200', 1),
(4089, 117, 'Iecavas novads', '0406400', 1),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 1),
(4091, 117, 'Ikšķiles novads', '0740600', 1),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 1),
(4093, 117, 'Ilūkstes novads', '0440801', 1),
(4094, 117, 'Inčukalna novads', '0801800', 1),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 1),
(4096, 117, 'Jaunjelgavas novads', '0321000', 1),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 1),
(4098, 117, 'Jaunpils novads', '0905700', 1),
(4099, 117, 'Jelgava', '0090000', 1),
(4100, 117, 'Jelgavas novads', '0540200', 1),
(4101, 117, 'Jēkabpils', '0110000', 1),
(4102, 117, 'Jēkabpils novads', '0560200', 1),
(4103, 117, 'Jūrmala', '0130000', 1),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 1),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 1),
(4106, 117, 'Kandavas novads', '0901201', 1),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 1),
(4108, 117, 'Kārsavas novads', '0681000', 1),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 1),
(4110, 117, 'Kokneses novads', '0326100', 1),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 1),
(4112, 117, 'Krāslavas novads', '0600202', 1),
(4113, 117, 'Krimuldas novads', '0806900', 1),
(4114, 117, 'Krustpils novads', '0566900', 1),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 1),
(4116, 117, 'Kuldīgas novads', '0620200', 1),
(4117, 117, 'Ķeguma novads', '0741001', 1),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 1),
(4119, 117, 'Ķekavas novads', '0800800', 1),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 1),
(4121, 117, 'Lielvārdes novads', '0741401', 1),
(4122, 117, 'Liepāja', '0170000', 1),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 1),
(4124, 117, 'Limbažu novads', '0660200', 1),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 1),
(4126, 117, 'Līgatnes novads', '0421200', 1),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 1),
(4128, 117, 'Līvānu novads', '0761201', 1),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 1),
(4130, 117, 'Lubānas novads', '0701400', 1),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 1),
(4132, 117, 'Ludzas novads', '0680200', 1),
(4133, 117, 'Madona, Madonas novads', '0700201', 1),
(4134, 117, 'Madonas novads', '0700200', 1),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 1),
(4136, 117, 'Mazsalacas novads', '0961000', 1),
(4137, 117, 'Mālpils novads', '0807400', 1),
(4138, 117, 'Mārupes novads', '0807600', 1),
(4139, 117, 'Mērsraga novads', '0887600', 1),
(4140, 117, 'Naukšēnu novads', '0967300', 1),
(4141, 117, 'Neretas novads', '0327100', 1),
(4142, 117, 'Nīcas novads', '0647900', 1),
(4143, 117, 'Ogre, Ogres novads', '0740201', 1),
(4144, 117, 'Ogres novads', '0740202', 1),
(4145, 117, 'Olaine, Olaines novads', '0801009', 1),
(4146, 117, 'Olaines novads', '0801000', 1),
(4147, 117, 'Ozolnieku novads', '0546701', 1),
(4148, 117, 'Pārgaujas novads', '0427500', 1),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 1),
(4150, 117, 'Pāvilostas novads', '0641401', 1),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 1),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 1),
(4153, 117, 'Pļaviņu novads', '0321400', 1),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 1),
(4155, 117, 'Preiļu novads', '0760202', 1),
(4156, 117, 'Priekule, Priekules novads', '0641615', 1),
(4157, 117, 'Priekules novads', '0641600', 1),
(4158, 117, 'Priekuļu novads', '0427300', 1),
(4159, 117, 'Raunas novads', '0427700', 1),
(4160, 117, 'Rēzekne', '0210000', 1),
(4161, 117, 'Rēzeknes novads', '0780200', 1),
(4162, 117, 'Riebiņu novads', '0766300', 1),
(4163, 117, 'Rīga', '0010000', 1),
(4164, 117, 'Rojas novads', '0888300', 1),
(4165, 117, 'Ropažu novads', '0808400', 1),
(4166, 117, 'Rucavas novads', '0648500', 1),
(4167, 117, 'Rugāju novads', '0387500', 1),
(4168, 117, 'Rundāles novads', '0407700', 1),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 1),
(4170, 117, 'Rūjienas novads', '0961600', 1),
(4171, 117, 'Sabile, Talsu novads', '0880213', 1),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 1),
(4173, 117, 'Salacgrīvas novads', '0661400', 1),
(4174, 117, 'Salas novads', '0568700', 1),
(4175, 117, 'Salaspils novads', '0801200', 1),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 1),
(4177, 117, 'Saldus novads', '0840200', 1),
(4178, 117, 'Saldus, Saldus novads', '0840201', 1),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 1),
(4180, 117, 'Saulkrastu novads', '0801400', 1),
(4181, 117, 'Seda, Strenču novads', '0941813', 1),
(4182, 117, 'Sējas novads', '0809200', 1),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 1),
(4184, 117, 'Siguldas novads', '0801601', 1),
(4185, 117, 'Skrīveru novads', '0328200', 1),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 1),
(4187, 117, 'Skrundas novads', '0621200', 1),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 1),
(4189, 117, 'Smiltenes novads', '0941600', 1),
(4190, 117, 'Staicele, Alojas novads', '0661017', 1),
(4191, 117, 'Stende, Talsu novads', '0880215', 1),
(4192, 117, 'Stopiņu novads', '0809600', 1),
(4193, 117, 'Strenči, Strenču novads', '0941817', 1),
(4194, 117, 'Strenču novads', '0941800', 1),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 1),
(4196, 117, 'Talsi, Talsu novads', '0880201', 1),
(4197, 117, 'Talsu novads', '0880200', 1),
(4198, 117, 'Tērvetes novads', '0468900', 1),
(4199, 117, 'Tukuma novads', '0900200', 1),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 1),
(4201, 117, 'Vaiņodes novads', '0649300', 1),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 1),
(4203, 117, 'Valka, Valkas novads', '0940201', 1),
(4204, 117, 'Valkas novads', '0940200', 1),
(4205, 117, 'Valmiera', '0250000', 1),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 1),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 1),
(4208, 117, 'Varakļānu novads', '0701800', 1),
(4209, 117, 'Vārkavas novads', '0769101', 1),
(4210, 117, 'Vecpiebalgas novads', '0429300', 1),
(4211, 117, 'Vecumnieku novads', '0409500', 1),
(4212, 117, 'Ventspils', '0270000', 1),
(4213, 117, 'Ventspils novads', '0980200', 1),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 1),
(4215, 117, 'Viesītes novads', '0561800', 1),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 1),
(4217, 117, 'Viļakas novads', '0381600', 1),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 1),
(4219, 117, 'Viļānu novads', '0781800', 1),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 1),
(4221, 117, 'Zilupes novads', '0681801', 1),
(4222, 43, 'Arica y Parinacota', 'AP', 1),
(4223, 43, 'Los Rios', 'LR', 1),
(4224, 220, 'Kharkivs''ka Oblast''', '63', 1),
(4225, 118, 'Beirut', 'LB-BR', 1),
(4226, 118, 'Bekaa', 'LB-BE', 1),
(4227, 118, 'Mount Lebanon', 'LB-ML', 1),
(4228, 118, 'Nabatieh', 'LB-NB', 1),
(4229, 118, 'North', 'LB-NR', 1),
(4230, 118, 'South', 'LB-ST', 1);

-- --------------------------------------------------------

--
-- Structure de la table `sm_zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `sm_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=110 ;

--
-- Contenu de la table `sm_zone_to_geo_zone`
--

INSERT INTO `sm_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 222, 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 222, 3513, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 222, 3514, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 222, 3515, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 222, 3516, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 222, 3517, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 222, 3518, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 222, 3519, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 222, 3520, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 222, 3521, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 222, 3522, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 222, 3523, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 222, 3524, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 222, 3525, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 222, 3526, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 222, 3527, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 222, 3528, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 222, 3529, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 222, 3530, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 222, 3531, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 222, 3532, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 222, 3533, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 222, 3534, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 222, 3535, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 222, 3536, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 222, 3537, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 222, 3538, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 222, 3539, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 222, 3540, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 222, 3541, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 222, 3542, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 222, 3543, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 222, 3544, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 222, 3545, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 222, 3546, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 222, 3547, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 222, 3548, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 222, 3549, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 222, 3550, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 222, 3551, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 222, 3552, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 222, 3553, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 222, 3554, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 222, 3555, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 222, 3556, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 222, 3557, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 222, 3558, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 222, 3559, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 222, 3560, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 222, 3561, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 222, 3562, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 222, 3563, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 222, 3564, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 222, 3565, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 222, 3566, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 222, 3567, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 222, 3568, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 222, 3569, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 222, 3570, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 222, 3571, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 222, 3572, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 222, 3573, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 222, 3574, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 222, 3575, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 222, 3576, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 222, 3577, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 222, 3578, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 222, 3579, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 222, 3580, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 222, 3581, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 222, 3582, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 222, 3583, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 222, 3584, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 222, 3585, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 222, 3586, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 222, 3587, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 222, 3588, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 222, 3589, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 222, 3590, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 222, 3591, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 222, 3592, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 222, 3593, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 222, 3594, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 222, 3595, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 222, 3596, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 222, 3597, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 222, 3598, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 222, 3599, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 222, 3600, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 222, 3601, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 222, 3602, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 222, 3603, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 222, 3604, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 222, 3605, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 222, 3606, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 222, 3607, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 222, 3608, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 222, 3609, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 222, 3610, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 222, 3611, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 222, 3612, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 222, 3949, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 222, 3950, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 222, 3951, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 222, 3952, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 222, 3953, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 222, 3954, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 222, 3955, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 222, 3972, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
