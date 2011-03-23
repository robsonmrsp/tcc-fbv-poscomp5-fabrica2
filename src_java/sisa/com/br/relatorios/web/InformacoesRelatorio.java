package sisa.com.br.relatorios.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import sisa.com.br.relatorios.ConexaoMySQL;

/**
 * Classe responsável por armazenar as informações referente ao relatório.
 * 
 */
public class InformacoesRelatorio extends HttpServlet{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String identificador;	

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
		identificador = pIdenticacaoRelatorio;
		nomeArquivoSaida = pNomeArquivoSaida;
		mapaParametros = pMapaParametros;
	}

	/**
	 * @return O identicacaoRelatorio a ser recuperado.
	 */
	public String getIdenticacaoRelatorio() {
		return identificador;
	}

	/**
	 * @param identicacaoRelatorio
	 *            O valor a ser atribuido em identicacaoRelatorio.
	 */
	public void setIdenticacaoRelatorio(String identicacaoRelatorio) {
		this.identificador = identicacaoRelatorio;
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
	
	public byte[] gerar() throws JRException, SQLException {
		System.out.println("inicio de gera��o de relat�rio!");
    	// Cria a conex�o
        Connection conexao = new ConexaoMySQL().getConnection();
        conexao.createStatement();
        
//        File arquivoAux = new File(identicacaoRelatorio);
        
//        arquivoAux = new File(arquivoAux.getClass().getResource("/").getPath() + complDiretorioJaspers + identicacaoRelatorio);
//        System.out.println(arquivoAux.exists());
        /*JasperDesign jd = JasperManager.loadDesign(getIdenticacaoRelatorio());
        JasperReport jr = JasperManager.compileReport(jd);
        byte[] r = JasperManager.runReportToPdf(jr, getMapaParametros(), conexao);*/
        
        //JasperPrint jp = JasperFillManager.fillReport(identicacaoRelatorio ,getMapaParametros(), conexao);            
        JasperPrint jp = JasperFillManager.fillReport(getIdenticacaoRelatorio() ,getMapaParametros(), conexao);
        
        // Exporta para PDF
//        JasperExportManager.exportReportToPdfFile(jp, nomeArquivoSaida);
        byte[] array =  JasperExportManager.exportReportToPdf(jp);
//        ServletOutputStream out = response.getOutputStream();
//		byte abyte0[] = new byte[4096];  
//		BufferedInputStream bufferedinputstream = new BufferedInputStream(new FileInputStream(localReportGerado));
//		int i;  
//		while((i = bufferedinputstream.read(abyte0, 0, 4096)) != -1)  
//			out.write(abyte0, 0, i);  
//		bufferedinputstream.close();
//		out.close();
        
//        JasperViewer jrv = new JasperViewer(jp, false);
//        jrv.setVisible(true);
        
    	String arquivoSaida = caminhoProjeto + "/" + nomeArquivoSaida;
        
        System.out.println("Relat�rio Gerado com Sucesso em: " + arquivoSaida);
        
        conexao.close();
        
        return array;
		
	}
	
	public String gerarXML() throws JRException, SQLException {
		String xmlRetorno = "";
		System.out.println("inicio de gera��o de relat�rio XML!");
    	// Cria a conex�o
        Connection conexao = new ConexaoMySQL().getConnection();
        conexao.createStatement();
        
        File arquivoAux = new File(identificador);
        
//        arquivoAux = new File(arquivoAux.getClass().getResource("/").getPath() + complDiretorioJaspers + identicacaoRelatorio);
//        System.out.println(arquivoAux.exists());
        
        JasperPrint jp = 
        	JasperFillManager.fillReport(arquivoAux.getClass().getResource("/").getPath() + "/" + complDiretorioJaspers + identificador , 
        			getMapaParametros(), conexao);            
        jp.setName(nomeArquivoSaida);
        xmlRetorno = JasperExportManager.exportReportToXml(jp);
        
    	String arquivoSaida = caminhoProjeto + "/" + nomeArquivoSaida;
        
        System.out.println("Relat�rio Gerado com Sucesso em: " + arquivoSaida);
        
        conexao.close();
		
        return xmlRetorno;
	}
	
	protected void processarRequisicao(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String reportXML = "";
		try {
			reportXML = gerarXML();
		} catch (JRException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.setContentType("text/xml"); //Configura o ContentType
		response.setCharacterEncoding("ISO 8859 1");//- - Configura o Character Enconding
		PrintWriter outputStream = response.getWriter();
		outputStream.print(reportXML); // Imprime o xml
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		processarRequisicao(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		processarRequisicao(request, response);
	}
	public String getServletInfo() {
		return "Short description";
	}

}