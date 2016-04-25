CREATE SCHEMA IF NOT EXISTS `Husky` DEFAULT CHARACTER SET utf8 ;
USE `Husky` ;

-- -----------------------------------------------------
-- Table `Husky`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Husky`.`Users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `date_birth` DATE NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Husky`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Husky`.`Courses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `short_description` VARCHAR(45) NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `teacher_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_id_teacher_idx` (`teacher_id` ASC),
  CONSTRAINT `teacher_id_fk`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `Husky`.`Users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Husky`.`UserCourses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Husky`.`UserCourses` (
  `user_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `course_id`),
  INDEX `course_id_fk_idx` (`course_id` ASC),
  CONSTRAINT `user_id_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `Husky`.`Users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `course_id_fk`
    FOREIGN KEY (`course_id`)
    REFERENCES `Husky`.`Courses` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Husky`.`Modules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Husky`.`Modules` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `short_description` VARCHAR(255) NOT NULL,
  `article` VARCHAR(4000) NOT NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `course_id_fk_cn`
    FOREIGN KEY (`course_id`)
    REFERENCES `Husky`.`Courses` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Husky`.`Videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Husky`.`Videos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `link` VARCHAR(255) NOT NULL,
  `module_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `module_id_fk`
    FOREIGN KEY (`module_id`)
    REFERENCES `Husky`.`Modules` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


