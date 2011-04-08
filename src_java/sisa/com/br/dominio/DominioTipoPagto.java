package sisa.com.br.dominio;

import java.util.ArrayList;

public enum DominioTipoPagto  
{
	BOLETO("B", "Boleto"),
	ESPECIE("E", "Espécie"),
	CHEQUE("C", "Cheque"),
	CREDITO_RENEGOCIADO("R", "Crédito Renegociado");
	
	private String codigo;
	private String descricao;
	
	DominioTipoPagto(String codigo, String descricao){
		this.codigo = codigo;
		this.descricao = descricao;
	}
	
	public String getCodigo(){
		return this.codigo;
	}
	
	public static String getDescricao(String codigo){
		String descricao = "";
		if (codigo.equals(BOLETO.getCodigo()))
			descricao = BOLETO.getDescricao();
		else if (codigo.equals(ESPECIE.getCodigo()))
			descricao = ESPECIE.getDescricao();
		else if (codigo.equals(CHEQUE.getCodigo()))
			descricao = CHEQUE.getDescricao();
		else if (codigo.equals(CREDITO_RENEGOCIADO.getCodigo()))
			descricao = CREDITO_RENEGOCIADO.getDescricao();
			
		return descricao;
	}
	
	public String getDescricao(){
		return this.descricao;
	}
	
	public static ArrayList<objDominio> getLista(){
		ArrayList<objDominio> tiposPagto = new ArrayList<objDominio>();
		
		tiposPagto.add(new objDominio(BOLETO.getCodigo(), BOLETO.getDescricao()));
		tiposPagto.add(new objDominio(ESPECIE.getCodigo(), ESPECIE.getDescricao()));
		tiposPagto.add(new objDominio(CHEQUE.getCodigo(), CHEQUE.getDescricao()));
		tiposPagto.add(new objDominio(CREDITO_RENEGOCIADO.getCodigo(), CREDITO_RENEGOCIADO.getDescricao()));
		
		return tiposPagto;
	}
}
