-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2025 at 03:33 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `be25_exam6_bigeventskimschlueter`
--
CREATE DATABASE IF NOT EXISTS `be25_exam6_bigeventskimschlueter` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `be25_exam6_bigeventskimschlueter`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `street_name` varchar(100) NOT NULL,
  `street_number` varchar(5) NOT NULL,
  `zip_code` varchar(5) NOT NULL,
  `city_name` varchar(100) NOT NULL,
  `country_name` varchar(100) NOT NULL,
  `location_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `street_name`, `street_number`, `zip_code`, `city_name`, `country_name`, `location_name`) VALUES
(1, 'Albertinaplatz', '1', '1010', 'Vienna', 'Austria', 'Albertina Museum'),
(2, 'Lobkowitzplatz', '2', '1010', 'Vienna', 'Austria', 'Theatermuseum'),
(3, 'Karlsplatz', '8', '1040', 'Vienna', 'Austria', 'Wien Museum Karlsplatz'),
(4, 'Spittelberggasse', '10', '1070', 'Vienna', 'Austria', 'Theater am Spittelberg'),
(5, 'Schloss Schönbrunn, Hofratstrakt', '0', '1130', 'Vienna', 'Austria', 'Marionette Theater at Schönbrunn Palace'),
(6, 'Schönbrunner Schlossstraße', '0', '1130', 'Vienna', 'Austria', 'Schönbrunn Palace (Schloss Schönbrunn)'),
(7, 'Rathausplatz', '0', '1010', 'Vienna', 'Austria', 'City Hall Square');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `start_time` datetime NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `capacity` int(11) NOT NULL,
  `contact_email` varchar(100) NOT NULL,
  `contact_phone_number` varchar(50) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `end_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `address_id`, `type_id`, `name`, `start_time`, `image`, `capacity`, `contact_email`, `contact_phone_number`, `url`, `description`, `end_time`) VALUES
