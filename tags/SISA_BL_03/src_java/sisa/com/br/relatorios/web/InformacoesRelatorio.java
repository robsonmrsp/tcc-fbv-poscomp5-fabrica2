package sisa.com.br.relatorios.web;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

import sisa.com.br.relatorios.ConexaoMySQL;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JasperViewer;

/**
 * Classe responsável por armazenar as informações referente ao relatório.
 * 
 */
public class InformacoesRelatorio {
	

	private String identicacaoRelatorio;	

	private Map<String, Object> mapaParametros;
	
	private static String nomeArquivoSaida = "";
	
	static String complDiretorioJaspers = "relatorios/";
	static String complDiretorioImagens = "relatorios/imagens/";
	static String nomeImgCidadeGarapu = complDiretorioImagens + "cidade garapu.jpg";
	static String nomeImgLogoSisa = complDiretorioImagens + "logo sisa.jpg";
	static String caminhoProjeto = System.getProperty("user.dir");
	
	// Construtores
	public InformacoesRelatorio(String pIdenticacaoRelatorio, String pNomeArquivoSaida){
		this(pIdenticacaoRelatorio, pNomeArquivoSaida, null);
	}
	
	public InformacoesRelatorio(String pIdenticacaoRelatorio, String pNomeArquivoSaida, Map<String, Object> pMapaParametros){
		identicacaoRelatorio = pIdenticacaoRelatorio;
		nomeArquivoSaida = pNomeArquivoSaida;
		mapaParametros = pMapaParametros;
	}

	/**
	 * @return O identicacaoRelatorio a ser recuperado.
	 */
	public String getIdenticacaoRelatorio() {
		return identicacaoRelatorio;
	}

	/**
	 * @param identicacaoRelatorio
	 *            O valor a ser atribuido em identicacaoRelatorio.
	 */
	public void setIdenticacaoRelatorio(String identicacaoRelatorio) {
		this.identicacaoRelatorio = identicacaoRelatorio;
	}


	/**
	 * @return O mapaParametros a ser recuperado.
	 */
	public Map<String, Object> getMapaParametros() {
		return mapaParametros;
	}

	/**
	 * @param mapaParametros
	 *            O valor a ser atribuido em mapaParametros.
	 */
	public void setMapaParametros(Map<String, Object> mapaParametros) {
		this.mapaParametros = mapaParametros;
	}
	
	public void gerar() throws JRException, SQLException {
    	// Cria a conex�o
        Connection conexao = new ConexaoMySQL().getConnection();
        conexao.createStatement();
        
        File arquivoAux = new File(identicacaoRelatorio);
        
//        arquivoAux = new File(arquivoAux.getClass().getResource("/").getPath() + complDiretorioJaspers + identicacaoRelatorio);
//        System.out.println(arquivoAux.exists());
        
        JasperPrint jp = JasperFillManager.fillReport(arquivoAux.getClass().getResource("/").getPath() + "/" + complDiretorioJaspers + identicacaoRelatorio , getMapaParametros(), conexao);            
        
        // Exporta para PDF
//        JasperExportManager.exportReportToPdfFile(jp, nomeArquivoSaida);
        
        JasperViewer jrv = new JasperViewer(jp);
        jrv.setVisible(true);
        
    	String arquivoSaida = caminhoProjeto + "/" + nomeArquivoSaida;
        
        System.out.println("Relat�rio Gerado com Sucesso em: " + arquivoSaida);
        
        conexao.close();
		
	}

}
