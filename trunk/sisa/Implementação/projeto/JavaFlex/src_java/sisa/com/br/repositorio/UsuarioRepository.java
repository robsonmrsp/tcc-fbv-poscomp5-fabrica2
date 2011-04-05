package sisa.com.br.repositorio;

import java.util.List;

import sisa.com.br.entidade.Usuario;

public interface UsuarioRepository {

	Usuario consultaUsuario(String usuario, String senha) throws Exception;
	
	Usuario save(Usuario usuario) throws Exception;
	Usuario findById(Usuario usuario) throws Exception;
	List<Usuario> getList() throws Exception;
	List<Usuario> consultaUsuario(Usuario usuario)throws Exception;
	void remove(Usuario usuario) throws Exception;
}
