-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bandmatedb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bandmatedb` ;

-- -----------------------------------------------------
-- Schema bandmatedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bandmatedb` DEFAULT CHARACTER SET utf8 ;
USE `bandmatedb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(200) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip_code` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `admin` TINYINT NULL,
  `date_of_birth` DATE NULL,
  `profile_image_url` VARCHAR(1000) NULL,
  `bio` TEXT NULL,
  `address_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `band`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `band` ;

CREATE TABLE IF NOT EXISTS `band` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(1000) NULL,
  `year_formed` YEAR NULL,
  `manager_id` INT NOT NULL,
  `band_image_url` VARCHAR(1000) NULL,
  `band_logo_url` VARCHAR(1000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_band_user1_idx` (`manager_id` ASC),
  CONSTRAINT `fk_band_user1`
    FOREIGN KEY (`manager_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `musician`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `musician` ;

CREATE TABLE IF NOT EXISTS `musician` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `bio` TEXT NULL,
  `vocals` TINYINT NULL,
  `band_member_image_url` VARCHAR(1000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instrument`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instrument` ;

CREATE TABLE IF NOT EXISTS `instrument` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `price` DECIMAL NULL,
  `musician_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_instrument_band_member1_idx` (`musician_id` ASC),
  CONSTRAINT `fk_instrument_band_member1`
    FOREIGN KEY (`musician_id`)
    REFERENCES `musician` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `venue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `venue` ;

CREATE TABLE IF NOT EXISTS `venue` (
  `id` INT NOT NULL,
  `name` VARCHAR(200) NULL,
  `capacity` INT NULL,
  `address_id` INT NOT NULL,
  `venue_image_url` VARCHAR(1000) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_venue_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_venue_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `performance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `performance` ;

CREATE TABLE IF NOT EXISTS `performance` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `performance_date` DATE NULL,
  `ticket_price` DECIMAL NULL,
  `name` VARCHAR(45) NULL,
  `venue_id` INT NOT NULL,
  `band_id` INT NOT NULL,
  `start_time` TIME NULL,
  `end_time` TIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_venue1_idx` (`venue_id` ASC),
  INDEX `fk_event_band1_idx` (`band_id` ASC),
  CONSTRAINT `fk_event_venue1`
    FOREIGN KEY (`venue_id`)
    REFERENCES `venue` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_band1`
    FOREIGN KEY (`band_id`)
    REFERENCES `band` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `band_member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `band_member` ;

CREATE TABLE IF NOT EXISTS `band_member` (
  `band_id` INT NOT NULL,
  `musician_id` INT NOT NULL,
  `stage_name` VARCHAR(45) NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`band_id`, `musician_id`),
  INDEX `fk_band_has_band_member_band_member1_idx` (`musician_id` ASC),
  INDEX `fk_band_has_band_member_band1_idx` (`band_id` ASC),
  CONSTRAINT `fk_band_has_band_member_band1`
    FOREIGN KEY (`band_id`)
    REFERENCES `band` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_band_has_band_member_band_member1`
    FOREIGN KEY (`musician_id`)
    REFERENCES `musician` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genre` ;

CREATE TABLE IF NOT EXISTS `genre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `performance_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `performance_comment` ;

CREATE TABLE IF NOT EXISTS `performance_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `performance_id` INT NOT NULL,
  `comment` TEXT NULL,
  `comment_date` DATETIME NULL,
  `reply_to_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_comments_user1_idx` (`user_id` ASC),
  INDEX `fk_event_comments_event1_idx` (`performance_id` ASC),
  INDEX `fk_event_comments_event_comments1_idx` (`reply_to_id` ASC),
  CONSTRAINT `fk_event_comments_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_comments_event1`
    FOREIGN KEY (`performance_id`)
    REFERENCES `performance` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_comments_event_comments1`
    FOREIGN KEY (`reply_to_id`)
    REFERENCES `performance_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `performance_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `performance_review` ;

CREATE TABLE IF NOT EXISTS `performance_review` (
  `user_id` INT NOT NULL,
  `performance_id` INT NOT NULL,
  `rating` INT NOT NULL,
  `rating_comment` TEXT NULL,
  `review_date` DATETIME NULL,
  PRIMARY KEY (`user_id`, `performance_id`),
  INDEX `fk_user_has_event_event1_idx` (`performance_id` ASC),
  INDEX `fk_user_has_event_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_event_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_event_event1`
    FOREIGN KEY (`performance_id`)
    REFERENCES `performance` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `followed_band`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `followed_band` ;

CREATE TABLE IF NOT EXISTS `followed_band` (
  `user_id` INT NOT NULL,
  `band_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `band_id`),
  INDEX `fk_user_has_band_band1_idx` (`band_id` ASC),
  INDEX `fk_user_has_band_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_band_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_band_band1`
    FOREIGN KEY (`band_id`)
    REFERENCES `band` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `followed_musician`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `followed_musician` ;

CREATE TABLE IF NOT EXISTS `followed_musician` (
  `musician_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`musician_id`, `user_id`),
  INDEX `fk_band_member_has_user_user1_idx` (`user_id` ASC),
  INDEX `fk_band_member_has_user_band_member1_idx` (`musician_id` ASC),
  CONSTRAINT `fk_band_member_has_user_band_member1`
    FOREIGN KEY (`musician_id`)
    REFERENCES `musician` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_band_member_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `genre_has_band`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genre_has_band` ;

CREATE TABLE IF NOT EXISTS `genre_has_band` (
  `genre_id` INT NOT NULL,
  `band_id` INT NOT NULL,
  PRIMARY KEY (`genre_id`, `band_id`),
  INDEX `fk_genre_has_band_band1_idx` (`band_id` ASC),
  INDEX `fk_genre_has_band_genre1_idx` (`genre_id` ASC),
  CONSTRAINT `fk_genre_has_band_genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_genre_has_band_band1`
    FOREIGN KEY (`band_id`)
    REFERENCES `band` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ticket_sale`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ticket_sale` ;

CREATE TABLE IF NOT EXISTS `ticket_sale` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `performance_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `ticket_price` DECIMAL(8,2) NULL,
  `sale_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ticket_sale_performance1_idx` (`performance_id` ASC),
  INDEX `fk_ticket_sale_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_ticket_sale_performance1`
    FOREIGN KEY (`performance_id`)
    REFERENCES `performance` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_sale_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS bandmateuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'bandmateuser'@'localhost' IDENTIFIED BY 'bandmateuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'bandmateuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (1, '3601 Lyon St', 'San Francisco', 'California', '94123');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (2, '88 5th St', 'San Francisco', 'California', '94103');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (3, '900 Marin St', 'San Francisco', 'California', '94124');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (4, '19641 E Parker Square Dr', 'Parker', 'Colorado', '80134');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (5, '3317 E Colfax Ave', 'Denver', 'Colorado', '80206');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (6, '115 Wilcox St Suite 220', 'Castle Rock', 'Colorado', '80104');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (7, '1000 Broadway', 'Devner', 'Colorado', '80203');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (8, '11160 S Pikes Peak Dr', 'Parker', 'Colorado', '80138');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (9, '30 Coldbrook St NE', 'Grand Rapids', 'Michigan', '49503');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (10, '3304 Larimer St', 'Denver', 'Colorado', '80205');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (1, 'admin', '1234', 1, '888-555-2022', 'admin1@bandmate.com', 'Jimmy', 'Kicks', 1, '1996-01-01', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (2, 'test', '1234', 1, '333-444-1111', 'test@live.com', 'test', 'test', 0, '1996-01-02', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (3, 'bandmateuser', '5678', 1, '333-111-9999', 'bandmateuser@bandmate.com', 'Sally', 'Limbs', 0, '1996-01-03', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (4, 'HammerRockManage', '1234', 1, '444-111-9000', 'hammerofrock@bandmate.com', 'Rodney', 'Rockerson', 0, '1996-01-04', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (5, 'KobeSalazar', '1234', 1, '888-888-3333', 'KobeSalazar@gmail.com', 'Kobe', 'Salazar', 0, '1996-01-05', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (6, 'BarbaraStroehlein', '1234', 1, '888-888-3334', 'BarbaraStroehlein@gmail.com', 'Barbara', 'Stroehlein', 0, '1996-01-06', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (7, 'BrendaSmith', '1234', 1, '888-888-3335', 'BrendaSmith@gmail.com', 'Brenda', 'Smith', 0, '1996-01-07', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (8, 'KatherineMedina', '1234', 1, '888-888-3336', 'KatherineMedina@gmail.com', 'Katherine', 'Medina', 0, '1996-01-08', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (9, 'MaryFurnari', '1234', 1, '888-888-3337', 'MaryFurnari@gmail.com', 'Mary', 'Furnari', 0, '1996-01-09', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (10, 'WalterTemeyosa', '1234', 1, '888-888-3338', 'WalterTemeyosa@gmail.com', 'Walter', 'Temeyosa', 0, '1996-01-10', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (11, 'AspenMedina', '1234', 1, '888-888-3339', 'AspenMedina@gmail.com', 'Aspen', 'Medina', 0, '1996-01-11', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (12, 'DeloresHall', '1234', 1, '888-888-3340', 'DeloresHall@gmail.com', 'Delores', 'Hall', 0, '1996-01-12', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (13, 'FaithHall', '1234', 1, '888-888-3341', 'FaithHall@gmail.com', 'Faith', 'Hall', 0, '1996-01-13', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (14, 'MarleneShipwash', '1234', 1, '888-888-3342', 'MarleneShipwash@gmail.com', 'Marlene', 'Shipwash', 0, '1996-01-14', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (15, 'MichaelZimmerman', '1234', 1, '888-888-3343', 'MichaelZimmerman@gmail.com', 'Michael', 'Zimmerman', 0, '1996-01-15', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (16, 'AspenCulver', '1234', 1, '888-888-3344', 'AspenCulver@gmail.com', 'Aspen', 'Culver', 0, '1996-01-16', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (17, 'JulianEverly', '1234', 1, '888-888-3345', 'JulianEverly@gmail.com', 'Julian', 'Everly', 0, '1996-01-17', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (18, 'JamesEstrada', '1234', 1, '888-888-3346', 'JamesEstrada@gmail.com', 'James', 'Estrada', 0, '1996-01-18', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (19, 'JeremyBaker', '1234', 1, '888-888-3347', 'JeremyBaker@gmail.com', 'Jeremy', 'Baker', 0, '1996-01-19', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (20, 'BarnitoHairston', '1234', 1, '888-888-3348', 'BarnitoHairston@gmail.com', 'Barnito', 'Hairston', 0, '1996-01-20', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (21, 'KamoraWhite Crane', '1234', 1, '888-888-3349', 'KamoraWhite Crane@gmail.com', 'Kamora', 'White Crane', 0, '1996-01-21', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (22, 'MarikoDelk', '1234', 1, '888-888-3350', 'MarikoDelk@gmail.com', 'Mariko', 'Delk', 0, '1996-01-22', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (23, 'KatherineDavis', '1234', 1, '888-888-3351', 'KatherineDavis@gmail.com', 'Katherine', 'Davis', 0, '1996-01-23', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (24, 'AliciaKreibich', '1234', 1, '888-888-3352', 'AliciaKreibich@gmail.com', 'Alicia', 'Kreibich', 0, '1996-01-24', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (25, 'LexieDettweiler', '1234', 1, '888-888-3353', 'LexieDettweiler@gmail.com', 'Lexie', 'Dettweiler', 0, '1996-01-25', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (26, 'SydneyHicks', '1234', 1, '888-888-3354', 'SydneyHicks@gmail.com', 'Sydney', 'Hicks', 0, '1996-01-26', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (27, 'TarranLechman', '1234', 1, '888-888-3355', 'TarranLechman@gmail.com', 'Tarran', 'Lechman', 0, '1996-01-27', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (28, 'KelseyLim', '1234', 1, '888-888-3356', 'KelseyLim@gmail.com', 'Kelsey', 'Lim', 0, '1996-01-28', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (29, 'BrooklynGantt', '1234', 1, '888-888-3357', 'BrooklynGantt@gmail.com', 'Brooklyn', 'Gantt', 0, '1996-01-29', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (30, 'AspenParker', '1234', 1, '888-888-3358', 'AspenParker@gmail.com', 'Aspen', 'Parker', 0, '1996-01-30', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (31, 'TroyDesir', '1234', 1, '888-888-3359', 'TroyDesir@gmail.com', 'Troy', 'Desir', 0, '1996-01-31', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (32, 'GorettiDreamer', '1234', 1, '888-888-3360', 'GorettiDreamer@gmail.com', 'Goretti', 'Dreamer', 0, '1996-02-01', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (33, 'SloaneTrujillo', '1234', 1, '888-888-3361', 'SloaneTrujillo@gmail.com', 'Sloane', 'Trujillo', 0, '1996-02-02', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (34, 'JosephineIsom', '1234', 1, '888-888-3362', 'JosephineIsom@gmail.com', 'Josephine', 'Isom', 0, '1996-02-03', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (35, 'DavidNguyen', '1234', 1, '888-888-3363', 'DavidNguyen@gmail.com', 'David', 'Nguyen', 0, '1996-02-04', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (36, 'JeremyVillalba', '1234', 1, '888-888-3364', 'JeremyVillalba@gmail.com', 'Jeremy', 'Villalba', 0, '1996-02-05', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (37, 'MichaelAltreche', '1234', 1, '888-888-3365', 'MichaelAltreche@gmail.com', 'Michael', 'Altreche', 0, '1996-02-06', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (38, 'KaylerMorisset-Everly', '1234', 1, '888-888-3366', 'KaylerMorisset-Everly@gmail.com', 'Kayler', 'Morisset-Everly', 0, '1996-02-07', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (39, 'TanishaYates', '1234', 1, '888-888-3367', 'TanishaYates@gmail.com', 'Tanisha', 'Yates', 0, '1996-02-08', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (40, 'CeciliaFranklyn', '1234', 1, '888-888-3368', 'CeciliaFranklyn@gmail.com', 'Cecilia', 'Franklyn', 0, '1996-02-09', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (41, 'KaylaSpanier', '1234', 1, '888-888-3369', 'KaylaSpanier@gmail.com', 'Kayla', 'Spanier', 0, '1996-02-10', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (42, 'RyleeWollert', '1234', 1, '888-888-3370', 'RyleeWollert@gmail.com', 'Rylee', 'Wollert', 0, '1996-02-11', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (43, 'LailaVought', '1234', 1, '888-888-3371', 'LailaVought@gmail.com', 'Laila', 'Vought', 0, '1996-02-12', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (44, 'StephenMartinez', '1234', 1, '888-888-3372', 'StephenMartinez@gmail.com', 'Stephen', 'Martinez', 0, '1996-02-13', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (45, 'JesusRoberts', '1234', 1, '888-888-3373', 'JesusRoberts@gmail.com', 'Jesus', 'Roberts', 0, '1996-02-14', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (46, 'GavynUrrutia-Everly', '1234', 1, '888-888-3374', 'GavynUrrutia-Everly@gmail.com', 'Gavyn', 'Urrutia-Everly', 0, '1996-02-15', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (47, 'LilyLang', '1234', 1, '888-888-3375', 'LilyLang@gmail.com', 'Lily', 'Lang', 0, '1996-02-16', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (48, 'BriceHaberkorn', '1234', 1, '888-888-3376', 'BriceHaberkorn@gmail.com', 'Brice', 'Haberkorn', 0, '1996-02-17', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (49, 'EvelynMudliar', '1234', 1, '888-888-3377', 'EvelynMudliar@gmail.com', 'Evelyn', 'Mudliar', 0, '1996-02-18', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (50, 'JamesHarvey', '1234', 1, '888-888-3378', 'JamesHarvey@gmail.com', 'James', 'Harvey', 0, '1996-02-19', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (51, 'ChristineGonzalez', '1234', 1, '888-888-3379', 'ChristineGonzalez@gmail.com', 'Christine', 'Gonzalez', 0, '1996-02-20', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (52, 'AdamEverly', '1234', 1, '888-888-3380', 'AdamEverly@gmail.com', 'Adam', 'Everly', 0, '1996-02-21', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (53, 'OliviaPhilbin', '1234', 1, '888-888-3381', 'OliviaPhilbin@gmail.com', 'Olivia', 'Philbin', 0, '1996-02-22', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (54, 'LindaLeonard', '1234', 1, '888-888-3382', 'LindaLeonard@gmail.com', 'Linda', 'Leonard', 0, '1996-02-23', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (55, 'DennisBeitey-Everly', '1234', 1, '888-888-3383', 'DennisBeitey-Everly@gmail.com', 'Dennis', 'Beitey-Everly', 0, '1996-02-24', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `profile_image_url`, `bio`, `address_id`) VALUES (56, 'MarilynEppard', '1234', 1, '888-888-3384', 'MarilynEppard@gmail.com', 'Marilyn', 'Eppard', 0, '1996-02-25', 'abc', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `band`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (1, 'Hammer of Rock', 'Classic hard rock, a good time for all!', 2018, 3, 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80', NULL);
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (2, 'The Sandbox', 'The smootheset of experimental free-form jazz, you\'re gonna love it.', 2013, 3, 'https://images.unsplash.com/photo-1488197047962-b48492212cda?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1467&q=80', NULL);
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (3, 'The Lamb Commander', 'Straight out of Dallas, Texas, we are bringing southern metal to a town near you!', 2021, 3, 'https://images.unsplash.com/photo-1523311964370-42ac336c878b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', NULL);
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (4, 'The Correction Screens', 'We will keep you dancing all night long with our sick beats and unparalleled energy.', 2012, 3, 'https://images.unsplash.com/photo-1562408590-e32931084e23?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', NULL);
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (5, 'Flock Freeman', 'A three piece country band like you\'ve never heard or seen before.', 1998, 3, 'https://images.unsplash.com/photo-1563019826-3016b0ddc9db?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80', NULL);
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (6, 'Hook Offense', 'All blues, all day', 2000, 3, 'https://images.unsplash.com/photo-1610741620547-1191d693e43d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', NULL);
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (7, 'Lilacs Locus', 'Psychedelic rock meets Scandinavian death metal', 2019, 3, 'https://images.unsplash.com/photo-1589186118523-34c03029a4b3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80', NULL);
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (8, 'Housetop Sparkle', 'Post-grunge from Seattle area', 2017, 3, 'https://images.unsplash.com/photo-1520637645622-6740bb3491c3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=958&q=80', NULL);
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (9, 'Honeybee Races', 'Classical music with an electronic twist', 2006, 3, 'https://images.unsplash.com/photo-1573762462482-d8acd37ffa1f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1479&q=80', NULL);
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (10, 'Free Southland', 'Old school country from way down south', 1993, 3, 'https://images.unsplash.com/photo-1443928281170-6900dc50ac55?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80', NULL);
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (11, 'Jam Accentuate', 'You bring the peanut butter, we bring the jam', 2021, 3, 'https://images.unsplash.com/photo-1500912239908-4ee48acb3a7f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `musician`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `musician` (`id`, `first_name`, `last_name`, `phone`, `bio`, `vocals`, `band_member_image_url`) VALUES (1, 'Rocky', 'Rockerson', '555-300-1129', 'I am the lead singer of my awesome band', 1, 'https://images.unsplash.com/photo-1525857597365-5f6dbff2e36e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80');
INSERT INTO `musician` (`id`, `first_name`, `last_name`, `phone`, `bio`, `vocals`, `band_member_image_url`) VALUES (2, 'Billy', 'Hammer', '555-300-1128', 'I am the lead guitarist of my awesome band', 0, 'https://images.unsplash.com/photo-1566937169390-7be4c63b8a0e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1738&q=80');
INSERT INTO `musician` (`id`, `first_name`, `last_name`, `phone`, `bio`, `vocals`, `band_member_image_url`) VALUES (3, 'Frank', 'Freeman', NULL, 'Singer and banjo player for Flock Freeman', 1, 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80');
INSERT INTO `musician` (`id`, `first_name`, `last_name`, `phone`, `bio`, `vocals`, `band_member_image_url`) VALUES (4, 'Fran', 'Freeman', NULL, 'Drummer for Flock Freeman', 0, 'https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=461&q=80');
INSERT INTO `musician` (`id`, `first_name`, `last_name`, `phone`, `bio`, `vocals`, `band_member_image_url`) VALUES (5, 'Follie', 'Freeman', NULL, 'Guitarist for Flock Freeman', 0, 'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80');
INSERT INTO `musician` (`id`, `first_name`, `last_name`, `phone`, `bio`, `vocals`, `band_member_image_url`) VALUES (6, 'Tevin', 'Edmonds', NULL, 'Sax player for The Sandbox', 0, 'https://images.unsplash.com/photo-1570158268183-d296b2892211?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80');
INSERT INTO `musician` (`id`, `first_name`, `last_name`, `phone`, `bio`, `vocals`, `band_member_image_url`) VALUES (7, 'Shona', 'Cartwright', NULL, 'Drummer for The Sandbox', 0, 'https://images.unsplash.com/photo-1571327073757-71d13c24de30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80');
INSERT INTO `musician` (`id`, `first_name`, `last_name`, `phone`, `bio`, `vocals`, `band_member_image_url`) VALUES (8, 'Aila', 'Alexander', NULL, 'DJ for The Correction Screens', 1, 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80');
INSERT INTO `musician` (`id`, `first_name`, `last_name`, `phone`, `bio`, `vocals`, `band_member_image_url`) VALUES (9, 'Brody', 'Powers', NULL, 'Lamb Commander lead guitarist', 1, 'https://images.unsplash.com/photo-1552053831-71594a27632d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=362&q=80');
INSERT INTO `musician` (`id`, `first_name`, `last_name`, `phone`, `bio`, `vocals`, `band_member_image_url`) VALUES (10, 'Christian', 'Zamora', NULL, 'Lamb Commander drummer', 1, 'https://images.unsplash.com/photo-1580198144214-2a555ab6e793?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80');
INSERT INTO `musician` (`id`, `first_name`, `last_name`, `phone`, `bio`, `vocals`, `band_member_image_url`) VALUES (11, 'Amos', 'Donalds', NULL, 'Lamb Commander bassist', 0, 'https://images.unsplash.com/photo-1603838254880-2cdbb7a0c5ac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=416&q=80');
INSERT INTO `musician` (`id`, `first_name`, `last_name`, `phone`, `bio`, `vocals`, `band_member_image_url`) VALUES (12, 'Roseanne', 'Tucker', NULL, 'Hook Offense solo guitarist', 1, 'https://images.unsplash.com/flagged/photo-1566220978828-14849ad915d0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80');
INSERT INTO `musician` (`id`, `first_name`, `last_name`, `phone`, `bio`, `vocals`, `band_member_image_url`) VALUES (13, 'Victor', 'Hodge', NULL, 'Lilacs Locus organ player', 0, 'https://images.unsplash.com/photo-1605466153192-eadb02570ff3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80');
INSERT INTO `musician` (`id`, `first_name`, `last_name`, `phone`, `bio`, `vocals`, `band_member_image_url`) VALUES (14, 'Kaylum', 'Leach', NULL, 'Lilacs Locus drummer', 0, 'https://images.unsplash.com/photo-1593915451045-064bf8007a0f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80');
INSERT INTO `musician` (`id`, `first_name`, `last_name`, `phone`, `bio`, `vocals`, `band_member_image_url`) VALUES (15, 'Alan', 'McAndy', NULL, 'Lilacs Locus guitarist', 0, 'https://images.unsplash.com/photo-1568062916840-9d6bf3f09b87?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80');
INSERT INTO `musician` (`id`, `first_name`, `last_name`, `phone`, `bio`, `vocals`, `band_member_image_url`) VALUES (16, 'Phillip', 'Lim', NULL, 'Honeybee Races DJ', 0, 'https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80');
INSERT INTO `musician` (`id`, `first_name`, `last_name`, `phone`, `bio`, `vocals`, `band_member_image_url`) VALUES (17, 'Mac', 'Stein', NULL, 'Honeybee Races pianist', 1, 'https://images.unsplash.com/photo-1455274111113-575d080ce8cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80');
INSERT INTO `musician` (`id`, `first_name`, `last_name`, `phone`, `bio`, `vocals`, `band_member_image_url`) VALUES (18, 'Sam', 'Cornish', NULL, 'Jam Accentuate lead singer', 1, 'https://images.unsplash.com/photo-1618979251882-0b40ef3617f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80');

COMMIT;


-- -----------------------------------------------------
-- Data for table `instrument`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `instrument` (`id`, `name`, `price`, `musician_id`) VALUES (1, 'guitar', 750.00, 2);
INSERT INTO `instrument` (`id`, `name`, `price`, `musician_id`) VALUES (2, 'banjo', NULL, 3);
INSERT INTO `instrument` (`id`, `name`, `price`, `musician_id`) VALUES (3, 'drum', NULL, 4);
INSERT INTO `instrument` (`id`, `name`, `price`, `musician_id`) VALUES (4, 'guitar', NULL, 5);
INSERT INTO `instrument` (`id`, `name`, `price`, `musician_id`) VALUES (5, 'saxaphone', NULL, 6);
INSERT INTO `instrument` (`id`, `name`, `price`, `musician_id`) VALUES (6, 'drums', NULL, 7);
INSERT INTO `instrument` (`id`, `name`, `price`, `musician_id`) VALUES (7, 'guitar', NULL, 9);
INSERT INTO `instrument` (`id`, `name`, `price`, `musician_id`) VALUES (8, 'drums', NULL, 10);
INSERT INTO `instrument` (`id`, `name`, `price`, `musician_id`) VALUES (9, 'bass', NULL, 11);
INSERT INTO `instrument` (`id`, `name`, `price`, `musician_id`) VALUES (10, 'guitar', NULL, 12);
INSERT INTO `instrument` (`id`, `name`, `price`, `musician_id`) VALUES (11, 'organ', NULL, 13);
INSERT INTO `instrument` (`id`, `name`, `price`, `musician_id`) VALUES (12, 'drums', NULL, 14);
INSERT INTO `instrument` (`id`, `name`, `price`, `musician_id`) VALUES (13, 'guitar', NULL, 15);
INSERT INTO `instrument` (`id`, `name`, `price`, `musician_id`) VALUES (14, 'piano', NULL, 17);

COMMIT;


-- -----------------------------------------------------
-- Data for table `venue`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `venue` (`id`, `name`, `capacity`, `address_id`, `venue_image_url`, `description`) VALUES (1, 'Palace of Fine Arts', 200, 1, 'https://images.unsplash.com/photo-1566527899457-add2c6c00f3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80', 'The Palace of Fine Arts is a monumental structure located in the Marina District of San Francisco, California, originally constructed for the 1915 Panama–Pacific International Exposition to exhibit works of art. Completely rebuilt from 1964 to 1974, it is the only structure from the exposition that survives on site.');
INSERT INTO `venue` (`id`, `name`, `capacity`, `address_id`, `venue_image_url`, `description`) VALUES (2, 'TheSan Francisco Mint', 300, 2, 'https://www.ggcatering.com/system/uploads/fae/image/asset/3141/TheSanFranciscoMint_Both_.jpg', 'The San Francisco Mint is a historical venue which has been renovated as a beautiful venue for private events and conferences.');
INSERT INTO `venue` (`id`, `name`, `capacity`, `address_id`, `venue_image_url`, `description`) VALUES (3, 'The Midway', 400, 3, 'https://eventective-media.azureedge.net/2584021_lg.jpg', 'Humble joint offering cocktails in small, brick-lined quarters with bottles of liquor for sale.');
INSERT INTO `venue` (`id`, `name`, `capacity`, `address_id`, `venue_image_url`, `description`) VALUES (4, 'The Montgomery', 1000, 4, 'https://cdn0.weddingwire.com/vendor/826285/3_2/640/jpg/1449605424360-fellowship8.webp', 'We feature a bright, newly-renovated ballroom that has a breathtaking view of our gorgeous golf course and is affordable for events of all sizes.');
INSERT INTO `venue` (`id`, `name`, `capacity`, `address_id`, `venue_image_url`, `description`) VALUES (5, 'Blue Theater', 200, 5, 'https://images.unsplash.com/photo-1522776203873-e4961ae6e07d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', 'The Blue Note is a beautifully renovated, historic concert venue and private event space.');
INSERT INTO `venue` (`id`, `name`, `capacity`, `address_id`, `venue_image_url`, `description`) VALUES (6, 'Jones', 100, 6, 'https://images.unsplash.com/photo-1521543387600-c745f8e83d77?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', 'This beautiful waterfront facility has everything you need to make your next event truly special!');
INSERT INTO `venue` (`id`, `name`, `capacity`, `address_id`, `venue_image_url`, `description`) VALUES (7, 'Sports Castle', 500, 10, 'https://wp-denverite.s3.amazonaws.com/wp-content/uploads/sites/4/2021/08/Chrysler-building.png', 'Denver\'s previously premier automobile showroom is a three-story Deco Gothic building dressed in terracotta.');
INSERT INTO `venue` (`id`, `name`, `capacity`, `address_id`, `venue_image_url`, `description`) VALUES (8, 'Denver Post', 300, 8, 'https://www.denverpost.com/wp-content/uploads/2022/06/TDP-Z-ratiopatio-01-1.jpg?w=863', 'The new and renovated Denver venues are available for corporate parties, weddings, fundraisers, outdoor functions, business dinners, and music events.');
INSERT INTO `venue` (`id`, `name`, `capacity`, `address_id`, `venue_image_url`, `description`) VALUES (9, 'The Broadway', 100, 9, 'https://images.unsplash.com/photo-1562329265-95a6d7a83440?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=770&q=80', 'The Broadway is a multi-story bar and music venue');
INSERT INTO `venue` (`id`, `name`, `capacity`, `address_id`, `venue_image_url`, `description`) VALUES (10, 'Wild Goose Saloon', 100, 7, 'https://images.unsplash.com/photo-1560840881-4bbcd415a9ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80', 'Parker\'s newest music bar & restaurant. Featuring all genres of live music regional and national. Also, great food as well as patio dining.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `performance`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `performance` (`id`, `performance_date`, `ticket_price`, `name`, `venue_id`, `band_id`, `start_time`, `end_time`) VALUES (1, '2022-03-31', 23.49, 'An Adaption', 1, 3, '17:09:41', '19:38:57');
INSERT INTO `performance` (`id`, `performance_date`, `ticket_price`, `name`, `venue_id`, `band_id`, `start_time`, `end_time`) VALUES (2, '2022-09-04', 50.99, 'BSB Back', 2, 6, '16:18:21', '19:01:10');
INSERT INTO `performance` (`id`, `performance_date`, `ticket_price`, `name`, `venue_id`, `band_id`, `start_time`, `end_time`) VALUES (3, '2022-04-07', 25.99, 'Al Fresco', 3, 7, '16:29:13', '20:32:06');
INSERT INTO `performance` (`id`, `performance_date`, `ticket_price`, `name`, `venue_id`, `band_id`, `start_time`, `end_time`) VALUES (4, '2022-12-10', 30, 'Speak Now Tour', 4, 1, '16:18:22', '21:03:19');
INSERT INTO `performance` (`id`, `performance_date`, `ticket_price`, `name`, `venue_id`, `band_id`, `start_time`, `end_time`) VALUES (5, '2022-08-10', 100, 'Powerhouse', 5, 2, '15:44:49', '21:03:03');
INSERT INTO `performance` (`id`, `performance_date`, `ticket_price`, `name`, `venue_id`, `band_id`, `start_time`, `end_time`) VALUES (6, '2022-02-13', 200, 'The Night', 6, 9, '16:24:18', '19:54:50');
INSERT INTO `performance` (`id`, `performance_date`, `ticket_price`, `name`, `venue_id`, `band_id`, `start_time`, `end_time`) VALUES (7, '2022-12-08', 150, 'Caroling at the Fireplace', 7, 5, '16:45:02', '21:42:30');
INSERT INTO `performance` (`id`, `performance_date`, `ticket_price`, `name`, `venue_id`, `band_id`, `start_time`, `end_time`) VALUES (8, '2022-06-18', 80, 'Bloom', 8, 4, '17:47:06', '21:54:25');
INSERT INTO `performance` (`id`, `performance_date`, `ticket_price`, `name`, `venue_id`, `band_id`, `start_time`, `end_time`) VALUES (9, '2022-12-20', 90, 'Head In the Clouds', 9, 10, '15:40:54', '19:47:38');
INSERT INTO `performance` (`id`, `performance_date`, `ticket_price`, `name`, `venue_id`, `band_id`, `start_time`, `end_time`) VALUES (10, '2022-05-15', 20, 'Secret Dreams Fesitval', 10, 8, '16:54:50', '18:53:46');

COMMIT;


-- -----------------------------------------------------
-- Data for table `band_member`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `band_member` (`band_id`, `musician_id`, `stage_name`, `role`) VALUES (1, 1, 'Rocky Rockstar', 'Lead Singer');
INSERT INTO `band_member` (`band_id`, `musician_id`, `stage_name`, `role`) VALUES (1, 2, 'Hammer Man', 'Lead Guitarist');
INSERT INTO `band_member` (`band_id`, `musician_id`, `stage_name`, `role`) VALUES (5, 3, 'Frank Freeman', 'Lead Singer');
INSERT INTO `band_member` (`band_id`, `musician_id`, `stage_name`, `role`) VALUES (5, 4, 'Fran Freeman', 'Drummer');
INSERT INTO `band_member` (`band_id`, `musician_id`, `stage_name`, `role`) VALUES (5, 5, 'Follie Freeman', 'Guitarist');
INSERT INTO `band_member` (`band_id`, `musician_id`, `stage_name`, `role`) VALUES (2, 6, 'Tevin Edmonds', NULL);
INSERT INTO `band_member` (`band_id`, `musician_id`, `stage_name`, `role`) VALUES (2, 7, 'Shona Cartwright', NULL);
INSERT INTO `band_member` (`band_id`, `musician_id`, `stage_name`, `role`) VALUES (4, 8, 'Aila Alexander', NULL);
INSERT INTO `band_member` (`band_id`, `musician_id`, `stage_name`, `role`) VALUES (3, 9, 'Brody Powers', NULL);
INSERT INTO `band_member` (`band_id`, `musician_id`, `stage_name`, `role`) VALUES (3, 10, 'Christian Zamora', NULL);
INSERT INTO `band_member` (`band_id`, `musician_id`, `stage_name`, `role`) VALUES (3, 11, 'Amos Donalds', NULL);
INSERT INTO `band_member` (`band_id`, `musician_id`, `stage_name`, `role`) VALUES (6, 12, 'Roseanne Tucker', NULL);
INSERT INTO `band_member` (`band_id`, `musician_id`, `stage_name`, `role`) VALUES (7, 13, 'Victor Hodge', NULL);
INSERT INTO `band_member` (`band_id`, `musician_id`, `stage_name`, `role`) VALUES (7, 14, 'Kaylum Leach', NULL);
INSERT INTO `band_member` (`band_id`, `musician_id`, `stage_name`, `role`) VALUES (7, 15, 'Alan McAndy', NULL);
INSERT INTO `band_member` (`band_id`, `musician_id`, `stage_name`, `role`) VALUES (9, 16, 'Phillip Lim', NULL);
INSERT INTO `band_member` (`band_id`, `musician_id`, `stage_name`, `role`) VALUES (9, 17, 'Mac Stein', NULL);
INSERT INTO `band_member` (`band_id`, `musician_id`, `stage_name`, `role`) VALUES (11, 18, 'Sam Cornish', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (1, 'Hard Rock', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (2, 'Metal', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (3, 'Pop', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (4, 'Country', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (5, 'Jazz', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (6, 'Blues', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (7, 'EDM', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (8, 'Disco', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (9, 'Grunge', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (10, 'Alternative', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (11, 'Folk', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (12, 'Psychedelic Rock', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (13, 'Death Metal', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (14, 'Post-Grunge', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (15, 'Classical', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (16, 'Neo-Classical Speed Metal', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (17, 'Math Rock', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (18, 'Indie', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (19, 'Metalcore', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (20, 'Hip-Hop', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (21, 'Rap', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (22, 'Soul', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (23, 'Industrial', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (24, 'Melodic Death Metal', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `performance_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `performance_comment` (`id`, `user_id`, `performance_id`, `comment`, `comment_date`, `reply_to_id`) VALUES (1, 2, 1, 'This concert ruled, man!', NULL, NULL);
INSERT INTO `performance_comment` (`id`, `user_id`, `performance_id`, `comment`, `comment_date`, `reply_to_id`) VALUES (2, 3, 1, 'No way, bro... Concert was traaash.', NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `performance_review`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `performance_review` (`user_id`, `performance_id`, `rating`, `rating_comment`, `review_date`) VALUES (2, 1, 5, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `followed_band`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `followed_band` (`user_id`, `band_id`) VALUES (2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `followed_musician`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `followed_musician` (`musician_id`, `user_id`) VALUES (1, 2);
INSERT INTO `followed_musician` (`musician_id`, `user_id`) VALUES (2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `genre_has_band`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `genre_has_band` (`genre_id`, `band_id`) VALUES (1, 1);
INSERT INTO `genre_has_band` (`genre_id`, `band_id`) VALUES (4, 5);
INSERT INTO `genre_has_band` (`genre_id`, `band_id`) VALUES (11, 5);
INSERT INTO `genre_has_band` (`genre_id`, `band_id`) VALUES (5, 2);
INSERT INTO `genre_has_band` (`genre_id`, `band_id`) VALUES (2, 3);
INSERT INTO `genre_has_band` (`genre_id`, `band_id`) VALUES (7, 4);
INSERT INTO `genre_has_band` (`genre_id`, `band_id`) VALUES (6, 6);
INSERT INTO `genre_has_band` (`genre_id`, `band_id`) VALUES (13, 7);
INSERT INTO `genre_has_band` (`genre_id`, `band_id`) VALUES (12, 7);
INSERT INTO `genre_has_band` (`genre_id`, `band_id`) VALUES (14, 8);
INSERT INTO `genre_has_band` (`genre_id`, `band_id`) VALUES (15, 9);
INSERT INTO `genre_has_band` (`genre_id`, `band_id`) VALUES (7, 9);
INSERT INTO `genre_has_band` (`genre_id`, `band_id`) VALUES (4, 10);
INSERT INTO `genre_has_band` (`genre_id`, `band_id`) VALUES (3, 11);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ticket_sale`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (1, 1, 1, 30, '2021-06-24');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (2, 1, 2, 30, '2021-09-21');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (3, 1, 3, 476, '2021-06-11');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (4, 1, 4, 175, '2021-08-29');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (5, 1, 5, 439, '2021-08-31');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (6, 1, 6, 40, '2021-05-23');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (7, 1, 7, 75, '2021-06-28');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (8, 1, 8, 139, '2021-06-26');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (9, 1, 9, 345, '2021-11-04');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (10, 1, 10, 83, '2021-10-01');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (11, 1, 11, 154, '2021-12-28');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (12, 1, 12, 58, '2021-07-05');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (13, 1, 13, 376, '2021-05-05');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (14, 1, 14, 178, '2021-12-29');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (15, 1, 15, 85, '2021-04-14');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (16, 1, 16, 106, '2021-12-10');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (17, 1, 17, 385, '2021-12-28');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (18, 1, 18, 345, '2021-08-18');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (19, 1, 19, 337, '2021-09-03');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (20, 1, 20, 123, '2021-09-13');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (21, 1, 21, 451, '2021-08-03');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (22, 1, 22, 381, '2021-07-17');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (23, 1, 23, 74, '2021-07-02');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (24, 1, 24, 210, '2021-08-29');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (25, 1, 25, 165, '2021-04-11');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (26, 1, 26, 209, '2021-04-06');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (27, 1, 27, 497, '2021-06-05');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (28, 1, 28, 231, '2021-05-03');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (29, 1, 29, 114, '2021-11-28');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (30, 1, 30, 108, '2021-11-21');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (31, 1, 31, 426, '2021-06-26');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (32, 1, 32, 57, '2021-10-13');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (33, 1, 33, 44, '2021-09-26');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (34, 1, 34, 344, '2021-04-22');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (35, 1, 35, 436, '2021-04-08');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (36, 1, 36, 346, '2021-06-19');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (37, 1, 37, 196, '2021-06-22');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (38, 1, 38, 37, '2021-12-02');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (39, 1, 39, 128, '2021-05-11');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (40, 1, 40, 390, '2021-06-26');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (41, 1, 41, 370, '2021-08-11');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (42, 1, 42, 32, '2021-12-07');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (43, 1, 43, 342, '2021-11-20');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (44, 1, 44, 49, '2021-06-09');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (45, 1, 45, 59, '2021-06-11');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (46, 1, 46, 278, '2021-05-07');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (47, 1, 47, 122, '2021-09-26');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (48, 1, 48, 229, '2021-04-24');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (49, 1, 49, 498, '2021-04-13');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (50, 1, 50, 460, '2021-09-11');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (51, 1, 51, 187, '2021-08-03');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (52, 1, 52, 101, '2021-07-09');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (53, 1, 53, 181, '2021-07-02');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (54, 2, 10, 322, '2021-07-02');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (55, 2, 11, 178, '2021-07-02');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (56, 2, 12, 109, '2021-08-12');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (57, 2, 13, 458, '2021-10-04');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (58, 2, 14, 400, '2021-04-01');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (59, 2, 15, 324, '2021-07-01');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (60, 2, 16, 332, '2021-07-21');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (61, 2, 17, 449, '2021-04-11');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (62, 2, 18, 198, '2021-07-17');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (63, 2, 19, 177, '2021-04-08');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (64, 2, 20, 411, '2021-09-27');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (65, 2, 21, 211, '2021-06-21');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (66, 2, 22, 423, '2021-12-26');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (67, 2, 23, 464, '2021-10-09');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (68, 2, 24, 350, '2021-12-14');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (69, 2, 25, 458, '2021-08-23');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (70, 2, 26, 193, '2021-09-03');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (71, 2, 27, 282, '2021-09-22');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (72, 2, 28, 470, '2021-05-18');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (73, 2, 29, 128, '2021-05-26');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (74, 2, 30, 229, '2021-06-19');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (75, 2, 31, 180, '2021-05-10');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (76, 2, 32, 452, '2021-11-27');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (77, 2, 33, 424, '2021-05-03');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (78, 2, 34, 491, '2021-12-18');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (79, 2, 35, 264, '2021-09-12');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (80, 2, 36, 145, '2021-09-29');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (81, 2, 37, 256, '2021-09-12');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (82, 2, 38, 395, '2021-10-28');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (83, 2, 39, 90, '2021-06-15');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (84, 2, 40, 435, '2021-09-23');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (85, 2, 41, 437, '2021-08-25');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (86, 2, 42, 244, '2021-08-24');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (87, 2, 43, 145, '2021-04-06');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (88, 2, 44, 108, '2021-04-23');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (89, 2, 45, 112, '2021-12-28');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (90, 2, 46, 157, '2021-05-28');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (91, 2, 47, 37, '2021-04-25');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (92, 2, 48, 497, '2021-07-18');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (93, 3, 20, 432, '2021-09-30');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (94, 3, 20, 235, '2021-06-01');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (95, 3, 20, 432, '2021-10-02');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (96, 3, 20, 185, '2021-06-21');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (97, 3, 20, 488, '2021-06-01');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (98, 3, 20, 377, '2021-12-08');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (99, 3, 20, 49, '2021-09-12');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (100, 3, 20, 237, '2021-12-11');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (101, 3, 20, 488, '2021-07-30');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (102, 3, 20, 49, '2021-11-19');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (103, 3, 20, 112, '2021-09-30');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (104, 3, 20, 272, '2021-05-18');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (105, 3, 20, 326, '2021-06-14');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (106, 3, 20, 431, '2021-04-17');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (107, 3, 20, 414, '2021-10-23');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (108, 3, 20, 169, '2021-11-04');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (109, 3, 20, 488, '2021-04-05');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (110, 3, 20, 252, '2021-09-01');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (111, 3, 20, 160, '2021-06-25');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (112, 3, 20, 301, '2021-08-16');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (113, 3, 20, 405, '2021-11-17');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (114, 3, 20, 211, '2021-10-23');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (115, 3, 20, 438, '2021-08-05');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (116, 3, 20, 203, '2021-06-24');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (117, 3, 20, 93, '2021-11-14');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (118, 3, 20, 194, '2021-10-12');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (119, 3, 20, 405, '2021-12-21');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (120, 3, 20, 261, '2021-09-15');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (121, 3, 20, 218, '2021-05-15');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (122, 3, 20, 372, '2021-10-21');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (123, 3, 20, 277, '2021-06-01');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (124, 3, 20, 334, '2021-06-03');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (125, 3, 20, 486, '2021-04-25');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (126, 3, 20, 289, '2021-09-22');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (127, 3, 20, 84, '2021-04-28');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (128, 3, 20, 78, '2021-08-23');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (129, 3, 20, 332, '2021-07-23');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (130, 3, 20, 473, '2021-12-22');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (131, 3, 20, 423, '2021-04-30');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (132, 3, 20, 416, '2021-04-07');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (133, 3, 20, 179, '2021-05-14');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (134, 3, 20, 53, '2021-09-14');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (135, 3, 20, 420, '2021-09-16');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (136, 3, 20, 500, '2021-05-03');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (137, 3, 20, 252, '2021-12-30');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (138, 3, 20, 315, '2021-08-09');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (139, 3, 20, 83, '2021-06-29');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (140, 3, 20, 422, '2021-10-27');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (141, 3, 20, 244, '2021-12-14');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (142, 3, 20, 148, '2021-08-14');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (143, 3, 20, 433, '2021-12-06');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (144, 3, 20, 352, '2021-06-19');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (145, 3, 20, 173, '2021-04-27');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (146, 3, 20, 416, '2021-08-31');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (147, 3, 20, 466, '2021-08-24');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (148, 3, 20, 480, '2021-09-06');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (149, 3, 20, 113, '2021-07-12');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (150, 3, 20, 111, '2021-09-08');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (151, 3, 20, 133, '2021-11-11');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (152, 4, 30, 276, '2021-11-14');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (153, 4, 31, 499, '2021-09-12');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (154, 4, 32, 341, '2021-08-16');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (155, 4, 33, 155, '2021-05-13');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (156, 4, 34, 81, '2021-06-19');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (157, 4, 35, 167, '2021-12-13');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (158, 4, 36, 73, '2021-12-02');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (159, 4, 37, 301, '2021-11-29');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (160, 4, 38, 366, '2021-05-19');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (161, 4, 39, 455, '2021-07-20');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (162, 4, 40, 174, '2021-10-26');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (163, 4, 41, 32, '2021-06-10');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (164, 4, 42, 94, '2021-09-21');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (165, 4, 43, 345, '2021-07-06');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (166, 4, 44, 66, '2021-09-21');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (167, 4, 45, 249, '2021-07-29');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (168, 4, 46, 306, '2021-08-27');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (169, 4, 47, 56, '2021-06-01');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (170, 4, 48, 161, '2021-08-10');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (171, 4, 49, 487, '2021-12-11');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (172, 4, 50, 203, '2021-04-16');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (173, 4, 51, 222, '2021-07-17');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (174, 4, 52, 410, '2021-11-08');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (175, 4, 53, 119, '2021-09-12');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (176, 4, 54, 491, '2021-11-17');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (177, 4, 55, 386, '2021-03-29');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (178, 4, 56, 389, '2021-07-29');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (179, 4, 1, 31, '2021-04-27');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (180, 4, 2, 321, '2021-06-23');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (181, 4, 3, 226, '2021-05-31');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (182, 4, 4, 386, '2021-06-21');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (183, 4, 5, 478, '2021-08-06');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (184, 4, 6, 483, '2021-09-09');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (185, 4, 7, 194, '2021-12-23');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (186, 4, 8, 415, '2021-08-19');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (187, 4, 9, 497, '2021-04-28');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (188, 4, 10, 190, '2021-12-10');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (189, 4, 11, 282, '2021-06-25');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (190, 5, 20, 308, '2021-07-26');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (191, 5, 21, 140, '2021-06-26');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (192, 5, 22, 356, '2021-05-21');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (193, 5, 23, 431, '2021-03-29');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (194, 5, 24, 240, '2021-07-11');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (195, 5, 25, 229, '2021-07-01');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (196, 5, 26, 407, '2021-05-05');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (197, 5, 27, 235, '2021-03-29');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (198, 5, 28, 157, '2021-04-10');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (199, 5, 29, 187, '2021-06-21');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (200, 5, 30, 360, '2021-04-19');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (201, 5, 31, 444, '2021-11-12');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (202, 5, 32, 180, '2021-09-23');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (203, 5, 33, 303, '2021-08-30');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (204, 5, 34, 465, '2021-04-29');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (205, 5, 35, 181, '2021-11-18');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (206, 5, 36, 127, '2021-12-12');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (207, 5, 37, 315, '2021-08-03');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (208, 5, 38, 217, '2021-11-29');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (209, 5, 39, 423, '2021-07-31');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (210, 5, 40, 213, '2021-12-04');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (211, 5, 41, 435, '2021-08-04');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (212, 5, 42, 154, '2021-04-08');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (213, 5, 43, 100, '2021-09-12');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (214, 5, 44, 33, '2021-12-10');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (215, 5, 45, 425, '2021-05-18');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (216, 5, 46, 208, '2021-07-30');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (217, 5, 47, 87, '2021-08-20');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (218, 5, 48, 195, '2021-12-06');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (219, 5, 49, 193, '2021-04-22');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (220, 6, 15, 131, '2021-10-23');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (221, 6, 16, 374, '2021-09-28');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (222, 6, 17, 179, '2021-10-05');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (223, 6, 18, 66, '2021-10-12');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (224, 6, 19, 285, '2021-11-07');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (225, 6, 20, 98, '2021-12-15');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (226, 6, 21, 40, '2021-04-11');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (227, 6, 22, 430, '2021-05-29');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (228, 6, 23, 370, '2021-06-14');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (229, 6, 24, 304, '2021-09-06');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (230, 6, 25, 380, '2021-05-20');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (231, 6, 26, 198, '2021-04-25');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (232, 6, 27, 256, '2021-12-03');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (233, 6, 28, 127, '2021-05-22');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (234, 6, 29, 472, '2021-04-25');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (235, 6, 30, 345, '2021-11-27');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (236, 6, 31, 178, '2021-09-06');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (237, 6, 32, 361, '2021-11-04');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (238, 6, 33, 219, '2021-09-16');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (239, 6, 34, 82, '2021-05-07');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (240, 6, 35, 218, '2021-10-08');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (241, 6, 36, 468, '2021-11-04');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (242, 6, 37, 312, '2021-11-21');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (243, 6, 38, 176, '2021-11-11');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (244, 6, 39, 52, '2021-07-09');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (245, 6, 40, 481, '2021-05-14');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (246, 6, 41, 421, '2021-07-10');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (247, 7, 1, 256, '2021-04-14');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (248, 7, 2, 204, '2021-04-02');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (249, 7, 3, 283, '2021-07-08');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (250, 7, 4, 37, '2021-12-18');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (251, 7, 5, 390, '2021-12-14');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (252, 7, 6, 121, '2021-08-04');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (253, 7, 7, 394, '2021-08-28');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (254, 7, 8, 52, '2021-08-12');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (255, 7, 9, 475, '2021-09-24');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (256, 7, 10, 368, '2021-06-02');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (257, 7, 11, 261, '2021-09-28');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (258, 7, 12, 230, '2021-10-16');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (259, 7, 13, 60, '2021-10-06');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (260, 7, 14, 131, '2021-09-26');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (261, 7, 15, 253, '2021-12-24');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (262, 7, 16, 40, '2021-04-11');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (263, 7, 17, 497, '2021-10-20');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (264, 7, 18, 259, '2021-11-12');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (265, 7, 19, 203, '2021-07-27');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (266, 7, 20, 410, '2021-04-21');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (267, 7, 21, 174, '2021-07-17');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (268, 7, 22, 388, '2021-09-26');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (269, 7, 23, 466, '2021-10-25');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (270, 7, 24, 409, '2021-10-25');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (271, 7, 25, 192, '2021-09-05');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (272, 7, 26, 127, '2021-04-27');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (273, 7, 27, 488, '2021-11-02');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (274, 7, 28, 488, '2021-11-30');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (275, 7, 29, 461, '2021-06-16');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (276, 7, 30, 379, '2021-06-11');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (277, 7, 31, 284, '2021-12-07');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (278, 7, 32, 300, '2021-05-02');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (279, 7, 33, 270, '2021-08-10');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (280, 7, 34, 270, '2021-06-15');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (281, 7, 35, 148, '2021-10-19');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (282, 7, 36, 208, '2021-04-21');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (283, 7, 37, 358, '2021-07-01');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (284, 7, 38, 301, '2021-04-06');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (285, 7, 39, 400, '2021-06-15');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (286, 7, 40, 487, '2021-12-30');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (287, 7, 41, 40, '2021-05-06');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (288, 7, 42, 407, '2021-08-12');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (289, 7, 43, 428, '2021-10-12');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (290, 7, 44, 86, '2021-08-09');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (291, 7, 45, 232, '2021-08-14');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (292, 7, 46, 185, '2021-09-04');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (293, 7, 47, 172, '2021-08-06');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (294, 7, 48, 159, '2021-04-16');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (295, 7, 49, 314, '2021-04-30');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (296, 7, 50, 192, '2021-05-17');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (297, 7, 51, 225, '2021-11-27');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (298, 8, 10, 149, '2021-08-21');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (299, 8, 11, 81, '2021-12-25');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (300, 8, 12, 333, '2021-05-30');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (301, 8, 13, 287, '2021-06-29');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (302, 8, 14, 366, '2021-10-17');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (303, 8, 15, 338, '2021-07-17');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (304, 8, 16, 128, '2021-10-22');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (305, 8, 17, 45, '2021-10-04');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (306, 8, 18, 80, '2021-09-08');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (307, 8, 19, 213, '2021-11-24');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (308, 8, 20, 372, '2021-06-26');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (309, 8, 21, 398, '2021-12-01');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (310, 8, 22, 255, '2021-07-26');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (311, 8, 23, 356, '2021-05-04');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (312, 8, 24, 162, '2021-09-29');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (313, 8, 25, 135, '2021-09-04');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (314, 8, 26, 351, '2021-10-24');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (315, 8, 27, 391, '2021-12-11');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (316, 8, 28, 212, '2021-09-15');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (317, 8, 29, 320, '2021-08-07');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (318, 8, 30, 88, '2021-04-08');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (319, 8, 31, 36, '2021-04-14');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (320, 8, 32, 288, '2021-08-23');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (321, 8, 33, 33, '2021-07-04');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (322, 8, 34, 303, '2021-11-12');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (323, 8, 35, 317, '2021-04-14');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (324, 8, 36, 455, '2021-09-29');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (325, 8, 37, 102, '2021-06-19');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (326, 8, 38, 106, '2021-10-20');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (327, 9, 35, 86, '2021-04-30');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (328, 9, 36, 348, '2021-05-11');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (329, 9, 37, 324, '2021-12-23');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (330, 9, 38, 100, '2021-05-23');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (331, 9, 39, 324, '2021-04-05');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (332, 9, 40, 135, '2021-05-16');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (333, 9, 41, 306, '2021-09-21');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (334, 9, 42, 489, '2021-11-10');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (335, 9, 43, 486, '2021-07-02');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (336, 9, 44, 472, '2021-10-04');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (337, 9, 45, 434, '2021-04-23');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (338, 9, 46, 251, '2021-10-24');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (339, 9, 47, 57, '2021-06-18');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (340, 9, 48, 80, '2021-06-01');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (341, 9, 49, 115, '2021-05-30');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (342, 9, 50, 323, '2021-10-07');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (343, 9, 51, 110, '2021-05-28');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (344, 9, 52, 172, '2021-05-16');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (345, 9, 53, 292, '2021-10-06');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (346, 9, 54, 124, '2021-06-24');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (347, 9, 55, 453, '2021-08-25');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (348, 9, 20, 439, '2021-07-17');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (349, 9, 21, 95, '2021-04-03');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (350, 9, 22, 147, '2021-09-11');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (351, 9, 23, 288, '2021-10-07');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (352, 9, 24, 401, '2021-08-15');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (353, 9, 25, 189, '2021-12-14');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (354, 9, 26, 132, '2021-10-12');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (355, 9, 27, 310, '2021-05-12');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (356, 10, 8, 245, '2021-07-01');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (357, 10, 9, 286, '2021-12-28');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (358, 10, 10, 86, '2021-04-30');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (359, 10, 11, 218, '2021-06-14');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (360, 10, 12, 444, '2021-07-13');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (361, 10, 13, 348, '2021-07-09');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (362, 10, 14, 149, '2021-04-13');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (363, 10, 15, 82, '2021-07-23');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (364, 10, 16, 225, '2021-09-28');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (365, 10, 17, 324, '2021-09-28');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (366, 10, 18, 124, '2021-11-22');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (367, 10, 19, 497, '2021-08-15');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (368, 10, 20, 354, '2021-08-19');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (369, 10, 21, 165, '2021-09-22');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (370, 10, 22, 133, '2021-09-19');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (371, 10, 23, 440, '2021-12-19');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (372, 10, 24, 275, '2021-10-09');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (373, 10, 25, 429, '2021-11-22');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (374, 10, 26, 200, '2021-09-08');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (375, 10, 27, 461, '2021-12-10');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (376, 10, 28, 398, '2021-06-15');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (377, 10, 29, 147, '2021-11-17');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (378, 10, 30, 140, '2021-08-03');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (379, 10, 31, 246, '2021-12-05');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (380, 10, 32, 31, '2021-04-07');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (381, 10, 33, 152, '2021-08-16');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (382, 10, 34, 199, '2021-06-02');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (383, 10, 35, 306, '2021-09-02');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (384, 10, 36, 86, '2021-10-24');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (385, 10, 37, 424, '2021-06-28');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (386, 10, 38, 174, '2021-12-29');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (387, 10, 39, 213, '2021-12-29');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (388, 10, 40, 94, '2021-05-10');
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (389, 10, 41, 370, '2021-04-26');

COMMIT;

