package sisa.com.br.entidade;

import java.util.Date;

public class ParcelaSinal {

	private ParcelaSinalPK parcelaSinalPK;
	private String tipoPagto;
	private String numeroDocumento;
	private double valor;
	private Date dataVencimento;
	
	public ParcelaSinal(){
	}
	
	public ParcelaSinal(ParcelaSinalPK pk)
	{
		this.parcelaSinalPK = pk;
	}

	public ParcelaSinalPK getParcelaSinalPK() {
		return parcelaSinalPK;
	}

	public void setParcelaSinalPK(ParcelaSinalPK parcelaSinalPK) {
		this.parcelaSinalPK = parcelaSinalPK;
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
