package sisa.com.br.service;

import java.util.List;

import sisa.com.br.entidade.Perfil;

public interface PerfilService {

	
	Perfil save(Perfil perfil) throws Exception;
	Perfil findById(Perfil perfil) throws Exception;
	List<Perfil> getList() throws Exception;
	List<Perfil> consultaPerfil(Perfil perfil)throws Exception;
	void remove(Perfil perfil) throws Exception;
}
