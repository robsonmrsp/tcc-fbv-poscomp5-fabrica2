DROP TABLE `parcelas_sinal_proposta`;

CREATE TABLE `parcelas_sinal_proposta` (
  `id` int(11) NOT NULL,
  `nu_proposta` varchar(5) NOT NULL,
  `nu_parcela` int(11) NOT NULL,
  `tipo_pagto` varchar(1) DEFAULT NULL,
  `num_doc` varchar(10) NOT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `data_vencimento` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_ParcelaSinal` (`nu_proposta`,`nu_parcela`),
  CONSTRAINT `fk_proposta_sinal` FOREIGN KEY (`nu_proposta`) REFERENCES `proposta` (`nu_proposta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) 

