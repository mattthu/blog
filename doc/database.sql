-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 29, 2018 at 10:20 PM
-- Server version: 5.7.21
-- PHP Version: 7.0.27-0+deb9u1

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(10) UNSIGNED NOT NULL,
  `comment_text` varchar(255) NOT NULL,
  `comment_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `comment_text`, `comment_created`) VALUES
(1, 'Test comment.', '2018-05-20 13:10:22'),
(2, 'Another one.', '2018-05-20 13:10:39'),
(3, 'Lorem ipsum.', '2018-05-20 13:11:13');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `post_subject` varchar(255) NOT NULL,
  `post_text` text NOT NULL,
  `post_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `post_subject`, `post_text`, `post_created`, `user_id`) VALUES
(1, 'Hello World!', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '2018-05-20 14:05:01', 1),
(2, 'Tere maailm!', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '2018-05-20 14:05:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

DROP TABLE IF EXISTS `post_comments`;
CREATE TABLE `post_comments` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `comment_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`post_id`, `comment_id`) VALUES
(1, 1),
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
CREATE TABLE `post_tags` (
  `post_id` int(11) UNSIGNED NOT NULL,
  `tag_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`post_id`, `tag_id`) VALUES
(1, 1),
(1, 2),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tag_id` int(10) UNSIGNED NOT NULL,
  `tag_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`tag_id`, `tag_name`) VALUES
(1, 'testing testing'),
(2, 'test2');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations` (
  `translation_id` int(10) UNSIGNED NOT NULL,
  `phrase` varchar(191) NOT NULL,
  `language` char(3) NOT NULL,
  `translation` varchar(191) DEFAULT NULL,
  `controller` varchar(15) NOT NULL,
  `action` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`translation_id`, `phrase`, `language`, `translation`, `controller`, `action`) VALUES
(1, 'Action', 'en', '{untranslated}', 'welcome', 'index'),
(2, 'Server returned response in an unexpected format', 'en', '{untranslated}', 'global', 'global'),
(3, 'Forbidden', 'en', '{untranslated}', 'global', 'global'),
(4, 'Server returned an error', 'en', '{untranslated}', 'global', 'global'),
(5, 'Action', 'en', '{untranslated}', 'halo', 'index'),
(6, 'Logout', 'en', '{untranslated}', 'global', 'global'),
(7, 'Settings', 'en', '{untranslated}', 'global', 'global'),
(8, 'Logged in as', 'en', '{untranslated}', 'global', 'global'),
(9, 'Log out', 'en', '{untranslated}', 'global', 'global'),
(10, 'Action', 'et', '{untranslated}', 'welcome', 'index'),
(11, 'Log out', 'et', '{untranslated}', 'global', 'global'),
(12, 'Server returned response in an unexpected format', 'et', '{untranslated}', 'global', 'global'),
(13, 'Forbidden', 'et', '{untranslated}', 'global', 'global'),
(14, 'Server returned an error', 'et', '{untranslated}', 'global', 'global'),
(15, 'Please sign in', 'et', '{untranslated}', 'global', 'global'),
(16, 'Email', 'et', '{untranslated}', 'global', 'global'),
(17, 'Password', 'et', '{untranslated}', 'global', 'global'),
(18, 'Sign in', 'et', '{untranslated}', 'global', 'global'),
(19, 'Please sign in', 'en', '{untranslated}', 'global', 'global'),
(20, 'Email', 'en', '{untranslated}', 'global', 'global'),
(21, 'Password', 'en', '{untranslated}', 'global', 'global'),
(22, 'Sign in', 'en', '{untranslated}', 'global', 'global'),
(23, 'Oops...', 'en', '{untranslated}', 'global', 'global'),
(24, 'Close', 'en', '{untranslated}', 'global', 'global'),
(25, 'Server returned an error. Please try again later ', 'en', '{untranslated}', 'global', 'global'),
(26, 'Action', 'en', '{untranslated}', 'global', 'global');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  `password` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `is_admin`, `password`, `email`, `deleted`, `name`) VALUES
(1, 1, '$2y$10$vTje.ndUFKHyuotY99iYkO.2aHJUgOsy2x0RMXP1UmrTe6CQsKbtm', 'demo@example.com', 0, 'Demo User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`post_id`,`comment_id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`post_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`) USING BTREE;

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`translation_id`),
  ADD UNIQUE KEY `language_phrase_controller_action_index` (`language`,`phrase`,`controller`,`action`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `tag_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `translation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`),
  ADD CONSTRAINT `post_comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`);

--
-- Constraints for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD CONSTRAINT `post_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`),
  ADD CONSTRAINT `post_tags_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`);
SET FOREIGN_KEY_CHECKS=1;
