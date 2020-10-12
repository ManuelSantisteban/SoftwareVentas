-- MySQL Script generated by MySQL Workbench
-- Sun Oct 11 20:45:56 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Sistema_Textil
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Sistema_Textil
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Sistema_Textil` DEFAULT CHARACTER SET utf8 ;
USE `Sistema_Textil` ;

-- -----------------------------------------------------
-- Table `Sistema_Textil`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_Textil`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `cli_nombre` VARCHAR(20) NOT NULL,
  `cli_dni/ruc` VARCHAR(11) NOT NULL,
  `cli_telefono` INT NOT NULL,
  `cli_direccion` VARCHAR(40) NOT NULL,
  `cli_correo` VARCHAR(30) NULL,
  `cli_estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_Textil`.`Licencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_Textil`.`Licencia` (
  `idLicencia` INT NOT NULL AUTO_INCREMENT,
  `lic_tipo` VARCHAR(15) NOT NULL,
  `lic_emision` DATE NOT NULL,
  `lic_caducidad` DATE NOT NULL,
  `lic_estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idLicencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_Textil`.`Trabajador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_Textil`.`Trabajador` (
  `idTrabajador` INT NOT NULL AUTO_INCREMENT,
  `trab_nombre` VARCHAR(20) NOT NULL,
  `trab_apellido` VARCHAR(30) NULL,
  `trab_telefono` INT NOT NULL,
  `trab_correo` VARCHAR(30) NULL,
  `trab_estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idTrabajador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_Textil`.`Conductor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_Textil`.`Conductor` (
  `idConductor` INT NOT NULL AUTO_INCREMENT,
  `idLicencia` INT NOT NULL,
  `idTrabajador` INT NOT NULL,
  `cond_sueldoB` DECIMAL(4,2) NOT NULL,
  `cond_estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idConductor`),
  INDEX `fk_Conductor_Licencia1_idx` (`idLicencia` ASC) VISIBLE,
  INDEX `fk_Conductor_Trabajador1_idx` (`idTrabajador` ASC) VISIBLE,
  CONSTRAINT `fk_Conductor_Licencia1`
    FOREIGN KEY (`idLicencia`)
    REFERENCES `Sistema_Textil`.`Licencia` (`idLicencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Conductor_Trabajador1`
    FOREIGN KEY (`idTrabajador`)
    REFERENCES `Sistema_Textil`.`Trabajador` (`idTrabajador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_Textil`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_Textil`.`Pedido` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `idCliente` INT NOT NULL,
  `idConductor` INT NOT NULL,
  `ped_fecha` DATE NOT NULL,
  `ped_estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_Pedido_Cliente_idx` (`idCliente` ASC) VISIBLE,
  INDEX `fk_Pedido_Conductor1_idx` (`idConductor` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Cliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `Sistema_Textil`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Conductor1`
    FOREIGN KEY (`idConductor`)
    REFERENCES `Sistema_Textil`.`Conductor` (`idConductor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_Textil`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_Textil`.`Categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `cat_nombre` VARCHAR(20) NOT NULL,
  `cat_observaciones` VARCHAR(40) NOT NULL,
  `cat_estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_Textil`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_Textil`.`Producto` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `idCategoria` INT NOT NULL,
  `prod_nombre` VARCHAR(20) NOT NULL,
  `prod_marca` VARCHAR(20) NOT NULL,
  `prod_precio` DECIMAL(3,2) NOT NULL,
  `prod_stock` INT NOT NULL,
  `prod_estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `fk_Producto_Categoria1_idx` (`idCategoria` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_Categoria1`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `Sistema_Textil`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_Textil`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_Textil`.`Proveedor` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `prov_nombre` VARCHAR(20) NOT NULL,
  `prov_ruc` VARCHAR(11) NOT NULL,
  `prov_telefono` INT NOT NULL,
  `prov_direccion` VARCHAR(40) NOT NULL,
  `prov_correo` VARCHAR(30) NOT NULL,
  `prov_estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_Textil`.`Materia_Prima`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_Textil`.`Materia_Prima` (
  `idMateria_Prima` INT NOT NULL AUTO_INCREMENT,
  `mp_nombre` VARCHAR(20) NOT NULL,
  `mp_precio` DECIMAL(3,2) NOT NULL,
  `mp_cantidad` INT NOT NULL,
  `mp_estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idMateria_Prima`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_Textil`.`Remallador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_Textil`.`Remallador` (
  `idRemallador` INT NOT NULL AUTO_INCREMENT,
  `idTrabajador` INT NOT NULL,
  `rem_sueldoB` DECIMAL(4,2) NOT NULL,
  `rem_estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idRemallador`),
  INDEX `fk_Remallador_Trabajador1_idx` (`idTrabajador` ASC) VISIBLE,
  CONSTRAINT `fk_Remallador_Trabajador1`
    FOREIGN KEY (`idTrabajador`)
    REFERENCES `Sistema_Textil`.`Trabajador` (`idTrabajador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_Textil`.`Movilidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_Textil`.`Movilidad` (
  `idMovilidad` INT NOT NULL AUTO_INCREMENT,
  `mov_marca` VARCHAR(10) NOT NULL,
  `mov_modelo` VARCHAR(20) NOT NULL,
  `mov_soat` VARCHAR(20) NOT NULL,
  `mov_estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idMovilidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_Textil`.`Guia_Remision`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_Textil`.`Guia_Remision` (
  `idGuia_Remision` INT NOT NULL AUTO_INCREMENT,
  `idConductor` INT NOT NULL,
  `idMovilidad` INT NOT NULL,
  `idProducto` INT NOT NULL,
  `idCliente` INT NOT NULL,
  `guia_estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idGuia_Remision`),
  INDEX `fk_Repartidor_Movilidad1_idx` (`idMovilidad` ASC) VISIBLE,
  INDEX `fk_Detalle_Entrega_Conductor1_idx` (`idConductor` ASC) VISIBLE,
  INDEX `fk_Guia_Remision_Producto1_idx` (`idProducto` ASC) VISIBLE,
  INDEX `fk_Guia_Remision_Cliente1_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Repartidor_Movilidad1`
    FOREIGN KEY (`idMovilidad`)
    REFERENCES `Sistema_Textil`.`Movilidad` (`idMovilidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Entrega_Conductor1`
    FOREIGN KEY (`idConductor`)
    REFERENCES `Sistema_Textil`.`Conductor` (`idConductor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Guia_Remision_Producto1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `Sistema_Textil`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Guia_Remision_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `Sistema_Textil`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_Textil`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_Textil`.`Factura` (
  `idFactura` INT NOT NULL AUTO_INCREMENT,
  `idPedido` INT NOT NULL,
  `idGuia_Remision` INT NOT NULL,
  `fac_fecha` DATE NOT NULL,
  `fac_monto` DECIMAL(5,2) NOT NULL,
  `fac_estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idFactura`),
  INDEX `fk_Factura_Pedido1_idx` (`idPedido` ASC) VISIBLE,
  INDEX `fk_Factura_Guia_Remision1_idx` (`idGuia_Remision` ASC) VISIBLE,
  CONSTRAINT `fk_Factura_Pedido1`
    FOREIGN KEY (`idPedido`)
    REFERENCES `Sistema_Textil`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Guia_Remision1`
    FOREIGN KEY (`idGuia_Remision`)
    REFERENCES `Sistema_Textil`.`Guia_Remision` (`idGuia_Remision`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_Textil`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_Textil`.`Compra` (
  `idCompra` INT NOT NULL,
  `idProveedor` INT NOT NULL,
  `idMateria_Prima` INT NOT NULL,
  `comp_fecha` DATE NOT NULL,
  `comp_monto` DECIMAL(5,2) NOT NULL,
  `comp_estado` TINYINT(1) NOT NULL,
  INDEX `fk_Detalle_Compra_Proveedor1_idx` (`idProveedor` ASC) VISIBLE,
  INDEX `fk_Detalle_Compra_Materia_Prima1_idx` (`idMateria_Prima` ASC) VISIBLE,
  PRIMARY KEY (`idCompra`),
  CONSTRAINT `fk_Detalle_Compra_Proveedor1`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `Sistema_Textil`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Compra_Materia_Prima1`
    FOREIGN KEY (`idMateria_Prima`)
    REFERENCES `Sistema_Textil`.`Materia_Prima` (`idMateria_Prima`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_Textil`.`Produccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_Textil`.`Produccion` (
  `idProduccion` INT NOT NULL AUTO_INCREMENT,
  `idMateria_Prima` INT NOT NULL,
  `idRemallador` INT NOT NULL,
  `prod_estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idProduccion`),
  INDEX `fk_Detalle_Proceso_Materia_Prima1_idx` (`idMateria_Prima` ASC) VISIBLE,
  INDEX `fk_Detalle_Proceso_Remallador1_idx` (`idRemallador` ASC) VISIBLE,
  CONSTRAINT `fk_Detalle_Proceso_Materia_Prima1`
    FOREIGN KEY (`idMateria_Prima`)
    REFERENCES `Sistema_Textil`.`Materia_Prima` (`idMateria_Prima`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Proceso_Remallador1`
    FOREIGN KEY (`idRemallador`)
    REFERENCES `Sistema_Textil`.`Remallador` (`idRemallador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_Textil`.`Detalle_Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_Textil`.`Detalle_Pedido` (
  `idProducto` INT NOT NULL,
  `idPedido` INT NOT NULL,
  `dp_cantidad` INT NOT NULL,
  `dp_precio` DECIMAL(3,2) NOT NULL,
  `dp_estado` TINYINT(1) NOT NULL,
  INDEX `fk_Detalle_Pedido_Producto1_idx` (`idProducto` ASC) VISIBLE,
  INDEX `fk_Detalle_Pedido_Pedido1_idx` (`idPedido` ASC) VISIBLE,
  CONSTRAINT `fk_Detalle_Pedido_Producto1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `Sistema_Textil`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Pedido_Pedido1`
    FOREIGN KEY (`idPedido`)
    REFERENCES `Sistema_Textil`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_Textil`.`Detalle_Produccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_Textil`.`Detalle_Produccion` (
  `Produccion_idProduccion` INT NOT NULL,
  `Producto_idProducto` INT NOT NULL,
  `dprod_cantidad` INT NOT NULL,
  `dprod_estado` TINYINT(1) NOT NULL,
  INDEX `fk_Detalle_Produccion_Produccion1_idx` (`Produccion_idProduccion` ASC) VISIBLE,
  INDEX `fk_Detalle_Produccion_Producto1_idx` (`Producto_idProducto` ASC) VISIBLE,
  CONSTRAINT `fk_Detalle_Produccion_Produccion1`
    FOREIGN KEY (`Produccion_idProduccion`)
    REFERENCES `Sistema_Textil`.`Produccion` (`idProduccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Produccion_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `Sistema_Textil`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_Textil`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_Textil`.`Usuarios` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `usu_usuario` VARCHAR(30) NOT NULL,
  `usu_contraseña` VARCHAR(30) NOT NULL,
  `usu_privilegio` VARCHAR(30) NOT NULL,
  `usu_estado` TINYINT(1) NOT NULL,
  `Trabajador_idTrabajador` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `fk_Usuarios_Trabajador1_idx` (`Trabajador_idTrabajador` ASC) VISIBLE,
  CONSTRAINT `fk_Usuarios_Trabajador1`
    FOREIGN KEY (`Trabajador_idTrabajador`)
    REFERENCES `Sistema_Textil`.`Trabajador` (`idTrabajador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
