package sisa.com.br.repositorio;

import java.util.List;

import sisa.com.br.entidade.Transacao;

public interface TransacaoRepository {
	
	Transacao save(Transacao transacao) throws Exception;
	Transacao findById(Transacao transacao) throws Exception;
	List<Transacao> getList() throws Exception;
	List<Transacao> consultaTransacao(Transacao transacao)throws Exception;
	void remove(Transacao transacao) throws Exception;
	List<Transacao> getListMenu(int id) throws Exception;
}
