-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mi_minimarket_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mi_minimarket_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mi_minimarket_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mi_minimarket_db` ;

-- -----------------------------------------------------
-- Table `mi_minimarket_db`.`address_db`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_minimarket_db`.`address_db` (
  `id_address` INT(11) NOT NULL AUTO_INCREMENT,
  `calle_address` VARCHAR(45) NOT NULL,
  `casa_address` VARCHAR(45) NOT NULL,
  `lugar_address` VARCHAR(45) NOT NULL,
  `ubicacion_address` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_address`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mi_minimarket_db`.`category_db`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_minimarket_db`.`category_db` (
  `id_category` INT(11) NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_category`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mi_minimarket_db`.`user_db`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_minimarket_db`.`user_db` (
  `id_user` INT(11) NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `user_password` VARCHAR(45) NOT NULL,
  `user_email` VARCHAR(50) NOT NULL,
  `user_cellphone` VARCHAR(9) NOT NULL,
  `user_nacimiento` DATE NOT NULL,
  `user_type` ENUM('user', 'admin') NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mi_minimarket_db`.`order_db`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_minimarket_db`.`order_db` (
  `id_order` INT(11) NOT NULL AUTO_INCREMENT,
  `order_client` INT(11) NOT NULL,
  `order_date` DATE NOT NULL,
  `order_address` INT(11) NOT NULL,
  `order_status` ENUM('waiting', 'Cancelled', 'in process', 'recived') NOT NULL DEFAULT 'waiting',
  `subtotal` DECIMAL(12,2) NOT NULL,
  PRIMARY KEY (`id_order`),
  INDEX `fk_order_db_user_db1_idx` (`order_client` ASC) VISIBLE,
  INDEX `fk_order_db_address_db1_idx` (`order_address` ASC) VISIBLE,
  CONSTRAINT `fk_order_db_address_db1`
    FOREIGN KEY (`order_address`)
    REFERENCES `mi_minimarket_db`.`address_db` (`id_address`),
  CONSTRAINT `fk_order_db_user_db1`
    FOREIGN KEY (`order_client`)
    REFERENCES `mi_minimarket_db`.`user_db` (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mi_minimarket_db`.`product_db`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_minimarket_db`.`product_db` (
  `id_product` INT(11) NOT NULL,
  `product_name` VARCHAR(45) NOT NULL,
  `product_description` TEXT NOT NULL,
  `product_img` BLOB NOT NULL,
  `product_status` ENUM('active', 'inactive') NOT NULL DEFAULT 'active',
  `product_code` VARCHAR(15) NOT NULL,
  `product_price` DOUBLE(12,2) NOT NULL,
  PRIMARY KEY (`id_product`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mi_minimarket_db`.`order_details_db`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_minimarket_db`.`order_details_db` (
  `id_details` INT(11) NOT NULL AUTO_INCREMENT,
  `details_order` INT(11) NOT NULL,
  `details_product` INT(11) NOT NULL,
  `details_amount` INT(11) NOT NULL,
  `total_money` DECIMAL(12,2) NOT NULL,
  PRIMARY KEY (`id_details`),
  INDEX `fk_bill_details_db_bill_db1_idx` (`details_order` ASC) VISIBLE,
  INDEX `fk_bill_details_db_product_db1_idx` (`details_product` ASC) VISIBLE,
  CONSTRAINT `order_to_details`
    FOREIGN KEY (`details_order`)
    REFERENCES `mi_minimarket_db`.`order_db` (`id_order`)
    ON UPDATE RESTRICT,
  CONSTRAINT `order_to_product`
    FOREIGN KEY (`details_product`)
    REFERENCES `mi_minimarket_db`.`product_db` (`id_product`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mi_minimarket_db`.`product_category_join`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_minimarket_db`.`product_category_join` (
  `id_product_category_join` INT(11) NOT NULL AUTO_INCREMENT,
  `id_p` INT(11) NOT NULL,
  `id_c` INT(11) NOT NULL,
  PRIMARY KEY (`id_product_category_join`),
  INDEX `fk_product_category_join_product_db1_idx` (`id_p` ASC) VISIBLE,
  INDEX `fk_product_category_join_category_db1_idx` (`id_c` ASC) VISIBLE,
  CONSTRAINT `fk_product_category_join_category_db1`
    FOREIGN KEY (`id_c`)
    REFERENCES `mi_minimarket_db`.`category_db` (`id_category`),
  CONSTRAINT `fk_product_category_join_product_db1`
    FOREIGN KEY (`id_p`)
    REFERENCES `mi_minimarket_db`.`product_db` (`id_product`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mi_minimarket_db`.`product_imgs_db`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_minimarket_db`.`product_imgs_db` (
  `idproduct_imgs_db` INT(11) NOT NULL AUTO_INCREMENT,
  `id_product` INT(11) NOT NULL,
  `product_imgs_dbcol` BLOB NOT NULL,
  PRIMARY KEY (`idproduct_imgs_db`),
  INDEX `fk_product_imgs_db_product_db1_idx` (`id_product` ASC) VISIBLE,
  CONSTRAINT `fk_product_imgs_db_product_db1`
    FOREIGN KEY (`id_product`)
    REFERENCES `mi_minimarket_db`.`product_db` (`id_product`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mi_minimarket_db`.`user_address_join`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_minimarket_db`.`user_address_join` (
  `id_user_address_join` INT(11) NOT NULL AUTO_INCREMENT,
  `id_user` INT(11) NOT NULL,
  `id_address` INT(11) NOT NULL,
  PRIMARY KEY (`id_user_address_join`),
  INDEX `fk_user_adrees_join_user_db_idx` (`id_user` ASC) VISIBLE,
  INDEX `fk_user_adrees_join_address_db1_idx` (`id_address` ASC) VISIBLE,
  CONSTRAINT `fk_address`
    FOREIGN KEY (`id_address`)
    REFERENCES `mi_minimarket_db`.`address_db` (`id_address`),
  CONSTRAINT `fk_user`
    FOREIGN KEY (`id_user`)
    REFERENCES `mi_minimarket_db`.`user_db` (`id_user`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
