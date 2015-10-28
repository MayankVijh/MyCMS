-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2015 at 01:42 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(3) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Bootstrap'),
(2, 'Javascript'),
(3, 'PHP'),
(4, 'JAVA'),
(6, 'JAVA2'),
(7, 'JAVA'),
(8, 'C#');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` int(3) NOT NULL,
  `comment_post_id` int(3) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_status` varchar(255) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
(1, 2, 'Mayank Vijh', 'mayankvijh89@gmail.com', 'Example Content', 'approved', '2015-10-11'),
(2, 1, 'Mayank', 'afafdsf@adfsdf', 'sdfsfsddfsdf', 'approved', '2015-10-11'),
(7, 1, 'Superman', 'superman@marvel.com', 'Hey Mayank, great post', 'approved', '2015-10-13'),
(11, 1, 'Batman', 'batman@marvel.com', 'you are going to pay superman', 'approved', '2015-10-13'),
(13, 1, 'Spiderman', 'spiderman@marvel.com', 'you both sucks', 'approved', '2015-10-13'),
(15, 1, 'Bhau', 'bhau@bhau', 'Bhau', 'approved', '2015-10-17'),
(16, 2, 'Black', 'black@green.com', 'asadfssf', 'approved', '2015-10-23');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(3) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_counts` varchar(255) NOT NULL,
  `post_status` varchar(255) NOT NULL DEFAULT 'draft',
  `post_views_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `post_title`, `post_author`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_counts`, `post_status`, `post_views_count`) VALUES
(1, 1, 'Mayank CMS First try', 'Mayank Vijh', '2015-10-13', 'Ship.jpg', 'WOW I made my 1st post', 'Mayank', '7', 'published', 1),
(2, 1, 'Javascript Learn', 'Batman', '2015-10-18', 'ASU.jpg', '<p>Superman vs batman</p>', 'superman', '1', 'published', 0),
(4, 1, 'With Select Box', 'BatMan', '2015-10-20', 'CSUEB.png', '<p>New Post with admin select box</p>', 'CSU,Batman', '4', 'published', 0),
(5, 1, 'With Select Box', 'BatMan', '2015-10-26', 'CSUEB.png', '<p>New Post with admin select box</p>', 'CSU,Batman', '', 'published', 0),
(6, 1, 'Javascript Learn', 'Batman', '2015-10-26', 'ASU.jpg', '<p>Superman vs batman</p>', 'superman', '', 'published', 0),
(7, 1, 'Mayank CMS First try', 'Mayank Vijh', '2015-10-26', 'Ship.jpg', 'WOW I made my 1st post', 'Mayank', '', 'published', 1),
(8, 1, 'Mayank CMS First try', 'Mayank Vijh', '2015-10-26', 'Ship.jpg', 'WOW I made my 1st post', 'Mayank', '', 'published', 0),
(9, 1, 'Javascript Learn', 'Batman', '2015-10-26', 'ASU.jpg', '<p>Superman vs batman</p>', 'superman', '', 'published', 0),
(10, 1, 'With Select Box', 'BatMan', '2015-10-26', 'CSUEB.png', '<p>New Post with admin select box</p>', 'CSU,Batman', '', 'published', 0),
(11, 1, 'With Select Box', 'BatMan', '2015-10-26', 'CSUEB.png', '<p>New Post with admin select box</p>', 'CSU,Batman', '', 'published', 0),
(12, 1, 'Javascript Learn', 'Batman', '2015-10-26', 'ASU.jpg', '<p>Superman vs batman</p>', 'superman', '', 'published', 0),
(13, 1, 'Mayank CMS First try', 'Mayank Vijh', '2015-10-26', 'Ship.jpg', 'WOW I made my 1st post', 'Mayank', '', 'published', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(3) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_image` text NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `randSalt` varchar(255) NOT NULL DEFAULT '$2y$10$supermanalsousethiscms'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_image`, `user_role`, `randSalt`) VALUES
(3, 'Batman', '123', 'Batman', 'Sucker', 'batman@robin.com', '', 'subscriber', '$2y$10$supermanalsousethiscms'),
(4, 'gambit', '123', 'Gambit', 'Danger', 'gambit@gmail.com', '', 'subscriber', '$2y$10$supermanalsousethiscms'),
(5, 'admin', '$2y$10$supermanalsousethiscmevfMCQtng9BAdpfwqNEkNzbSve3iRfM.', 'admin', 'admin', 'admin@admin.com', '', 'admin', '$2y$10$supermanalsousethiscms'),
(6, 'sub', '123', '', '', 'sub@sub.com', '', 'subscriber', '$2y$10$supermanalsousethiscms'),
(9, 'newuser', '$1$1P0..h/.$hzXI4gXkf98psZ8HRjItm/', '', '', 'new@user.com', '', 'subscriber', '$2y$10$supermanalsousethiscms'),
(10, 'monty', '$2y$10$supermanalsousethiscmeaRi7ABZHpOgSgQH1fRdnxbUVhGy.mtC', 'Monty', 'monty', 'monty@monty', '', 'subscriber', '$2y$10$supermanalsousethiscms'),
(11, 'Wolve', '$2y$10$supermanalsousethiscmeAW7wuHqgPgWHOPfCQbsRuvGVPY0w736', '', '', 'Wolve@Wolve.com', '', 'subscriber', '$2y$10$supermanalsousethiscms'),
(12, 'm1', '$2y$12$YZ46K/iP1N871mQ0ChCNnO5lNqq4yNJowt6g.U5TFSRqohXW609Gu', 'm1', 'm1', 'm1@m1.com', '', 'admin', '$2y$10$supermanalsousethiscms');

-- --------------------------------------------------------

--
-- Table structure for table `users_online`
--

CREATE TABLE IF NOT EXISTS `users_online` (
  `id` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_online`
--

INSERT INTO `users_online` (`id`, `session`, `time`) VALUES
(3, 'deh4prhalrcb06lregrqavfon7', 1446035985),
(4, 'p1q40v5oti7pd95qvjbqj6dli1', 1446033186),
(5, 'qmmk3n1pprtn9e9vcnv3vgk1d2', 1446033489);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
