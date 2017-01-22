CREATE TABLE IF NOT EXISTS `Users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `date_birth` DATE NULL,
  PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `Covers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `file_name` varchar(128) NOT NULL,
  `file` blob NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `Courses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `short_description` VARCHAR(45) NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `teacher_id` INT NOT NULL,
  `cover_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `teacher_id_fk`
  FOREIGN KEY (`teacher_id`)
  REFERENCES `Users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `cover_id_fk`
  FOREIGN KEY (`cover_id`)
  REFERENCES `Covers` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `UserCourses` (
  `user_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `course_id`),
  CONSTRAINT `user_id_fk`
  FOREIGN KEY (`user_id`)
  REFERENCES `Users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `course_id_fk`
  FOREIGN KEY (`course_id`)
  REFERENCES `Courses` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `Modules` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `short_description` VARCHAR(255) NOT NULL,
  `article` VARCHAR(4000) NOT NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `course_id_fk_cn`
  FOREIGN KEY (`course_id`)
  REFERENCES `Courses` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `Videos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `link` VARCHAR(255) NOT NULL,
  `module_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `module_id_fk`
  FOREIGN KEY (`module_id`)
  REFERENCES `Modules` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
