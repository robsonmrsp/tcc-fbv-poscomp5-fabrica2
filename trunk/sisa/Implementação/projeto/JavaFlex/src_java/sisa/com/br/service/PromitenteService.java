package sisa.com.br.service;

import java.util.List;

import sisa.com.br.entidade.Promitente;

public interface PromitenteService {
	Promitente save(Promitente promitente) throws Exception;
	Promitente update(Promitente promitente) throws Exception;
	Promitente findById(String id) throws Exception;
	List<Promitente> getList() throws Exception;
	List<Promitente> find(Promitente promitente)throws Exception;
	void remove(Promitente promitente) throws Exception;
}
