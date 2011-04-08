package sisa.com.br.dominio;

import java.util.ArrayList;

public enum DominioSituacaoProposta {
	AGUARDANDO_APROVACAO("P", "Aguardando Aprovação"),
	EM_ABERTO("A", "Em Aberto"),
	LIQUIDADA("L", "Liquidada"),
	CANCELADA("C", "Cancelada");
	
	private String codigo;
	private String descricao;
	
	DominioSituacaoProposta(String codigo, String descricao) {
		this.codigo = codigo;
		this.descricao = descricao;
	}
	
	public String getCodigo(){
		return this.codigo;
	}
	
	public static String getDescricao(String codigo){
		String descricao = "";
		if (codigo.equals(AGUARDANDO_APROVACAO.getCodigo()))
			descricao = AGUARDANDO_APROVACAO.getDescricao();
		else if (codigo.equals(EM_ABERTO.getCodigo()))
			descricao = EM_ABERTO.getDescricao();
		else if (codigo.equals(LIQUIDADA.getCodigo()))
			descricao = LIQUIDADA.getDescricao();
		else if (codigo.equals(CANCELADA.getCodigo()))
			descricao = CANCELADA.getDescricao();
			
		return descricao;
	}
	
	public String getDescricao(){
		return this.descricao;
	}
	
	public static ArrayList<objDominio> getLista(){
		ArrayList<objDominio> situacoesProposta = new ArrayList<objDominio>();
		
		situacoesProposta.add(new objDominio(AGUARDANDO_APROVACAO.getCodigo(), AGUARDANDO_APROVACAO.getDescricao()));
		situacoesProposta.add(new objDominio(EM_ABERTO.getCodigo(), EM_ABERTO.getDescricao()));
		situacoesProposta.add(new objDominio(LIQUIDADA.getCodigo(), LIQUIDADA.getDescricao()));
		situacoesProposta.add(new objDominio(CANCELADA.getCodigo(), CANCELADA.getDescricao()));
		
		return situacoesProposta;
	}
}
