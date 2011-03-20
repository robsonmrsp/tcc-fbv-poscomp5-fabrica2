package sisa.com.br.entidade;


public class Transacao {
 
	private int Id_Transacao;
	
	private String Titulo;
	
	private String Nome;
	
	private String Url;
	
	private int Ordem;
	
	private String ativa;
	
	private int idPai;


	public Transacao(){
		
	}
	
	public Transacao(int Id_Transacao, String Titulo, String Nome, String Url, int Ordem, String ativa, int idPai) {
		super();
		this.Id_Transacao = Id_Transacao;
		this.Titulo = Titulo;
		this.Nome = Nome;
		this.Url = Url;
		this.Ordem = Ordem;
		this.ativa = ativa;
		this.idPai = idPai;
	}
	
	public Transacao(int Id_Transacao, String Nome, int idPai) {
		super();
		this.Id_Transacao = Id_Transacao;
		this.Nome = Nome;
		this.idPai = idPai;
	}
	
	public Transacao(int id) {
		super();
		this.Id_Transacao = id;
	}

	public int getId() {
		return Id_Transacao;
	}


	public void setId(int Id_Transacao) {
		this.Id_Transacao = Id_Transacao;
	}


	public String getTitulo() {
		return Titulo;
	}


	public void setTitulo(String titulo) {
		Titulo = titulo;
	}

	public String getNome() {
		return Nome;
	}


	public void setNome(String nome) {
		Nome = nome;
	}
	
	public int getidPai() {
		return idPai;
	}

	public void setidPai(int idPai) {
		this.idPai = idPai;
	}

	public String getUrl() {
		return Url;
	}


	public void setUrl(String url) {
		Url = url;
	}


	public int getOrdem() {
		return Ordem;
	}


	public void setOrdem(int ordem) {
		Ordem = ordem;
	}


	public String getAtiva() {
		return ativa;
	}


	public void setAtiva(String ativa) {
		this.ativa = ativa;
	}
	
	public String toString(){
		return Nome;
	}
	
}
 
