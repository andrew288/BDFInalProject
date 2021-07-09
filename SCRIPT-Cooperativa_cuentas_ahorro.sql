/*
Created: 10/06/2021
Modified: 10/06/2021
Model: MySQL 8.0
Database: MySQL 8.0
*/

-- Create tables section -------------------------------------------------

-- Table Cooperativa

CREATE TABLE `Cooperativa`
(
  `CooCod` Int(4) NOT NULL AUTO_INCREMENT,
  `CooIden` Char(8),
  `CooNom` Char(30),
  `CooSig` Char(10),
  `CooDir` Char(60),
  `CooTel` Char(12),
  `CooCor` Char(20),
  `CooSlo` Char(60),
  `CooLog` Longblob,
  `CooUsu` Int(4),
  `CooEstReg` Int(1) NOT NULL,
  PRIMARY KEY (`CooCod`)
)
;

-- Table Socio

CREATE TABLE `Socio`
(
  `SocCod` Int(4) NOT NULL AUTO_INCREMENT,
  `SocCoo` Int(4) NOT NULL,
  `SocIden` Char(8),
  `SocApePat` Char(30),
  `SocApeMat` Char(30),
  `SocNom` Char(30),
  `SocNacDia` Int(2),
  `SocNacMes` Int(2),
  `SocNacAño` Int(4),
  `SocCor` Char(40),
  `SocTipPro` Int(1) NOT NULL,
  `SocCue` Int(8),
  `SocDep` Int(2) NOT NULL,
  `SocPro` Int(3) NOT NULL,
  `SocDis` Int(4) NOT NULL,
  `SocEstReg` Int(1) NOT NULL,
  PRIMARY KEY (`SocCod`)
)
;

-- Table Usuario

CREATE TABLE `Usuario`
(
  `UsuCod` Int(4) NOT NULL AUTO_INCREMENT,
  `UsuEmp` Int(4) NOT NULL,
  `UsuIde` Char(8),
  `UsuUsu` Char(20),
  `UsuPas` Char(15),
  `UsuFecInsUsuDia` Int(2),
  `UsuFecInsUsuMes` Int(2),
  `UsuFecInsUsuAño` Int(4),
  `UsuFun` Int(2) NOT NULL,
  `UsuEstReg` Int(1) NOT NULL,
  PRIMARY KEY (`UsuCod`)
)
;

-- Table Persona

CREATE TABLE `Persona`
(
  `PerCod` Int(4) NOT NULL AUTO_INCREMENT,
  `PerCoo` Int(4) NOT NULL,
  `PerIden` Char(8),
  `PerApePat` Char(30),
  `PerApeMat` Char(30),
  `PerNom` Char(30),
  `PerFecNacDia` Int(2),
  `PerFecNacMes` Int(2),
  `PerFecNacAño` Int(4),
  `PerCor` Char(35),
  `PerFot` Longblob,
  `PerEstReg` Int(1) NOT NULL,
  PRIMARY KEY (`PerCod`)
)
;

-- Table Producto

CREATE TABLE `Producto`
(
  `ProCod` Int(6) NOT NULL AUTO_INCREMENT,
  `ProSoc` Int(4) NOT NULL,
  `ProIden` Char(8),
  `ProDes` Char(100),
  `ProMon` Int(2) NOT NULL,
  `ProMonIni` Decimal(10,3),
  `ProMonAct` Decimal(10,3),
  `ProEstReg` Int(1) NOT NULL,
  PRIMARY KEY (`ProCod`)
)
;

-- Table Rol

CREATE TABLE `Rol`
(
  `RolCod` Int(6) NOT NULL AUTO_INCREMENT,
  `RolUsu` Int(4) NOT NULL,
  `RolTipRol` Int(1) NOT NULL,
  `RolDes` Char(30),
  `RolEstReg` Int(1) NOT NULL,
  PRIMARY KEY (`RolCod`)
)
;

-- Table Tipo_Rol

CREATE TABLE `Tipo_Rol`
(
  `TipRolCod` Int(1) NOT NULL AUTO_INCREMENT,
  `TipRolDes` Char(15),
  `TipRolEstReg` Int(1) NOT NULL,
  PRIMARY KEY (`TipRolCod`)
)
;

