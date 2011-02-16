package sisa.com.br.entidade;

public class Lote {

	private String numero;

	private String quadra;

	private String confFrente;

	private String confFundo;

	private String confDireita;

	private String confEsquerda;

	private double area;

	private double distanciaParaEsquina;

	private String dimensaoFrente;

	private String dimensaoFundo;

	private String dimensaoDireita;

	private String dimensaoEsquerda;

	private double valorM2;

	public Lote() {
	}

	public Lote(String numero, String quadra, String confFrente,
			String confFundo, String confDireita, String confEsquerda,
			double area, double distanciaParaEsquina, String dimensaoFrente,
			String dimensaoFundo, String dimensaoDireita,
			String dimensaoEsquerda, double valorM2) {
		super();
		this.numero = numero;
		this.quadra = quadra;
		this.confFrente = confFrente;
		this.confFundo = confFundo;
		this.confDireita = confDireita;
		this.confEsquerda = confEsquerda;
		this.area = area;
		this.distanciaParaEsquina = distanciaParaEsquina;
		this.dimensaoFrente = dimensaoFrente;
		this.dimensaoFundo = dimensaoFundo;
		this.dimensaoDireita = dimensaoDireita;
		this.dimensaoEsquerda = dimensaoEsquerda;
		this.valorM2 = valorM2;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getQuadra() {
		return quadra;
	}

	public void setQuadra(String quadra) {
		this.quadra = quadra;
	}

	public String getConfFrente() {
		return confFrente;
	}

	public void setConfFrente(String confFrente) {
		this.confFrente = confFrente;
	}

	public String getConfFundo() {
		return confFundo;
	}

	public void setConfFundo(String confFundo) {
		this.confFundo = confFundo;
	}

	public String getConfDireita() {
		return confDireita;
	}

	public void setConfDireita(String confDireita) {
		this.confDireita = confDireita;
	}

	public String getConfEsquerda() {
		return confEsquerda;
	}

	public void setConfEsquerda(String confEsquerda) {
		this.confEsquerda = confEsquerda;
	}

	public double getArea() {
		return area;
	}

	public void setArea(double area) {
		this.area = area;
	}

	public double getDistanciaParaEsquina() {
		return distanciaParaEsquina;
	}

	public void setDistanciaParaEsquina(double distanciaParaEsquina) {
		this.distanciaParaEsquina = distanciaParaEsquina;
	}

	public String getDimensaoFrente() {
		return dimensaoFrente;
	}

	public void setDimensaoFrente(String dimensaoFrente) {
		this.dimensaoFrente = dimensaoFrente;
	}

	public String getDimensaoFundo() {
		return dimensaoFundo;
	}

	public void setDimensaoFundo(String dimensaoFundo) {
		this.dimensaoFundo = dimensaoFundo;
	}

	public String getDimensaoDireita() {
		return dimensaoDireita;
	}

	public void setDimensaoDireita(String dimensaoDireita) {
		this.dimensaoDireita = dimensaoDireita;
	}

	public String getDimensaoEsquerda() {
		return dimensaoEsquerda;
	}

	public void setDimensaoEsquerda(String dimensaoEsquerda) {
		this.dimensaoEsquerda = dimensaoEsquerda;
	}

	public double getValorM2() {
		return valorM2;
	}

	public void setValorM2(double valorM2) {
		this.valorM2 = valorM2;
	}

}
