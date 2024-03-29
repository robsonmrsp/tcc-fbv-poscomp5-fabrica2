SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `tcc` ;
CREATE SCHEMA IF NOT EXISTS `tcc` DEFAULT CHARACTER SET latin1 ;
USE `tcc` ;

-- -----------------------------------------------------
-- Table `tcc`.`endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tcc`.`endereco` ;

CREATE  TABLE IF NOT EXISTS `tcc`.`endereco` (
  `cd_endereco` INT(11) NOT NULL AUTO_INCREMENT ,
  `nu_cep` VARCHAR(8) NULL DEFAULT NULL ,
  `ds_logradouro` VARCHAR(200) NOT NULL ,
  `nr_endereco` VARCHAR(15) NULL DEFAULT NULL ,
  `ds_complemento` VARCHAR(45) NULL DEFAULT NULL ,
  `ds_bairro` VARCHAR(100) NULL DEFAULT NULL ,
  `cd_uf` VARCHAR(2) NOT NULL ,
  `no_cidade` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`cd_endereco`) ,
  INDEX `fk_bairro_endereco` (`ds_bairro` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tcc`.`financiamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tcc`.`financiamento` ;

CREATE  TABLE IF NOT EXISTS `tcc`.`financiamento` (
  `qtd_parcelas` INT(11) NOT NULL ,
  `perc_financiamento` DECIMAL(15,5) NOT NULL ,
  PRIMARY KEY (`qtd_parcelas`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tcc`.`loteamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tcc`.`loteamento` ;

CREATE  TABLE IF NOT EXISTS `tcc`.`loteamento` (
  `nu_lotm` VARCHAR(3) NOT NULL ,
  `ds_lotm` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`nu_lotm`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tcc`.`lote`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tcc`.`lote` ;

CREATE  TABLE IF NOT EXISTS `tcc`.`lote` (
  `cd_lote` INT(11) NOT NULL AUTO_INCREMENT ,
  `nu_lotm` VARCHAR(3) NOT NULL ,
  `nu_quadra` VARCHAR(3) NOT NULL ,
  `nu_lote` VARCHAR(3) NOT NULL ,
  `ds_conf_frente` VARCHAR(20) NOT NULL ,
  `ds_conf_fundo` VARCHAR(20) NOT NULL ,
  `ds_conf_direita` VARCHAR(20) NOT NULL ,
  `ds_conf_esquerda` VARCHAR(20) NOT NULL ,
  `nu_area` DECIMAL(15,2) NOT NULL ,
  `nu_dist_esquina` DECIMAL(15,2) NOT NULL ,
  `situacao` VARCHAR(1) NOT NULL ,
  `ds_dim_frente` VARCHAR(20) NOT NULL ,
  `ds_dim_fundo` VARCHAR(20) NOT NULL ,
  `ds_dim_direita` VARCHAR(20) NOT NULL ,
  `ds_dim_esquerda` VARCHAR(20) NOT NULL ,
  `valorm2` DECIMAL(15,2) NOT NULL ,
  PRIMARY KEY (`cd_lote`) ,
  UNIQUE INDEX `uk_lote` (`nu_lotm` ASC, `nu_quadra` ASC, `nu_lote` ASC) ,
  INDEX `fk_lote_loteamento` (`nu_lotm` ASC) ,
  CONSTRAINT `fk_lote_loteamento`
    FOREIGN KEY (`nu_lotm` )
    REFERENCES `tcc`.`loteamento` (`nu_lotm` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tcc`.`promitente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tcc`.`promitente` ;

CREATE  TABLE IF NOT EXISTS `tcc`.`promitente` (
  `cd_pro` VARCHAR(5) NOT NULL ,
  `nome_promitente` VARCHAR(40) NOT NULL ,
  `dominio_estado_civil` VARCHAR(1) NOT NULL ,
  `dominio_sexo` VARCHAR(1) NOT NULL ,
  `nu_rg` VARCHAR(10) NOT NULL ,
  `ds_org_emiss` VARCHAR(6) NOT NULL ,
  `dt_exp_rg` DATETIME NOT NULL ,
  `nu_cgc_cpf` VARCHAR(15) NOT NULL ,
  `dt_nasc` DATETIME NOT NULL ,
  `fl_dep` VARCHAR(1) NOT NULL DEFAULT 'N' ,
  `nu_fone_res` VARCHAR(11) NULL DEFAULT NULL ,
  `cd_end_cobr` INT(11) NOT NULL ,
  `nu_fone_cobr` VARCHAR(11) NULL DEFAULT NULL ,
  `ds_profissao` VARCHAR(20) NULL DEFAULT NULL ,
  `situacao` VARCHAR(1) NOT NULL DEFAULT 'A' ,
  `nacionalidade` VARCHAR(50) NULL DEFAULT NULL ,
  `cd_end_residencial` INT(11) NOT NULL ,
  `nome_responsavel` VARCHAR(40) NULL DEFAULT NULL ,
  `nu_cgc_cpf_responsavel` VARCHAR(15) NULL DEFAULT NULL ,
  PRIMARY KEY (`cd_pro`) ,
  INDEX `fk_promitente_endereco` (`cd_end_cobr` ASC) ,
  INDEX `fk_end_promitente_resid` (`cd_end_residencial` ASC) ,
  CONSTRAINT `fk_endereco_promitente`
    FOREIGN KEY (`cd_end_cobr` )
    REFERENCES `tcc`.`endereco` (`cd_endereco` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_end_promitente_resid`
    FOREIGN KEY (`cd_end_residencial` )
    REFERENCES `tcc`.`endereco` (`cd_endereco` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tcc`.`vendedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tcc`.`vendedor` ;

CREATE  TABLE IF NOT EXISTS `tcc`.`vendedor` (
  `cd_vend` VARCHAR(3) NOT NULL ,
  `ds_razao_nome` VARCHAR(40) NOT NULL ,
  `nu_fone` VARCHAR(11) NOT NULL ,
  `nu_cgc_cpf` VARCHAR(15) NOT NULL ,
  `no_fantasia` VARCHAR(40) NOT NULL ,
  `situacao` VARCHAR(1) NOT NULL ,
  `cd_endereco` INT(11) NOT NULL ,
  PRIMARY KEY (`cd_vend`) ,
  INDEX `fk_vendedor_endereco` (`cd_endereco` ASC) ,
  CONSTRAINT `fk_endereco_vendedor`
    FOREIGN KEY (`cd_endereco` )
    REFERENCES `tcc`.`endereco` (`cd_endereco` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tcc`.`proposta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tcc`.`proposta` ;

CREATE  TABLE IF NOT EXISTS `tcc`.`proposta` (
  `nu_proposta` VARCHAR(5) NOT NULL ,
  `cd_promitente` VARCHAR(5) NOT NULL ,
  `no_conjuge` VARCHAR(40) NOT NULL ,
  `vl_vista` DECIMAL(15,2) NOT NULL ,
  `vl_sinal` DECIMAL(15,2) NOT NULL ,
  `qt_prest` INT(11) NOT NULL ,
  `vl_prest` DECIMAL(15,2) NOT NULL ,
  `ds_obs` VARCHAR(60) NOT NULL ,
  `situacao` VARCHAR(1) NOT NULL ,
  `cd_vend` VARCHAR(3) NOT NULL ,
  `dt_emissao` DATETIME NOT NULL ,
  `dt_pri_prest` DATETIME NOT NULL ,
  `fl_dep` VARCHAR(1) NOT NULL ,
  `nu_cgc_cpf_menor` VARCHAR(15) NULL DEFAULT NULL ,
  `fl_pagto_avista` VARCHAR(1) NOT NULL ,
  PRIMARY KEY (`nu_proposta`) ,
  INDEX `fk_promitente_proposta` (`cd_promitente` ASC) ,
  INDEX `fk_financiamento_proposta` (`qt_prest` ASC) ,
  INDEX `fk_vendedor_proposta` (`cd_vend` ASC) ,
  CONSTRAINT `fk_financiamento_proposta`
    FOREIGN KEY (`qt_prest` )
    REFERENCES `tcc`.`financiamento` (`qtd_parcelas` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_promitente_proposta`
    FOREIGN KEY (`cd_promitente` )
    REFERENCES `tcc`.`promitente` (`cd_pro` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendedor_proposta`
    FOREIGN KEY (`cd_vend` )
    REFERENCES `tcc`.`vendedor` (`cd_vend` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tcc`.`lotes_proposta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tcc`.`lotes_proposta` ;

CREATE  TABLE IF NOT EXISTS `tcc`.`lotes_proposta` (
  `nu_proposta` VARCHAR(5) NOT NULL ,
  `cd_lote` INT(11) NOT NULL ,
  PRIMARY KEY (`nu_proposta`, `cd_lote`) ,
  INDEX `fk_lote_lotesproposta` (`cd_lote` ASC) ,
  CONSTRAINT `fk_lote_lotesproposta`
    FOREIGN KEY (`cd_lote` )
    REFERENCES `tcc`.`lote` (`cd_lote` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proposta_lotesproposta`
    FOREIGN KEY (`nu_proposta` )
    REFERENCES `tcc`.`proposta` (`nu_proposta` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tcc`.`parcelas_sinal_proposta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tcc`.`parcelas_sinal_proposta` ;

CREATE  TABLE IF NOT EXISTS `tcc`.`parcelas_sinal_proposta` (
  `nu_proposta` VARCHAR(5) NOT NULL ,
  `nu_parcela` INT(11) NOT NULL ,
  `tipo_pagto` VARCHAR(15) NULL DEFAULT NULL ,
  `num_doc` VARCHAR(10) NOT NULL ,
  `valor` DECIMAL(10,2) NULL DEFAULT NULL ,
  `data_vencimento` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`nu_proposta`, `nu_parcela`) ,
  CONSTRAINT `fk_proposta_sinal`
    FOREIGN KEY (`nu_proposta` )
    REFERENCES `tcc`.`proposta` (`nu_proposta` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tcc`.`perfil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tcc`.`perfil` ;

CREATE  TABLE IF NOT EXISTS `tcc`.`perfil` (
  `id_perfil` INT(11) NOT NULL AUTO_INCREMENT ,
  `descricao` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`id_perfil`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tcc`.`transacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tcc`.`transacao` ;

CREATE  TABLE IF NOT EXISTS `tcc`.`transacao` (
  `id_transacao` INT(11) NOT NULL AUTO_INCREMENT ,
  `titulo` VARCHAR(50) NOT NULL ,
  `nome` VARCHAR(50) NOT NULL ,
  `url` VARCHAR(200) NULL DEFAULT NULL ,
  `ordem` TINYINT(4) NOT NULL ,
  `ativa` BIT(1) NOT NULL ,
  `idpai` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_transacao`) ,
  INDEX `fk_transacao_transacao` (`idpai` ASC) ,
  CONSTRAINT `fk_transacao_pai`
    FOREIGN KEY (`idpai` )
    REFERENCES `tcc`.`transacao` (`id_transacao` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tcc`.`transacao_perfil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tcc`.`transacao_perfil` ;

CREATE  TABLE IF NOT EXISTS `tcc`.`transacao_perfil` (
  `id_perfil` INT(11) NOT NULL COMMENT '	' ,
  `id_transacao` INT(11) NOT NULL ,
  PRIMARY KEY (`id_perfil`, `id_transacao`) ,
  INDEX `fk_transacao_transacaoperfil` (`id_transacao` ASC) ,
  CONSTRAINT `fk_perfil_transacao`
    FOREIGN KEY (`id_perfil` )
    REFERENCES `tcc`.`perfil` (`id_perfil` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transacao_perfil`
    FOREIGN KEY (`id_transacao` )
    REFERENCES `tcc`.`transacao` (`id_transacao` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tcc`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tcc`.`usuario` ;

CREATE  TABLE IF NOT EXISTS `tcc`.`usuario` (
  `id_usuario` INT(11) NOT NULL AUTO_INCREMENT ,
  `login` VARCHAR(30) NOT NULL ,
  `nome` VARCHAR(50) NOT NULL ,
  `senha` VARCHAR(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`id_usuario`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tcc`.`usuario_perfil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tcc`.`usuario_perfil` ;

CREATE  TABLE IF NOT EXISTS `tcc`.`usuario_perfil` (
  `id_usuario` INT(11) NOT NULL ,
  `id_perfil` INT(11) NOT NULL ,
  PRIMARY KEY (`id_usuario`, `id_perfil`) ,
  INDEX `fk_perfil_usuarioperfil` (`id_perfil` ASC) ,
  CONSTRAINT `fk_perfil_usuario`
    FOREIGN KEY (`id_perfil` )
    REFERENCES `tcc`.`perfil` (`id_perfil` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_perfil`
    FOREIGN KEY (`id_usuario` )
    REFERENCES `tcc`.`usuario` (`id_usuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
