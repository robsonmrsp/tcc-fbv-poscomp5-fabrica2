package sisa.com.br.entidade;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Proposta {

	private String numero; 
	private Promitente promitente; 
	private double valorVista; 
	private double valorSinal; 
	private Financiamento financiamento; 
	private String observacao; 
	private String situacao; 
	private Vendedor vendedor; 
	private Date dataEmissao; 
	private Date dataPrimeiraParcela; 
	private double valorParcela; 
	private String pagamentoVista;  //S: Sim - N: Não
	private Loteamento loteamento;
	private Set<Lote> lotes = new HashSet<Lote>();
	private Set<ParcelaSinal> parcelasSinal = new HashSet<ParcelaSinal>();
	
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public Promitente getPromitente() {
		return promitente;
	}
	public void setPromitente(Promitente promitente) {
		this.promitente = promitente;
	}
	public double getValorVista() {
		return valorVista;
	}
	public void setValorVista(double valorVista) {
		this.valorVista = valorVista;
	}
	public double getValorSinal() {
		return valorSinal;
	}
	public void setValorSinal(double valorSinal) {
		this.valorSinal = valorSinal;
	}
	public Financiamento getFinanciamento() {
		return financiamento;
	}
	public void setFinanciamento(Financiamento financiamento) {
		this.financiamento = financiamento;
	}
	public String getObservacao() {
		return observacao;
	}
	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
	public String getSituacao() {
		return situacao;
	}
	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}
	
	public Vendedor getVendedor() {
		return vendedor;
	}
	public void setVendedor(Vendedor vendedor) {
		this.vendedor = vendedor;
	}
	public Date getDataEmissao() {
		return dataEmissao;
	}
	public void setDataEmissao(Date dataEmissao) {
		this.dataEmissao = dataEmissao;
	}
	public Date getDataPrimeiraParcela() {
		return dataPrimeiraParcela;
	}
	public void setDataPrimeiraParcela(Date dataPrimeiraParcela) {
		this.dataPrimeiraParcela = dataPrimeiraParcela;
	}
	public double getValorParcela() {
		return valorParcela;
	}
	public void setValorParcela(double valorParcela) {
		this.valorParcela = valorParcela;
	}
	public String getPagamentoVista() {
		return pagamentoVista;
	}
	public void setPagamentoVista(String pagamentoVista) {
		this.pagamentoVista = pagamentoVista;
	}
	public Loteamento getLoteamento() {
		return loteamento;
	}
	public void setLoteamento(Loteamento loteamento) {
		this.loteamento = loteamento;
	}
	public Set<Lote> getLotes() {
		return lotes;
	}
	public void setLotes(Set<Lote> lotes) {
		this.lotes = lotes;
	}
	public Set<ParcelaSinal> getParcelasSinal() {
		return parcelasSinal;
	}
	public void setParcelasSinal(Set<ParcelaSinal> parcelasSinal) {
		this.parcelasSinal = parcelasSinal;
	} 		

}
