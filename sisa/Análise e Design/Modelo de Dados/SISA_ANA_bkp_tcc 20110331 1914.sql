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
-- Definition of table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
CREATE TABLE `endereco` (
  `cd_endereco` int(11) NOT NULL AUTO_INCREMENT,
  `nu_cep` varchar(8) DEFAULT NULL,
  `ds_logradouro` varchar(200) NOT NULL,
  `nr_endereco` varchar(15) DEFAULT NULL,
  `ds_complemento` varchar(45) DEFAULT NULL,
  `ds_bairro` varchar(100) DEFAULT NULL,
  `cd_uf` varchar(2) NOT NULL,
  `no_cidade` varchar(100) NOT NULL,
  PRIMARY KEY (`cd_endereco`),
  KEY `fk_bairro_endereco` (`ds_bairro`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `endereco`
--

/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` (`cd_endereco`,`nu_cep`,`ds_logradouro`,`nr_endereco`,`ds_complemento`,`ds_bairro`,`cd_uf`,`no_cidade`) VALUES 
 (1,'54500000','Estrada do Bongi','1155','AP-210','Prado','PE','RECIFE'),
 (5,'54500000','Estrada do Bongi','1155','AP-210','Prado','PE','RECIFE');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;


--
-- Definition of table `financiamento`
--

DROP TABLE IF EXISTS `financiamento`;
CREATE TABLE `financiamento` (
  `qtd_parcelas` int(11) NOT NULL,
  `perc_financiamento` decimal(15,5) NOT NULL,
  PRIMARY KEY (`qtd_parcelas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `financiamento`
--

/*!40000 ALTER TABLE `financiamento` DISABLE KEYS */;
INSERT INTO `financiamento` (`qtd_parcelas`,`perc_financiamento`) VALUES 
 (1,'1.01000'),
 (2,'0.50751'),
 (3,'0.34002'),
 (4,'0.25628'),
 (5,'0.20604'),
 (6,'0.17255'),
 (7,'0.14863'),
 (8,'0.13069'),
 (9,'0.11674'),
 (10,'0.10558'),
 (11,'0.09645'),
 (12,'0.08885'),
 (13,'0.08241'),
 (14,'0.07690'),
 (15,'0.07212'),
 (16,'0.06794'),
 (17,'0.06426'),
 (18,'0.06098'),
 (19,'0.05805'),
 (20,'0.05542'),
 (21,'0.05303'),
 (22,'0.05086'),
 (23,'0.04889'),
 (24,'0.04707'),
 (25,'0.04541'),
 (26,'0.04387'),
 (27,'0.04245'),
 (28,'0.04112'),
 (29,'0.03990'),
 (30,'0.03875'),
 (31,'0.03768'),
 (32,'0.03667'),
 (33,'0.03573'),
 (34,'0.03484'),
 (35,'0.03400'),
 (36,'0.03321'),
 (37,'0.03247'),
 (38,'0.03176'),
 (39,'0.03109'),
 (40,'0.03046'),
 (41,'0.02985'),
 (42,'0.02928'),
 (43,'0.02873'),
 (44,'0.02820'),
 (45,'0.02771'),
 (46,'0.02723'),
 (47,'0.02677'),
 (48,'0.02633'),
 (49,'0.02591'),
 (50,'0.02551'),
 (51,'0.02513'),
 (52,'0.02476'),
 (53,'0.02440'),
 (54,'0.02406'),
 (55,'0.02373'),
 (56,'0.02341'),
 (57,'0.02310'),
 (58,'0.02281'),
 (59,'0.02252'),
 (60,'0.02224'),
 (61,'0.02198'),
 (62,'0.02172'),
 (63,'0.02147'),
 (64,'0.02133'),
 (65,'0.02100'),
 (66,'0.02077'),
 (67,'0.02055'),
 (68,'0.02034'),
 (69,'0.02013'),
 (70,'0.01993'),
 (71,'0.01974'),
 (72,'0.01955'),
 (84,'0.01765'),
 (96,'0.01625');
/*!40000 ALTER TABLE `financiamento` ENABLE KEYS */;


--
-- Definition of table `lote`
--

DROP TABLE IF EXISTS `lote`;
CREATE TABLE `lote` (
  `cd_lote` int(11) NOT NULL AUTO_INCREMENT,
  `nu_lotm` varchar(3) NOT NULL,
  `nu_quadra` varchar(3) NOT NULL,
  `nu_lote` varchar(3) NOT NULL,
  `ds_conf_frente` varchar(20) NOT NULL,
  `ds_conf_fundo` varchar(20) NOT NULL,
  `ds_conf_direita` varchar(20) NOT NULL,
  `ds_conf_esquerda` varchar(20) NOT NULL,
  `nu_area` decimal(15,2) NOT NULL,
  `nu_dist_esquina` decimal(15,2) NOT NULL,
  `situacao` varchar(1) NOT NULL,
  `ds_dim_frente` varchar(20) NOT NULL,
  `ds_dim_fundo` varchar(20) NOT NULL,
  `ds_dim_direita` varchar(20) NOT NULL,
  `ds_dim_esquerda` varchar(20) NOT NULL,
  `valorm2` decimal(15,2) NOT NULL,
  PRIMARY KEY (`cd_lote`),
  UNIQUE KEY `uk_lote` (`nu_lotm`,`nu_quadra`,`nu_lote`),
  CONSTRAINT `fk_lote_loteamento` FOREIGN KEY (`nu_lotm`) REFERENCES `loteamento` (`nu_lotm`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lote`
--

/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
INSERT INTO `lote` (`cd_lote`,`nu_lotm`,`nu_quadra`,`nu_lote`,`ds_conf_frente`,`ds_conf_fundo`,`ds_conf_direita`,`ds_conf_esquerda`,`nu_area`,`nu_dist_esquina`,`situacao`,`ds_dim_frente`,`ds_dim_fundo`,`ds_dim_direita`,`ds_dim_esquerda`,`valorm2`) VALUES 
 (1,'001','004','006','R.72','LOTE 12','LOTE 05','LOTE 7','235.86','0.00','P','11,50','11,50','23,00','23,00','108.00'),
 (2,'001','006','008','R.74','LOTE 9','LOTE 7','ENG CEDRO','364.40','0.00','P','23,34','11,30','20,00','23,34','108.00'),
 (3,'001','008','009','R.76','LOTE 19','LOTE 8','LOTE 10','200.00','0.00','L','10,00','10,00','20,00','20,00','108.00'),
 (4,'001','009','014','R.76','LOTE 11','LOTE 13','LOTE 15','200.00','0.00','L','10,00','10,00','20,00','20,00','108.00'),
 (5,'001','010','022','AVENIDA 3','LOTE 30','LOTE 23','LOTE 21','200.00','0.00','P','10,00','10,00','20,00','20,00','108.00'),
 (6,'001','015','001','R.64','LOTE 15,16','LOTE 2','ZV-1','200.00','0.00','P','10,00','10,00','20,00','20,00','150.00'),
 (7,'001','015','002','R.64','LOTE 14,15','LOTE 3','LOTE 1','200.00','0.00','L','10,00','10,00','20,00','20,00','150.00'),
 (8,'001','015','003','R.64','LOTE 13,14','LOTE 4','LOTE 2','200.00','0.00','P','10,00','10,00','20,00','20,00','150.00'),
 (9,'001','015','004','R.64','LOTE 12,13','LOTE 5','LOTE 3','200.00','0.00','L','10,00','10,00','20,00','20,00','150.00'),
 (10,'001','015','005','R.64','LOTE 11,12','LOTE 6','LOTE 4','200.00','0.00','P','10,00','10,00','20,00','20,00','150.00');
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;


--
-- Definition of table `loteamento`
--

DROP TABLE IF EXISTS `loteamento`;
CREATE TABLE `loteamento` (
  `nu_lotm` varchar(3) NOT NULL,
  `ds_lotm` varchar(100) NOT NULL,
  PRIMARY KEY (`nu_lotm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loteamento`
--

/*!40000 ALTER TABLE `loteamento` DISABLE KEYS */;
INSERT INTO `loteamento` (`nu_lotm`,`ds_lotm`) VALUES 
 ('001','CIDADE GARAPU');
/*!40000 ALTER TABLE `loteamento` ENABLE KEYS */;


--
-- Definition of table `lotes_proposta`
--

DROP TABLE IF EXISTS `lotes_proposta`;
CREATE TABLE `lotes_proposta` (
  `nu_proposta` varchar(5) NOT NULL,
  `cd_lote` int(11) NOT NULL,
  PRIMARY KEY (`nu_proposta`,`cd_lote`),
  KEY `fk_lote_lotesproposta` (`cd_lote`),
  CONSTRAINT `fk_lote_lotesproposta` FOREIGN KEY (`cd_lote`) REFERENCES `lote` (`cd_lote`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proposta_lotesproposta` FOREIGN KEY (`nu_proposta`) REFERENCES `proposta` (`nu_proposta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lotes_proposta`
--

/*!40000 ALTER TABLE `lotes_proposta` DISABLE KEYS */;
INSERT INTO `lotes_proposta` (`nu_proposta`,`cd_lote`) VALUES 
 ('11111',1),
 ('12222',2),
 ('33333',3),
 ('44444',5),
 ('1',6),
 ('1',8),
 ('2',10);
/*!40000 ALTER TABLE `lotes_proposta` ENABLE KEYS */;


--
-- Definition of table `parcelas_sinal_proposta`
--

DROP TABLE IF EXISTS `parcelas_sinal_proposta`;
CREATE TABLE `parcelas_sinal_proposta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nu_proposta` varchar(5) NOT NULL,
  `nu_parcela` int(11) NOT NULL,
  `tipo_pagto` varchar(1) DEFAULT NULL,
  `num_doc` varchar(10) NOT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `data_vencimento` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_ParcelaSinal` (`nu_proposta`,`nu_parcela`),
  CONSTRAINT `fk_proposta_sinal` FOREIGN KEY (`nu_proposta`) REFERENCES `proposta` (`nu_proposta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parcelas_sinal_proposta`
--

/*!40000 ALTER TABLE `parcelas_sinal_proposta` DISABLE KEYS */;
INSERT INTO `parcelas_sinal_proposta` (`id`,`nu_proposta`,`nu_parcela`,`tipo_pagto`,`num_doc`,`valor`,`data_vencimento`) VALUES 
 (1,'11111',1,'B','12212121','1000.00','2011-04-08 00:00:00'),
 (2,'11111',3,'B','444444','1000.00','2011-06-08 00:00:00'),
 (3,'11111',2,'B','333333','1000.00','2011-05-08 00:00:00'),
 (4,'12222',2,'B','123457','1967.76','2011-05-10 00:00:00'),
 (5,'12222',1,'B','123456','1967.76','2011-04-10 00:00:00'),
 (6,'33333',1,'B','324234234','1080.00','2011-04-11 00:00:00'),
 (7,'33333',2,'B','4234234','1080.00','2011-05-11 00:00:00'),
 (10,'44444',1,'B','12112','2160.00','2011-04-11 00:00:00');
/*!40000 ALTER TABLE `parcelas_sinal_proposta` ENABLE KEYS */;


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
-- Definition of table `promitente`
--

DROP TABLE IF EXISTS `promitente`;
CREATE TABLE `promitente` (
  `cd_pro` varchar(5) NOT NULL,
  `nome_promitente` varchar(40) NOT NULL,
  `dominio_estado_civil` varchar(1) NOT NULL,
  `dominio_sexo` varchar(1) NOT NULL,
  `nu_rg` varchar(10) NOT NULL,
  `ds_org_emiss` varchar(6) NOT NULL,
  `dt_exp_rg` datetime NOT NULL,
  `nu_cgc_cpf` varchar(15) NOT NULL,
  `dt_nasc` datetime NOT NULL,
  `fl_dep` varchar(1) NOT NULL DEFAULT 'N',
  `nu_fone_res` varchar(11) DEFAULT NULL,
  `cd_end_cobr` int(11) NOT NULL,
  `nu_fone_cobr` varchar(11) DEFAULT NULL,
  `ds_profissao` varchar(20) DEFAULT NULL,
  `situacao` varchar(1) NOT NULL DEFAULT 'I',
  `nacionalidade` varchar(50) DEFAULT NULL,
  `cd_end_residencial` int(11) NOT NULL,
  `nome_responsavel` varchar(40) DEFAULT NULL,
  `nu_cgc_cpf_responsavel` varchar(15) DEFAULT NULL,
  `no_conjuge` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`cd_pro`),
  KEY `fk_promitente_endereco` (`cd_end_cobr`),
  KEY `fk_end_promitente_resid` (`cd_end_residencial`),
  CONSTRAINT `fk_endereco_promitente` FOREIGN KEY (`cd_end_cobr`) REFERENCES `endereco` (`cd_endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_end_promitente_resid` FOREIGN KEY (`cd_end_residencial`) REFERENCES `endereco` (`cd_endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `promitente`
--

/*!40000 ALTER TABLE `promitente` DISABLE KEYS */;
INSERT INTO `promitente` (`cd_pro`,`nome_promitente`,`dominio_estado_civil`,`dominio_sexo`,`nu_rg`,`ds_org_emiss`,`dt_exp_rg`,`nu_cgc_cpf`,`dt_nasc`,`fl_dep`,`nu_fone_res`,`cd_end_cobr`,`nu_fone_cobr`,`ds_profissao`,`situacao`,`nacionalidade`,`cd_end_residencial`,`nome_responsavel`,`nu_cgc_cpf_responsavel`,`no_conjuge`) VALUES 
 ('1','SILVIO ALMEIDA DA SILVA','S','M','5560670','SSP-PE','1995-05-01 00:00:00','03158308401','1978-10-02 00:00:00','N','34313256',1,'34322225','AUTONOMO','A','BRASILEIRO',1,NULL,NULL,NULL),
 ('2','LEONARDO RODRIGO TESTE','S','M','5560679','SSP-PE','1998-05-03 00:00:00','03158308401','1980-10-02 00:00:00','N','4313266',5,'4322225','AUTONOMO','A','BRASILEIRO',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `promitente` ENABLE KEYS */;


--
-- Definition of table `proposta`
--

DROP TABLE IF EXISTS `proposta`;
CREATE TABLE `proposta` (
  `nu_proposta` varchar(5) NOT NULL,
  `cd_promitente` varchar(5) NOT NULL,
  `vl_vista` decimal(15,2) DEFAULT NULL,
  `vl_sinal` decimal(15,2) DEFAULT NULL,
  `qt_prest` int(11) DEFAULT NULL,
  `vl_prest` decimal(15,2) DEFAULT NULL,
  `ds_obs` varchar(60) DEFAULT NULL,
  `situacao` varchar(1) NOT NULL,
  `cd_vend` varchar(3) NOT NULL,
  `dt_emissao` datetime NOT NULL,
  `dt_pri_prest` datetime DEFAULT NULL,
  `fl_pagto_avista` varchar(1) NOT NULL,
  `nu_lotm` varchar(3) NOT NULL,
  PRIMARY KEY (`nu_proposta`),
  KEY `fk_promitente_proposta` (`cd_promitente`),
  KEY `fk_financiamento_proposta` (`qt_prest`),
  KEY `fk_loteamento_proposta` (`nu_lotm`),
  KEY `fk_vendedor_proposta` (`cd_vend`),
  CONSTRAINT `fk_financiamento_proposta` FOREIGN KEY (`qt_prest`) REFERENCES `financiamento` (`qtd_parcelas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_loteamento_proposta` FOREIGN KEY (`nu_lotm`) REFERENCES `loteamento` (`nu_lotm`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_promitente_proposta` FOREIGN KEY (`cd_promitente`) REFERENCES `promitente` (`cd_pro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendedor_proposta` FOREIGN KEY (`cd_vend`) REFERENCES `vendedor` (`cd_vend`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proposta`
--

/*!40000 ALTER TABLE `proposta` DISABLE KEYS */;
INSERT INTO `proposta` (`nu_proposta`,`cd_promitente`,`vl_vista`,`vl_sinal`,`qt_prest`,`vl_prest`,`ds_obs`,`situacao`,`cd_vend`,`dt_emissao`,`dt_pri_prest`,`fl_pagto_avista`,`nu_lotm`) VALUES 
 ('1','1','51000.00','15000.00',60,'600.00','','A','003','2010-12-05 00:00:00','2011-01-10 00:00:00','N','001'),
 ('11111','2','25472.88','3000.00',72,'439.34','Teste','A','008','2011-04-08 00:00:00','2011-07-08 00:00:00','N','001'),
 ('12222','1','39355.20','3935.52',36,'1176.28','','P','035','2011-04-10 00:00:00','2011-06-10 00:00:00','N','001'),
 ('2','2','51000.00','15000.00',60,'600.00','','C','003','2010-12-05 00:00:00','2011-01-10 00:00:00','N','001'),
 ('33333','2','21600.00','2160.00',36,'645.60','Teste','C','004','2011-04-11 00:00:00','2011-06-10 00:00:00','N','001'),
 ('44444','2','21600.00','2160.00',56,'455.09','','P','004','2011-04-11 00:00:00','2011-05-11 00:00:00','N','001');
/*!40000 ALTER TABLE `proposta` ENABLE KEYS */;


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


--
-- Definition of table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
CREATE TABLE `vendedor` (
  `cd_vend` varchar(3) NOT NULL,
  `ds_razao_nome` varchar(40) NOT NULL,
  `nu_fone` varchar(11) NOT NULL,
  `nu_cgc_cpf` varchar(15) NOT NULL,
  `no_fantasia` varchar(40) NOT NULL,
  `situacao` varchar(1) NOT NULL,
  `cd_endereco` int(11) NOT NULL,
  PRIMARY KEY (`cd_vend`),
  KEY `fk_vendedor_endereco` (`cd_endereco`),
  CONSTRAINT `fk_endereco_vendedor` FOREIGN KEY (`cd_endereco`) REFERENCES `endereco` (`cd_endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendedor`
--

/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` (`cd_vend`,`ds_razao_nome`,`nu_fone`,`nu_cgc_cpf`,`no_fantasia`,`situacao`,`cd_endereco`) VALUES 
 ('003','DEROUINEAU E ANTUNES C DE IMOVEIS LTDA','08199245598','010257391000188','ANTUNES IMOVEIS','N',1),
 ('004','CARLOS DEROUINEAU ANTUNES NETO','08196078335','754109827000020','CARLOS DEROUINE','N',1),
 ('005','HILDA DA SILVA SOUZA','0815211010 ','089974544000004','HILDA','C',1),
 ('008','CRISTIANE SUMEIA DE PONTES','08188069454','008653134000040','CRISTIANE','N',1),
 ('010','MORADIA','           ','000000000000000','MORADIA','C',1),
 ('020','GLAUCIO ALENCAR','0081000000 ','000000000000000','GLAUCIO','C',1),
 ('030','CARLOS ANDRE DE OLIVEIRA LIMA','00815210170','136969474000015','ANDRE','C',1),
 ('031','JOSIMAR VASCONCELOS SILVA','00815210242','661195024000091','JOSIMAR','C',1),
 ('032','JOSILENE VASCONCELOS SILVA','           ','000000000000000','JOSILENE','C',1),
 ('033','PAULO DOMINGOS DOS SANTOS','           ','989254404000082','PAULO DOMINGOS','N',1),
 ('034','RODOLFO DE BARROS PEREIRA','           ','112943528000094','RODOLFO','N',1),
 ('035','GILBERTO MENEZES DE SANTANA','00814393282','351156964000087','GILBERTO','C',1),
 ('036','MARIA ELIZABETE DA SILVA','           ','022477604000057','ELIZABETE','N',1),
 ('037','PAULO FERNANDO DE ALBUQUERQUE BARBOSA','00815210264','104931404000025','PAULO FERNANDO','C',1),
 ('038','JOSE MARCOS GOMES DOS SANTOS','           ','137760104000088','MARCOS SANTOS','N',1),
 ('039','RILDO DA SILVA SOUZA','00815211010','588863974000053','RILDO','C',1),
 ('041','SAULO SOARES DA SILVA','           ','476400654000053','SAULO','N',1),
 ('042','BARRETO','           ','000000000000000','BARRETO','C',1),
 ('043','MORGE MIRIM','           ','000000000000000','MORGE','C',1),
 ('044','AMARO BERNARDO DA SILVA','           ','841990088000053','AMARO BERNARDO','N',1),
 ('045','JOSE ANTONIO NINO','00815210879','178633174000087','JOSE NINO','N',1),
 ('046','DORGIVAL FELIX DE OLIVEIRA','           ','195413684000068','DORGIVAL','N',1),
 ('047','ERINALDO GOMES DOS SANTOS','           ','000000000000000','ERINALDO','C',1),
 ('048','SEVERINO FELIX DE OLIVEIRA','00815211422','224578364000068','FELIX','N',1),
 ('049','WALDY BEZERRA DA SILVEIRA FILHO','           ','124536922000018','WALDY','N',1),
 ('050','DIANA MEDEIROS DANTAS','           ','887323474000072','DIANA','N',1);
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
