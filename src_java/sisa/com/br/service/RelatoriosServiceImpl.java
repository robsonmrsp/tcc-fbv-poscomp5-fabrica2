package sisa.com.br.service;

import java.sql.SQLException;

import net.sf.jasperreports.engine.JRException;

import org.springframework.stereotype.Service;

import sisa.com.br.relatorios.web.RelatorioProposta;
import sisa.com.br.relatorios.web.RelatorioPropostaEspecifico;

@Service(value="relatoriosService")
public class RelatoriosServiceImpl implements RelatoriosService{

	@Override
	public void gerarRelatorioProposta(String dtInicio, String dtFim,
			String situacao, String codVendedor) throws JRException,
			SQLException {
		RelatorioProposta relatorioProposta = new RelatorioProposta(dtInicio, dtFim, situacao, codVendedor);
        relatorioProposta.gerar();
	}

	@Override
	public void gerarRelatorioPropostaEspecifico(String numeroProposta)
			throws JRException, SQLException {
        RelatorioPropostaEspecifico relEspecifico = new RelatorioPropostaEspecifico(numeroProposta);
        relEspecifico.gerar();
	}
	
	@Override
	public void gerarBoleto(String numeroProposta) throws JRException,
			SQLException {
       		
	}

}
