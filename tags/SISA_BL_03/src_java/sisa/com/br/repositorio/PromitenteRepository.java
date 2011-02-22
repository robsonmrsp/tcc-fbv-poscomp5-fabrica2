package sisa.com.br.repositorio;

import java.util.List;

import sisa.com.br.entidade.Promitente;;

public interface PromitenteRepository {

	Promitente save(Promitente promitente) throws Exception;
	Promitente findById(String id) throws Exception;
	List<Promitente> getList() throws Exception;
	List<Promitente> consultaPromitente(Promitente promitente)throws Exception;
	void remove(Promitente promitente) throws Exception;

}
