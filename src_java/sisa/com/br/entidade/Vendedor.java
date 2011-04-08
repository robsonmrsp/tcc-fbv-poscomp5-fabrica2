package sisa.com.br.entidade;

public class Vendedor {
	
	private String cd_vend;
	private String ds_razao_nome;
	private String nu_fone;
	private String nu_cgc_cpf;
	private String no_fantasia;
	private String situacao;
	private Endereco endereco;
	
	public Vendedor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getCd_vend() {
		return cd_vend;
	}

	public void setCd_vend(String cd_vend) {
		this.cd_vend = cd_vend;
	}

	public String getDs_razao_nome() {
		return ds_razao_nome;
	}

	public void setDs_razao_nome(String ds_razao_nome) {
		this.ds_razao_nome = ds_razao_nome;
	}

	public String getNu_fone() {
		return nu_fone;
	}

	public void setNu_fone(String nu_fone) {
		this.nu_fone = nu_fone;
	}

	public String getNu_cgc_cpf() {
		return nu_cgc_cpf;
	}

	public void setNu_cgc_cpf(String nu_cgc_cpf) {
		this.nu_cgc_cpf = nu_cgc_cpf;
	}

	public String getNo_fantasia() {
		return no_fantasia;
	}

	public void setNo_fantasia(String no_fantasia) {
		this.no_fantasia = no_fantasia;
	}

	public String getSituacao() {
		return situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}
}
