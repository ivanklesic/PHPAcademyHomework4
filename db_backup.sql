-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2020 at 11:46 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movies`
--

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`id`, `first_name`, `last_name`) VALUES
(1, 'Samuel L.', 'Jackson'),
(2, 'Bruce', 'Willis'),
(3, 'Christian', 'Bale'),
(4, 'Kevin', 'Spacey'),
(5, 'Tim', 'Roth'),
(6, 'Guy', 'Pearce'),
(7, 'Carrie Ann', 'Moss'),
(8, 'Keanu', 'Reeves'),
(9, 'Joe', 'Pantoliano'),
(10, 'Jennifer', 'Jason Leigh'),
(11, 'Hugo', 'Weaving'),
(12, 'John', 'Travolta'),
(13, 'Uma', 'Thurman'),
(14, 'Nicolas', 'Cage'),
(15, 'Sean', 'Connery'),
(16, 'Ed', 'Harris'),
(17, 'Heath', 'Ledger'),
(18, 'Morgan', 'Freeman'),
(19, 'Leonardo', 'DiCaprio'),
(20, 'Stephen', 'Baldwin'),
(21, 'Gabriel', 'Byrne'),
(22, 'Benicio', 'Del Toro'),
(23, 'Harvey', 'Keitel'),
(24, 'Michael', 'Madsen'),
(25, 'Tom', 'Cruise'),
(26, 'Jon', 'Voight'),
(27, 'Jean', 'Reno'),
(28, 'Natalie', 'Portman'),
(29, 'Gary', 'Oldman'),
(30, 'Milla', 'Jovovich'),
(31, 'Mark', 'Ruffalo'),
(32, 'Ben', 'Kingsley'),
(33, 'Ving', 'Rhames'),
(34, 'Josh', 'Hartnett');

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`id`, `first_name`, `last_name`) VALUES
(1, 'Brad', 'Anderson'),
(2, 'Quentin', 'Tarantino'),
(3, 'Michael', 'Bay'),
(4, 'Christopher', 'Nolan'),
(5, 'Bryan', 'Singer'),
(6, 'Brian', 'De Palma'),
(7, 'Martin', 'Scorsese'),
(8, 'Luc', 'Besson'),
(9, 'Larry', 'Wachowski');

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `release_date` date NOT NULL,
  `won_oscar` tinyint(4) NOT NULL,
  `director_id` int(11) NOT NULL,
  `total_ratings_sum` int(11) DEFAULT '0',
  `total_ratings_count` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`id`, `name`, `release_date`, `won_oscar`, `director_id`, `total_ratings_sum`, `total_ratings_count`) VALUES
(2, 'The rock', '1996-06-21', 0, 3, 6, 1),
(4, 'The usual suspects', '1995-08-25', 1, 5, 27, 3),
(5, 'Reservoir dogs', '1993-01-15', 0, 2, 38, 5),
(7, 'Shutter island', '2010-03-12', 0, 7, 9, 1),
(8, 'Memento', '2000-10-20', 0, 4, 34, 4),
(9, 'The machinist', '2005-03-18', 0, 1, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `movie_actor`
--

CREATE TABLE `movie_actor` (
  `id` int(11) NOT NULL,
  `actor_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movie_actor`
--

INSERT INTO `movie_actor` (`id`, `actor_id`, `movie_id`, `role`) VALUES
(7, 16, 2, 'General Francis X. Hummel'),
(8, 14, 2, 'Stanley Goodspeed'),
(9, 15, 2, 'John Patrick Mason'),
(14, 4, 4, 'SPOILER ALERT Verbal Kint / Keyser Soze'),
(15, 21, 4, 'Keaton'),
(16, 20, 4, 'McManus'),
(17, 22, 4, 'Fenster'),
(25, 19, 7, 'Teddy Daniels'),
(26, 31, 7, 'Chuck Aule'),
(27, 32, 7, 'Dr. Cawley'),
(28, 6, 8, 'Leonard'),
(29, 7, 8, 'Natalie'),
(30, 9, 8, 'Teddy'),
(31, 3, 9, 'Trevor Reznik'),
(32, 10, 9, 'Stevie');

-- --------------------------------------------------------

--
-- Table structure for table `movie_rating`
--

CREATE TABLE `movie_rating` (
  `id` int(11) NOT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movie_rating`
--

INSERT INTO `movie_rating` (`id`, `reviewer_id`, `movie_id`, `rating`) VALUES
(4, 1, 4, 9),
(5, 1, 5, 7),
(7, 1, 8, 9),
(10, 1, 7, 9),
(15, 2, 8, 9),
(20, 2, 5, 9),
(23, 3, 5, 8),
(25, 3, 8, 9),
(31, 4, 5, 7),
(34, 5, 4, 9),
(35, 5, 5, 7),
(38, 5, 9, 9),
(42, 6, 2, 6),
(43, 6, 4, 9),
(45, 6, 8, 7);

--
-- Triggers `movie_rating`
--
DELIMITER $$
CREATE TRIGGER `update_rating_on_delete` BEFORE DELETE ON `movie_rating` FOR EACH ROW update movie
    SET total_ratings_count = total_ratings_count - 1,
        total_ratings_sum = total_ratings_sum - OLD.rating
    WHERE id = OLD.movie_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_rating_on_insert` AFTER INSERT ON `movie_rating` FOR EACH ROW update movie
    SET total_ratings_count = total_ratings_count + 1,
        total_ratings_sum = total_ratings_sum + NEW.rating
    WHERE id = NEW.movie_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_rating_on_update` AFTER UPDATE ON `movie_rating` FOR EACH ROW update movie
    SET total_ratings_sum = total_ratings_sum - OLD.rating,
        total_ratings_sum = total_ratings_sum + NEW.rating
    WHERE id = NEW.movie_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reviewer`
--

CREATE TABLE `reviewer` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviewer`
--

INSERT INTO `reviewer` (`id`, `first_name`, `last_name`) VALUES
(1, 'Ivan', 'Ivanović'),
(2, 'Marko', 'Marković'),
(3, 'Luka', 'Lukić'),
(4, 'Matko', 'Ivić'),
(5, 'Matej', 'Matić'),
(6, 'Mirko', 'Mirkić');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `director_id` (`director_id`);

--
-- Indexes for table `movie_actor`
--
ALTER TABLE `movie_actor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `actor_id` (`actor_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `movie_rating`
--
ALTER TABLE `movie_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviewer_id` (`reviewer_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `reviewer`
--
ALTER TABLE `reviewer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actor`
--
ALTER TABLE `actor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `director`
--
ALTER TABLE `director`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `movie_actor`
--
ALTER TABLE `movie_actor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `movie_rating`
--
ALTER TABLE `movie_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `reviewer`
--
ALTER TABLE `reviewer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`director_id`) REFERENCES `director` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `movie_actor`
--
ALTER TABLE `movie_actor`
  ADD CONSTRAINT `movie_actor_ibfk_1` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `movie_actor_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `movie_rating`
--
ALTER TABLE `movie_rating`
  ADD CONSTRAINT `movie_rating_ibfk_1` FOREIGN KEY (`reviewer_id`) REFERENCES `reviewer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `movie_rating_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
