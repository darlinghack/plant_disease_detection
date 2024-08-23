-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 16, 2023 at 12:59 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plantdd_db`
--
CREATE DATABASE IF NOT EXISTS `plantdd_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `plantdd_db`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user'),
(29, 'Can add plant_ image', 8, 'add_plant_image'),
(30, 'Can change plant_ image', 8, 'change_plant_image'),
(31, 'Can delete plant_ image', 8, 'delete_plant_image'),
(32, 'Can view plant_ image', 8, 'view_plant_image');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'user_app', 'user'),
(8, 'user_app', 'plant_image');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-03-15 05:53:29.326501'),
(2, 'auth', '0001_initial', '2023-03-15 05:53:30.269035'),
(3, 'admin', '0001_initial', '2023-03-15 05:53:30.583667'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-03-15 05:53:30.605651'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-03-15 05:53:30.613654'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-03-15 05:53:30.709057'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-03-15 05:53:30.758654'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-03-15 05:53:30.808840'),
(9, 'auth', '0004_alter_user_username_opts', '2023-03-15 05:53:30.815793'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-03-15 05:53:30.858415'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-03-15 05:53:30.859417'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-03-15 05:53:30.866414'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-03-15 05:53:30.919738'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-03-15 05:53:30.957948'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-03-15 05:53:31.008213'),
(16, 'auth', '0011_update_proxy_permissions', '2023-03-15 05:53:31.014235'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-03-15 05:53:31.068958'),
(18, 'sessions', '0001_initial', '2023-03-15 05:53:31.146221'),
(19, 'user_app', '0001_initial', '2023-03-15 05:53:31.184688'),
(20, 'user_app', '0002_user_password_user_profile_pic_alter_user_table', '2023-03-15 05:53:31.265597'),
(21, 'user_app', '0003_user_age', '2023-03-15 05:53:31.313143'),
(22, 'user_app', '0004_user_user_status', '2023-03-15 05:53:31.401156'),
(23, 'user_app', '0005_alter_user_email', '2023-03-15 05:53:31.460301'),
(24, 'user_app', '0006_alter_user_email', '2023-03-15 05:53:35.613307'),
(25, 'user_app', '0007_plant_image', '2023-03-15 10:48:18.479438'),
(26, 'user_app', '0008_plant_image_desc_plant_image_prevent_and_more', '2023-03-15 12:09:40.686828'),
(27, 'user_app', '0009_alter_plant_image_desc', '2023-03-15 12:21:22.908711'),
(28, 'user_app', '0010_remove_plant_image_disease', '2023-03-15 12:33:43.964914'),
(29, 'user_app', '0011_alter_plant_image_prevent_alter_plant_image_title', '2023-03-15 12:39:46.139546'),
(30, 'user_app', '0012_plant_image_s_img_plant_image_s_link_and_more', '2023-03-15 13:10:33.461541'),
(31, 'user_app', '0013_alter_plant_image_s_img', '2023-03-15 13:14:40.591791');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('s85zzm154i3wsedp0cbe5sbotmvuqsl9', 'eyJ1c2VyX2lkIjoxfQ:1pcmwK:NMjH6XF4yupJnUVhOhmuI0dLfIGaCzEq3oSbbYpC2EU', '2023-03-30 12:42:40.154253');

-- --------------------------------------------------------

--
-- Table structure for table `plant details`
--

DROP TABLE IF EXISTS `plant details`;
CREATE TABLE IF NOT EXISTS `plant details` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `user_i_id` int(11) NOT NULL,
  `desc` longtext,
  `prevent` longtext,
  `title` longtext,
  `s_img` longtext,
  `s_link` longtext,
  `s_name` longtext,
  PRIMARY KEY (`img_id`),
  KEY `plant details_user_i_id_5954c95b` (`user_i_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plant details`
--

INSERT INTO `plant details` (`img_id`, `img`, `user_i_id`, `desc`, `prevent`, `title`, `s_img`, `s_link`, `s_name`) VALUES
(44, 'plant image/corn_northen_leaf_blight.JPG', 1, 'Northern corn leaf blight (NCLB) is caused by the fungus Setosphaeria turcica. Symptoms usually appear first on the lower leaves. Leaf lesions are long (1 to 6 inches) and elliptical, gray-green at first but then turn pale gray or tan. Under moist conditions, dark gray spores are produced, usually on the lower leaf surface, which give lesions a \"dirty\" gray appearance. Entire leaves on severely blighted plants can die, so individual lesions are not visible. Lesions may occur on the outer husk of ears, but the kernels are not infected. On hybrids that contain an Ht gene for resistance to the fungus, lesions are smaller, chlorotic, and may develop into linear streaks. These lesions rarely produce spores.', 'Fungicide applications reduced Northern Corn Leaf Blight damage and protected yield. Fungicide value was higher in reducing yield in susceptible corn hybrids. Fungicide were most effective if they were applied at disease onset. Disease onset varied in growth stages, and so the best stage to apply fungicides.', 'Northern Leaf Blight', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRO2FK6IsSuUuQQ0ehzVKIsEdgjCGbMq2nBmOsUp38ajgm8dPwR9MvTBL9_PFRZVRkbtiAzdwP8lwGlrR1c7axKHE6VALk6l3X4Snu9HWFCKpVCFYly65Bs&usqp=CAE', 'https://agribegri.com/products/buy-carbendazim-12--mancozeb-63-online--buy-fungicide-online.php', 'QUIT (Carbendazim 12% + Mancozeb 63% WP) Protective And Curative Fungicide'),
(43, 'plant image/cherry_powdery_mildew.JPG', 1, 'Initial symptoms, often occurring 7 to 10 days after the onset of the first irrigation, are light roughly-circular, powdery looking patches on young, susceptible leaves (newly unfolded, and light green expanding leaves). Older leaves develop an age-related (ontogenic) resistance to powdery mildew and are naturally more resistant to infection than younger leaves. Look for early leaf infections on root suckers, the interior of the canopy or the crotch of the tree where humidity is high. In contrast to other fungi, powdery mildews do not need free water to germinate but germination and fungal growth are favored by high humidity. The disease is more likely to initiate on the undersides (abaxial) of leaves but will occur on both sides at later stages. As the season progresses and infection is spread by wind, leaves may become distorted, curling upward. Severe infections may cause leaves to pucker and twist. Newly developed leaves on new shoots become progressively smaller, are often pale and may be distorted.', 'Disinfect the cutting edges, then prune out and discard the diseased portions of the plant immediately. At the same time, apply fungicides to protect the remaining leaves on the fruit tree. You\'ll need to repeat the fungicide applications according to label instructions to protect the trees over the entire season.', 'Powdery Mildew', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSeHlqcksdF25o8mv-fYxNOrfJkp4Ov2hgVf01w2aCed1WbyL604ubLtPAlB7rfNoHRtxbTljQvA7P3VRh8LM0XndFHWDqvC4kC4w-DLQiknnS3vRzAxTpP&usqp=CAE', 'https://agribegri.com/products/rom-mildew-clean-1-kg--price-of-organic-fungicide-online-.php', 'ROM Mildew Clean'),
(42, 'plant image/blueberry_healthy_6DeT2H1.JPG', 1, 'Blueberries Are Low in Calories But High in Nutrients. ...\nBlueberries are the King of Antioxidant Foods. ...\nBlueberries Reduce DNA Damage, Which May Help Protect Against Aging and Cancer. ...\nBlueberries Protect Cholesterol in Your Blood From Becoming Damaged. ...\nBlueberries May Lower Blood Pressure.', 'Deep, low pH mulch like peat moss, pine needles or well aged sawdust conserves water and minimizes soil water fluctuations. Water blueberry plants during the day. Keep the soil moist but not soggy. Give them at least 1\" per week during growing season and up to 4\" per week during fruit ripening.The blueberry is a shallow-rooted plant. Therefore, it requires a soil that holds moisture, but also drains well and doesn’t stay wet. Don’t plant blueberries in sites that have heavy, clayey soils that stay wet.', 'Healthy', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSW_S8Mrnq0lLnXWCSPPlONkrPbkB8C3Gy9613OGD0ZaejmP5UNRf8LFnXUYJTM64BC1VYLYcYSbSSv-qVTV15RzDJZipvzsikme8oHSEtVX_ZKDiUQpnbHPQ&usqp=CAE', 'https://lazygardener.in/products/greenstix?variant=30920527020087&currency=INR&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic&utm_campaign=gs-2019-10-29&utm_source=google&utm_medium=smart_campaign', 'GreenStix Fertilizer'),
(41, 'plant image/apple_healthy_B9m2S5T.JPG', 1, 'As with most fruit, apples produce best when grown in full sun, which means six or more hours of direct summer Sun daily.The best exposure for apples is a north side of a house, tree line, or rise rather than the south.Apple trees need well-drained soil, but should be able to retain some moisture.', 'Apples Are Nutritious. \nApples May Be Good for Weight Loss.\nApples May Be Good for Your Heart. \nThey\'re Linked to a Lower Risk of Diabetes. \nThey May Have Prebiotic Effects and Promote Good Gut Bacteria.\nSubstances in Apples May Help Prevent Cancer.', 'Healthy', 'https://rukminim1.flixcart.com/image/416/416/kc6jyq80/soil-manure/6/y/v/500-tapti-booster-500-ml-green-yantra-original-imaftd6rrgfhvshc.jpeg?q=70', 'https://agribegri.com/products/tapti-booster-500-ml--organic-fertilizer-online-in-india.php', 'Tapti Booster Organic Fertilizer'),
(40, 'plant image/corn_cercospora_leaf_Oa63guu.JPG', 1, 'Gray leaf spot on corn, caused by the fungus Cercospora zeae-maydis, is a peren- nial and economically damaging disease in the United States. Since the mid-1990s, the disease has increased in importance in Indiana, and now is the one of the most important foliar diseases of corn in the state.Gray leaf spot disease is caused by the fungus Pyricularia grisea, also referred to as Magnaporthe grisea. The frequent warm rainy periods common in Florida create favorable conditions for this fungal disease. This fungus slows grow-in, thins established stands and can kill large areas of St.', 'Irrigate deeply, but infrequently.\nAvoid using post-emergent weed killers on the lawn while the disease is active.\nAvoid medium to high nitrogen fertilizer levels.\nImprove air circulation and light level on lawn.\nMow at the proper height and only mow when the grass is dry.', 'Cercospora Leaf Spot | Gray Leaf Spot', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTm0wIanaB9OdUkuH9IJ-bHG_qyungwi2lWnmkFmze9VFU1yeSuRO3wImAhPfEJwuBZXPSEf5QwZhieERwrlE5H7lg_8bvf&usqp=CAE', 'https://www.bighaat.com/products/antracol?variant=14521365063&currency=INR&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic', 'ANTRACOL FUNGICIDE'),
(39, 'plant image/cherry_healthy_8EZigfC.JPG', 1, 'There is no difference in care between sour and sweet cherries.\nApply mulch to retain moisture.\nDrape netting over trees to protect the fruit from birds.\nWater routinely in dry areas.\nThinning the fruit is not necessary for cherry trees, as they typically thin naturally in early summer.', 'Packed with nutrients.\nRich in antioxidants and anti-inflammatory compounds.\nCan boost exercise recovery.\nMay benefit heart health.\nMay improve symptoms of arthritis and gout.\nMay improve sleep quality.\nEasy to add to your diet.', 'Healthy', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSpHb-xEa2rTSIEf5QtLMbax4zvRsTzD4kAwQ9Rcwr3AbDDQxUhmMmPJBVGLCAvczXrXAqwWKN-rReHwSR-XSGlsJRLvZOKRXHV-54uLhU_6EIuBq5BHXaAwg&usqp=CAE', 'https://plantic.in/products/organic-bloomdrop', 'Plantic Organic BloomDrop Liquid Plant Food '),
(38, 'plant image/blueberry_healthy_bn6tTQ8.JPG', 1, 'Blueberries Are Low in Calories But High in Nutrients. ...\nBlueberries are the King of Antioxidant Foods. ...\nBlueberries Reduce DNA Damage, Which May Help Protect Against Aging and Cancer. ...\nBlueberries Protect Cholesterol in Your Blood From Becoming Damaged. ...\nBlueberries May Lower Blood Pressure.', 'Deep, low pH mulch like peat moss, pine needles or well aged sawdust conserves water and minimizes soil water fluctuations. Water blueberry plants during the day. Keep the soil moist but not soggy. Give them at least 1\" per week during growing season and up to 4\" per week during fruit ripening.The blueberry is a shallow-rooted plant. Therefore, it requires a soil that holds moisture, but also drains well and doesn’t stay wet. Don’t plant blueberries in sites that have heavy, clayey soils that stay wet.', 'Healthy', 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSW_S8Mrnq0lLnXWCSPPlONkrPbkB8C3Gy9613OGD0ZaejmP5UNRf8LFnXUYJTM64BC1VYLYcYSbSSv-qVTV15RzDJZipvzsikme8oHSEtVX_ZKDiUQpnbHPQ&usqp=CAE', 'https://lazygardener.in/products/greenstix?variant=30920527020087&currency=INR&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic&utm_campaign=gs-2019-10-29&utm_source=google&utm_medium=smart_campaign', 'GreenStix Fertilizer'),
(36, 'plant image/apple_healthy_r5kHTGG.JPG', 1, 'As with most fruit, apples produce best when grown in full sun, which means six or more hours of direct summer Sun daily.The best exposure for apples is a north side of a house, tree line, or rise rather than the south.Apple trees need well-drained soil, but should be able to retain some moisture.', 'Apples Are Nutritious. \nApples May Be Good for Weight Loss.\nApples May Be Good for Your Heart. \nThey\'re Linked to a Lower Risk of Diabetes. \nThey May Have Prebiotic Effects and Promote Good Gut Bacteria.\nSubstances in Apples May Help Prevent Cancer.', 'Healthy', 'https://rukminim1.flixcart.com/image/416/416/kc6jyq80/soil-manure/6/y/v/500-tapti-booster-500-ml-green-yantra-original-imaftd6rrgfhvshc.jpeg?q=70', 'https://agribegri.com/products/tapti-booster-500-ml--organic-fertilizer-online-in-india.php', 'Tapti Booster Organic Fertilizer'),
(37, 'plant image/Apple_scab.JPG', 1, 'Septoria leaf spot is caused by a fungus, Septoria lycopersici. It is one of the most destructive diseases of tomato foliage and is particularly severe in areas where wet, humid weather persists for extended periods.Septoria leaf spot usually appears on the lower leaves after the first fruit sets. Spots are circular, about 1/16 to 1/4 inch in diameter with dark brown margins and tan to gray centers with small black fruiting structures. Characteristically, there are many spots per leaf. This disease spreads upwards from oldest to youngest growth. If leaf lesions are numerous, the leaves turn slightly yellow, then brown, and then wither. Fruit infection is rare.', 'Remove diseased leaves. \nImprove air circulation around the plants.\nMulch around the base of the plants. Mulching will reduce splashing soil, which may contain fungal spores associated with debris. Apply mulch after the soil has warmed.\nDo not use overhead watering. Overhead watering facilitates infection and spreads the disease. Use a soaker hose at the base of the plant to keep the foliage dry. Water early in the day.\nControl weeds. Nightshade and horsenettle are frequently hosts of Septoria leaf spot and should be eradicated around the garden site.\nUse crop rotation. Next year do not plant tomatoes back in the same location where diseased tomatoes grew. Wait 1–2 years before replanting tomatoes in these areas.\nUse fungicidal sprays.', 'Septoria Leaf Spot', 'https://farmagritech.com/wp-content/uploads/2020/05/roko-insecticide.jpg', 'https://farmagritech.com/product/roko-fungicide/?attribute_pa_size=500gm&utm_source=Google%20Shopping&utm_campaign=Google%20shopping%20feed%201&utm_medium=cpc&utm_term=3239', 'Roko Fungicide'),
(35, 'plant image/Apple_ceder_apple_rust_nKR0v9L.JPG', 1, 'Cedar apple rust (Gymnosporangium juniperi-virginianae) is a fungal disease that requires juniper plants to complete its complicated two year life-cycle. Spores overwinter as a reddish-brown gall on young twigs of various juniper species. In early spring, during wet weather, these galls swell and bright orange masses of spores are blown by the wind where they infect susceptible apple and crab-apple trees. The spores that develop on these trees will only infect junipers the following year. From year to year, the disease must pass from junipers to apples to junipers again; it cannot spread between apple trees.', 'Choose resistant cultivars when available.\nRake up and dispose of fallen leaves and other debris from under trees.\nRemove galls from infected junipers. In some cases, juniper plants should be removed entirely.\nApply preventative, disease-fighting fungicides labeled for use on apples weekly, starting with bud break, to protect trees from spores being released by the juniper host. This occurs only once per year, so additional applications after this springtime spread are not necessary.\nOn juniper, rust can be controlled by spraying plants with a copper solution (0.5 to 2.0 oz/ gallon of water) at least four times between late August and late October.\nSafely treat most fungal and bacterial diseases with SERENADE Garden. This broad spectrum bio-fungicide uses a patented strain of Bacillus subtilis that is registered for organic use. Best of all, SERENADE is completely non-toxic to honey bees and beneficial insects.', 'Cedar rust', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcT2JQ-fAdtrzzmkSespqEpKwop3BnWntsLioVSgjy79mpxQVPSqoD4v9yfL0mtiFJvFnPqeE7EcefadhdEpc9uUTCZbROwOPsklL_XDMSLTpxOGvIcBMMFiBQ&usqp=CAE', 'https://agribegri.com/products/buy-organic-fungicide-all-in-1-online--organic-fungicide-.php', 'Katyayani All in 1 Organic Fungicide');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
CREATE TABLE IF NOT EXISTS `user_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `profile_pic` varchar(100) DEFAULT NULL,
  `Age` varchar(100) DEFAULT NULL,
  `user_status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `first_name`, `last_name`, `email`, `phone_number`, `city`, `password`, `profile_pic`, `Age`, `user_status`) VALUES
(1, 'user', 'one', 'user1@email.com', '5656565656', 'hyd', '0000', 'Image/user/5.JPG', '15', 'accepted');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
