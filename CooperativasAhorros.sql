-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 22, 2021 at 01:56 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CooperativasAhorros`
--

-- --------------------------------------------------------

--
-- Table structure for table `Asistencia`
--

CREATE TABLE `Asistencia` (
  `AsiCod` int(6) NOT NULL,
  `AsiUsu` int(4) NOT NULL,
  `AsiDes` char(15) DEFAULT NULL,
  `AsiSeg` int(2) DEFAULT NULL,
  `AsiMin` int(2) DEFAULT NULL,
  `AsiHor` int(2) DEFAULT NULL,
  `AsiDia` int(2) DEFAULT NULL,
  `AsiMes` int(2) DEFAULT NULL,
  `AsiAño` int(4) DEFAULT NULL,
  `AsiEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Cooperativa`
--

CREATE TABLE `Cooperativa` (
  `CooCod` int(4) NOT NULL,
  `CooIden` char(8) DEFAULT NULL,
  `CooNom` char(30) DEFAULT NULL,
  `CooSig` char(10) DEFAULT NULL,
  `CooDir` char(60) DEFAULT NULL,
  `CooTel` char(12) DEFAULT NULL,
  `CooCor` char(20) DEFAULT NULL,
  `CooSlo` char(60) DEFAULT NULL,
  `CooLog` longblob DEFAULT NULL,
  `CooUsu` int(4) DEFAULT NULL,
  `CooEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Cuenta`
--

CREATE TABLE `Cuenta` (
  `CueCod` int(6) NOT NULL,
  `CueNum` char(20) DEFAULT NULL,
  `CueSoc` int(4) NOT NULL,
  `CueMonTot` decimal(9,3) DEFAULT NULL,
  `CueMon` int(2) NOT NULL,
  `CueEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Departamento`
--

CREATE TABLE `Departamento` (
  `DepCod` int(2) NOT NULL,
  `DepDes` char(20) DEFAULT NULL,
  `DepEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Distrito`
--

CREATE TABLE `Distrito` (
  `DisCod` int(4) NOT NULL,
  `DisDes` char(20) DEFAULT NULL,
  `DisEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Estado_Ayuda`
--

CREATE TABLE `Estado_Ayuda` (
  `EstAyuCod` int(1) NOT NULL,
  `EstAyuDes` char(15) DEFAULT NULL,
  `EstAyuEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Estado_Registro`
--

CREATE TABLE `Estado_Registro` (
  `EstRegCod` varchar(1) NOT NULL,
  `EstRegDes` char(1) DEFAULT NULL,
  `EstRegEstReg` varchar(1) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Funcion`
--

