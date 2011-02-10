SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `tcc` ;
CREATE SCHEMA IF NOT EXISTS `tcc` DEFAULT CHARACTER SET latin1 ;
USE `tcc` ;


-- -----------------------------------------------------
-- Table `uf`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `uf` ;

CREATE  TABLE IF NOT EXISTS `uf` (
  `cd_uf` INT(11) NOT NULL ,
  `sg_uf` CHAR(2) NOT NULL ,
  `ds_uf` VARCHAR(72) NULL DEFAULT NULL ,
  PRIMARY KEY (`cd_uf`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cidade` ;

CREATE  TABLE IF NOT EXISTS `cidade` (
  `cd_cidade` INT(11) NOT NULL ,
  `cd_uf` INT(11) NOT NULL ,
  `no_cidade` VARCHAR(50) NOT NULL ,
  `cep_cidade` VARCHAR(8) NULL DEFAULT NULL ,
  PRIMARY KEY (`cd_cidade`) ,
  INDEX `fk_uf_cidade` (`cd_uf` ASC) ,
  CONSTRAINT `fk_uf_cidade`
    FOREIGN KEY (`cd_uf` )
    REFERENCES `uf` (`cd_uf` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bairro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bairro` ;

CREATE  TABLE IF NOT EXISTS `bairro` (
  `cd_bairro` INT(11) NOT NULL ,
  `cd_cidade` INT(11) NOT NULL ,
  `ds_bairro` VARCHAR(72) NOT NULL ,
  PRIMARY KEY (`cd_bairro`) ,
  INDEX `fk_cidade_bairro` (`cd_cidade` ASC) ,
  CONSTRAINT `fk_cidade_bairro`
    FOREIGN KEY (`cd_cidade` )
    REFERENCES `cidade` (`cd_cidade` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `endereco` ;

CREATE  TABLE IF NOT EXISTS `endereco` (
  `cd_endereco` INT(11) NOT NULL ,
  `cd_bairro` INT(11) NOT NULL ,
  `nu_cep` VARCHAR(8) NOT NULL ,
  `ds_logradouro` VARCHAR(200) NOT NULL ,
  `ds_complemento` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`cd_endereco`) ,
  INDEX `fk_bairro_endereco` (`cd_bairro` ASC) ,
  CONSTRAINT `fk_bairro_endereco`
    FOREIGN KEY (`cd_bairro` )
    REFERENCES `bairro` (`cd_bairro` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `financiamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `financiamento` ;

CREATE  TABLE IF NOT EXISTS `financiamento` (
  `qtd_parcelas` INT(11) NOT NULL ,
  `perc_financiamento` DECIMAL(15,5) NOT NULL ,
  PRIMARY KEY (`qtd_parcelas`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `loteamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `loteamento` ;

CREATE  TABLE IF NOT EXISTS `loteamento` (
  `nu_lotm` VARCHAR(3) NOT NULL ,
  `ds_lotm` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`nu_lotm`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `lote`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lote` ;

CREATE  TABLE IF NOT EXISTS `lote` (
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
  PRIMARY KEY (`nu_lotm`, `nu_quadra`, `nu_lote`) ,
  CONSTRAINT `fk_lote_loteamento`
    FOREIGN KEY (`nu_lotm` )
    REFERENCES `loteamento` (`nu_lotm` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `promitente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `promitente` ;

CREATE  TABLE IF NOT EXISTS `promitente` (
  `cd_pro` VARCHAR(5) NOT NULL ,
  `nome_promitente` VARCHAR(40) NOT NULL ,
  `dominio_estado_civil` VARCHAR(1) NOT NULL ,
  `dominio_sexo` VARCHAR(1) NOT NULL ,
  `nu_rg` VARCHAR(10) NOT NULL ,
  `ds_org_emiss` VARCHAR(6) NOT NULL ,
  `dt_exp_rg` DATETIME NOT NULL ,
  `nu_cgc_cpf` VARCHAR(15) NOT NULL ,
  `dt_nasc` DATETIME NOT NULL ,
  `fl_dep` VARCHAR(1) NOT NULL ,
  `nu_fone_res` VARCHAR(11) NOT NULL ,
  `cd_end_cobr` INT(11) NOT NULL ,
  `nu_end_cobr` VARCHAR(15) NULL DEFAULT NULL ,
  `ds_compl_end_cobr` VARCHAR(30) NULL DEFAULT NULL ,
  `nu_fone_cobr` VARCHAR(11) NOT NULL ,
  `ds_profissao` VARCHAR(20) NOT NULL ,
  `situacao` VARCHAR(1) NOT NULL ,
  `nacionalidade` VARCHAR(50) NULL DEFAULT NULL ,
  `cd_end_residencial` INT(11) NOT NULL ,
  `nu_end_resid` VARCHAR(15) NULL DEFAULT NULL ,
  `ds_compl_end_resid` VARCHAR(30) NULL DEFAULT NULL ,
  `nome_responsavel` VARCHAR(40) NULL DEFAULT NULL ,
  `nu_cgc_cpf_responsavel` VARCHAR(15) NULL DEFAULT NULL ,
  PRIMARY KEY (`cd_pro`) ,
  INDEX `fk_promitente_endereco` (`cd_end_cobr` ASC) ,
  INDEX `fk_end_promitente_resid` (`cd_end_residencial` ASC) ,
  CONSTRAINT `fk_end_promitente_resid`
    FOREIGN KEY (`cd_end_residencial` )
    REFERENCES `endereco` (`cd_endereco` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_promitente`
    FOREIGN KEY (`cd_end_cobr` )
    REFERENCES `endereco` (`cd_endereco` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `vendedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vendedor` ;

CREATE  TABLE IF NOT EXISTS `vendedor` (
  `cd_vend` VARCHAR(3) NOT NULL ,
  `ds_razao_nome` VARCHAR(40) NOT NULL ,
  `nu_fone` VARCHAR(11) NOT NULL ,
  `nu_cgc_cpf` VARCHAR(15) NOT NULL ,
  `no_fantasia` VARCHAR(40) NOT NULL ,
  `situacao` VARCHAR(1) NOT NULL ,
  `cd_endereco` INT(11) NOT NULL ,
  `ds_comp_end` VARCHAR(30) NULL DEFAULT NULL ,
  `nu_endereco` VARCHAR(15) NULL DEFAULT NULL ,
  PRIMARY KEY (`cd_vend`) ,
  INDEX `fk_vendedor_endereco` (`cd_endereco` ASC) ,
  CONSTRAINT `fk_endereco_vendedor`
    FOREIGN KEY (`cd_endereco` )
    REFERENCES `endereco` (`cd_endereco` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proposta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proposta` ;

CREATE  TABLE IF NOT EXISTS `proposta` (
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
  `nu_cgc_cpf_menor` VARCHAR(15) NOT NULL ,
  `fl_pagto_avista` VARCHAR(1) NOT NULL ,
  `nu_lotm` VARCHAR(3) NOT NULL ,
  PRIMARY KEY (`nu_proposta`) ,
  INDEX `fk_promitente_proposta` (`cd_promitente` ASC) ,
  INDEX `fk_financiamento_proposta` (`qt_prest` ASC) ,
  INDEX `fk_loteamento_proposta` (`nu_lotm` ASC) ,
  INDEX `fk_vendedor_proposta` (`cd_vend` ASC) ,
  CONSTRAINT `fk_financiamento_proposta`
    FOREIGN KEY (`qt_prest` )
    REFERENCES `financiamento` (`qtd_parcelas` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_loteamento_proposta`
    FOREIGN KEY (`nu_lotm` )
    REFERENCES `loteamento` (`nu_lotm` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_promitente_proposta`
    FOREIGN KEY (`cd_promitente` )
    REFERENCES `promitente` (`cd_pro` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendedor_proposta`
    FOREIGN KEY (`cd_vend` )
    REFERENCES `vendedor` (`cd_vend` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `lotes_proposta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lotes_proposta` ;

CREATE  TABLE IF NOT EXISTS `lotes_proposta` (
  `nu_proposta` VARCHAR(5) NOT NULL ,
  `nu_lote` VARCHAR(3) NOT NULL ,
  `nu_lotm` VARCHAR(3) NOT NULL ,
  `nu_quadra` VARCHAR(3) NOT NULL ,
  PRIMARY KEY (`nu_proposta`, `nu_lote`, `nu_lotm`, `nu_quadra`) ,
  INDEX `fk_lote_proposta` (`nu_lotm` ASC, `nu_quadra` ASC, `nu_lote` ASC) ,
  CONSTRAINT `fk_lote_proposta`
    FOREIGN KEY (`nu_lotm` , `nu_quadra` , `nu_lote` )
    REFERENCES `lote` (`nu_lotm` , `nu_quadra` , `nu_lote` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proposta_lote`
    FOREIGN KEY (`nu_proposta` )
    REFERENCES `proposta` (`nu_proposta` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `parcelas_sinal_proposta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `parcelas_sinal_proposta` ;

CREATE  TABLE IF NOT EXISTS `parcelas_sinal_proposta` (
  `nu_proposta` VARCHAR(5) NOT NULL ,
  `nu_parcela` INT(11) NOT NULL ,
  `tipo_pagto` VARCHAR(15) NULL DEFAULT NULL ,
  `num_doc` VARCHAR(10) NOT NULL ,
  `valor` DECIMAL(10,2) NULL DEFAULT NULL ,
  `data_vencimento` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`nu_proposta`, `nu_parcela`) ,
  CONSTRAINT `fk_proposta_sinal`
    FOREIGN KEY (`nu_proposta` )
    REFERENCES `proposta` (`nu_proposta` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `perfil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `perfil` ;

CREATE  TABLE IF NOT EXISTS `perfil` (
  `id` INT(11) NOT NULL ,
  `descricao` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `transacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `transacao` ;

CREATE  TABLE IF NOT EXISTS `transacao` (
  `id` INT(11) NOT NULL ,
  `titulo` VARCHAR(50) NOT NULL ,
  `nome` VARCHAR(50) NOT NULL ,
  `url` VARCHAR(200) NULL DEFAULT NULL ,
  `ordem` TINYINT(4) NOT NULL ,
  `ativa` BIT(1) NOT NULL ,
  `idpai` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_transacao_transacao` (`idpai` ASC) ,
  CONSTRAINT `fk_transacao_transacao`
    FOREIGN KEY (`idpai` )
    REFERENCES `transacao` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `transacao_perfil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `transacao_perfil` ;

CREATE  TABLE IF NOT EXISTS `transacao_perfil` (
  `id_perfil` INT(11) NOT NULL COMMENT '	' ,
  `id_transacao` INT(11) NOT NULL ,
  PRIMARY KEY (`id_perfil`, `id_transacao`) ,
  INDEX `fk_transacao_transacaoperfil` (`id_transacao` ASC) ,
  CONSTRAINT `fk_perfil_transacaoperfil`
    FOREIGN KEY (`id_perfil` )
    REFERENCES `perfil` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transacao_transacaoperfil`
    FOREIGN KEY (`id_transacao` )
    REFERENCES `transacao` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `usuario` ;

CREATE  TABLE IF NOT EXISTS `usuario` (
  `id` INT(11) NOT NULL ,
  `login` VARCHAR(30) NOT NULL ,
  `nome` VARCHAR(50) NOT NULL ,
  `senha` VARCHAR(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `usuario_perfil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `usuario_perfil` ;

CREATE  TABLE IF NOT EXISTS `usuario_perfil` (
  `id_usuario` INT(11) NOT NULL ,
  `id_perfil` INT(11) NOT NULL ,
  PRIMARY KEY (`id_usuario`, `id_perfil`) ,
  INDEX `fk_perfil_usuarioperfil` (`id_perfil` ASC) ,
  CONSTRAINT `fk_perfil_usuarioperfil`
    FOREIGN KEY (`id_perfil` )
    REFERENCES `perfil` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_usuarioperfil`
    FOREIGN KEY (`id_usuario` )
    REFERENCES `usuario` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
