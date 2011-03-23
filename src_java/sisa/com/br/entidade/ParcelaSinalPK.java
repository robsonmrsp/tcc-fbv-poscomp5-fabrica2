package sisa.com.br.entidade;

import java.io.Serializable;

public class ParcelaSinalPK implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Proposta proposta;
	private int parcela;
	
	public ParcelaSinalPK()
	{
	}
	
	public Proposta getProposta() {
		return proposta;
	}

	public void setProposta(Proposta proposta) {
		this.proposta = proposta;
	}

	public int getParcela() {
		return parcela;
	}

	public void setParcela(int parcela) {
		this.parcela = parcela;
	}
	
	
}
