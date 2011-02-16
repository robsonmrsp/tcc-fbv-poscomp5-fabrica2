package sisa.com.br.service;

import sisa.com.br.entidade.Usuario;


public interface controleSessaoService {
	
	void destruirSessao(Usuario usuarioLogado);
}
