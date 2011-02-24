package sisa.com.br.relatorios;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JasperViewer;
import sisa.com.br.relatorios.web.RelatorioProposta;
import sisa.com.br.relatorios.web.RelatorioPropostaEspecifico;


public class Programa {

	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {


		
        try {
        	
        	// Cria a conexão
            Connection con = new ConexaoMySQL().getConnection();
            con.createStatement();
            
//            gerarRelatorioPropostas(con, "2000-01-01", "2011-12-31", "A", "003");
            RelatorioProposta relProp = new RelatorioProposta("2000-01-01", "2011-12-31", "A", "003");
            relProp.gerar(con);
//            gerarRelatorioPropostasEspecifico(con, "1");
            RelatorioPropostaEspecifico relEspecifico = new RelatorioPropostaEspecifico("1");
            relEspecifico.gerar(con);
            
        } catch(Exception e) {
        	e.getMessage();
        	e.getCause();
            e.printStackTrace();
        } finally {
            //out.close();
        }
            

	}
	
	public static void gerarRelatorioPropostas(Connection conexao, String dtInicio, String dtFim, String situacao, String codVendedor) throws JRException{
    	String nomeRelatorioPropostas = "relatorioPropostas.jasper";
        
        File arquivoAux = new File(nomeRelatorioPropostas);
        String caminhoProjeto = System.getProperty("user.dir");
        String nomeArquivoSaida = caminhoProjeto + "/" + "propostas.pdf";
        
        arquivoAux = new File(arquivoAux.getClass().getResource("/").getPath() + "relatorios/" + nomeRelatorioPropostas);
//        System.out.println(arquivoAux.exists());
        
        Map<String, String> parametros = new HashMap<String, String>(); 
        parametros = montarParametrosRelatorioPropostas(dtInicio, dtFim, situacao, codVendedor);

        JasperPrint jp = JasperFillManager.fillReport(arquivoAux.getClass().getResource("/").getPath() + "/relatorios/" + nomeRelatorioPropostas , parametros, conexao);            
//        JasperExportManager.exportReportToPdfFile(jp, nomeArquivoSaida);
        
        JasperViewer jrv = new JasperViewer(jp);
        jrv.setVisible(true);
        
        System.out.println("Relatório Gerado com Sucesso em: " + nomeArquivoSaida);
	}
	
	public static HashMap<String, String> montarParametrosRelatorioPropostas(String dtInicio, String dtFim, String situacao, String codVendedor){
		String caminhoArquivoImgCidadeGarapu = "";
		String caminhoArquivoImgLogoSisa = "";
		String nomeImgCidadeGarapu = "cidade garapu.jpg";
		String nomeImgLogoSisa = "logo sisa.jpg";
		
		File arquivoAux = null;
		arquivoAux = new File(nomeImgCidadeGarapu);
		caminhoArquivoImgCidadeGarapu = arquivoAux.getClass().getResource("/").getPath() + "relatorios/imagens/" + nomeImgCidadeGarapu;
//		arquivoAux = new File(caminhoArquivoImgCidadeGarapu);
//		System.out.println(arquivoAux.exists());
		
		arquivoAux = new File(nomeImgLogoSisa);
		caminhoArquivoImgLogoSisa = arquivoAux.getClass().getResource("/").getPath() + "relatorios/imagens/" + nomeImgLogoSisa;
//		arquivoAux = new File(caminhoArquivoImgCidadeGarapu);
//		System.out.println(arquivoAux.exists());

		// Nome dos parãmetros
		String paramDataInicio = "DATA_INICIO";
		String paramDataFim = "DATA_FIM";
		String paramSituacao = "SITUACAO";
		String paramCodigoVendedor = "CODIGO_VENDEDOR";
		String paramImgCidadeGarapu = "CAMINHO_JASPER_CID_GARAPU";
		String paramImgLogo = "CAMINHO_JASPER_SISA";
		
        HashMap<String, String> parametros = new HashMap<String, String>(6);
        parametros.put(paramDataInicio, dtInicio);
        parametros.put(paramDataFim, dtFim);
        parametros.put(paramSituacao, situacao);
        parametros.put(paramCodigoVendedor, codVendedor);
        parametros.put(paramImgCidadeGarapu, caminhoArquivoImgCidadeGarapu);
        parametros.put(paramImgLogo, caminhoArquivoImgLogoSisa);
        
        return parametros;
	}
	
	public static void gerarRelatorioPropostasEspecifico(Connection conexao, String numeroProposta) throws JRException{
    	String nomeRelatorioPropostasEspecifico = "relatorioPropostaEspecifico.jasper";
       
        File arquivoAux = new File(nomeRelatorioPropostasEspecifico);
        String caminhoProjeto = System.getProperty("user.dir");
        String nomeArquivoSaida = caminhoProjeto + "/" + "propostasEmModeloEspecifico.pdf";

        arquivoAux = new File(arquivoAux.getClass().getResource("/").getPath() + "relatorios/" + nomeRelatorioPropostasEspecifico);
//        System.out.println(arquivoAux.exists());
        
        Map<String, String> parametros = new HashMap<String, String>(); 
        parametros = montarParametrosRelatorioPropostasEspecifico(numeroProposta);

        JasperPrint jp = JasperFillManager.fillReport(arquivoAux.getClass().getResource("/").getPath() + "/relatorios/" + nomeRelatorioPropostasEspecifico , parametros, conexao);            
//        JasperExportManager.exportReportToPdfFile(jp, nomeArquivoSaida);
        
        JasperViewer jrv = new JasperViewer(jp);
        jrv.setVisible(true);
        
        System.out.println("Relatório Gerado com Sucesso em: " + nomeArquivoSaida);
	}
	
	public static HashMap<String, String> montarParametrosRelatorioPropostasEspecifico(String numeroProposta){
		String caminhoArquivoImgCidadeGarapu = "";
		String caminhoArquivoImgLogoSisa = "";
		String nomeImgCidadeGarapu = "cidade garapu.jpg";
		String nomeImgLogoSisa = "logo sisa.jpg";
		
		File arquivoAux = null;
		arquivoAux = new File(nomeImgCidadeGarapu);
		caminhoArquivoImgCidadeGarapu = arquivoAux.getClass().getResource("/").getPath() + "relatorios/imagens/" + nomeImgCidadeGarapu;
//		arquivoAux = new File(caminhoArquivoImgCidadeGarapu);
//		System.out.println(arquivoAux.exists());
		
		arquivoAux = new File(nomeImgLogoSisa);
		caminhoArquivoImgLogoSisa = arquivoAux.getClass().getResource("/").getPath() + "relatorios/imagens/" + nomeImgLogoSisa;
//		arquivoAux = new File(caminhoArquivoImgCidadeGarapu);
//		System.out.println(arquivoAux.exists());

		// Nome dos parãmetros
		String paramNumeroProposta = "NUMERO_PROPOSTA";
		String paramImgCidadeGarapu = "CAMINHO_JASPER_CID_GARAPU";
		String paramImgLogo = "CAMINHO_JASPER_SISA";
		
        HashMap<String, String> parametros = new HashMap<String, String>(6);
        parametros.put(paramNumeroProposta, numeroProposta);
        parametros.put(paramImgCidadeGarapu, caminhoArquivoImgCidadeGarapu);
        parametros.put(paramImgLogo, caminhoArquivoImgLogoSisa);
        
        return parametros;
	}

}
