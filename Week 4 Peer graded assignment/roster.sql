
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";




--
-- Database: `roster`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `title` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `title`) VALUES
(1, 'si106'),
(2, 'si110'),
(3, 'si206');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`user_id`, `course_id`, `role`) VALUES
(1, 1, 1),
(2, 1, 0),
(3, 1, 0),
(4, 1, 0),
(5, 1, 0),
(6, 2, 1),
(7, 2, 0),
(8, 2, 0),
(9, 2, 0),
(10, 2, 0),
(11, 3, 1),
(12, 3, 0),
(13, 3, 0),
(14, 3, 0),
(15, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`) VALUES
(2, 'Aaliyah'),
(3, 'Dillan'),
(12, 'Eilidh'),
(13, 'Ellis'),
(4, 'Dora'),
(11, 'Tylor'),
(7, 'Adana'),
(8, 'Aneshka'),
(9, 'Malayka'),
(10, 'Mei'),
(14, 'Iria'),
(6, 'Margaret'),
(5, 'Hema'),
(15, 'Yva'),
(1, 'Natividad');

/*
Natividad, si106, Instructor
Aaliyah, si106, Learner
Dillan, si106, Learner
Dora, si106, Learner
Hema, si106, Learner
Margaret, si110, Instructor
Adana, si110, Learner
Aneshka, si110, Learner
Malayka, si110, Learner
Mei, si110, Learner
Tylor, si206, Instructor
Eilidh, si206, Learner
Ellis, si206, Learner
Iria, si206, Learner
Yva, si206, Learner
*/
--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`user_id`,`course_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `member_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

SELECT `User`.name, Course.title, Member.role
    FROM `User` JOIN Member JOIN Course
    ON `User`.user_id = Member.user_id AND Member.course_id = Course.course_id
    ORDER BY Course.title, Member.role DESC, `User`.name
