package sisa.com.br.service;

import java.util.List;

import sisa.com.br.entidade.Proposta;

public interface PropostaService {
	Proposta insert(Proposta proposta) throws Exception;
	Proposta update(Proposta proposta) throws Exception;
	Proposta findById(String id) throws Exception;
	List<Proposta> getList() throws Exception;
	List<Proposta> find(Proposta proposta)throws Exception;
	void remove(Proposta proposta) throws Exception;
	void cancelar(Proposta proposta)  throws Exception;
	void autorizar(Proposta proposta)  throws Exception;
}