-- Table Asistencia

CREATE TABLE `Asistencia`
(
  `AsiCod` Int(6) NOT NULL AUTO_INCREMENT,
  `AsiUsu` Int(4) NOT NULL,
  `AsiDes` Char(15),
  `AsiSeg` Int(2),
  `AsiMin` Int(2),
  `AsiHor` Int(2),
  `AsiDia` Int(2),
  `AsiMes` Int(2),
  `AsiAño` Int(4),
  `AsiEstReg` Int(1) NOT NULL,
  PRIMARY KEY (`AsiCod`)
)
;

-- Table Mesa_Ayuda

CREATE TABLE `Mesa_Ayuda`
(
  `MesAyuCod` Int(4) NOT NULL,
  `MesAyuNumPro` Int(5),
  `MesAyuNumNoPro` Int(5),
  `MesAyuEstReg` Int(1) NOT NULL
)
;

ALTER TABLE `Mesa_Ayuda` ADD PRIMARY KEY (`MesAyuCod`)
;

-- Table Soporte

CREATE TABLE `Soporte`
(
  `SopCod` Int(5) NOT NULL AUTO_INCREMENT,
  `SopMesAyu` Int(4) NOT NULL,
  `SopUsu` Int(4) NOT NULL,
  `SopDet` Char(100),
  `SopDoc` Blob,
  `SopFecDia` Int(2),
  `SopFecMes` Int(2),
  `SopFecAño` Int(4),
  `SopTipSer` Int(2) NOT NULL,
  `SopEstAyu` Int(1) NOT NULL,
  `SopEstReg` Int(1) NOT NULL,
  PRIMARY KEY (`SopCod`)
)
;

-- Table Tipo_Servicio

CREATE TABLE `Tipo_Servicio`
(
  `TipSerCod` Int(2) NOT NULL AUTO_INCREMENT,
  `TipSerDes` Char(20),
  `TipSerEstReg` Int(1) NOT NULL,
  PRIMARY KEY (`TipSerCod`)
)
;

-- Table Estado_Ayuda

CREATE TABLE `Estado_Ayuda`
(
  `EstAyuCod` Int(1) NOT NULL,
  `EstAyuDes` Char(15),
  `EstAyuEstReg` Int(1) NOT NULL
)
;

ALTER TABLE `Estado_Ayuda` ADD PRIMARY KEY (`EstAyuCod`)
;

-- Table Soporte_Solucion

CREATE TABLE `Soporte_Solucion`
(
  `SopSolCod` Int(5) NOT NULL AUTO_INCREMENT,
  `SopSolSop` Int(5) NOT NULL,
  `SopSolSol` Int(4) NOT NULL,
  `SopSolEstReg` Int(1) NOT NULL,
  PRIMARY KEY (`SopSolCod`)
)
;

-- Table Solucion

CREATE TABLE `Solucion`
(
  `SolCod` Int(4) NOT NULL AUTO_INCREMENT,
  `SolDes` Char(100),
  `SolDoc` Blob,
  `SolTipSer` Int(2) NOT NULL,
  `SolTipEstReg` Int(1) NOT NULL,
  PRIMARY KEY (`SolCod`)
)
;

-- Table Tasa

CREATE TABLE `Tasa`
(
  `TasCod` Int(6) NOT NULL AUTO_INCREMENT,
  `TasIden` Char(8),
  `TasDes` Char(30),
  `TasTas` Decimal(6,4),
  `TasPlaDia` Int(4),
  `TasIniDia` Int(2),
  `TasIniMes` Int(2),
  `TasIniAño` Int(4),
  `TasFinDia` Int(2),
  `TasFinMes` Int(2),
  `TasFinAño` Int(4),
  `TasEstReg` Int(1) NOT NULL,
  PRIMARY KEY (`TasCod`)
)
;

-- Table Funcion

CREATE TABLE `Funcion`
(
  `FunCod` Int(2) NOT NULL AUTO_INCREMENT,
  `FunDes` Char(15),
  `FunEstReg` Int(1) NOT NULL,
  PRIMARY KEY (`FunCod`)
)
;

-- Table Departamento

