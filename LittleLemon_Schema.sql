-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `BookingTime` TIME NULL,
  `Date` DATE NOT NULL,
  `Table_number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`BookingID`),
  UNIQUE INDEX `BookingID_UNIQUE` (`BookingID` ASC) VISIBLE,
  UNIQUE INDEX `Table_number_UNIQUE` (`Table_number` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Staff` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `Role` VARCHAR(255) NOT NULL,
  `Name` VARCHAR(255) NOT NULL,
  `Salary` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`StaffID`),
  UNIQUE INDEX `StaffID_UNIQUE` (`StaffID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Beverage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Beverage` (
  `BeverageID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`BeverageID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sides`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sides` (
  `SideID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`SideID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Menus` (
  `MenuID` INT NULL AUTO_INCREMENT,
  `SideID` INT NULL,
  `BeverageID` INT NULL,
  `Cuisine` VARCHAR(255) NOT NULL,
  `MenuType` VARCHAR(255) NOT NULL,
  `Cost` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `MenuID_UNIQUE` (`MenuID` ASC) VISIBLE,
  INDEX `SideID_idx` (`SideID` ASC) VISIBLE,
  INDEX `BeverageID_idx` (`BeverageID` ASC) VISIBLE,
  CONSTRAINT `BeverageID`
    FOREIGN KEY (`BeverageID`)
    REFERENCES `mydb`.`Beverage` (`BeverageID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `SideID`
    FOREIGN KEY (`SideID`)
    REFERENCES `mydb`.`Sides` (`SideID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CustomerDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CustomerDetails` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `CustomerFirstName` VARCHAR(255) NULL,
  `CustomerLastName` VARCHAR(255) NOT NULL,
  `Email` VARCHAR(255) NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE INDEX `CustomerDetailsid_UNIQUE` (`CustomerID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OrderDeliveryStatus` (
  `OrderStatusID` INT NOT NULL AUTO_INCREMENT,
  `DeliveryDate` DATE NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`OrderStatusID`),
  UNIQUE INDEX `OrderDeliveryStatusID_UNIQUE` (`OrderStatusID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `OrderDate` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `Cost` DECIMAL(7,2) NULL,
  `BookingID` INT NULL,
  `StaffID` INT NULL,
  `MenuID` INT NULL,
  `CustomerID` INT NULL,
  `OrderStatusID` INT NULL,
  PRIMARY KEY (`OrderID`),
  UNIQUE INDEX `OrderID_UNIQUE` (`OrderID` ASC) VISIBLE,
  INDEX `StaffIF_idx` (`StaffID` ASC) VISIBLE,
  INDEX `MenuID_idx` (`MenuID` ASC) VISIBLE,
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `OrderStatusID_idx` (`OrderStatusID` ASC) VISIBLE,
  INDEX `BookingID_idx` (`BookingID` ASC) VISIBLE,
  CONSTRAINT `StaffID`
    FOREIGN KEY (`StaffID`)
    REFERENCES `mydb`.`Staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `MenuID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `mydb`.`Menus` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `mydb`.`CustomerDetails` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `OrderStatusID`
    FOREIGN KEY (`OrderStatusID`)
    REFERENCES `mydb`.`OrderDeliveryStatus` (`OrderStatusID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `BookingID`
    FOREIGN KEY (`BookingID`)
    REFERENCES `mydb`.`Bookings` (`BookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE USER 'user1';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
