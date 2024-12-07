CREATE DATABASE Questor;

USE Questor;

CREATE TABLE IF NOT EXISTS `Questor`.`MARCA` (
  `ID_MARCA` INT NOT NULL,
  `DESCRICAO` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_MARCA`));
  
CREATE TABLE IF NOT EXISTS `Questor`.`MODELO` (
  `ID_MODELO` INT NOT NULL,
  `DESCRICAO` VARCHAR(45) NULL,
  `LANCAMENTO` DATE NULL,
  `ID_MARCA` INT NULL,
  PRIMARY KEY (`ID_MODELO`),
  INDEX `MODELO_MARCA_idx` (`ID_MARCA` ASC) VISIBLE,
  CONSTRAINT `MODELO_MARCA`
    FOREIGN KEY (`ID_MARCA`)
    REFERENCES `Questor`.`MARCA` (`ID_MARCA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE IF NOT EXISTS `Questor`.`CLIENTE` (
  `ID_CLIENTE` INT NOT NULL,
  `NOME` VARCHAR(60) NULL,
  `CPF` VARCHAR(14) NULL,
  PRIMARY KEY (`ID_CLIENTE`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE);
  
CREATE TABLE IF NOT EXISTS `Questor`.`VENDA` (
  `ID_VENDA` INT NOT NULL,
  `VL_TOTAL` DECIMAL(15,2) NULL,
  `DATA_VENDA` DATE NULL,
  `ID_CLIENTE` INT NULL,
  PRIMARY KEY (`ID_VENDA`),
  INDEX `VENDA_CLIENTE_idx` (`ID_CLIENTE` ASC) VISIBLE,
  CONSTRAINT `VENDA_CLIENTE`
    FOREIGN KEY (`ID_CLIENTE`)
    REFERENCES `Questor`.`CLIENTE` (`ID_CLIENTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE IF NOT EXISTS `Questor`.`ITEM` (
  `ID_ITEM` INT NOT NULL,
  `ID_VENDA` INT NULL,
  `VL_ITEM` DECIMAL(15,2) NULL,
  `QUANTIDADE` INT NULL,
  `ID_MODELO` INT NULL,
  PRIMARY KEY (`ID_ITEM`),
  INDEX `ITEM_VENDA_idx` (`ID_VENDA` ASC) VISIBLE,
  INDEX `ITEM_MODELO_idx` (`ID_MODELO` ASC) VISIBLE,
  CONSTRAINT `ITEM_VENDA`
    FOREIGN KEY (`ID_VENDA`)
    REFERENCES `Questor`.`VENDA` (`ID_VENDA`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `ITEM_MODELO`
    FOREIGN KEY (`ID_MODELO`)
    REFERENCES `Questor`.`MODELO` (`ID_MODELO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);