CREATE TABLE `Departamento`
(
  `DepCod` Int(2) NOT NULL AUTO_INCREMENT,
  `DepDes` Char(20),
  `DepEstReg` Int(1) NOT NULL,
  PRIMARY KEY (`DepCod`)
)
;

-- Table Provincia

CREATE TABLE `Provincia`
(
  `ProCod` Int(3) NOT NULL AUTO_INCREMENT,
  `ProDes` Char(20),
  `ProEstReg` Int(1) NOT NULL,
  PRIMARY KEY (`ProCod`)
)
;

-- Table Distrito

CREATE TABLE `Distrito`
(
  `DisCod` Int(4) NOT NULL AUTO_INCREMENT,
  `DisDes` Char(20),
  `DisEstReg` Int(1) NOT NULL,
  PRIMARY KEY (`DisCod`)
)
;

-- Table Tipo_Producto

CREATE TABLE `Tipo_Producto`
(
  `TipProCod` Int(1) NOT NULL AUTO_INCREMENT,
  `TipProDes` Char(15),
  `TipProEstReg` Int(1) NOT NULL,
  PRIMARY KEY (`TipProCod`)
)
;

-- Table Cuenta

CREATE TABLE `Cuenta`
(
  `CueCod` Int(6) NOT NULL AUTO_INCREMENT,
  `CueNum` Char(20),
  `CueSoc` Int(4) NOT NULL,
  `CueMonTot` Decimal(9,3),
  `CueMon` Int(2) NOT NULL,
  `CueEstReg` Int(1) NOT NULL,
  PRIMARY KEY (`CueCod`)
)
;

-- Table Moneda

CREATE TABLE `Moneda`
(
  `MonCod` Int(2) NOT NULL AUTO_INCREMENT,
  `MonDes` Char(15),
  `MonValSol` Decimal(5,3),
  `MonEstReg` Int(1) NOT NULL,
  PRIMARY KEY (`MonCod`)
)
;

-- Table Estado_Registro