(2, 1, 5, 'Brigitte Kowanz', '2025-08-14 10:00:00', 'https://events.wien.info/media/images/brigitte-kowanz-email02081984-03081984-202_c_bildrecht-foto-peter-hoiss.jpg', 100, 'info@albertina.at', '+43 1 534 830', 'https://www.albertina.at/', 'Light Is What We See\n\nThe question, \"What is light?\" stands at the center of Brigitte Kowanz’ oeuvre. Her answer is: \"Light is what we see\" - an allusion to the paradoxical fact that light makes everything visible but itself normally remains invisible. The eponymous retrospective at the Albertina guides viewers through works created by this important artist since the 1980s.', '2025-08-14 18:00:00'),
(3, 2, 4, 'Johann Strauss - The Exhibtion', '2025-08-17 10:00:00', 'https://events.wien.info/media/images/TM_Strauss_112024_Preview_DS-5699.jpg', 100, 'info@theatermuseum.at', '+43 1 525 24 2729', 'http://www.theatermuseum.at/', 'Vienna is proud to present the official exhibition commemorating the King of the Waltz.\n\nThe exhibition offers you the perfect opportunity to experience the glamour of the Strauss era in the city that made his music a global sensation.\n\nJohann Strauss was a superstar of his time. He was the proponent of developing dancemusic into serious concert music. He drew his audience into enthusiastic adoration asconductor and principal violinist ‘Schani Strauss’. Extensive tours saw him travel fromEurope to Russia and the USA. He was also a businessman and organizational talent, whoknew to involve his brothers Josef and Eduard in the family business, while his wives werein charge of appointments and finances in the background. He employed artists such assinger and first director of the Theater an der Wien Marie Geistinger as well as the star ofthe stage Alexander Girardi who guaranteed success for his operettas.The exhibition illuminates the exhausting lifestyle led by Johann Strauss, his relationshipto his parents and brothers, the so-called \'firm\', to his three wives and his lovers in Russia.Beyond his dance and marching music, the show furthermore focuses on An der schönenblauen Donau, his \'waltz for the world\', as well as his works for the stage, in particular DieFledermaus.\n\nIt will be the first time that objects from his written estate, including the original score forthe operetta Die Fledermaus, will be shown together with original objects associated withthe stagings of his works. This provides for a fascinating combination of the artist’smusical oeuvre and its translation for the stage. The exhibition will moreover illuminatethe context in the history of the theatre and contemporary politics.An exhibition by the KHM-Museumsverband in cooperation with the Vienna Library in City Hall and Johann Strauss 2025 Vienna', '2025-08-17 18:00:00'),
(4, 3, 6, 'Vienna. My History', '2025-08-19 09:00:00', 'https://events.wien.info/media/images/Wien_Museum_-_Wal_Poldi.jpg', 100, 'service@wienmuseum.at', '+43 1 505 874785173', 'http://www.wienmuseum.at/', 'The new permanent exhibition Vienna.\n\nMy History takes visitors on a journey through the centuries. Over 1,700 objects, from prehistoric to contemporary times, await across three levels and 35,000 square feet. The exhibition focuses on people and their lives, shaped by politics and religion, social structures, and the environment around them. Topics such as work, housing, traffic, immigration, and ecology shape everyday life, both then and now.\n\nThe history of Vienna unfolds in a chronological way that winds around the museum’s great hall. There, visitors encounter iconic objects, such as the 18ft-model of St. Stephen\'s Cathedral or Poldi, the enormous Prater whale floating in midair.\n\nAdmission free!', '2025-08-19 18:00:00'),
(5, 1, 9, 'Albert&Tina', '2025-08-20 18:00:00', 'https://events.wien.info/media/images/Albert_Tina.jpg', 200, 'info@albertina.at', '+43 1 534 830', 'https://www.albertina.at/', 'Exclusive outdoor after-work event 2025\n\nOnce again this year, meet up with friends, loved ones and colleagues after work on Vienna’s nicest terrace, and enjoy summer drinks while looking out at the Vienna State Opera. Every Wednesday between 6 p.m. and 11 p.m., it provides a unique and striking backdrop that will ensure a really special experience in combination with DJs playing the best uplifting tunes.\n\nWithin the historical walls of the Albertina bastion terrace, only in good weather!If the event is cancelled due to bad weather, the ticket will be valid for the next event.', '2025-08-20 23:00:00'),
(6, 4, 9, 'Theater am Spittelberg', '2025-08-14 00:00:00', 'https://events.wien.info/media/images/Spittelberg_Theater_Au%C3%9Fenansicht.JPEG', 100, 'tickets@theateramspittelberg.at', '+43 1 526 13 85', 'http://www.theateramspittelberg.at/', 'Summer stage 2025\n\nWorld music, Viennese music, pop, jazz, vaudeville, cabaret & comedy, theater and concerts for children\n\nThe focus of the summer stage of the Theater am Spittelberg is the unique and especially in Vienna in this expressive and powerful form lived together of cultures as well as a respectful and creative exchange of these different worlds. The artistic program of the Theater am Spittelberg is a cross-section of the cultures of this city.The close encounter of artists with audiences from all walks of life and of all ages make the Theater am Spittelberg a cultural world living room with a family atmosphere without any fear of contact. Quality and originality in a quaint venue with a lively character combine for a multi-faceted audience.', '2025-09-30 00:00:00'),
(7, 5, 4, 'The Magic Flute', '2025-08-20 20:00:00', 'https://events.wien.info/media/images/kinderzauberfl%C3%B6te_1_1.jpg', 50, 'office@marionettentheater.at', '+43 1 817 32 47', 'http://www.marionettentheater.at/', 'World famous opera by Wolfgang Amadé Mozart\n\nThis famous opera by Mozart is about the exciting story of the young Prince Tamino sent by the Queen of the Night to rescue her daughter Pamina, who was abducted by the Sovereign Sarastro. Tamino receives a Magic Flute, Papageno - the Birdcatcher - a magical carillon. Many tests have to be passed until Papageno gets his Papagena and Prince Tamino can marry his Princess Pamina.', '2025-08-20 22:00:00'),
(8, 6, 1, 'Schönbrunn Palace Concerts', '2025-08-21 20:30:00', 'https://events.wien.info/media/images/Schloss_Sch%C3%B6nbrunn_Konzerte_edit.jpg', 100, 'info@schoenbrunn.at', '+43 1 811 13 239', 'http://www.schoenbrunn.at/', 'In the revitalized Schönbrunn Orangery, where Mozart himself once made music, the Schönbrunn Palace Orchestra and the Schönbrunn Palace Ensemble perform a concert with selected works by Mozart and Strauss, accompanied by dance and song.In the first part of the concert visitors will enjoy some of the most beautiful overtures, arias and duets from Wolfgang Amadeus Mozart\'s concertos and operas, such as \"Le Nozze di Figaro\", \"The Magic Flute\" and \"Don Giovanni\".The most popular operetta arias, waltzes and polkas by the waltz king Johann Strauss - from \"Die Fledermaus\" and \"Der Zigeunerbaron\" to the \"Danube Waltz\" and the \"Radetzky March\" - are offered in the second part of the concert.', '2025-08-21 22:00:00'),
(9, 7, 3, 'Film Festival at Vienna\'s Rathausplatz', '2025-07-28 00:00:00', 'https://events.wien.info/media/images/Film_Festival_Rathausplatz_von_oben.jpg', 300, 'filmfestival@stadtwienmarketing.at', NULL, 'https://filmfestival-rathausplatz.at/', 'Action!\n\nIn summer, the Rathausplatz is once again a vibrant open-air meeting place: from June 29, the Film Festival brings top-class music from opera, classical music, jazz and pop/rock as well as culinary delights. Before that, there will be public soccer viewing of Austria\'s European Championship matches.Outstanding music productions, a social meeting place and top-class enjoyment - the Film Festival offers all of this in a magical location in the heart of the city. Let\'s look forward to a program of superlatives in 2025. There is something for everyone when productions from a wide variety of genres flicker across the 300-square-meter screen every evening.The Gastro Mile invites you on a culinary world tour: numerous gourmet stands offer freshly prepared dishes from all over the world from 11 a.m. to midnight.\n\nFilm starts: daily at dusk\n\nFree admission!', '2025-08-31 23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `event_type`
--

CREATE TABLE `event_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_type`
--

INSERT INTO `event_type` (`id`, `name`) VALUES
(1, 'Music'),
(2, 'Sports'),
(3, 'Movie'),
(4, 'Theater'),
(5, 'Art'),
(6, 'History'),
(9, 'Festival');

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3BAE0AA7F5B7AF75` (`address_id`),
  ADD KEY `IDX_3BAE0AA7C54C8C93` (`type_id`);

--
-- Indexes for table `event_type`
--
ALTER TABLE `event_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `event_type`
--
ALTER TABLE `event_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `FK_3BAE0AA7C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `event_type` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_3BAE0AA7F5B7AF75` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
