package sisa.com.br.entidade;

import java.util.HashSet;
import java.util.Set;

public class Perfil {
 
	private int Id_Perfil;
	
	private String descricao;
	
	private Set<Transacao> listaTransacao = new HashSet<Transacao>();

	public Perfil(){
		
	}

	public Perfil(int Id_Perfil, String descricao) {
		super();
		this.Id_Perfil = Id_Perfil;
		this.descricao = descricao;
	}
	
	public Perfil(int Id_Perfil, String descricao, Set<Transacao> listaTransacao) {
		this(Id_Perfil,descricao);
		this.listaTransacao = listaTransacao;
	}

	public int getId() {
		return Id_Perfil;
	}

	public Set<Transacao> getListaTransacao() {
		return listaTransacao;
	}

	public void setListaTransacao(Set<Transacao> listaTransacao) {
		this.listaTransacao = listaTransacao;
	}

	public void setId(int Id_Perfil) {
		this.Id_Perfil = Id_Perfil;
	}
	
	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public String toString(){
		return descricao;
	}
	 
}
 
