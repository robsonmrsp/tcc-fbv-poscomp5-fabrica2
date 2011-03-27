package sisa.com.br.entidade;

import java.util.Date;

public class ParcelaSinal {
	
	private int id;
	private Proposta proposta;
	private int parcela;
	private String tipoPagto;
	private String numeroDocumento;
	private double valor;
	private Date dataVencimento;
	
	public ParcelaSinal(){
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getTipoPagto() {
		return tipoPagto;
	}

	public void setTipoPagto(String tipoPagto) {
		this.tipoPagto = tipoPagto;
	}

	public String getNumeroDocumento() {
		return numeroDocumento;
	}

	public void setNumeroDocumento(String numeroDocumento) {
		this.numeroDocumento = numeroDocumento;
	}

	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}

	public Date getDataVencimento() {
		return dataVencimento;
	}

	public void setDataVencimento(Date dataVencimento) {
		this.dataVencimento = dataVencimento;
	}
	
}
