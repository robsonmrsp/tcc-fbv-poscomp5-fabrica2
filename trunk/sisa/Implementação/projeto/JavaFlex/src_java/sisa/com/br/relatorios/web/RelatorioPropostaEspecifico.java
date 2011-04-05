package sisa.com.br.relatorios.web;

import java.util.HashMap;
import java.util.Map;

public class RelatorioPropostaEspecifico extends InformacoesRelatorio {
	
	//private static String identificacao = "relatorioPropostaEspecifico.jasper";
	private static String identificacao = DIR_JASPERS + "relatorioPropostaEspecifico.jasper";
	private static String caminhoImgRel = "";
	
	public RelatorioPropostaEspecifico(String numeroProposta) {
		super(identificacao, "propostasEmModeloEspecifico.pdf");
        Map<String, Object> parametros = new HashMap<String, Object>(); 
        parametros = montarParametrosRelatorioPropostas(numeroProposta);
        this.setMapaParametros(parametros);

	}
	
	public RelatorioPropostaEspecifico(String caminhoRel, String numeroProposta) {
		super(caminhoRel + identificacao, "propostasEmModeloEspecifico.pdf");
		caminhoImgRel = caminhoRel + DIR_JASPERS + "imagens/";
        Map<String, Object> parametros = new HashMap<String, Object>(); 
        parametros = montarParametrosRelatorioPropostas(numeroProposta);
        this.setMapaParametros(parametros);

	}
	
	public static HashMap<String, Object> montarParametrosRelatorioPropostas(String numeroProposta){
		String caminhoArquivoImgCidadeGarapu = "";
		String caminhoArquivoImgLogoSisa = "";
		
		caminhoArquivoImgCidadeGarapu = caminhoImgRel + "cidade_garapu.jpg";
		caminhoArquivoImgLogoSisa = caminhoImgRel + "logo_sisa.jpg";

		// Nome dos parãmetros
		String paramImgCidadeGarapu = "CAMINHO_JASPER_CID_GARAPU";
		String paramImgLogo = "CAMINHO_JASPER_SISA";
		String paramNumeroProposta = "NUMERO_PROPOSTA";
       
		HashMap<String, Object> parametros = new HashMap<String, Object>(6);
        parametros.put(paramNumeroProposta, numeroProposta);
        parametros.put(paramImgCidadeGarapu, caminhoArquivoImgCidadeGarapu);
        parametros.put(paramImgLogo, caminhoArquivoImgLogoSisa);
        
        return parametros;
	}

}
