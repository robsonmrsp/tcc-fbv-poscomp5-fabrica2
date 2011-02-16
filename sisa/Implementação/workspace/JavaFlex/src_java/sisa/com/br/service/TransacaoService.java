package sisa.com.br.service;

import java.util.List;

import sisa.com.br.entidade.Transacao;

public interface TransacaoService {

	
	Transacao save(Transacao transacao) throws Exception;
	Transacao findById(Transacao transacao) throws Exception;
	List<Transacao> getList() throws Exception;
	List<Transacao> consultaTransacao(Transacao transacao)throws Exception;
	void remove(Transacao transacao) throws Exception;
}
