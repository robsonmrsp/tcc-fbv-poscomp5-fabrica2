package sisa.com.br.relatorios.web;

import java.util.HashMap;
import java.util.Map;

public class RBoleto extends InformacoesRelatorio {
	
	private static String identificacao = DIR_JASPERS + "Boleto.jasper";
	private static String caminhoImgRel = "";
	
	public RBoleto(String caminhoRel, String cdProposta) {
		super(caminhoRel + identificacao, "boleto.pdf");
		caminhoImgRel = caminhoRel + DIR_JASPERS + "imagens/";
        Map<String, Object> parametros = new HashMap<String, Object>(); 
        parametros = montarParametrosRelatorioPropostas(cdProposta);
        this.setMapaParametros(parametros);
	}
	
	private HashMap<String, Object> montarParametrosRelatorioPropostas(String cdProposta){
		String caminhoArquivoImgLogoItau = "";
		caminhoArquivoImgLogoItau = caminhoImgRel + "logo-itau.jpg";
		// Nome dos parãmetros
		String paramNrBoleto = "P_NR_BOLETO";
		String paramNrParcelaBoleto = "P_NR_PARCELA_BOLETO";
		String paramDtVenc = "P_DT_VENCIMENTO";
		String paramVlBoleto = "P_VL_BOLETO";
		String paramNmSacado = "P_NM_SACADO";
		String paramImgLogo = "CAMINHO_JASPER_LOGO_ITAU";
		String paramNrProposta = "P_NR_PROPOSTA";
		
        HashMap<String, Object> parametros = new HashMap<String, Object>(6);
        parametros.put(paramNrBoleto, "123");
        parametros.put(paramNrParcelaBoleto, "01");
        parametros.put(paramDtVenc, "31/03/2011");
        parametros.put(paramVlBoleto, "12365.98");
        parametros.put(paramNrProposta, cdProposta);
        parametros.put(paramImgLogo, caminhoArquivoImgLogoItau);
        
        return parametros;
	}
}
