package sisa.com.br.entidade;

import java.util.Date;

public class Promitente {

	private String codigo; 
	private String nome; 
	private String estadoCivil; 
	private String sexo; 
	private String numeroRG; 
	private String orgaoEmissorRG; 
	private Date dataExpedicaoRG; 
	private String cpfCnpj; 
	private Date dataNascimento; 
	private String dependente; 
	private String telefoneResidencial; 
	private Endereco enderecoCobranca; 
	private String telefoneCobranca; 
	private String profissao; 
	private String situacao; 
	private String nacionalidade; 
	private Endereco enderecoResidencial; 
	private String nomeResponsavel; 
	private String cpfCnpjResponsavel;
	
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEstadoCivil() {
		return estadoCivil;
	}
	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public String getNumeroRG() {
		return numeroRG;
	}
	public void setNumeroRG(String numeroRG) {
		this.numeroRG = numeroRG;
	}
	public String getOrgaoEmissorRG() {
		return orgaoEmissorRG;
	}
	public void setOrgaoEmissorRG(String orgaoEmissorRG) {
		this.orgaoEmissorRG = orgaoEmissorRG;
	}
	public Date getDataExpedicaoRG() {
		return dataExpedicaoRG;
	}
	public void setDataExpedicaoRG(Date dataExpedicaoRG) {
		this.dataExpedicaoRG = dataExpedicaoRG;
	}
	public String getCpfCnpj() {
		return cpfCnpj;
	}
	public void setCpfCnpj(String cpfCnpj) {
		this.cpfCnpj = cpfCnpj;
	}
	public Date getDataNascimento() {
		return dataNascimento;
	}
	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}
	public String getDependente() {
		return dependente;
	}
	public void setDependente(String dependente) {
		this.dependente = dependente;
	}
	public String getTelefoneResidencial() {
		return telefoneResidencial;
	}
	public void setTelefoneResidencial(String telefoneResidencial) {
		this.telefoneResidencial = telefoneResidencial;
	}
	public Endereco getEnderecoCobranca() {
		return enderecoCobranca;
	}
	public void setEnderecoCobranca(Endereco enderecoCobranca) {
		this.enderecoCobranca = enderecoCobranca;
	}
	public String getTelefoneCobranca() {
		return telefoneCobranca;
	}
	public void setTelefoneCobranca(String telefoneCobranca) {
		this.telefoneCobranca = telefoneCobranca;
	}
	public String getProfissao() {
		return profissao;
	}
	public void setProfissao(String profissao) {
		this.profissao = profissao;
	}
	public String getSituacao() {
		return situacao;
	}
	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}
	public String getNacionalidade() {
		return nacionalidade;
	}
	public void setNacionalidade(String nacionalidade) {
		this.nacionalidade = nacionalidade;
	}
	public Endereco getEnderecoResidencial() {
		return enderecoResidencial;
	}
	public void setEnderecoResidencial(Endereco enderecoResidencial) {
		this.enderecoResidencial = enderecoResidencial;
	}
	public String getNomeResponsavel() {
		return nomeResponsavel;
	}
	public void setNomeResponsavel(String nomeResponsavel) {
		this.nomeResponsavel = nomeResponsavel;
	}
	public String getCpfCnpjResponsavel() {
		return cpfCnpjResponsavel;
	}
	public void setCpfCnpjResponsavel(String cpfCnpjResponsavel) {
		this.cpfCnpjResponsavel = cpfCnpjResponsavel;
	} 		

	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		
		if (!(obj instanceof Promitente)) return false;
		
		Promitente that = (Promitente)obj;
		
		return (this.codigo.equals(that.codigo));
	}
}
