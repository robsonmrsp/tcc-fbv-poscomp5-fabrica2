package sisa.com.br.dominio;

import java.util.ArrayList;


public enum DominioTipoSexo {

	MASCULINO("M"), FEMININO("F");

	private String codigo;


	DominioTipoSexo(String codigo) {
		this.codigo = codigo;
	}

	public static String getDescricao(String valor) {
		if (valor.equals(MASCULINO.getCodigo())) {
			return "MASCULINO";
		} else if (valor.equals(FEMININO.getCodigo())) {
			return "FEMININO";
		} else {
			return "";
		}
	}

	public String getCodigo() {
		return this.codigo;
	}
	
	public ArrayList<String> getListaSexo(){
		
		ArrayList<String> tiposSexo = new ArrayList<String>();
		tiposSexo.add(getDescricao(DominioTipoSexo.MASCULINO.getCodigo()));
		tiposSexo.add(getDescricao(DominioTipoSexo.FEMININO.getCodigo()));
		
		return tiposSexo;
		
	}

}
