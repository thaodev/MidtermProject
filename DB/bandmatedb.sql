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
  `password` VARCHAR(45) NULL,
  `enabled` TINYINT NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `admin` TINYINT NULL,
  `date_of_birth` DATE NULL,
  `address_id` INT NOT NULL,
  `profile_image_url` VARCHAR(1000) NULL,
  `bio` TEXT NULL,
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
  `id` INT NOT NULL,
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
  `id` INT NOT NULL,
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
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (1, '555 River Road', 'Denver', 'Colorado', '80019');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (2, '789 Rock Pike', 'Denver', 'Colorado', '80019');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (3, NULL, NULL, NULL, NULL);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (4, NULL, NULL, NULL, NULL);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (5, NULL, NULL, NULL, NULL);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (6, NULL, NULL, NULL, NULL);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (7, NULL, NULL, NULL, NULL);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (8, NULL, NULL, NULL, NULL);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (9, NULL, NULL, NULL, NULL);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip_code`) VALUES (10, NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `address_id`, `profile_image_url`, `bio`) VALUES (1, 'admin', '1234', 1, '808-555-2022', 'admin1@bandmate.com', 'Jimmy', 'Kicks', 1, '1995-03-19', 1, NULL, 'I love music and stuff!');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `address_id`, `profile_image_url`, `bio`) VALUES (2, 'bandmateuser', '5678', 1, '303-555-2121', 'bandmateuser@bandmate.com', 'Sally', 'Limbs', 0, '1984-08-02', 2, NULL, 'I love concerts and all that!');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `phone`, `email`, `first_name`, `last_name`, `admin`, `date_of_birth`, `address_id`, `profile_image_url`, `bio`) VALUES (3, 'HammerRockManage', '1234', 1, '555-300-1130', 'hammerofrock@bandmate.com', 'Rodney', 'Rockerson', 0, '1990-09-18', 3, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `band`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (1, 'Hammer of Rock', 'Classic hard rock, a good time for all!', 2018, 3, 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80', NULL);
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (2, 'The Sandbox', NULL, NULL, 3, NULL, NULL);
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (3, 'The Lamb Commander', NULL, NULL, 3, NULL, NULL);
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (4, 'The Correction Screens', NULL, NULL, 3, NULL, NULL);
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (5, 'Flock Freeman', NULL, NULL, 3, NULL, NULL);
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (6, 'Hook Offense', NULL, NULL, 3, NULL, NULL);
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (7, 'Lilacs Locus', NULL, NULL, 3, NULL, NULL);
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (8, 'Housetop Sparkle', NULL, NULL, 3, NULL, NULL);
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (9, 'Honeybee Races', NULL, NULL, 3, NULL, NULL);
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (10, 'Free Southland', NULL, NULL, 3, NULL, NULL);
INSERT INTO `band` (`id`, `name`, `description`, `year_formed`, `manager_id`, `band_image_url`, `band_logo_url`) VALUES (11, 'Jam Accentuate', NULL, NULL, 3, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `musician`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `musician` (`id`, `first_name`, `last_name`, `phone`, `bio`, `vocals`, `band_member_image_url`) VALUES (1, 'Rocky', 'Rockerson', '555-300-1129', 'I am the lead singer of my awesome band', 1, 'https://images.unsplash.com/photo-1525857597365-5f6dbff2e36e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80');
INSERT INTO `musician` (`id`, `first_name`, `last_name`, `phone`, `bio`, `vocals`, `band_member_image_url`) VALUES (2, 'Billy', 'Hammer', '555-300-1128', 'I am the lead guitarist of my awesome band', 0, 'https://images.unsplash.com/photo-1566937169390-7be4c63b8a0e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1738&q=80');

COMMIT;


-- -----------------------------------------------------
-- Data for table `instrument`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `instrument` (`id`, `name`, `price`, `musician_id`) VALUES (1, 'guitar', 750.00, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `venue`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `venue` (`id`, `name`, `capacity`, `address_id`, `venue_image_url`, `description`) VALUES (1, 'Palace of Fine Arts', 200, 1, 'url to fill', 'description to fill');
INSERT INTO `venue` (`id`, `name`, `capacity`, `address_id`, `venue_image_url`, `description`) VALUES (2, 'TheSan Francisco Mint', 300, 2, 'url to fill', 'description to fill');
INSERT INTO `venue` (`id`, `name`, `capacity`, `address_id`, `venue_image_url`, `description`) VALUES (3, 'The Midway', 400, 3, 'url to fill', 'description to fill');
INSERT INTO `venue` (`id`, `name`, `capacity`, `address_id`, `venue_image_url`, `description`) VALUES (4, 'The Montgomery', 1000, 4, 'url to fill', 'description to fill');
INSERT INTO `venue` (`id`, `name`, `capacity`, `address_id`, `venue_image_url`, `description`) VALUES (5, 'Blue Theater', 200, 5, 'url to fill', 'description to fill');
INSERT INTO `venue` (`id`, `name`, `capacity`, `address_id`, `venue_image_url`, `description`) VALUES (6, 'Jones', 100, 6, 'url to fill', 'description to fill');
INSERT INTO `venue` (`id`, `name`, `capacity`, `address_id`, `venue_image_url`, `description`) VALUES (7, 'Sports Castle', 500, 10, 'url to fill', 'description to fill');
INSERT INTO `venue` (`id`, `name`, `capacity`, `address_id`, `venue_image_url`, `description`) VALUES (8, 'Denver Post', 300, 8, 'url to fill', 'description to fill');
INSERT INTO `venue` (`id`, `name`, `capacity`, `address_id`, `venue_image_url`, `description`) VALUES (9, 'The Broadway', 100, 9, 'url to fill', 'description to fill');
INSERT INTO `venue` (`id`, `name`, `capacity`, `address_id`, `venue_image_url`, `description`) VALUES (10, 'Wild Goose Saloon', 100, 7, 'url to fill', 'description to fill');

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

COMMIT;


-- -----------------------------------------------------
-- Data for table `performance_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `performance_comment` (`id`, `user_id`, `performance_id`, `comment`, `comment_date`, `reply_to_id`) VALUES (1, 2, 1, 'This concert ruled, man!', NULL, NULL);

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

COMMIT;


-- -----------------------------------------------------
-- Data for table `ticket_sale`
-- -----------------------------------------------------
START TRANSACTION;
USE `bandmatedb`;
INSERT INTO `ticket_sale` (`id`, `performance_id`, `user_id`, `ticket_price`, `sale_date`) VALUES (1, 1, 2, 20.00, NULL);

COMMIT;

