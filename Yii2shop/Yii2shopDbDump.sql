-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Окт 10 2022 г., 08:56
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_assignments`
--

CREATE TABLE `auth_assignments` (
  `item_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `created_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `auth_assignments`
--

INSERT INTO `auth_assignments` (`item_name`, `user_id`, `created_at`) VALUES
('admin', 1, 1664110772),
('user', 2, 1664110844);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_items`
--

CREATE TABLE `auth_items` (
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` smallint NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `rule_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `auth_items`
--

INSERT INTO `auth_items` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, 'Admin', NULL, NULL, NULL, NULL),
('user', 1, 'User', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item_children`
--

CREATE TABLE `auth_item_children` (
  `parent` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `auth_item_children`
--

INSERT INTO `auth_item_children` (`parent`, `child`) VALUES
('admin', 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_rules`
--

CREATE TABLE `auth_rules` (
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `sort` int NOT NULL,
  `meta_json` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `title`, `description`, `sort`, `meta_json`) VALUES
(1, 'Game', 'game', 'Game sector', '<p>For true game fans</p>\r\n', 1, '\"{\\\"title\\\":\\\"game\\\",\\\"description\\\":\\\"\\\",\\\"keywords\\\":\\\"game, game-fans\\\"}\"'),
(2, 'HiTec', 'hitec', 'New technologies', '<p>Technologies changing the world</p>\r\n', 2, '\"{\\\"title\\\":\\\"HiTec\\\",\\\"description\\\":\\\"\\\",\\\"keywords\\\":\\\"hitec, tech. technology\\\"}\"');

-- --------------------------------------------------------

--
-- Структура таблицы `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` int NOT NULL,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `created_at` int UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `blog_comments`
--

INSERT INTO `blog_comments` (`id`, `post_id`, `user_id`, `parent_id`, `created_at`, `text`, `active`) VALUES
(1, 2, 1, NULL, 1663858600, 'Vivamus scelerisque accumsan nisi, ac venenatis lorem interdum ut. Mauris dignissim urna orci. Cras volutpat, sem a lobortis sollicitudin, quam ex feugiat sapien, eget sagittis quam turpis a enim.', 1),
(2, 2, 1, 1, 1663914680, 'Vivamus scelerisque accumsan nisi, ac venenatis lorem interdum ut. Mauris dignissim urna orci. Cras volutpat, sem a lobortis sollicitudin, quam ex feugiat sapien, eget sagittis quam turpis a enim. Curabitur nec ante eu ligula molestie ultricies sed nec nisi. Donec mattis nunc tellus, ac efficitur libero fringilla id. ', 1),
(3, 2, 1, 2, 1663914692, 'Nam sed eleifend augue. In malesuada finibus nunc, vel bibendum ex pretium sit amet. ', 1),
(4, 2, 1, 3, 1663914706, 'Etiam vitae sollicitudin purus, nec porttitor leo. Morbi id faucibus orci. ', 1),
(5, 2, 1, 4, 1663914716, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sagittis ornare consectetur. Aliquam erat volutpat. Nam quam risus, rhoncus vitae aliquam ut, ullamcorper a purus.', 0),
(6, 2, 1, 5, 1663914730, 'Mauris fermentum ante consectetur, laoreet nulla a, varius nunc. Donec bibendum turpis vel interdum semper. Fusce fringilla libero id fermentum pharetra.', 1),
(7, 2, 1, NULL, 1663914745, 'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec commodo velit in est rhoncus, at ultricies neque finibus.', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `photo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` int NOT NULL,
  `meta_json` json NOT NULL,
  `comments_count` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `category_id`, `created_at`, `title`, `description`, `content`, `photo`, `status`, `meta_json`, `comments_count`) VALUES
(2, 1, 1663856749, 'New gaming high performance machine', 'This is a revolution of gaming laptops. \r\n', '<p style=\"text-align:justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sagittis ornare consectetur. Aliquam erat volutpat. Nam quam risus, rhoncus vitae aliquam ut, ullamcorper a purus. Nulla non elit tristique, molestie libero quis, ullamcorper felis. Nunc efficitur et erat eget scelerisque. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus congue condimentum pulvinar. Maecenas nec nibh non ipsum ultricies rhoncus. Sed pulvinar erat sed mi pellentesque, sed malesuada elit sagittis. Ut vehicula rutrum dui, sit amet vulputate ex ullamcorper sit amet. Sed dapibus condimentum mauris. Mauris fermentum ante consectetur, laoreet nulla a, varius nunc. Donec bibendum turpis vel interdum semper. Fusce fringilla libero id fermentum pharetra.</p>\r\n\r\n<p style=\"text-align:justify\">Etiam vitae sollicitudin purus, nec porttitor leo. Morbi id faucibus orci. Vivamus metus dolor, rhoncus nec laoreet a, gravida vitae lacus. Nullam et orci in nisl egestas finibus et in lectus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; In scelerisque, felis ac sodales pretium, dui urna porta mi, eget molestie tellus diam vel nunc. Donec magna nulla, venenatis sed odio a, cursus iaculis velit. Pellentesque pellentesque nulla accumsan, mattis ligula sed, volutpat odio. Nulla viverra libero eget vehicula mattis. Nullam quis faucibus purus. Etiam facilisis risus nunc, quis elementum augue blandit sed. Sed non sem eu diam pretium feugiat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>\r\n\r\n<p style=\"text-align:justify\">Praesent nibh est, dictum non augue ut, vulputate porttitor ligula. Pellentesque congue consectetur diam, eget venenatis neque fermentum porttitor. Proin imperdiet massa in dui fringilla, vel convallis ligula tincidunt. Nunc suscipit lectus sit amet imperdiet vestibulum. Nulla vitae eros euismod, maximus massa a, sodales tellus. Nullam non scelerisque magna. Ut faucibus pulvinar quam, quis laoreet odio ornare sit amet. Pellentesque pharetra erat id suscipit hendrerit.</p>\r\n\r\n<p style=\"text-align:justify\">Ut et justo dapibus, tincidunt velit vel, ultricies eros. Nam sit amet dui a odio condimentum aliquam. Duis in est ut metus porttitor blandit non sed tellus. Maecenas vel pharetra elit. Proin dapibus ultricies efficitur. Mauris ultricies vulputate tincidunt. Nam convallis ultrices nulla nec laoreet. Morbi sed est tempor, mollis nibh ullamcorper, rutrum nulla. Quisque ac metus luctus, posuere lacus id, posuere elit. Mauris at facilisis diam. Praesent ipsum elit, egestas a leo sed, cursus tincidunt turpis. Nullam massa dui, tincidunt sed nisl sit amet, tincidunt bibendum magna. Donec feugiat porta quam.</p>\r\n\r\n<p style=\"text-align:justify\">Vivamus scelerisque accumsan nisi, ac venenatis lorem interdum ut. Mauris dignissim urna orci. Cras volutpat, sem a lobortis sollicitudin, quam ex feugiat sapien, eget sagittis quam turpis a enim. Curabitur nec ante eu ligula molestie ultricies sed nec nisi. Donec mattis nunc tellus, ac efficitur libero fringilla id. Fusce vulputate, nibh eget viverra euismod, risus tortor scelerisque lacus, at vehicula nulla augue vitae nisi. Cras ultricies eleifend pulvinar. Nam sed eleifend augue. In malesuada finibus nunc, vel bibendum ex pretium sit amet. Sed ac justo eget tellus commodo molestie. Praesent porta ante id tortor porta, eget venenatis neque mattis. Vivamus pretium, erat at porta fermentum, elit metus vehicula ante, ut commodo quam augue vitae erat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec commodo velit in est rhoncus, at ultricies neque finibus.</p>\r\n', '2163393.jpeg', 1, '\"{\\\"title\\\":\\\"HiTec\\\",\\\"description\\\":\\\"Super gaming machine\\\",\\\"keywords\\\":\\\"game, game-fans\\\"}\"', 6),
(3, 2, 1663856956, 'Human or machine?', 'In the age of Artificial intelligence who will survive?', '<p style=\"text-align:justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sagittis ornare consectetur. Aliquam erat volutpat. Nam quam risus, rhoncus vitae aliquam ut, ullamcorper a purus. Nulla non elit tristique, molestie libero quis, ullamcorper felis. Nunc efficitur et erat eget scelerisque. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus congue condimentum pulvinar. Maecenas nec nibh non ipsum ultricies rhoncus. Sed pulvinar erat sed mi pellentesque, sed malesuada elit sagittis. Ut vehicula rutrum dui, sit amet vulputate ex ullamcorper sit amet. Sed dapibus condimentum mauris. Mauris fermentum ante consectetur, laoreet nulla a, varius nunc. Donec bibendum turpis vel interdum semper. Fusce fringilla libero id fermentum pharetra.</p>\r\n\r\n<p style=\"text-align:justify\">Etiam vitae sollicitudin purus, nec porttitor leo. Morbi id faucibus orci. Vivamus metus dolor, rhoncus nec laoreet a, gravida vitae lacus. Nullam et orci in nisl egestas finibus et in lectus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; In scelerisque, felis ac sodales pretium, dui urna porta mi, eget molestie tellus diam vel nunc. Donec magna nulla, venenatis sed odio a, cursus iaculis velit. Pellentesque pellentesque nulla accumsan, mattis ligula sed, volutpat odio. Nulla viverra libero eget vehicula mattis. Nullam quis faucibus purus. Etiam facilisis risus nunc, quis elementum augue blandit sed. Sed non sem eu diam pretium feugiat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>\r\n\r\n<p style=\"text-align:justify\">Praesent nibh est, dictum non augue ut, vulputate porttitor ligula. Pellentesque congue consectetur diam, eget venenatis neque fermentum porttitor. Proin imperdiet massa in dui fringilla, vel convallis ligula tincidunt. Nunc suscipit lectus sit amet imperdiet vestibulum. Nulla vitae eros euismod, maximus massa a, sodales tellus. Nullam non scelerisque magna. Ut faucibus pulvinar quam, quis laoreet odio ornare sit amet. Pellentesque pharetra erat id suscipit hendrerit.</p>\r\n\r\n<p style=\"text-align:justify\">Ut et justo dapibus, tincidunt velit vel, ultricies eros. Nam sit amet dui a odio condimentum aliquam. Duis in est ut metus porttitor blandit non sed tellus. Maecenas vel pharetra elit. Proin dapibus ultricies efficitur. Mauris ultricies vulputate tincidunt. Nam convallis ultrices nulla nec laoreet. Morbi sed est tempor, mollis nibh ullamcorper, rutrum nulla. Quisque ac metus luctus, posuere lacus id, posuere elit. Mauris at facilisis diam. Praesent ipsum elit, egestas a leo sed, cursus tincidunt turpis. Nullam massa dui, tincidunt sed nisl sit amet, tincidunt bibendum magna. Donec feugiat porta quam.</p>\r\n\r\n<p style=\"text-align:justify\">Vivamus scelerisque accumsan nisi, ac venenatis lorem interdum ut. Mauris dignissim urna orci. Cras volutpat, sem a lobortis sollicitudin, quam ex feugiat sapien, eget sagittis quam turpis a enim. Curabitur nec ante eu ligula molestie ultricies sed nec nisi. Donec mattis nunc tellus, ac efficitur libero fringilla id. Fusce vulputate, nibh eget viverra euismod, risus tortor scelerisque lacus, at vehicula nulla augue vitae nisi. Cras ultricies eleifend pulvinar. Nam sed eleifend augue. In malesuada finibus nunc, vel bibendum ex pretium sit amet. Sed ac justo eget tellus commodo molestie. Praesent porta ante id tortor porta, eget venenatis neque mattis. Vivamus pretium, erat at porta fermentum, elit metus vehicula ante, ut commodo quam augue vitae erat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec commodo velit in est rhoncus, at ultricies neque finibus.</p>\r\n', 'modern-technology-is-impacting-our-daily-life.png', 1, '\"{\\\"title\\\":\\\"HiTec\\\",\\\"description\\\":\\\"\\\",\\\"keywords\\\":\\\"hitec, tech. technology\\\"}\"', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `blog_tags`
--

CREATE TABLE `blog_tags` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `blog_tags`
--

INSERT INTO `blog_tags` (`id`, `name`, `slug`) VALUES
(1, 'HiTec', 'hitec'),
(2, 'For gaming', 'game');

-- --------------------------------------------------------

--
-- Структура таблицы `blog_tag_assignments`
--

CREATE TABLE `blog_tag_assignments` (
  `post_id` int NOT NULL,
  `tag_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `blog_tag_assignments`
--

INSERT INTO `blog_tag_assignments` (`post_id`, `tag_id`) VALUES
(2, 2),
(3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1659789764),
('m130524_201442_init', 1659789769),
('m140506_102106_rbac_init', 1664107926),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1664107926),
('m180523_151638_rbac_updates_indexes_without_prefix', 1664107926),
('m190124_110200_add_verification_token_column_to_user_table', 1659789769),
('m200409_110543_rbac_update_mssql_trigger', 1664107926),
('m220810_145604_add_user_email_confirmation_token', 1660233773),
('m220811_155942_create_user_networks_table', 1660237161),
('m220812_093926_change_user_field_requirements', 1660297722),
('m220814_135823_create_tags_table', 1660808864),
('m220818_073451_create_shop_brands_table', 1660808864),
('m220818_073517_create_shop_categories_table', 1660808864),
('m220818_073559_create_shop_characterisitcs_table', 1660808864),
('m220818_073622_create_shop_products_table', 1660808864),
('m220818_073647_create_shop_category_assignments_table', 1660808865),
('m220818_073716_create_shop_values_table', 1660808865),
('m220818_073727_create_shop_photos_table', 1660808865),
('m220818_073739_create_shop_tag_assignments_table', 1660808866),
('m220818_073758_create_shop_related_assignments_table', 1660808866),
('m220818_073825_create_shop_modifications_table', 1660808866),
('m220818_073840_create_shop_reviews_table', 1660808867),
('m220821_092128_add_shop_product_main_photo_field', 1661074966),
('m220821_092233_add_shop_product_description_field', 1661074966),
('m220821_092252_add_shop_product_status_field', 1661074966),
('m220821_094431_add_shop_product_fields', 1661075127),
('m220907_160605_create_user_wishlist_items_table', 1662568778),
('m220907_163037_create_shop_discounts_table', 1662568778),
('m220914_145735_create_shop_discounts_table', 1663168002),
('m220914_152840_create_shop_delivery_methods', 1663169804),
('m220914_152900_create_shop_orders_table', 1663169804),
('m220914_152922_create_shop_order_items_table', 1663169804),
('m220922_130845_create_blog_tags_table', 1663852997),
('m220922_130933_create_blog_categories_table', 1663852997),
('m220922_130946_create_blog_posts_table', 1663852997),
('m220922_131024_create_blog_tag_assignments_table', 1663852997),
('m220922_131051_create_blog_comments_table', 1663852997),
('m220922_131431_add_blog_post_comments_count_field', 1663852997),
('m220922_131510_create_pages_table', 1663852997),
('m220925_114812_change_auth_assignments_table', 1664108048),
('m220925_114839_add_user_roles', 1664108048),
('m220926_080716_create_oauth_server_tables', 1664179925),
('m220926_134850_create_shop_cart_items_table', 1664200208);

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `access_token` varchar(40) NOT NULL,
  `client_id` varchar(32) NOT NULL,
  `user_id` int DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`access_token`, `client_id`, `user_id`, `expires`, `scope`) VALUES
('1676c15eda39f8c22a47fdcf135f6e6b08260afe', 'testclient', 1, '2022-09-28 16:17:13', NULL),
('24812563b501f71f0f53b7b50626070922a7711c', 'testclient', 1, '2022-09-28 11:05:05', NULL),
('2c3952c3112d8550e22528d9d6a565d486eccfb0', 'testclient', 1, '2022-09-28 15:24:43', NULL),
('391ad6853814996a0e51280c81da67e1c76c071a', 'testclient', 1, '2022-10-07 13:05:20', NULL),
('5c0c8c411a4e9c29b9fdb208de72d441109655f1', 'testclient', 1, '2022-10-07 09:31:20', NULL),
('683ce06252b7bbf31b6ce83019a9d629a5e6daf6', 'testclient', 1, '2022-09-28 06:44:23', NULL),
('7a351edc42589e331ce9205268af1a912a339f9d', 'buyer', 2, '2022-09-28 16:28:04', NULL),
('8552bae00f1a4a27adc2f7a0e99d1b9c34b62778', 'testclient', 1, '2022-09-28 06:33:13', NULL),
('9b946138215c2e3e757e6316602a7d237b8e84e9', 'testclient', 1, '2022-10-07 13:10:09', NULL),
('a80eb598b937b54cba6776976d019787b04d0049', 'testclient', 1, '2022-09-29 09:22:40', NULL),
('bf2ba49fc6978696d94fbca1f04bd8c4cb99c545', 'testclient', 1, '2022-10-06 13:33:48', NULL),
('c6d3642884ec943540ffbf8c39adfe81056b63ad', 'testclient', 1, '2022-10-07 14:41:55', NULL),
('cb01bb74a881fec3add665d8b1885fdde18b5aec', 'testclient', 1, '2022-10-07 13:53:14', NULL),
('e637d70379383d657a44b06d4567407e56045483', 'testclient', 1, '2022-09-27 15:22:37', NULL),
('f316beefe56dc49c6869565e97ad960bcc3b0c9d', 'buyer', 2, '2022-10-07 09:31:38', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_authorization_codes`
--

CREATE TABLE `oauth_authorization_codes` (
  `authorization_code` varchar(40) NOT NULL,
  `client_id` varchar(32) NOT NULL,
  `user_id` int DEFAULT NULL,
  `redirect_uri` varchar(1000) NOT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `client_id` varchar(32) NOT NULL,
  `client_secret` varchar(32) DEFAULT NULL,
  `redirect_uri` varchar(1000) NOT NULL,
  `grant_types` varchar(100) NOT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oauth_clients`
--

INSERT INTO `oauth_clients` (`client_id`, `client_secret`, `redirect_uri`, `grant_types`, `scope`, `user_id`) VALUES
('buyer', 'passphrase', 'http://api.shop.d/', 'client_credentials authorization_code password implicit', NULL, NULL),
('testclient', 'testpass', 'http://fake/', 'client_credentials authorization_code password implicit', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_jwt`
--

CREATE TABLE `oauth_jwt` (
  `client_id` varchar(32) NOT NULL,
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_public_keys`
--

CREATE TABLE `oauth_public_keys` (
  `client_id` varchar(255) NOT NULL,
  `public_key` varchar(2000) DEFAULT NULL,
  `private_key` varchar(2000) DEFAULT NULL,
  `encryption_algorithm` varchar(100) DEFAULT 'RS256'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(32) NOT NULL,
  `user_id` int DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`refresh_token`, `client_id`, `user_id`, `expires`, `scope`) VALUES
('1808734ded9223d31c49b003613258636cc056b1', 'testclient', 1, '2022-10-20 13:53:14', NULL),
('1b5adaadef021755c8e90db461d664b4841fe063', 'testclient', 1, '2022-10-12 09:22:40', NULL),
('1ede6189bebbdbbe917747885fcba94324c8e1b3', 'testclient', 1, '2022-10-19 13:33:48', NULL),
('255e4ad5e582d3b8a13b7c28281f6b7cdc3057e9', 'testclient', 1, '2022-10-11 16:17:13', NULL),
('2d628e41a38a81b520b1fca25d52624e39438cbc', 'buyer', 2, '2022-10-20 09:31:38', NULL),
('315aaf780af249db49ea8bd8b106657349989cb5', 'testclient', 1, '2022-10-10 15:22:37', NULL),
('4cf48e975740ccfeb443fbe4b119dd41f5122c03', 'testclient', 1, '2022-10-20 13:05:20', NULL),
('4ee56e79658c7c8fa34c5d846b9d8b54a4bfc49b', 'testclient', 1, '2022-10-11 15:24:43', NULL),
('543b358260fd00d79dbb96468c19199a4ed97295', 'testclient', 1, '2022-10-20 13:10:09', NULL),
('5dcc59790e71f19446b5a99b4cb7efbd787a3104', 'testclient', 1, '2022-10-11 06:33:13', NULL),
('6fbc8c28ad4954b31f754ad2c0687778e4ef39ec', 'testclient', 1, '2022-10-20 09:31:20', NULL),
('a29bb19d23c8297273c906fcd94a42cf694a4974', 'testclient', 1, '2022-10-20 14:41:55', NULL),
('b72ae1980851d22832f9b7614a8db88652fd365b', 'testclient', 1, '2022-10-11 11:05:05', NULL),
('cae53cdb0553a091e486828b35313c329f1d6436', 'buyer', 2, '2022-10-11 16:28:04', NULL),
('eaaf4f94be5e02c6d5da9a4cb03a04f51db0bfd9', 'testclient', 1, '2022-10-11 06:44:23', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_scopes`
--

CREATE TABLE `oauth_scopes` (
  `scope` varchar(2000) NOT NULL,
  `is_default` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_users`
--

CREATE TABLE `oauth_users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(2000) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oauth_users`
--

INSERT INTO `oauth_users` (`username`, `password`, `first_name`, `last_name`) VALUES
('admin', '12345678', 'admin', 'api');

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `meta_json` json NOT NULL,
  `lft` int NOT NULL,
  `rgt` int NOT NULL,
  `depth` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `content`, `meta_json`, `lft`, `rgt`, `depth`) VALUES
(1, '', 'root', NULL, '\"{}\"', 1, 6, 0),
(2, 'About us', 'about', '<p style=\"text-align:justify\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean blandit non purus vitae hendrerit. Duis eu tempor libero. Proin vitae magna tellus. Maecenas aliquet, lacus ac vestibulum convallis, nisi orci aliquam metus, non luctus tellus diam vitae mi. Sed blandit at leo et commodo. Vivamus dictum lorem sit amet ex accumsan eleifend nec eget turpis. Suspendisse pulvinar erat vel porta egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Duis pretium nibh et faucibus sodales. Integer at condimentum ante. Nunc facilisis orci in libero molestie, id tristique lorem euismod. Morbi commodo, turpis nec mattis mattis, ipsum mauris ullamcorper ex, varius pulvinar tortor libero vitae dui.</p>\r\n\r\n<p style=\"text-align:justify\">Sed vulputate sapien eget dui venenatis, sed tempor erat ullamcorper. Maecenas tristique nisi vel vestibulum commodo. Etiam et ante sollicitudin turpis auctor iaculis eget non nibh. Aliquam feugiat maximus quam, ut finibus eros imperdiet nec. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed nec ligula ut tortor pretium tincidunt sit amet in est. Duis faucibus sem ut tincidunt bibendum. Phasellus auctor leo sem, et hendrerit lorem volutpat sit amet. Pellentesque commodo luctus purus sit amet malesuada. Mauris aliquam et arcu quis bibendum. Aliquam eget neque libero. Quisque quis condimentum diam.</p>\r\n\r\n<p style=\"text-align:justify\">Duis id venenatis magna. Mauris cursus dui non lectus tempus scelerisque. Vivamus maximus imperdiet viverra. Fusce dignissim scelerisque tellus, sed vestibulum leo blandit vitae. Vestibulum sit amet efficitur quam. Nam vitae dolor nibh. Curabitur sapien nisl, fringilla eu dui ac, sollicitudin ullamcorper tortor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris iaculis tincidunt libero nec dignissim. Ut sodales, lorem nec ornare rutrum, arcu mauris bibendum nisl, eu tincidunt erat tortor et tortor. Integer eget purus quis felis lacinia congue gravida in enim.</p>\r\n', '\"{\\\"title\\\":\\\"About us\\\",\\\"description\\\":\\\"\\\",\\\"keywords\\\":\\\"about\\\"}\"', 2, 5, 1),
(3, 'Our services', 'services', '<p><span style=\"color:rgb(0, 0, 0); font-family:open sans,arial,sans-serif; font-size:14px\"><img alt=\"Big Sale\" src=\"http://static.shop.d/files/realistic-autumn-sale-background52683-72174.jpg\" style=\"height:150px; width:225px\" /></span></p>\r\n\r\n<p><span style=\"color:rgb(0, 0, 0); font-family:open sans,arial,sans-serif; font-size:14px\">Nullam elementum rhoncus augue in pretium. Nam ultricies turpis et tellus malesuada, et tempor urna ultricies. Curabitur tellus tellus, feugiat id elit eget, pulvinar maximus sapien. Nunc tortor neque, tempor sit amet nisl vel, vehicula imperdiet est. Phasellus rutrum, nulla nec convallis eleifend, eros enim dignissim nunc, ut rhoncus nunc urna sit amet nisl. Morbi non venenatis ante. Sed malesuada vitae erat quis porta. Sed venenatis volutpat lacus, vitae volutpat nisl ornare in. Etiam purus elit, congue nec nulla aliquam, pellentesque tincidunt est. Aenean vitae velit a purus pellentesque faucibus quis in libero. Integer quis tempor sapien. Ut nisl libero, rutrum quis urna a, bibendum varius ex. Maecenas lacinia libero et lectus molestie dictum. Mauris et ipsum in arcu dignissim iaculis. Mauris enim metus, gravida eu auctor ut, rutrum tincidunt tortor.</span></p>\r\n', '\"{\\\"title\\\":\\\"Our services\\\",\\\"description\\\":\\\"\\\",\\\"keywords\\\":\\\"services\\\"}\"', 3, 4, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_brands`
--

CREATE TABLE `shop_brands` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `meta_json` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `shop_brands`
--

INSERT INTO `shop_brands` (`id`, `name`, `slug`, `meta_json`) VALUES
(1, 'Lenovo', 'lenovo', '\"{\\\"title\\\":\\\"Lenovo\\\",\\\"description\\\":\\\"Good laptop\\\",\\\"keywords\\\":\\\"lenovo\\\"}\"'),
(2, 'Acer', 'acer', '\"{\\\"title\\\":\\\"Acer\\\",\\\"description\\\":\\\"\\\",\\\"keywords\\\":\\\"acer\\\"}\"'),
(3, 'Samsung', 'samsung', '\"{\\\"title\\\":\\\"Samsung\\\",\\\"description\\\":\\\"\\\",\\\"keywords\\\":\\\"samsung\\\"}\"');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_cart_items`
--

CREATE TABLE `shop_cart_items` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `modification_id` int DEFAULT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `shop_cart_items`
--

INSERT INTO `shop_cart_items` (`id`, `user_id`, `product_id`, `modification_id`, `quantity`) VALUES
(1, 1, 9, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_categories`
--

CREATE TABLE `shop_categories` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `meta_json` json NOT NULL,
  `lft` int NOT NULL,
  `rgt` int NOT NULL,
  `depth` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `shop_categories`
--

INSERT INTO `shop_categories` (`id`, `name`, `slug`, `title`, `description`, `meta_json`, `lft`, `rgt`, `depth`) VALUES
(1, '', 'root', NULL, NULL, '\"{}\"', 1, 10, 0),
(3, 'Computers', 'comps', 'Computers Category', '', '\"{\\\"title\\\":\\\"\\\",\\\"description\\\":\\\"\\\",\\\"keywords\\\":\\\"\\\"}\"', 2, 7, 1),
(4, 'Laptops', 'laptops', 'Laptop computers', '', '\"{\\\"title\\\":\\\"\\\",\\\"description\\\":\\\"\\\",\\\"keywords\\\":\\\"\\\"}\"', 3, 6, 2),
(5, 'Ultrabook', 'ultrabook', 'Thin and light', '', '\"{\\\"title\\\":\\\"\\\",\\\"description\\\":\\\"\\\",\\\"keywords\\\":\\\"\\\"}\"', 4, 5, 3),
(7, 'Mobile phones', 'mobile', 'Mobile phones', '', '\"{\\\"title\\\":\\\"Mobile phones\\\",\\\"description\\\":\\\"\\\",\\\"keywords\\\":\\\"mobile\\\"}\"', 8, 9, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_category_assignments`
--

CREATE TABLE `shop_category_assignments` (
  `product_id` int NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `shop_category_assignments`
--

INSERT INTO `shop_category_assignments` (`product_id`, `category_id`) VALUES
(3, 4),
(3, 5),
(4, 4),
(5, 4),
(8, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_characteristics`
--

CREATE TABLE `shop_characteristics` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL,
  `default` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `variants_json` json NOT NULL,
  `sort` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `shop_characteristics`
--

INSERT INTO `shop_characteristics` (`id`, `name`, `type`, `required`, `default`, `variants_json`, `sort`) VALUES
(2, 'Color', 'string', 0, '', '\"[\\\"Red\\\",\\\"Green\\\",\\\"Blue\\\"]\"', 2),
(3, 'Diagonal', 'string', 0, '', '\"[\\\"13\\\",\\\"14\\\",\\\"15\\\",\\\"16\\\",\\\"17\\\"]\"', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_delivery_methods`
--

CREATE TABLE `shop_delivery_methods` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `cost` int NOT NULL,
  `min_weight` int DEFAULT NULL,
  `max_weight` int DEFAULT NULL,
  `sort` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `shop_delivery_methods`
--

INSERT INTO `shop_delivery_methods` (`id`, `name`, `cost`, `min_weight`, `max_weight`, `sort`) VALUES
(1, 'NovaPoshta', 100, 0, 30, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_discounts`
--

CREATE TABLE `shop_discounts` (
  `id` int NOT NULL,
  `percent` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `sort` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_modifications`
--

CREATE TABLE `shop_modifications` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int DEFAULT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_orders`
--

CREATE TABLE `shop_orders` (
  `id` int NOT NULL,
  `created_at` int NOT NULL,
  `user_id` int NOT NULL,
  `delivery_method_id` int DEFAULT NULL,
  `delivery_method_name` varchar(255) NOT NULL,
  `delivery_cost` int NOT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `cost` int NOT NULL,
  `note` text,
  `current_status` int NOT NULL,
  `cancel_reason` text,
  `statuses_json` json NOT NULL,
  `customer_phone` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `delivery_index` varchar(255) DEFAULT NULL,
  `delivery_address` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `shop_orders`
--

INSERT INTO `shop_orders` (`id`, `created_at`, `user_id`, `delivery_method_id`, `delivery_method_name`, `delivery_cost`, `payment_method`, `cost`, `note`, `current_status`, `cancel_reason`, `statuses_json`, `customer_phone`, `customer_name`, `delivery_index`, `delivery_address`) VALUES
(1, 1663682630, 1, 1, 'NovaPoshta', 100, NULL, 0, '', 1, NULL, '\"[{\\\"value\\\":1,\\\"created_at\\\":1663682630}]\"', '+380937073356', 'Александр', '65005', 'Прохоровская');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_order_items`
--

CREATE TABLE `shop_order_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `modification_id` int DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `modification_name` varchar(255) DEFAULT NULL,
  `modification_code` varchar(255) DEFAULT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_photos`
--

CREATE TABLE `shop_photos` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `file` varchar(255) NOT NULL,
  `sort` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `shop_photos`
--

INSERT INTO `shop_photos` (`id`, `product_id`, `file`, `sort`) VALUES
(6, 3, 'lenovo_17inch.jpg', 0),
(7, 3, 'lenovo_15inch.jpg', 1),
(9, 4, 'lenovo_17inch.jpg', 1),
(10, 4, 'Lenovo-G50.jpg', 0),
(11, 5, 'AcerPredatorTriton.jpg', 0),
(15, 8, 'AcerPredatorHeliosInside.jpg', 1),
(16, 8, 'AcerPredatorHelios.jpg', 0),
(17, 9, 'GalaxyS22.jpeg', 0),
(18, 9, 'Galaxy-S22x2.jpg', 1),
(19, 4, 'lenovoff.jpg', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_products`
--

CREATE TABLE `shop_products` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `brand_id` int NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price_old` int DEFAULT NULL,
  `price_new` int DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT NULL,
  `meta_json` text,
  `main_photo_id` int DEFAULT NULL,
  `status` smallint NOT NULL,
  `weight` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `shop_products`
--

INSERT INTO `shop_products` (`id`, `category_id`, `brand_id`, `created_at`, `code`, `name`, `description`, `price_old`, `price_new`, `rating`, `meta_json`, `main_photo_id`, `status`, `weight`, `quantity`) VALUES
(3, 3, 1, 1661078952, '1212ssdasd', 'Laptop 17 inch', '<p>asfsfdfghgfhghgf</p>\r\n', 13500, 14000, NULL, '{\"title\":\"\",\"description\":\"\",\"keywords\":\"\"}', 6, 1, 2, 1),
(4, 3, 1, 1661343393, 'qwewqere334556', 'Laptop16 inch', '<p>good laptop</p>\r\n', 0, 11200, NULL, '{\"title\":\"Lenovo\",\"description\":\"\",\"keywords\":\"\"}', 10, 1, 3, 1),
(5, 3, 2, 1664893694, 'sdfsdfrfrx23244435456dddd', 'Acer Predator Triton', '<p>Perfect design for gamers</p>\r\n', NULL, 42000, NULL, '{\"title\":\"Acer\",\"description\":\"\",\"keywords\":\"acer\"}', 11, 1, 2, 2),
(8, 3, 2, 1664895696, '22wew2ddddsww23', 'Acer Predator Helios', '<p>Best gaming performance</p>\r\n', NULL, 32000, NULL, '{\"title\":\"Acer\",\"description\":\"\",\"keywords\":\"acer\"}', 16, 1, 2, 4),
(9, 7, 3, 1664896093, 'sdfsdfrfrx23244435', 'Samsung S22', '<p>Samsung S22 mobile phone</p>\r\n', 9500, 9300, NULL, '{\"title\":\"Samsung\",\"description\":\"\",\"keywords\":\"samsung\"}', 17, 1, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_related_assignments`
--

CREATE TABLE `shop_related_assignments` (
  `product_id` int NOT NULL,
  `related_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_reviews`
--

CREATE TABLE `shop_reviews` (
  `id` int NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `vote` int NOT NULL,
  `text` text NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_tags`
--

CREATE TABLE `shop_tags` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `shop_tags`
--

INSERT INTO `shop_tags` (`id`, `name`, `slug`) VALUES
(1, 'Computor', 'computor'),
(2, '15_inch', '15_inch'),
(3, '17_inch', '17_inch'),
(4, '16_inch', '16_inch'),
(5, 'For gaming', 'game');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_tag_assignments`
--

CREATE TABLE `shop_tag_assignments` (
  `product_id` int NOT NULL,
  `tag_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `shop_tag_assignments`
--

INSERT INTO `shop_tag_assignments` (`product_id`, `tag_id`) VALUES
(3, 3),
(4, 4),
(5, 2),
(5, 5),
(8, 2),
(8, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_values`
--

CREATE TABLE `shop_values` (
  `product_id` int NOT NULL,
  `characteristic_id` int NOT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `shop_values`
--

INSERT INTO `shop_values` (`product_id`, `characteristic_id`, `value`) VALUES
(3, 2, 'Green'),
(3, 3, '17'),
(4, 2, 'Red'),
(4, 3, '16'),
(5, 2, 'Red'),
(5, 3, '15'),
(8, 2, 'Blue'),
(8, 3, '15'),
(9, 2, 'Blue'),
(9, 3, '');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `password_reset_token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email_confirm_token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '10',
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  `verification_token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `email_confirm_token`, `status`, `created_at`, `updated_at`, `verification_token`) VALUES
(1, 'admin', 'Fu17FrjnHQQBp1BM8MO7Dl1dF3hHEQM3', '$2y$13$CouXfL0VgxW9bdgdgeIyseNaL.oVf0LkydJLjZ1euEejQGN1hOvp.', NULL, 'admin@example.com', NULL, 10, 1659789892, 1660474262, '1XNZg7DRm5q6Aqcl0TifASXufz101KGs_1659789892'),
(2, 'Alex200294', 'UgxJtbGGN0P89pQ8uukTP8TZRyv4VSFG', '$2y$13$xUmHxUGFpMX65cF2VQEMYO8M.kSDGWEr5gEgXA07bMaReXH2GTbwq', NULL, 'plahotniy.alex@gmail.com', NULL, 10, 1660473111, 1660473405, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `user_networks`
--

CREATE TABLE `user_networks` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `identity` varchar(255) NOT NULL,
  `network` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `user_wishlist_items`
--

CREATE TABLE `user_wishlist_items` (
  `user_id` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `user_wishlist_items`
--

INSERT INTO `user_wishlist_items` (`user_id`, `product_id`) VALUES
(1, 5),
(1, 9);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_assignments`
--
ALTER TABLE `auth_assignments`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `idx-auth_assignment-user_id` (`user_id`),
  ADD KEY `idx-auth_assignments-user_id` (`user_id`);

--
-- Индексы таблицы `auth_items`
--
ALTER TABLE `auth_items`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Индексы таблицы `auth_item_children`
--
ALTER TABLE `auth_item_children`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Индексы таблицы `auth_rules`
--
ALTER TABLE `auth_rules`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx-blog_categories-slug` (`slug`);

--
-- Индексы таблицы `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-blog_comments-post_id` (`post_id`),
  ADD KEY `idx-blog_comments-user_id` (`user_id`),
  ADD KEY `idx-blog_comments-parent_id` (`parent_id`);

--
-- Индексы таблицы `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-blog_posts-category_id` (`category_id`);

--
-- Индексы таблицы `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx-blog_tags-slug` (`slug`);

--
-- Индексы таблицы `blog_tag_assignments`
--
ALTER TABLE `blog_tag_assignments`
  ADD PRIMARY KEY (`post_id`,`tag_id`),
  ADD KEY `idx-blog_tag_assignments-post_id` (`post_id`),
  ADD KEY `idx-blog_tag_assignments-tag_id` (`tag_id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`access_token`),
  ADD KEY `client_id` (`client_id`);

--
-- Индексы таблицы `oauth_authorization_codes`
--
ALTER TABLE `oauth_authorization_codes`
  ADD PRIMARY KEY (`authorization_code`),
  ADD KEY `client_id` (`client_id`);

--
-- Индексы таблицы `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Индексы таблицы `oauth_jwt`
--
ALTER TABLE `oauth_jwt`
  ADD PRIMARY KEY (`client_id`);

--
-- Индексы таблицы `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`refresh_token`),
  ADD KEY `client_id` (`client_id`);

--
-- Индексы таблицы `oauth_users`
--
ALTER TABLE `oauth_users`
  ADD PRIMARY KEY (`username`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx-pages-slug` (`slug`);

--
-- Индексы таблицы `shop_brands`
--
ALTER TABLE `shop_brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx-shop_brands-slug` (`slug`);

--
-- Индексы таблицы `shop_cart_items`
--
ALTER TABLE `shop_cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-shop_cart_items-user_id` (`user_id`),
  ADD KEY `idx-shop_cart_items-product_id` (`product_id`),
  ADD KEY `idx-shop_cart_items-modification_id` (`modification_id`);

--
-- Индексы таблицы `shop_categories`
--
ALTER TABLE `shop_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx-shop_categories-slug` (`slug`);

--
-- Индексы таблицы `shop_category_assignments`
--
ALTER TABLE `shop_category_assignments`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `idx-shop_category_assignments-product_id` (`product_id`),
  ADD KEY `idx-shop_category_assignments-category_id` (`category_id`);

--
-- Индексы таблицы `shop_characteristics`
--
ALTER TABLE `shop_characteristics`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_delivery_methods`
--
ALTER TABLE `shop_delivery_methods`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_discounts`
--
ALTER TABLE `shop_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_modifications`
--
ALTER TABLE `shop_modifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx-shop_modifications-product_id-code` (`product_id`,`code`),
  ADD KEY `idx-shop_modifications-code` (`code`),
  ADD KEY `idx-shop_modifications-product_id` (`product_id`);

--
-- Индексы таблицы `shop_orders`
--
ALTER TABLE `shop_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-shop_orders-user_id` (`user_id`),
  ADD KEY `idx-shop_orders-delivery_method_id` (`delivery_method_id`);

--
-- Индексы таблицы `shop_order_items`
--
ALTER TABLE `shop_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-shop_order_items-order_id` (`order_id`),
  ADD KEY `idx-shop_order_items-product_id` (`product_id`),
  ADD KEY `idx-shop_order_items-modification_id` (`modification_id`);

--
-- Индексы таблицы `shop_photos`
--
ALTER TABLE `shop_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-shop_photos-product_id` (`product_id`);

--
-- Индексы таблицы `shop_products`
--
ALTER TABLE `shop_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx-shop_products-code` (`code`),
  ADD KEY `idx-shop_products-category_id` (`category_id`),
  ADD KEY `idx-shop_products-brand_id` (`brand_id`),
  ADD KEY `idx-shop_products-main_photo_id` (`main_photo_id`);

--
-- Индексы таблицы `shop_related_assignments`
--
ALTER TABLE `shop_related_assignments`
  ADD PRIMARY KEY (`product_id`,`related_id`),
  ADD KEY `idx-shop_related_assignments-product_id` (`product_id`),
  ADD KEY `idx-shop_related_assignments-related_id` (`related_id`);

--
-- Индексы таблицы `shop_reviews`
--
ALTER TABLE `shop_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-shop_reviews-product_id` (`product_id`),
  ADD KEY `idx-shop_reviews-user_id` (`user_id`);

--
-- Индексы таблицы `shop_tags`
--
ALTER TABLE `shop_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx-shop_tags-slug` (`slug`);

--
-- Индексы таблицы `shop_tag_assignments`
--
ALTER TABLE `shop_tag_assignments`
  ADD PRIMARY KEY (`product_id`,`tag_id`),
  ADD KEY `idx-shop_tag_assignments-product_id` (`product_id`),
  ADD KEY `idx-shop_tag_assignments-tag_id` (`tag_id`);

--
-- Индексы таблицы `shop_values`
--
ALTER TABLE `shop_values`
  ADD PRIMARY KEY (`product_id`,`characteristic_id`),
  ADD KEY `idx-shop_values-product_id` (`product_id`),
  ADD KEY `idx-shop_values-characteristic_id` (`characteristic_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`),
  ADD UNIQUE KEY `email_confirm_token` (`email_confirm_token`);

--
-- Индексы таблицы `user_networks`
--
ALTER TABLE `user_networks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx-user_networks-identity-name` (`identity`,`network`),
  ADD KEY `idx-user_networks-user_id` (`user_id`);

--
-- Индексы таблицы `user_wishlist_items`
--
ALTER TABLE `user_wishlist_items`
  ADD PRIMARY KEY (`user_id`,`product_id`),
  ADD KEY `idx-user_wishlist_items-user_id` (`user_id`),
  ADD KEY `idx-user_wishlist_items-product_id` (`product_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `shop_brands`
--
ALTER TABLE `shop_brands`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `shop_cart_items`
--
ALTER TABLE `shop_cart_items`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `shop_categories`
--
ALTER TABLE `shop_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `shop_characteristics`
--
ALTER TABLE `shop_characteristics`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `shop_delivery_methods`
--
ALTER TABLE `shop_delivery_methods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `shop_discounts`
--
ALTER TABLE `shop_discounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_modifications`
--
ALTER TABLE `shop_modifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_orders`
--
ALTER TABLE `shop_orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `shop_order_items`
--
ALTER TABLE `shop_order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_photos`
--
ALTER TABLE `shop_photos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `shop_products`
--
ALTER TABLE `shop_products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `shop_reviews`
--
ALTER TABLE `shop_reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_tags`
--
ALTER TABLE `shop_tags`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `user_networks`
--
ALTER TABLE `user_networks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_assignments`
--
ALTER TABLE `auth_assignments`
  ADD CONSTRAINT `auth_assignments_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_items` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk-auth_assignments-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_items`
--
ALTER TABLE `auth_items`
  ADD CONSTRAINT `auth_items_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rules` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item_children`
--
ALTER TABLE `auth_item_children`
  ADD CONSTRAINT `auth_item_children_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_items` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_children_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_items` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD CONSTRAINT `fk-blog_comments-parent_id` FOREIGN KEY (`parent_id`) REFERENCES `blog_comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-blog_comments-post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-blog_comments-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `fk-blog_posts-category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `blog_tag_assignments`
--
ALTER TABLE `blog_tag_assignments`
  ADD CONSTRAINT `fk-blog_tag_assignments-post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_posts` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk-blog_tag_assignments-tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tags` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD CONSTRAINT `oauth_access_tokens_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `oauth_authorization_codes`
--
ALTER TABLE `oauth_authorization_codes`
  ADD CONSTRAINT `oauth_authorization_codes_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD CONSTRAINT `oauth_refresh_tokens_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `shop_cart_items`
--
ALTER TABLE `shop_cart_items`
  ADD CONSTRAINT `fk-shop_cart_items-modification_id` FOREIGN KEY (`modification_id`) REFERENCES `shop_modifications` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-shop_cart_items-product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-shop_cart_items-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `shop_category_assignments`
--
ALTER TABLE `shop_category_assignments`
  ADD CONSTRAINT `fk-shop_category_assignments-category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk-shop_category_assignments-product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `shop_modifications`
--
ALTER TABLE `shop_modifications`
  ADD CONSTRAINT `fk-shop_modifications-product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `shop_orders`
--
ALTER TABLE `shop_orders`
  ADD CONSTRAINT `fk-shop_orders-delivery_method_id` FOREIGN KEY (`delivery_method_id`) REFERENCES `shop_delivery_methods` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk-shop_orders-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `shop_order_items`
--
ALTER TABLE `shop_order_items`
  ADD CONSTRAINT `fk-shop_order_items-modification_id` FOREIGN KEY (`modification_id`) REFERENCES `shop_modifications` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk-shop_order_items-order_id` FOREIGN KEY (`order_id`) REFERENCES `shop_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-shop_order_items-product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `shop_photos`
--
ALTER TABLE `shop_photos`
  ADD CONSTRAINT `fk-shop_photos-product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `shop_products`
--
ALTER TABLE `shop_products`
  ADD CONSTRAINT `fk-shop_products-brand_id` FOREIGN KEY (`brand_id`) REFERENCES `shop_brands` (`id`),
  ADD CONSTRAINT `fk-shop_products-category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_categories` (`id`),
  ADD CONSTRAINT `fk-shop_products-main_photo_id` FOREIGN KEY (`main_photo_id`) REFERENCES `shop_photos` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `shop_related_assignments`
--
ALTER TABLE `shop_related_assignments`
  ADD CONSTRAINT `fk-shop_related_assignments-product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk-shop_related_assignments-related_id` FOREIGN KEY (`related_id`) REFERENCES `shop_products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `shop_reviews`
--
ALTER TABLE `shop_reviews`
  ADD CONSTRAINT `fk-shop_reviews-product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk-shop_reviews-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `shop_tag_assignments`
--
ALTER TABLE `shop_tag_assignments`
  ADD CONSTRAINT `fk-shop_tag_assignments-product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk-shop_tag_assignments-tag_id` FOREIGN KEY (`tag_id`) REFERENCES `shop_tags` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `shop_values`
--
ALTER TABLE `shop_values`
  ADD CONSTRAINT `fk-shop_values-characteristic_id` FOREIGN KEY (`characteristic_id`) REFERENCES `shop_characteristics` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk-shop_values-product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `user_networks`
--
ALTER TABLE `user_networks`
  ADD CONSTRAINT `fk-user_networks-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_wishlist_items`
--
ALTER TABLE `user_wishlist_items`
  ADD CONSTRAINT `fk-user_wishlist_items-product_id` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk-user_wishlist_items-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