CREATE TABLE `Estado_Registro`
(
  `EstRegCod` Int(1) NOT NULL AUTO_INCREMENT,
  `EstRegDes` Char(1) DEFAULT 'A',
  PRIMARY KEY (`EstRegCod`)
)
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE `Socio` ADD CONSTRAINT `Int_Cooperartiva_Socio` FOREIGN KEY (`SocCoo`) REFERENCES `Cooperativa` (`CooCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Usuario` ADD CONSTRAINT `Int_Cooperativa_Usuario` FOREIGN KEY (`UsuEmp`) REFERENCES `Cooperativa` (`CooCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Persona` ADD CONSTRAINT `Int_Cooperativa_Persona` FOREIGN KEY (`PerCoo`) REFERENCES `Cooperativa` (`CooCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Producto` ADD CONSTRAINT `Int_Socio_Producto` FOREIGN KEY (`ProSoc`) REFERENCES `Socio` (`SocCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Rol` ADD CONSTRAINT `Int_Usuario_Roles` FOREIGN KEY (`RolUsu`) REFERENCES `Usuario` (`UsuCod`) ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE `Rol` ADD CONSTRAINT `Int_Tipo_Rol_Rol` FOREIGN KEY (`RolTipRol`) REFERENCES `Tipo_Rol` (`TipRolCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Asistencia` ADD CONSTRAINT `Int_Usuario_Asistencia` FOREIGN KEY (`AsiUsu`) REFERENCES `Usuario` (`UsuCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Mesa_Ayuda` ADD CONSTRAINT `Int_Cooperativa_Mesa_Ayuda` FOREIGN KEY (`MesAyuCod`) REFERENCES `Cooperativa` (`CooCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Soporte` ADD CONSTRAINT `Int_Mesa_Ayuda_Soporte` FOREIGN KEY (`SopMesAyu`) REFERENCES `Mesa_Ayuda` (`MesAyuCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Soporte` ADD CONSTRAINT `Int_Usuario_Soporte` FOREIGN KEY (`SopUsu`) REFERENCES `Usuario` (`UsuCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Soporte` ADD CONSTRAINT `Int_Tipo_Servicio_Soporte` FOREIGN KEY (`SopTipSer`) REFERENCES `Tipo_Servicio` (`TipSerCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Soporte` ADD CONSTRAINT `Int_Estado_Ayuda_Soporte` FOREIGN KEY (`SopEstAyu`) REFERENCES `Estado_Ayuda` (`EstAyuCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Soporte_Solucion` ADD CONSTRAINT `Int_Soporte_Soporte_Solucion` FOREIGN KEY (`SopSolSop`) REFERENCES `Soporte` (`SopCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Soporte_Solucion` ADD CONSTRAINT `Int_Solucion_Soporte_Solucion` FOREIGN KEY (`SopSolSol`) REFERENCES `Solucion` (`SolCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Solucion` ADD CONSTRAINT `Int_Tipo_Servicio_Solucion` FOREIGN KEY (`SolTipSer`) REFERENCES `Tipo_Servicio` (`TipSerCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Tasa` ADD CONSTRAINT `Int_Producto_Tasa` FOREIGN KEY (`TasCod`) REFERENCES `Producto` (`ProCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Usuario` ADD CONSTRAINT `Int_Funcion_Usuario` FOREIGN KEY (`UsuFun`) REFERENCES `Funcion` (`FunCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Socio` ADD CONSTRAINT `Int_Departamento_Socio` FOREIGN KEY (`SocDep`) REFERENCES `Departamento` (`DepCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Socio` ADD CONSTRAINT `Int_Provincia_Socio` FOREIGN KEY (`SocPro`) REFERENCES `Provincia` (`ProCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Socio` ADD CONSTRAINT `Int_Distrito_Socio` FOREIGN KEY (`SocDis`) REFERENCES `Distrito` (`DisCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Socio` ADD CONSTRAINT `Int_Tipo_Producto_Socio` FOREIGN KEY (`SocTipPro`) REFERENCES `Tipo_Producto` (`TipProCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Cuenta` ADD CONSTRAINT `Int_Socio_Cuenta` FOREIGN KEY (`CueSoc`) REFERENCES `Socio` (`SocCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Producto` ADD CONSTRAINT `Int_Moneda_Producto` FOREIGN KEY (`ProMon`) REFERENCES `Moneda` (`MonCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Cuenta` ADD CONSTRAINT `Int_Moneda_Cuenta` FOREIGN KEY (`CueMon`) REFERENCES `Moneda` (`MonCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Cooperativa` ADD CONSTRAINT `` FOREIGN KEY (`CooEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Socio` ADD CONSTRAINT `` FOREIGN KEY (`SocEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Persona` ADD CONSTRAINT `` FOREIGN KEY (`PerEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Soporte` ADD CONSTRAINT `` FOREIGN KEY (`SopEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Estado_Ayuda` ADD CONSTRAINT `` FOREIGN KEY (`EstAyuEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Soporte_Solucion` ADD CONSTRAINT `` FOREIGN KEY (`SopSolEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Solucion` ADD CONSTRAINT `` FOREIGN KEY (`SolTipEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Tipo_Servicio` ADD CONSTRAINT `` FOREIGN KEY (`TipSerEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Mesa_Ayuda` ADD CONSTRAINT `` FOREIGN KEY (`MesAyuEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Asistencia` ADD CONSTRAINT `` FOREIGN KEY (`AsiEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Usuario` ADD CONSTRAINT `` FOREIGN KEY (`UsuEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Funcion` ADD CONSTRAINT `` FOREIGN KEY (`FunEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Rol` ADD CONSTRAINT `` FOREIGN KEY (`RolEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Tipo_Rol` ADD CONSTRAINT `` FOREIGN KEY (`TipRolEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Departamento` ADD CONSTRAINT `` FOREIGN KEY (`DepEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Provincia` ADD CONSTRAINT `` FOREIGN KEY (`ProEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Tipo_Producto` ADD CONSTRAINT `` FOREIGN KEY (`TipProEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Producto` ADD CONSTRAINT `` FOREIGN KEY (`ProEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Cuenta` ADD CONSTRAINT `` FOREIGN KEY (`CueEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Distrito` ADD CONSTRAINT `` FOREIGN KEY (`DisEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Moneda` ADD CONSTRAINT `` FOREIGN KEY (`MonEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Tasa` ADD CONSTRAINT `` FOREIGN KEY (`TasEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`) ON DELETE RESTRICT ON UPDATE RESTRICT
;
