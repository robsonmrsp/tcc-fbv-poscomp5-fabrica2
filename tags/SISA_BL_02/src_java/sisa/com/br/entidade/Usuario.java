package sisa.com.br.entidade;

import java.util.HashSet;
import java.util.Set;

public class Usuario {
 
	private int id;
	
	private String login;
	 
	private String senha;
	 
	private String nome;
	
	private Set<Perfil> listaPerfil = new HashSet<Perfil>();
	
	public Usuario(int id, String login, String senha, String nome) {
		super();
		this.id = id;
		this.login = login;
		this.senha = senha;
		this.nome = nome;
	}
	
	public Usuario(int id, String login, String senha, String nome, Set<Perfil> listaPerfil) {
		this(id,login,senha,nome);
		this.listaPerfil = listaPerfil;
	}
	
	public Set<Perfil> getListaPerfil() {
		return listaPerfil;
	}

	public void setListaPerfil(Set<Perfil> listaPerfil) {
		this.listaPerfil = listaPerfil;
	}

	public Usuario(){
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}	
	 
}
 
