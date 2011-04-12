-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.34-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema tcc
--

CREATE DATABASE IF NOT EXISTS tcc;
USE tcc;

--
-- Definition of table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perfil`
--

/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` (`id_perfil`,`descricao`) VALUES 
 (1,'Administrador'),
 (2,'Gerente'),
 (3,'Vendedor');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;

--
-- Definition of table `transacao`
--

DROP TABLE IF EXISTS `transacao`;
CREATE TABLE `transacao` (
  `id_transacao` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `ordem` tinyint(4) NOT NULL,
  `ativa` varchar(1) NOT NULL,
  `idpai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_transacao`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transacao`
--

/*!40000 ALTER TABLE `transacao` DISABLE KEYS */;
INSERT INTO `transacao` (`id_transacao`,`titulo`,`nome`,`url`,`ordem`,`ativa`,`idpai`) VALUES 
 (1,'Administração','Administracao','administracao',1,'S',0),
 (2,'Usuario','Usuario','Usuario',1,'S',1),
 (3,'Perfil','Perfil','Perfil',2,'S',1),
 (4,'Transacao','Transacao','Transacao',3,'S',1),
 (5,'Cadastros','Cadastros','Cadastros',2,'S',0),
 (6,'Loteamento','Loteamento','Loteamento',1,'S',5),
 (7,'Lote','Lote','Lote',2,'S',5),
 (8,'Vendedor','Vendedor','Vendedor',3,'S',5),
 (9,'Promitente','Promitente','Promitente',4,'S',5),
 (10,'Proposta','Proposta','Proposta',5,'S',5),
 (11,'Relatórios','Relatorios','Relatorios',3,'S',0),
 (12,'Relatório Proposta','Relatório Proposta','Relatório Proposta',1,'S',11),
 (13,'Relatório Proposta em Formulário Específico','Relatório Proposta em Formulário Específico','Relatório Proposta em Formulário Específico',2,'S',11),
 (14,'Boleto Bancário','Boleto Bancário','Boleto Bancário',3,'S',11);
/*!40000 ALTER TABLE `transacao` ENABLE KEYS */;


--
-- Definition of table `transacao_perfil`
--

DROP TABLE IF EXISTS `transacao_perfil`;
CREATE TABLE `transacao_perfil` (
  `id_perfil` int(11) NOT NULL COMMENT '	',
  `id_transacao` int(11) NOT NULL,
  PRIMARY KEY (`id_perfil`,`id_transacao`),
  KEY `fk_transacao_transacaoperfil` (`id_transacao`),
  CONSTRAINT `fk_perfil_transacao` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transacao_perfil` FOREIGN KEY (`id_transacao`) REFERENCES `transacao` (`id_transacao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transacao_perfil`
--

/*!40000 ALTER TABLE `transacao_perfil` DISABLE KEYS */;
INSERT INTO `transacao_perfil` (`id_perfil`,`id_transacao`) VALUES 
 (1,1),
 (1,2),
 (1,3),
 (1,4),
 (1,5),
 (2,5),
 (3,5),
 (1,6),
 (2,6),
 (3,6),
 (1,7),
 (2,7),
 (3,7),
 (1,8),
 (2,8),
 (3,8),
 (1,9),
 (2,9),
 (3,9),
 (1,10),
 (2,10),
 (3,10),
 (1,11),
 (2,11),
 (1,12),
 (2,12),
 (1,13),
 (2,13),
 (1,14),
 (2,14);
/*!40000 ALTER TABLE `transacao_perfil` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `senha` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id_usuario`,`login`,`nome`,`senha`) VALUES 
 (1,'admin','Administrador','a'),
 (2,'leto','Leto','a'),
 (3,'mauri','Mauriceia','123'),
 (4,'maguelo','Maguelo','123');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;


--
-- Definition of table `usuario_perfil`
--

DROP TABLE IF EXISTS `usuario_perfil`;
CREATE TABLE `usuario_perfil` (
  `id_usuario` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_perfil`),
  KEY `fk_perfil_usuarioperfil` (`id_perfil`),
  CONSTRAINT `fk_perfil_usuario` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_perfil` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario_perfil`
--

/*!40000 ALTER TABLE `usuario_perfil` DISABLE KEYS */;
INSERT INTO `usuario_perfil` (`id_usuario`,`id_perfil`) VALUES 
 (1,1),
 (2,1),
 (3,2);
/*!40000 ALTER TABLE `usuario_perfil` ENABLE KEYS */;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
