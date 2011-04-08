package sisa.com.br.service;

import java.sql.SQLException;

import net.sf.jasperreports.engine.JRException;

public interface RelatoriosService {
	
	public void gerarRelatorioProposta(String dtInicio, String dtFim, String situacao, String codVendedor)throws JRException, SQLException;
	
	public void gerarRelatorioPropostaEspecifico(String numeroProposta)throws JRException, SQLException;
	
	public void gerarBoleto(String numeroProposta)throws JRException, SQLException;
}
