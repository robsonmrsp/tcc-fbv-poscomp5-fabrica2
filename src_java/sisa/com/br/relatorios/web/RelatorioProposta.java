package sisa.com.br.relatorios.web;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class RelatorioProposta extends InformacoesRelatorio {
	
	private static String identificacao = DIR_JASPERS + "relatorioPropostas.jasper";
	private static String caminhoImgRel = "";
//	private static String identificacao = "H:/workspace_sisa/JavaFlex/resources/relatorios/relatorioPropostas.jasper";
	
	public RelatorioProposta(String dtInicio, String dtFim, String situacao, String codVendedor) {
		super(identificacao, "propostas.pdf");
        Map<String, Object> parametros = new HashMap<String, Object>(); 
        parametros = montarParametrosRelatorioPropostas(dtInicio, dtFim, situacao, codVendedor);
        this.setMapaParametros(parametros);
	}
	
	public RelatorioProposta(String caminhoRel, String dtInicio, String dtFim, String situacao, String codVendedor) {
		super(caminhoRel + identificacao, "propostas.pdf");
		caminhoImgRel = caminhoRel + DIR_JASPERS + "imagens/";
        Map<String, Object> parametros = new HashMap<String, Object>(); 
        parametros = montarParametrosRelatorioPropostas(dtInicio, dtFim, situacao, codVendedor);
        this.setMapaParametros(parametros);
	}
	
	private HashMap<String, Object> montarParametrosRelatorioPropostas(String dtInicio, String dtFim, String situacao, String codVendedor){
		String caminhoArquivoImgCidadeGarapu = "";
		String caminhoArquivoImgLogoSisa = "";
		
		File arquivoAux = null;
		arquivoAux = new File(nomeImgCidadeGarapu);
		
//		caminhoArquivoImgCidadeGarapu = arquivoAux.getClass().getResource("/").getPath() + nomeImgCidadeGarapu;
//		caminhoArquivoImgCidadeGarapu = "H:/workspace_sisa/JavaFlex/build/classes/relatorios/imagens/cidade_garapu.jpg";
		caminhoArquivoImgCidadeGarapu = caminhoImgRel + "cidade_garapu.jpg";
//		caminhoArquivoImgCidadeGarapu = this.getServletContext().getContextPath() + nomeImgCidadeGarapu;
//		arquivoAux = new File(caminhoArquivoImgCidadeGarapu);
//		System.out.println(arquivoAux.exists());
		
		arquivoAux = new File(nomeImgLogoSisa);
//		caminhoArquivoImgLogoSisa = arquivoAux.getClass().getResource("/").getPath() + nomeImgLogoSisa;
//		caminhoArquivoImgLogoSisa ="H:/workspace_sisa/JavaFlex/build/classes/relatorios/imagens/logo_sisa.jpg";
		caminhoArquivoImgLogoSisa = caminhoImgRel + "logo_sisa.jpg";
//		caminhoArquivoImgLogoSisa = this.getServletContext().getContextPath() + nomeImgLogoSisa;
//		arquivoAux = new File(caminhoArquivoImgCidadeGarapu);
//		System.out.println(arquivoAux.exists());

		// Nome dos parãmetros
		String paramDataInicio = "DATA_INICIO";
		String paramDataFim = "DATA_FIM";
		String paramSituacao = "SITUACAO";
		String paramCodigoVendedor = "CODIGO_VENDEDOR";
		String paramImgCidadeGarapu = "CAMINHO_JASPER_CID_GARAPU";
		String paramImgLogo = "CAMINHO_JASPER_SISA";
		
        HashMap<String, Object> parametros = new HashMap<String, Object>(6);
        parametros.put(paramDataInicio, formatarData(dtInicio));
        parametros.put(paramDataFim, formatarData(dtFim));
        parametros.put(paramSituacao, situacao);
        parametros.put(paramCodigoVendedor, codVendedor);
        parametros.put(paramImgCidadeGarapu, caminhoArquivoImgCidadeGarapu);
        parametros.put(paramImgLogo, caminhoArquivoImgLogoSisa);
        
        return parametros;
	}
	
	private String formatarData(String pData){
		String retorno = pData;
		if (pData != null && pData != "" && pData.contains("/")){
			String[] arrayAux = pData.split("/", 3);
			retorno = arrayAux[2] + "-" + arrayAux[1] + "-" + arrayAux[0];
		}
		return retorno;
	}

}
