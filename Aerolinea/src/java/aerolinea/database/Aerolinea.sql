-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Aerolinea
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Aerolinea
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Aerolinea` DEFAULT CHARACTER SET utf8 ;
USE `Aerolinea` ;

-- -----------------------------------------------------
-- Table `Aerolinea`.`Ciudades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Ciudades` (
  `codigoCiudad` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  `zonaHoraria` VARCHAR(45) NULL,
  PRIMARY KEY (`codigoCiudad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aerolinea`.`TiposAvion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`TiposAvion` (
  `idTipoAvion` VARCHAR(15) NOT NULL,
  `annio` VARCHAR(4) NULL,
  `modelo` VARCHAR(30) NULL,
  `marca` VARCHAR(30) NULL,
  `cantPasajeros` INT NULL,
  `cantFilas` INT NULL,
  `cantAsientosFila` INT NULL,
  PRIMARY KEY (`idTipoAvion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aerolinea`.`Aviones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Aviones` (
  `codigoAvion` VARCHAR(15) NOT NULL,
  `tipoAvion` VARCHAR(15) NULL,
  INDEX `FK1_Avion_idx` (`tipoAvion` ASC),
  PRIMARY KEY (`codigoAvion`),
  CONSTRAINT `FK1_Avion`
    FOREIGN KEY (`tipoAvion`)
    REFERENCES `Aerolinea`.`TiposAvion` (`idTipoAvion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aerolinea`.`Vuelos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Vuelos` (
  `codigoVuelo` VARCHAR(15) NOT NULL,
  `distancia` FLOAT NULL,
  `duracion` INT NULL,
  `descuento` FLOAT NULL,
  `ciudadOrigen` VARCHAR(15) NULL,
  `ciudadDestino` VARCHAR(15) NULL,
  `avion` VARCHAR(15) NULL,
  PRIMARY KEY (`codigoVuelo`),
  INDEX `FK1_Vuelo_idx` (`ciudadOrigen` ASC),
  INDEX `FK2_Vuelo_idx` (`ciudadDestino` ASC),
  INDEX `FK3_Vuelo_idx` (`avion` ASC),
  CONSTRAINT `FK1_Vuelo`
    FOREIGN KEY (`ciudadOrigen`)
    REFERENCES `Aerolinea`.`Ciudades` (`codigoCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK2_Vuelo`
    FOREIGN KEY (`ciudadDestino`)
    REFERENCES `Aerolinea`.`Ciudades` (`codigoCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK3_Vuelo`
    FOREIGN KEY (`avion`)
    REFERENCES `Aerolinea`.`Aviones` (`codigoAvion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aerolinea`.`Viajes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Viajes` (
  `codigoViaje` VARCHAR(15) NOT NULL,
  `fecha` DATE NULL,
  `diaSemana` VARCHAR(10) NULL,
  `cantAsientos` INT NULL,
  `horaSalida` VARCHAR(45) NULL,
  `horaLlegada` VARCHAR(45) NULL,
  `precio` FLOAT NULL,
  `avion` VARCHAR(15) NULL,
  `vuelo` VARCHAR(15) NULL,
  PRIMARY KEY (`codigoViaje`),
  INDEX `FK1_Viaje_idx` (`avion` ASC),
  INDEX `FK2_Viaje_idx` (`vuelo` ASC),
  CONSTRAINT `FK1_Viaje`
    FOREIGN KEY (`avion`)
    REFERENCES `Aerolinea`.`Aviones` (`codigoAvion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK2_Viaje`
    FOREIGN KEY (`vuelo`)
    REFERENCES `Aerolinea`.`Vuelos` (`codigoVuelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aerolinea`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Usuarios` (
  `username` VARCHAR(15) NOT NULL,
  `password` VARCHAR(30) NULL,
  `nombre` VARCHAR(30) NULL,
  `apellidos` VARCHAR(30) NULL,
  `correoElectronico` VARCHAR(45) NULL,
  `fechaNacimiento` DATE NULL,
  `direccion` VARCHAR(50) NULL,
  `telefonoTrabajo` VARCHAR(15) NULL,
  `celular` VARCHAR(15) NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aerolinea`.`Asientos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Asientos` (
  `codigoAsiento` VARCHAR(15) NOT NULL,
  `estado` TINYINT NULL,
  `avion` VARCHAR(15) NULL,
  PRIMARY KEY (`codigoAsiento`),
  INDEX `FK1_Asiento_idx` (`avion` ASC),
  CONSTRAINT `FK1_Asiento`
    FOREIGN KEY (`avion`)
    REFERENCES `Aerolinea`.`Aviones` (`codigoAvion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aerolinea`.`Tiquete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Tiquete` (
  `codigoTiquete` VARCHAR(15) NOT NULL,
  `nombrePasajero` VARCHAR(30) NULL,
  `viaje` VARCHAR(15) NULL,
  PRIMARY KEY (`codigoTiquete`),
  INDEX `FK1_Tiquete_idx` (`viaje` ASC),
  CONSTRAINT `FK1_Tiquete`
    FOREIGN KEY (`viaje`)
    REFERENCES `Aerolinea`.`Viajes` (`codigoViaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aerolinea`.`Pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Pagos` (
  `codigoPago` VARCHAR(15) NOT NULL,
  `tipoTarjeta` VARCHAR(30) NULL,
  `codigoSeguridad` VARCHAR(10) NULL,
  `fechaVencimiento` DATE NULL,
  `precioTotal` FLOAT NULL,
  `usuario` VARCHAR(15) NULL,
  PRIMARY KEY (`codigoPago`),
  INDEX `FK1_Pago_idx` (`usuario` ASC),
  CONSTRAINT `FK1_Pago`
    FOREIGN KEY (`usuario`)
    REFERENCES `Aerolinea`.`Usuarios` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aerolinea`.`Compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Compras` (
  `codigoCompra` VARCHAR(15) NOT NULL,
  `usuario` VARCHAR(15) NULL,
  `tiquete` VARCHAR(15) NULL,
  `viaje` VARCHAR(15) NULL,
  `pago` VARCHAR(15) NULL,
  `fechaCompra` DATE NULL,
  PRIMARY KEY (`codigoCompra`),
  INDEX `FK1_Compra_idx` (`usuario` ASC),
  INDEX `FK2_Compra_idx` (`tiquete` ASC),
  INDEX `FK3_Compra_idx` (`viaje` ASC),
  INDEX `FK4_Compra_idx` (`pago` ASC),
  CONSTRAINT `FK1_Compra`
    FOREIGN KEY (`usuario`)
    REFERENCES `Aerolinea`.`Usuarios` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK2_Compra`
    FOREIGN KEY (`tiquete`)
    REFERENCES `Aerolinea`.`Tiquete` (`codigoTiquete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK3_Compra`
    FOREIGN KEY (`viaje`)
    REFERENCES `Aerolinea`.`Viajes` (`codigoViaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK4_Compra`
    FOREIGN KEY (`pago`)
    REFERENCES `Aerolinea`.`Pagos` (`codigoPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;