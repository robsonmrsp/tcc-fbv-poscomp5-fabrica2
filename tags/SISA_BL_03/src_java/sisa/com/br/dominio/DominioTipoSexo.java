package sisa.com.br.dominio;

import java.util.ArrayList;


public enum DominioTipoSexo {

	MASCULINO("M", "Masculino"), FEMININO("F", "Feminino");

	private String codigo;
	private String descricao;

	DominioTipoSexo(String codigo, String descricao) {
		this.codigo = codigo;
		this.descricao = descricao;
	}

	public String getDescricao() {
		return this.descricao;
	}
	
	public static String getDescricao(String codigo){
		String descricao = "";
		if (codigo.equals(MASCULINO.getCodigo()))
			descricao = MASCULINO.getDescricao();
		else if (codigo.equals(FEMININO.getCodigo()))
			descricao = FEMININO.getDescricao();
			
		return descricao;
	}

	public String getCodigo() {
		return this.codigo;
	}
	
	public static ArrayList<objDominio> getListaSexo(){
		
		ArrayList<objDominio> tiposSexo = new ArrayList<objDominio>();
		tiposSexo.add(new objDominio(MASCULINO.getCodigo(), MASCULINO.getDescricao()));
		tiposSexo.add(new objDominio(FEMININO.getCodigo(), FEMININO.getDescricao()));
		
		return tiposSexo;
		
	}

}
