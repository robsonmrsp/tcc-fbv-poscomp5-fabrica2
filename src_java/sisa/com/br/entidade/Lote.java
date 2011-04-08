package sisa.com.br.entidade;

import java.math.BigDecimal;

public class Lote {

	private Integer cd_lote;
	private String nu_lotm;
	private String nu_quadra;
	private String nu_lote;
	private String ds_conf_frente;
	private String ds_conf_fundo;
	private String ds_conf_direita;
	private String ds_conf_esquerda;
	private BigDecimal nu_area;
	private BigDecimal nu_dist_esquina;
	private String situacao;
	private String ds_dim_frente;
	private String ds_dim_fundo;
	private String ds_dim_direita;
	private String ds_dim_esquerda;
	private BigDecimal valorm2;

	public Lote() {

	}

	public Lote(Integer pCdLote) {
		this.cd_lote = pCdLote;
	}

	public Integer getCd_lote() {
		return cd_lote;
	}

	public void setCd_lote(Integer cd_lote) {
		this.cd_lote = cd_lote;
	}

	public String getNu_lotm() {
		return nu_lotm;
	}

	public void setNu_lotm(String nu_lotm) {
		this.nu_lotm = nu_lotm;
	}

	public String getNu_quadra() {
		return nu_quadra;
	}

	public void setNu_quadra(String nu_quadra) {
		this.nu_quadra = nu_quadra;
	}

	public String getNu_lote() {
		return nu_lote;
	}

	public void setNu_lote(String nu_lote) {
		this.nu_lote = nu_lote;
	}

	public String getDs_conf_frente() {
		return ds_conf_frente;
	}

	public void setDs_conf_frente(String ds_conf_frente) {
		this.ds_conf_frente = ds_conf_frente;
	}

	public String getDs_conf_fundo() {
		return ds_conf_fundo;
	}

	public void setDs_conf_fundo(String ds_conf_fundo) {
		this.ds_conf_fundo = ds_conf_fundo;
	}

	public String getDs_conf_direita() {
		return ds_conf_direita;
	}

	public void setDs_conf_direita(String ds_conf_direita) {
		this.ds_conf_direita = ds_conf_direita;
	}

	public String getDs_conf_esquerda() {
		return ds_conf_esquerda;
	}

	public void setDs_conf_esquerda(String ds_conf_esquerda) {
		this.ds_conf_esquerda = ds_conf_esquerda;
	}

	public BigDecimal getNu_area() {
		return nu_area;
	}

	public void setNu_area(BigDecimal nu_area) {
		this.nu_area = nu_area;
	}

	public BigDecimal getNu_dist_esquina() {
		return nu_dist_esquina;
	}

	public void setNu_dist_esquina(BigDecimal nu_dist_esquina) {
		this.nu_dist_esquina = nu_dist_esquina;
	}

	public String getSituacao() {
		return situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}

	public String getDs_dim_frente() {
		return ds_dim_frente;
	}

	public void setDs_dim_frente(String ds_dim_frente) {
		this.ds_dim_frente = ds_dim_frente;
	}

	public String getDs_dim_fundo() {
		return ds_dim_fundo;
	}

	public void setDs_dim_fundo(String ds_dim_fundo) {
		this.ds_dim_fundo = ds_dim_fundo;
	}

	public String getDs_dim_direita() {
		return ds_dim_direita;
	}

	public void setDs_dim_direita(String ds_dim_direita) {
		this.ds_dim_direita = ds_dim_direita;
	}

	public String getDs_dim_esquerda() {
		return ds_dim_esquerda;
	}

	public void setDs_dim_esquerda(String ds_dim_esquerda) {
		this.ds_dim_esquerda = ds_dim_esquerda;
	}

	public BigDecimal getValorm2() {
		return valorm2;
	}

	public void setValorm2(BigDecimal valorm2) {
		this.valorm2 = valorm2;
	}

	public Lote(Integer cd_lote, String nu_lotm, String nu_quadra) {
		super();
		this.cd_lote = cd_lote;
		this.nu_lotm = nu_lotm;
		this.nu_quadra = nu_quadra;
	}

}
