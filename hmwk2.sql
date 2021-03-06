-- MySQL Script generated by MySQL Workbench
-- Sat Sep 28 00:59:18 2019
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Customer` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `customerID` INT NOT NULL AUTO_INCREMENT,
  `customerName` VARCHAR(45) NOT NULL,
  `customerAddress1` VARCHAR(45) NOT NULL,
  `customerAddress2` VARCHAR(45) NULL,
  `customerCity` VARCHAR(45) NOT NULL,
  `customerState` VARCHAR(45) NULL,
  `customerZip` VARCHAR(10) NULL,
  `customerPhone` VARCHAR(45) NULL,
  `customerPhone2` VARCHAR(45) NULL,
  `referredBy` VARCHAR(45) NULL,
  `customerSince` DATE NULL,
  `mowingServices` TINYINT NULL,
  `landscapingServices` TINYINT NULL,
  `otherServices` TINYINT NULL,
  `priorBalance` DECIMAL(9,2) NULL,
  `totalNewCharges` DECIMAL(9,2) NULL,
  `taxes` DECIMAL(9,2) NULL,
  `totalCredits` DECIMAL(9,2) NULL,
  `totalAmountDue` DECIMAL(9,2) NULL,
  `notes` VARCHAR(45) NULL,
  PRIMARY KEY (`customerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Invoice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Invoice` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Invoice` (
  `invoiceID` INT NOT NULL AUTO_INCREMENT,
  `customerID` INT NOT NULL,
  `invoiceDate` VARCHAR(45) NOT NULL,
  `totalAmountNowDue` DECIMAL(9,2) NOT NULL,
  `totalNewCharges` DECIMAL(9,2) NOT NULL,
  `totalCredits` DECIMAL(9,2) NOT NULL,
  `Customer_customerID` INT NOT NULL,
  PRIMARY KEY (`invoiceID`),
  CONSTRAINT `fk_Invoice_Customer`
    FOREIGN KEY (`Customer_customerID`)
    REFERENCES `mydb`.`Customer` (`customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Invoice_Customer_idx` ON `mydb`.`Invoice` (`Customer_customerID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`InvoiceDetail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`InvoiceDetail` ;

CREATE TABLE IF NOT EXISTS `mydb`.`InvoiceDetail` (
  `invoiceID` INT NOT NULL,
  `invoiceDetailLineNum` INT NOT NULL,
  `invoiceDetailDate` DATE NOT NULL,
  `servicesRendered_MaterialsDelivered` VARCHAR(45) NOT NULL,
  `charges` DECIMAL(9,2) NOT NULL,
  `credits` DECIMAL(9,2) NOT NULL,
  `Invoice_invoiceID` INT NOT NULL,
  `Invoice_Customer_customerID` INT NOT NULL,
  PRIMARY KEY (`invoiceID`, `invoiceDetailLineNum`, `Invoice_invoiceID`, `Invoice_Customer_customerID`),
  CONSTRAINT `fk_InvoiceDetail_Invoice1`
    FOREIGN KEY (`Invoice_invoiceID` , `Invoice_Customer_customerID`)
    REFERENCES `mydb`.`Invoice` (`invoiceID` , `Customer_customerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_InvoiceDetail_Invoice1_idx` ON `mydb`.`InvoiceDetail` (`Invoice_invoiceID` ASC, `Invoice_Customer_customerID` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