CREATE TABLE `Funcion` (
  `FunCod` int(2) NOT NULL,
  `FunDes` char(40) DEFAULT NULL,
  `FunEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Mesa_Ayuda`
--

CREATE TABLE `Mesa_Ayuda` (
  `MesAyuCod` int(4) NOT NULL,
  `MesAyuNumPro` int(5) DEFAULT NULL,
  `MesAyuNumNoPro` int(5) DEFAULT NULL,
  `MesAyuEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Moneda`
--

CREATE TABLE `Moneda` (
  `MonCod` int(2) NOT NULL,
  `MonDes` char(15) DEFAULT NULL,
  `MonValSol` decimal(5,3) DEFAULT NULL,
  `MonEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Persona`
--

CREATE TABLE `Persona` (
  `PerCod` int(4) NOT NULL,
  `PerCoo` int(4) NOT NULL,
  `PerIden` char(8) DEFAULT NULL,
  `PerApePat` char(30) DEFAULT NULL,
  `PerApeMat` char(30) DEFAULT NULL,
  `PerNom` char(30) DEFAULT NULL,
  `PerFecNacDia` int(2) DEFAULT NULL,
  `PerFecNacMes` int(2) DEFAULT NULL,
  `PerFecNacAño` int(4) DEFAULT NULL,
  `PerCor` char(35) DEFAULT NULL,
  `PerFot` longblob DEFAULT NULL,
  `PerEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Producto`
--

CREATE TABLE `Producto` (
  `ProCod` int(6) NOT NULL,
  `ProSoc` int(4) NOT NULL,
  `ProIden` char(8) DEFAULT NULL,
  `ProDes` char(100) DEFAULT NULL,
  `ProMon` int(2) NOT NULL,
  `ProMonIni` decimal(10,3) DEFAULT NULL,
  `ProMonAct` decimal(10,3) DEFAULT NULL,
  `ProEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Provincia`
--

CREATE TABLE `Provincia` (
  `ProCod` int(3) NOT NULL,
  `ProDes` char(20) DEFAULT NULL,
  `ProEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Rol`
--

CREATE TABLE `Rol` (
  `RolCod` int(6) NOT NULL,
  `RolUsu` int(4) NOT NULL,
  `RolTipRol` int(1) NOT NULL,
  `RolDes` char(30) DEFAULT NULL,
  `RolEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Socio`
--

CREATE TABLE `Socio` (
  `SocCod` int(4) NOT NULL,
  `SocCoo` int(4) NOT NULL,
  `SocIden` char(8) DEFAULT NULL,
  `SocApePat` char(30) DEFAULT NULL,
  `SocApeMat` char(30) DEFAULT NULL,
  `SocNom` char(30) DEFAULT NULL,
  `SocNacDia` int(2) DEFAULT NULL,
  `SocNacMes` int(2) DEFAULT NULL,
  `SocNacAño` int(4) DEFAULT NULL,
  `SocCor` char(40) DEFAULT NULL,
  `SocTipPro` int(1) NOT NULL,
  `SocCue` int(8) DEFAULT NULL,
  `SocDep` int(2) NOT NULL,
  `SocPro` int(3) NOT NULL,
  `SocDis` int(4) NOT NULL,
  `SocEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Solucion`
--

CREATE TABLE `Solucion` (
  `SolCod` int(4) NOT NULL,
  `SolDes` char(100) DEFAULT NULL,
  `SolDoc` blob DEFAULT NULL,
  `SolTipSer` int(2) NOT NULL,
  `SolTipEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Soporte`
--

CREATE TABLE `Soporte` (
  `SopCod` int(5) NOT NULL,
  `SopMesAyu` int(4) NOT NULL,
  `SopUsu` int(4) NOT NULL,
  `SopDet` char(100) DEFAULT NULL,
  `SopDoc` blob DEFAULT NULL,
  `SopFecDia` int(2) DEFAULT NULL,
  `SopFecMes` int(2) DEFAULT NULL,
  `SopFecAño` int(4) DEFAULT NULL,
  `SopTipSer` int(2) NOT NULL,
  `SopEstAyu` int(1) NOT NULL,
  `SopEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Soporte_Solucion`
--

CREATE TABLE `Soporte_Solucion` (
  `SopSolCod` int(5) NOT NULL,
  `SopSolSop` int(5) NOT NULL,
  `SopSolSol` int(4) NOT NULL,
  `SopSolEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Tasa`
--

CREATE TABLE `Tasa` (
  `TasCod` int(6) NOT NULL,
  `TasIden` char(8) DEFAULT NULL,
  `TasDes` char(30) DEFAULT NULL,
  `TasTas` decimal(6,4) DEFAULT NULL,
  `TasPlaDia` int(4) DEFAULT NULL,
  `TasIniDia` int(2) DEFAULT NULL,
  `TasIniMes` int(2) DEFAULT NULL,
  `TasIniAño` int(4) DEFAULT NULL,
  `TasFinDia` int(2) DEFAULT NULL,
  `TasFinMes` int(2) DEFAULT NULL,
  `TasFinAño` int(4) DEFAULT NULL,
  `TasEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Tipo_Producto`
--

CREATE TABLE `Tipo_Producto` (
  `TipProCod` int(1) NOT NULL,
  `TipProDes` char(40) DEFAULT NULL,
  `TipProEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Tipo_Rol`
--

CREATE TABLE `Tipo_Rol` (
  `TipRolCod` int(1) NOT NULL,
  `TipRolDes` char(40) DEFAULT NULL,
  `TipRolEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Tipo_Servicio`
--

CREATE TABLE `Tipo_Servicio` (
  `TipSerCod` int(2) NOT NULL,
  `TipSerDes` char(20) DEFAULT NULL,
  `TipSerEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Usuario`
--

CREATE TABLE `Usuario` (
  `UsuCod` int(4) NOT NULL,
  `UsuEmp` int(4) NOT NULL,
  `UsuIde` char(8) DEFAULT NULL,
  `UsuUsu` char(20) DEFAULT NULL,
  `UsuPas` char(15) DEFAULT NULL,
  `UsuFecInsUsuDia` int(2) DEFAULT NULL,
  `UsuFecInsUsuMes` int(2) DEFAULT NULL,
  `UsuFecInsUsuAño` int(4) DEFAULT NULL,
  `UsuFun` int(2) NOT NULL,
  `UsuEstReg` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Asistencia`
--
ALTER TABLE `Asistencia`
  ADD PRIMARY KEY (`AsiCod`),
  ADD KEY `Int_Usuario_Asistencia` (`AsiUsu`),
  ADD KEY `AsiEstReg` (`AsiEstReg`);

--
-- Indexes for table `Cooperativa`
--
ALTER TABLE `Cooperativa`
  ADD PRIMARY KEY (`CooCod`),
  ADD KEY `CooEstReg` (`CooEstReg`);

--
-- Indexes for table `Cuenta`
--
ALTER TABLE `Cuenta`
  ADD PRIMARY KEY (`CueCod`),
  ADD KEY `Int_Socio_Cuenta` (`CueSoc`),
  ADD KEY `Int_Moneda_Cuenta` (`CueMon`),
  ADD KEY `CueEstReg` (`CueEstReg`);

--
-- Indexes for table `Departamento`
--
ALTER TABLE `Departamento`
  ADD PRIMARY KEY (`DepCod`),
  ADD KEY `DepEstReg` (`DepEstReg`);

--
-- Indexes for table `Distrito`
--
ALTER TABLE `Distrito`
  ADD PRIMARY KEY (`DisCod`),
  ADD KEY `DisEstReg` (`DisEstReg`);

--
-- Indexes for table `Estado_Ayuda`
--
ALTER TABLE `Estado_Ayuda`
  ADD PRIMARY KEY (`EstAyuCod`),
  ADD KEY `EstAyuEstReg` (`EstAyuEstReg`);

--
-- Indexes for table `Estado_Registro`
--
ALTER TABLE `Estado_Registro`
  ADD PRIMARY KEY (`EstRegCod`),
  ADD KEY `EstRegEstReg` (`EstRegEstReg`);

--
-- Indexes for table `Funcion`
--
ALTER TABLE `Funcion`
  ADD PRIMARY KEY (`FunCod`),
  ADD KEY `FunEstReg` (`FunEstReg`);

--
-- Indexes for table `Mesa_Ayuda`
--
ALTER TABLE `Mesa_Ayuda`
  ADD PRIMARY KEY (`MesAyuCod`),
  ADD KEY `MesAyuEstReg` (`MesAyuEstReg`);

--
-- Indexes for table `Moneda`
--
ALTER TABLE `Moneda`
  ADD PRIMARY KEY (`MonCod`),
  ADD KEY `MonEstReg` (`MonEstReg`);

--
-- Indexes for table `Persona`
--
ALTER TABLE `Persona`
  ADD PRIMARY KEY (`PerCod`),
  ADD KEY `Int_Cooperativa_Persona` (`PerCoo`),
  ADD KEY `PerEstReg` (`PerEstReg`);

--
-- Indexes for table `Producto`
--
ALTER TABLE `Producto`
  ADD PRIMARY KEY (`ProCod`),
  ADD KEY `Int_Socio_Producto` (`ProSoc`),
  ADD KEY `Int_Moneda_Producto` (`ProMon`),
  ADD KEY `ProEstReg` (`ProEstReg`);

--
-- Indexes for table `Provincia`
--
ALTER TABLE `Provincia`
  ADD PRIMARY KEY (`ProCod`),
  ADD KEY `ProEstReg` (`ProEstReg`);

--
-- Indexes for table `Rol`
--
ALTER TABLE `Rol`
  ADD PRIMARY KEY (`RolCod`),
  ADD KEY `Int_Usuario_Roles` (`RolUsu`),
  ADD KEY `Int_Tipo_Rol_Rol` (`RolTipRol`),
  ADD KEY `RolEstReg` (`RolEstReg`);

--
-- Indexes for table `Socio`
--
ALTER TABLE `Socio`
  ADD PRIMARY KEY (`SocCod`),
  ADD KEY `Int_Cooperartiva_Socio` (`SocCoo`);

--
-- Indexes for table `Solucion`
--
ALTER TABLE `Solucion`
  ADD PRIMARY KEY (`SolCod`),
  ADD KEY `Int_Tipo_Servicio_Solucion` (`SolTipSer`),
  ADD KEY `SolTipEstReg` (`SolTipEstReg`);

--
-- Indexes for table `Soporte`
--
ALTER TABLE `Soporte`
  ADD PRIMARY KEY (`SopCod`),
  ADD KEY `Int_Mesa_Ayuda_Soporte` (`SopMesAyu`),
  ADD KEY `Int_Usuario_Soporte` (`SopUsu`),
  ADD KEY `Int_Tipo_Servicio_Soporte` (`SopTipSer`),
  ADD KEY `Int_Estado_Ayuda_Soporte` (`SopEstAyu`),
  ADD KEY `SopEstReg` (`SopEstReg`);

--
-- Indexes for table `Soporte_Solucion`
--
ALTER TABLE `Soporte_Solucion`
  ADD PRIMARY KEY (`SopSolCod`),
  ADD KEY `Int_Soporte_Soporte_Solucion` (`SopSolSop`),
  ADD KEY `Int_Solucion_Soporte_Solucion` (`SopSolSol`),
  ADD KEY `SopSolEstReg` (`SopSolEstReg`);

--
-- Indexes for table `Tasa`
--
ALTER TABLE `Tasa`
  ADD PRIMARY KEY (`TasCod`),
  ADD KEY `TasEstReg` (`TasEstReg`);

--
-- Indexes for table `Tipo_Producto`
--
ALTER TABLE `Tipo_Producto`
  ADD PRIMARY KEY (`TipProCod`),
  ADD KEY `TipProEstReg` (`TipProEstReg`);

--
-- Indexes for table `Tipo_Rol`
--
ALTER TABLE `Tipo_Rol`
  ADD PRIMARY KEY (`TipRolCod`),
  ADD KEY `TipRolEstReg` (`TipRolEstReg`);

--
-- Indexes for table `Tipo_Servicio`
--
ALTER TABLE `Tipo_Servicio`
  ADD PRIMARY KEY (`TipSerCod`),
  ADD KEY `TipSerEstReg` (`TipSerEstReg`);

--
-- Indexes for table `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`UsuCod`),
  ADD KEY `Int_Cooperativa_Usuario` (`UsuEmp`),
  ADD KEY `Int_Funcion_Usuario` (`UsuFun`),
  ADD KEY `UsuEstReg` (`UsuEstReg`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Asistencia`
--
ALTER TABLE `Asistencia`
  MODIFY `AsiCod` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Cooperativa`
--
ALTER TABLE `Cooperativa`
  MODIFY `CooCod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Cuenta`
--
ALTER TABLE `Cuenta`
  MODIFY `CueCod` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Departamento`
--
ALTER TABLE `Departamento`
  MODIFY `DepCod` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Distrito`
--
ALTER TABLE `Distrito`
  MODIFY `DisCod` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Funcion`
--
ALTER TABLE `Funcion`
  MODIFY `FunCod` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Moneda`
--
ALTER TABLE `Moneda`
  MODIFY `MonCod` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Persona`
--
ALTER TABLE `Persona`
  MODIFY `PerCod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Producto`
--
ALTER TABLE `Producto`
  MODIFY `ProCod` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Provincia`
--
ALTER TABLE `Provincia`
  MODIFY `ProCod` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Rol`
--
ALTER TABLE `Rol`
  MODIFY `RolCod` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Socio`
--
ALTER TABLE `Socio`
  MODIFY `SocCod` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Solucion`
--
ALTER TABLE `Solucion`
  MODIFY `SolCod` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Soporte`
--
ALTER TABLE `Soporte`
  MODIFY `SopCod` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Soporte_Solucion`
--
ALTER TABLE `Soporte_Solucion`
  MODIFY `SopSolCod` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Tasa`
--
ALTER TABLE `Tasa`
  MODIFY `TasCod` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Tipo_Producto`
--
ALTER TABLE `Tipo_Producto`
  MODIFY `TipProCod` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Tipo_Rol`
--
ALTER TABLE `Tipo_Rol`
  MODIFY `TipRolCod` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Tipo_Servicio`
--
ALTER TABLE `Tipo_Servicio`
  MODIFY `TipSerCod` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `UsuCod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Asistencia`
--
ALTER TABLE `Asistencia`
  ADD CONSTRAINT `Asistencia_ibfk_1` FOREIGN KEY (`AsiEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`),
  ADD CONSTRAINT `Int_Usuario_Asistencia` FOREIGN KEY (`AsiUsu`) REFERENCES `Usuario` (`UsuCod`);

--
-- Constraints for table `Cooperativa`
--
ALTER TABLE `Cooperativa`
  ADD CONSTRAINT `Cooperativa_ibfk_1` FOREIGN KEY (`CooEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`);

--
-- Constraints for table `Cuenta`
--
ALTER TABLE `Cuenta`
  ADD CONSTRAINT `Cuenta_ibfk_1` FOREIGN KEY (`CueEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`),
  ADD CONSTRAINT `Int_Moneda_Cuenta` FOREIGN KEY (`CueMon`) REFERENCES `Moneda` (`MonCod`),
  ADD CONSTRAINT `Int_Socio_Cuenta` FOREIGN KEY (`CueSoc`) REFERENCES `Socio` (`SocCod`);

--
-- Constraints for table `Departamento`
--
ALTER TABLE `Departamento`
  ADD CONSTRAINT `Departamento_ibfk_1` FOREIGN KEY (`DepEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`);

--
-- Constraints for table `Distrito`
--
ALTER TABLE `Distrito`
  ADD CONSTRAINT `Distrito_ibfk_1` FOREIGN KEY (`DisEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`);

--
-- Constraints for table `Estado_Ayuda`
--
ALTER TABLE `Estado_Ayuda`
  ADD CONSTRAINT `Estado_Ayuda_ibfk_1` FOREIGN KEY (`EstAyuEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`);

--
-- Constraints for table `Estado_Registro`
--
ALTER TABLE `Estado_Registro`
  ADD CONSTRAINT `Estado_Registro_ibfk_1` FOREIGN KEY (`EstRegEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`);

--
-- Constraints for table `Funcion`
--
ALTER TABLE `Funcion`
  ADD CONSTRAINT `Funcion_ibfk_1` FOREIGN KEY (`FunEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`);

--
-- Constraints for table `Mesa_Ayuda`
--
ALTER TABLE `Mesa_Ayuda`
  ADD CONSTRAINT `Int_Cooperativa_Mesa_Ayuda` FOREIGN KEY (`MesAyuCod`) REFERENCES `Cooperativa` (`CooCod`),
  ADD CONSTRAINT `Mesa_Ayuda_ibfk_1` FOREIGN KEY (`MesAyuEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`);

--
-- Constraints for table `Moneda`
--
ALTER TABLE `Moneda`
  ADD CONSTRAINT `Moneda_ibfk_1` FOREIGN KEY (`MonEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`);

--
-- Constraints for table `Persona`
--
ALTER TABLE `Persona`
  ADD CONSTRAINT `Int_Cooperativa_Persona` FOREIGN KEY (`PerCoo`) REFERENCES `Cooperativa` (`CooCod`),
  ADD CONSTRAINT `Persona_ibfk_1` FOREIGN KEY (`PerEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`);

--
-- Constraints for table `Producto`
--
ALTER TABLE `Producto`
  ADD CONSTRAINT `Int_Moneda_Producto` FOREIGN KEY (`ProMon`) REFERENCES `Moneda` (`MonCod`),
  ADD CONSTRAINT `Int_Socio_Producto` FOREIGN KEY (`ProSoc`) REFERENCES `Socio` (`SocCod`),
  ADD CONSTRAINT `Producto_ibfk_1` FOREIGN KEY (`ProEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`);

--
-- Constraints for table `Provincia`
--
ALTER TABLE `Provincia`
  ADD CONSTRAINT `Provincia_ibfk_1` FOREIGN KEY (`ProEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`);

--
-- Constraints for table `Rol`
--
ALTER TABLE `Rol`
  ADD CONSTRAINT `Int_Tipo_Rol_Rol` FOREIGN KEY (`RolTipRol`) REFERENCES `Tipo_Rol` (`TipRolCod`),
  ADD CONSTRAINT `Int_Usuario_Roles` FOREIGN KEY (`RolUsu`) REFERENCES `Usuario` (`UsuCod`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Rol_ibfk_1` FOREIGN KEY (`RolEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`);

--
-- Constraints for table `Socio`
--
ALTER TABLE `Socio`
  ADD CONSTRAINT `Int_Cooperartiva_Socio` FOREIGN KEY (`SocCoo`) REFERENCES `Cooperativa` (`CooCod`);

--
-- Constraints for table `Solucion`
--
ALTER TABLE `Solucion`
  ADD CONSTRAINT `Int_Tipo_Servicio_Solucion` FOREIGN KEY (`SolTipSer`) REFERENCES `Tipo_Servicio` (`TipSerCod`),
  ADD CONSTRAINT `Solucion_ibfk_1` FOREIGN KEY (`SolTipEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`);

--
-- Constraints for table `Soporte`
--
ALTER TABLE `Soporte`
  ADD CONSTRAINT `Int_Estado_Ayuda_Soporte` FOREIGN KEY (`SopEstAyu`) REFERENCES `Estado_Ayuda` (`EstAyuCod`),
  ADD CONSTRAINT `Int_Mesa_Ayuda_Soporte` FOREIGN KEY (`SopMesAyu`) REFERENCES `Mesa_Ayuda` (`MesAyuCod`),
  ADD CONSTRAINT `Int_Tipo_Servicio_Soporte` FOREIGN KEY (`SopTipSer`) REFERENCES `Tipo_Servicio` (`TipSerCod`),
  ADD CONSTRAINT `Int_Usuario_Soporte` FOREIGN KEY (`SopUsu`) REFERENCES `Usuario` (`UsuCod`),
  ADD CONSTRAINT `Soporte_ibfk_1` FOREIGN KEY (`SopEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`);

--
-- Constraints for table `Soporte_Solucion`
--
ALTER TABLE `Soporte_Solucion`
  ADD CONSTRAINT `Int_Solucion_Soporte_Solucion` FOREIGN KEY (`SopSolSol`) REFERENCES `Solucion` (`SolCod`),
  ADD CONSTRAINT `Int_Soporte_Soporte_Solucion` FOREIGN KEY (`SopSolSop`) REFERENCES `Soporte` (`SopCod`),
  ADD CONSTRAINT `Soporte_Solucion_ibfk_1` FOREIGN KEY (`SopSolEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`);

--
-- Constraints for table `Tasa`
--
ALTER TABLE `Tasa`
  ADD CONSTRAINT `Int_Producto_Tasa` FOREIGN KEY (`TasCod`) REFERENCES `Producto` (`ProCod`),
  ADD CONSTRAINT `Tasa_ibfk_1` FOREIGN KEY (`TasEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`);

--
-- Constraints for table `Tipo_Producto`
--
ALTER TABLE `Tipo_Producto`
  ADD CONSTRAINT `Tipo_Producto_ibfk_1` FOREIGN KEY (`TipProEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`);

--
-- Constraints for table `Tipo_Rol`
--
ALTER TABLE `Tipo_Rol`
  ADD CONSTRAINT `Tipo_Rol_ibfk_1` FOREIGN KEY (`TipRolEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`);

--
-- Constraints for table `Tipo_Servicio`
--
ALTER TABLE `Tipo_Servicio`
  ADD CONSTRAINT `Tipo_Servicio_ibfk_1` FOREIGN KEY (`TipSerEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`);

--
-- Constraints for table `Usuario`
--
ALTER TABLE `Usuario`
  ADD CONSTRAINT `Int_Cooperativa_Usuario` FOREIGN KEY (`UsuEmp`) REFERENCES `Cooperativa` (`CooCod`),
  ADD CONSTRAINT `Int_Funcion_Usuario` FOREIGN KEY (`UsuFun`) REFERENCES `Funcion` (`FunCod`),
  ADD CONSTRAINT `Usuario_ibfk_1` FOREIGN KEY (`UsuEstReg`) REFERENCES `Estado_Registro` (`EstRegCod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
