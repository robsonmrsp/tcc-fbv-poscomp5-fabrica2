package sisa.com.br.dominio;

import java.util.ArrayList;

public enum DominioEstadoCivil {
	SOLTEIRO("S", "Solteiro"),
	CASADO("C", "Casado"),
	SEPARADO("P", "Separado"),
	DESQUITADO("D", "Desquitado"),
	VIUVO("V", "Viuvo");
	
	private String codigo;
	private String descricao;
	
	DominioEstadoCivil(String codigo, String descricao) {
		this.codigo = codigo;
		this.descricao = descricao;
	}
	
	public String getCodigo(){
		return this.codigo;
	}
	
	public static String getDescricao(String codigo){
		String descricao = "";
		if (codigo.equals(SOLTEIRO.getCodigo()))
			descricao = SOLTEIRO.getDescricao();
		else if (codigo.equals(CASADO.getCodigo()))
			descricao = CASADO.getDescricao();
		else if (codigo.equals(SEPARADO.getCodigo()))
			descricao = SEPARADO.getDescricao();
		else if (codigo.equals(DESQUITADO.getCodigo()))
			descricao = DESQUITADO.getDescricao();
		else if (codigo.equals(VIUVO.getCodigo()))
			descricao = VIUVO.getDescricao();
			
		return descricao;
	}
	
	public String getDescricao(){
		return this.descricao;
	}
	
	public static ArrayList<objDominio> getLista(){
		ArrayList<objDominio> estadosCivis = new ArrayList<objDominio>();
		
		estadosCivis.add(new objDominio(SOLTEIRO.getCodigo(), SOLTEIRO.getDescricao()));
		estadosCivis.add(new objDominio(CASADO.getCodigo(), CASADO.getDescricao()));
		estadosCivis.add(new objDominio(SEPARADO.getCodigo(), SEPARADO.getDescricao()));
		estadosCivis.add(new objDominio(DESQUITADO.getCodigo(), DESQUITADO.getDescricao()));
		estadosCivis.add(new objDominio(VIUVO.getCodigo(), VIUVO.getDescricao()));
		
		return estadosCivis;
	}
}
