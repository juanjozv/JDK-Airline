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
  `codigo` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  `zonaHoraria` VARCHAR(45) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aerolinea`.`TiposAvion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`TiposAvion` (
  `codigo` VARCHAR(15) NOT NULL,
  `annio` VARCHAR(4) NULL,
  `marca` VARCHAR(30) NULL,
  `modelo` VARCHAR(30) NULL,
  `cantidadPasajeros` INT NULL,
  `cantidadFilas` INT NULL,
  `cantidadAsientosFila` INT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aerolinea`.`Aviones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Aviones` (
  `codigo` VARCHAR(15) NOT NULL,
  `tipoAvion` VARCHAR(15) NULL,
  INDEX `FK1_Avion_idx` (`tipoAvion` ASC),
  PRIMARY KEY (`codigo`),
  CONSTRAINT `FK1_Avion`
    FOREIGN KEY (`tipoAvion`)
    REFERENCES `Aerolinea`.`TiposAvion` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aerolinea`.`Vuelos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Vuelos` (
  `codigo` VARCHAR(15) NOT NULL,
  `distancia` FLOAT NULL,
  `duracion` INT NULL,
  `descuento` FLOAT NULL,
  `origen` VARCHAR(15) NULL,
  `destino` VARCHAR(15) NULL,
  `avion` VARCHAR(15) NULL,
  PRIMARY KEY (`codigo`),
  INDEX `FK1_Vuelo_idx` (`origen` ASC),
  INDEX `FK3_Vuelo_idx` (`avion` ASC),
  INDEX `FK2_Vuelo_idx` (`destino` ASC),
  CONSTRAINT `FK1_Vuelo`
    FOREIGN KEY (`origen`)
    REFERENCES `Aerolinea`.`Ciudades` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK2_Vuelo`
    FOREIGN KEY (`destino`)
    REFERENCES `Aerolinea`.`Ciudades` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK3_Vuelo`
    FOREIGN KEY (`avion`)
    REFERENCES `Aerolinea`.`Aviones` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aerolinea`.`Viajes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Viajes` (
  `codigo` VARCHAR(15) NOT NULL,
  `fecha` DATE NULL,
  `dia` VARCHAR(10) NULL,
  `cantAsientOcup` INT NULL,
  `horaSalida` VARCHAR(45) NULL,
  `horaLlegada` VARCHAR(45) NULL,
  `precio` FLOAT NULL,
  `avion` VARCHAR(15) NULL,
  `vuelo` VARCHAR(15) NULL,
  PRIMARY KEY (`codigo`),
  INDEX `FK1_Viaje_idx` (`avion` ASC),
  INDEX `FK2_Viaje_idx` (`vuelo` ASC),
  CONSTRAINT `FK1_Viaje`
    FOREIGN KEY (`avion`)
    REFERENCES `Aerolinea`.`Aviones` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK2_Viaje`
    FOREIGN KEY (`vuelo`)
    REFERENCES `Aerolinea`.`Vuelos` (`codigo`)
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
  `email` VARCHAR(45) NULL,
  `fechaNacimiento` DATE NULL,
  `direccion` VARCHAR(50) NULL,
  `telefono` VARCHAR(15) NULL,
  `celular` VARCHAR(15) NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aerolinea`.`Asientos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Asientos` (
  `codigo` VARCHAR(15) NOT NULL,
  `estado` TINYINT NULL,
  `avion` VARCHAR(15) NULL,
  PRIMARY KEY (`codigo`),
  INDEX `FK1_Asiento_idx` (`avion` ASC),
  CONSTRAINT `FK1_Asiento`
    FOREIGN KEY (`avion`)
    REFERENCES `Aerolinea`.`Aviones` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Aerolinea`.`Tiquete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Aerolinea`.`Tiquete` (
  `codigo` VARCHAR(15) NOT NULL,
  `pasajero` VARCHAR(30) NULL,
  `viaje` VARCHAR(15) NULL,
  PRIMARY KEY (`codigo`),
  INDEX `FK1_Tiquete_idx` (`viaje` ASC),
  CONSTRAINT `FK1_Tiquete`
    FOREIGN KEY (`viaje`)
    REFERENCES `Aerolinea`.`Viajes` (`codigo`)
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
    REFERENCES `Aerolinea`.`Tiquete` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK3_Compra`
    FOREIGN KEY (`viaje`)
    REFERENCES `Aerolinea`.`Viajes` (`codigo`)
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

insert into Ciudades values("HA", "Hawai", "Estados Unidos", "UTC+6");
insert into Ciudades values("LN", "Londres", "Inglaterra", "UTC+6");
insert into Ciudades values("OR", "Orlando", "Estados Unidos", "UTC+6");
insert into Ciudades values("SJ", "San Jose", "Costa Rica", "UTC+6");
insert into Ciudades values("RI", "Rio", "Brasil", "UTC+6");
insert into Ciudades values("MIA", "Miami", "Estados Unidos", "UTC+6");
insert into Ciudades values("NY", "Nueva York", "Estados Unidos", "UTC+6");
insert into Ciudades values("BE", "Berlin", "Alemania", "UTC+6");
insert into Ciudades values("AM", "Amsterdam", "Holanda", "UTC+6");

insert into tiposAvion values ("TA1", "2000", "Airbus", "A320", 60, 10, 6);
insert into tiposAvion values ("TA2", "2001", "Airbus", "A380", 60, 10, 6);
insert into tiposAvion values ("TA3", "2002", "Boeing", "B111", 60, 10, 6);
insert into tiposAvion values ("TA4", "2003", "Boeign", "B424", 90, 10, 9);
insert into tiposAvion values ("TA5", "2004", "Cessna", "C666", 60, 10, 6);

insert into aviones values ("A1", "TA1"); -- 0
insert into aviones values ("A2", "TA2"); -- 1
insert into aviones values ("A3", "TA3"); -- 2
insert into aviones values ("A4", "TA4"); -- 3
insert into aviones values ("A5", "TA5"); -- 4

insert into vuelos values ("1001", 5780, 3, 20, "HA", "LN", "A1"); -- 0
insert into vuelos values ("2001", 5780, 3, 0, "LN", "HA", "A1"); -- 1
insert into vuelos values ("1002", 1180, 3, 15, "RI", "MIA", "A2"); -- 2
insert into vuelos values ("2002", 1180, 3, 0, "MIA", "RI", "A2"); -- 3
insert into vuelos values ("1003", 1180, 3, 30, "MIA", "NY", "A3"); -- 4
insert into vuelos values ("2003", 1180, 3, 0, "NY", "MIA", "A3"); -- 5
insert into vuelos values ("1004", 1200, 3, 0, "BE", "AM", "A4"); -- 6
insert into vuelos values ("2004", 1200, 3, 0, "AM", "BE", "A4");-- 7
insert into vuelos values ("1005", 4000, 3, 30, "SJ", "OR", "A5"); -- 8
insert into vuelos values ("2005", 4000, 3, 0, "OR", "SJ", "A5");-- 9

insert into viajes values ("1", "2017-07-05", "V", 20, "9:00am", "12:00pm", 150, "A1", "1001"); -- Hawai-Londres
insert into viajes values ("2", "2017-07-05", "V", 20, "5:00pm", "8:00pm", 150, "A1", "1001");
insert into viajes values ("3", "2017-07-09", "M", 10, "9:00am", "12:00pm", 150, "A1", "2001"); -- Londres-Hawai;
insert into viajes values ("4", "2017-07-09", "M", 10, "5:00pm", "8:00pm", 150, "A1", "2001");
insert into viajes values ("5", "2017-07-05", "V", 20, "9:00am", "12:00pm", 300, "A2", "1002"); -- Rio - Miami
insert into viajes values ("6", "2017-07-05", "V", 20, "5:00pm", "8:00pm", 300, "A2", "1002");
insert into viajes values ("7", "2017-07-09", "M", 10, "9:00am", "12:00pm", 300, "A2", "2002"); -- Miami - Rio
insert into viajes values ("8", "2017-07-09", "M", 10, "5:00pm", "8:00pm", 300, "A2", "2002");
insert into viajes values ("9", "2017-07-05", "V", 20, "9:00am", "12:00pm", 270, "A3", "1003"); -- Miami - Nueva York
insert into viajes values ("10", "2017-07-05", "V", 20, "5:00pm", "8:00pm", 270, "A3", "1003"); 
insert into viajes values ("11", "2017-07-09", "V", 20, "9:00am", "12:00pm", 270, "A3", "2003"); -- Nueva York - Miami
insert into viajes values ("12", "2017-07-09", "V", 20, "5:00pm", "8:00pm", 270, "A3", "2003");
insert into viajes values ("13", "2017-07-05", "V", 20, "9:00am", "12:00pm", 400, "A4", "1004"); -- Berlin - Amsterdam
insert into viajes values ("14", "2017-07-05", "V", 20, "5:00pm", "8:00pm", 400, "A4", "1004");
insert into viajes values ("15", "2017-07-09", "V", 20, "9:00am", "12:00pm", 400, "A4", "2004"); -- Amsterdam - Berlin
insert into viajes values ("16", "2017-07-09", "V", 20, "5:00pm", "8:00pm", 400, "A4", "2004");
insert into viajes values ("17", "2017-07-05", "M", 10, "09:00am", "12:00am", 350, "A5", "1005"); -- SJ - orlando
insert into viajes values ("18", "2017-07-05", "M", 10, "10:00am", "01:00pm", 350, "A5", "1005");
insert into viajes values ("19", "2017-07-05", "M", 10, "11:00am", "02:00pm", 350, "A5", "1005");
insert into viajes values ("20", "2017-07-05", "M", 10, "12:00pm", "03:00pm", 350, "A5", "1005");
insert into viajes values ("21", "2017-07-05", "M", 10, "01:00pm", "04:00pm", 350, "A5", "1005");
insert into viajes values ("22", "2017-07-05", "M", 10, "02:00pm", "05:00pm", 350, "A5", "1005");
insert into viajes values ("23", "2017-07-05", "M", 10, "03:00pm", "06:00pm", 350, "A5", "1005");
insert into viajes values ("24", "2017-07-05", "M", 10, "04:00pm", "07:00pm", 350, "A5", "1005");
insert into viajes values ("25", "2017-07-05", "M", 10, "05:00pm", "08:00pm", 350, "A5", "1005");
insert into viajes values ("26", "2017-07-05", "M", 10, "06:00pm", "09:00pm", 350, "A5", "1005");
insert into viajes values ("27", "2017-07-05", "M", 10, "07:00pm", "10:00pm", 350, "A5", "1005");
insert into viajes values ("28", "2017-07-05", "M", 10, "08:00pm", "11:00pm", 350, "A5", "1005");
insert into viajes values ("29", "2017-07-09", "M", 10, "09:00am", "12:00am", 350, "A5", "2005"); -- Orlando - SJ
insert into viajes values ("30", "2017-07-09", "M", 10, "10:00am", "01:00pm", 350, "A5", "2005");
insert into viajes values ("31", "2017-07-09", "M", 10, "11:00am", "02:00pm", 350, "A5", "2005");
insert into viajes values ("32", "2017-07-09", "M", 10, "12:00pm", "03:00pm", 350, "A5", "2005");
insert into viajes values ("33", "2017-07-09", "M", 10, "01:00pm", "04:00pm", 350, "A5", "2005");
insert into viajes values ("34", "2017-07-09", "M", 10, "02:00pm", "05:00pm", 350, "A5", "2005");
insert into viajes values ("35", "2017-07-09", "M", 10, "03:00pm", "06:00pm", 350, "A5", "2005");
insert into viajes values ("36", "2017-07-09", "M", 10, "04:00pm", "07:00pm", 350, "A5", "2005");
insert into viajes values ("37", "2017-07-09", "M", 10, "05:00pm", "08:00pm", 350, "A5", "2005");
insert into viajes values ("38", "2017-07-09", "M", 10, "06:00pm", "09:00pm", 350, "A5", "2005");
insert into viajes values ("39", "2017-07-09", "M", 10, "07:00pm", "10:00pm", 350, "A5", "2005");
insert into viajes values ("40", "2017-07-09", "M", 10, "08:00pm", "11:00pm", 350, "A5", "2005");