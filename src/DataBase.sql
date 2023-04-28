-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema blockbuster
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blockbuster
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blockbuster` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `blockbuster` ;

-- -----------------------------------------------------
-- Table `blockbuster`.`Actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`Actors` (
  `actor_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `last_update` DATETIME NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`Categories` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`Film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`Film` (
  `film_id` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `rental_duration` INT NULL,
  `rental_rate` FLOAT NULL,
  `length` INT NULL,
  `replacement_cost` FLOAT NULL,
  `rating` VARCHAR(45) NULL,
  `special_features` VARCHAR(45) NULL,
  PRIMARY KEY (`film_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`Inventary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`Inventary` (
  `inventory_id` INT NOT NULL,
  `Film_film_id` INT NOT NULL,
  PRIMARY KEY (`inventory_id`, `Film_film_id`),
  INDEX `fk_Inventary_Film_idx` (`Film_film_id` ASC) VISIBLE,
  CONSTRAINT `fk_Inventary_Film`
    FOREIGN KEY (`Film_film_id`)
    REFERENCES `blockbuster`.`Film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`Language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`Language` (
  `language_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`Rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`Rental` (
  `rental_id` INT NOT NULL,
  `rental_date` DATETIME NULL,
  `return_date` DATETIME NULL,
  `Inventary_inventory_id` INT NOT NULL,
  `Inventary_Film_film_id` INT NOT NULL,
  PRIMARY KEY (`rental_id`, `Inventary_inventory_id`, `Inventary_Film_film_id`),
  INDEX `fk_Rental_Inventary1_idx` (`Inventary_inventory_id` ASC, `Inventary_Film_film_id` ASC) VISIBLE,
  CONSTRAINT `fk_Rental_Inventary1`
    FOREIGN KEY (`Inventary_inventory_id` , `Inventary_Film_film_id`)
    REFERENCES `blockbuster`.`Inventary` (`inventory_id` , `Film_film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`Old_HDD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`Old_HDD` (
  `Old_HDD_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `title` VARCHAR(45) NULL,
  `Categories_category_id` INT NOT NULL,
  `Film_film_id` INT NOT NULL,
  `Actors_actor_id` INT NOT NULL,
  PRIMARY KEY (`Old_HDD_id`, `Categories_category_id`, `Film_film_id`, `Actors_actor_id`),
  INDEX `fk_Old_HDD_Categories1_idx` (`Categories_category_id` ASC) VISIBLE,
  INDEX `fk_Old_HDD_Film1_idx` (`Film_film_id` ASC) VISIBLE,
  INDEX `fk_Old_HDD_Actors1_idx` (`Actors_actor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Old_HDD_Categories1`
    FOREIGN KEY (`Categories_category_id`)
    REFERENCES `blockbuster`.`Categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Old_HDD_Film1`
    FOREIGN KEY (`Film_film_id`)
    REFERENCES `blockbuster`.`Film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Old_HDD_Actors1`
    FOREIGN KEY (`Actors_actor_id`)
    REFERENCES `blockbuster`.`Actors` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`Stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`Stores` (
  `store_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`store_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`Film_has_Language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`Film_has_Language` (
  `Film_film_id` INT NOT NULL,
  `Language_language_id` INT NOT NULL,
  PRIMARY KEY (`Film_film_id`, `Language_language_id`),
  INDEX `fk_Film_has_Language_Language1_idx` (`Language_language_id` ASC) VISIBLE,
  INDEX `fk_Film_has_Language_Film1_idx` (`Film_film_id` ASC) VISIBLE,
  CONSTRAINT `fk_Film_has_Language_Film1`
    FOREIGN KEY (`Film_film_id`)
    REFERENCES `blockbuster`.`Film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_has_Language_Language1`
    FOREIGN KEY (`Language_language_id`)
    REFERENCES `blockbuster`.`Language` (`language_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blockbuster`.`Film_has_Actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`Film_has_Actors` (
  `Film_film_id` INT NOT NULL,
  `Actors_actor_id` INT NOT NULL,
  PRIMARY KEY (`Film_film_id`, `Actors_actor_id`),
  INDEX `fk_Film_has_Actors_Actors1_idx` (`Actors_actor_id` ASC) VISIBLE,
  INDEX `fk_Film_has_Actors_Film1_idx` (`Film_film_id` ASC) VISIBLE,
  CONSTRAINT `fk_Film_has_Actors_Film1`
    FOREIGN KEY (`Film_film_id`)
    REFERENCES `blockbuster`.`Film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_has_Actors_Actors1`
    FOREIGN KEY (`Actors_actor_id`)
    REFERENCES `blockbuster`.`Actors` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
