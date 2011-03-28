ALTER TABLE `tcc`.`proposta` ADD COLUMN `nu_lotm` VARCHAR(3) NOT NULL  AFTER `fl_pagto_avista` , 
  ADD CONSTRAINT `fk_loteamento_proposta`
  FOREIGN KEY (`nu_lotm` )
  REFERENCES `tcc`.`loteamento` (`nu_lotm` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;