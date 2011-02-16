package sisa.com.br.repositorio;

import java.util.List;

import sisa.com.br.entidade.Perfil;

public interface PerfilRepository {
	
	Perfil save(Perfil perfil) throws Exception;
	Perfil findById(Perfil perfil) throws Exception;
	List<Perfil> getList() throws Exception;
	List<Perfil> consultaPerfil(Perfil perfil)throws Exception;
	void remove(Perfil perfil) throws Exception;
}
