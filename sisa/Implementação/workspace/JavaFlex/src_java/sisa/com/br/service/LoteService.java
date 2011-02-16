package sisa.com.br.service;

import java.util.List;

import sisa.com.br.entidade.Lote;

public interface LoteService {

	Lote consultaLote(String lote) throws Exception;

	Lote save(Lote lote) throws Exception;

	Lote findById(Lote lote) throws Exception;

	List<Lote> getList() throws Exception;

	List<Lote> consultaLote(Lote lote) throws Exception;

	void remove(Lote lote) throws Exception;

	public void pingSessao();
}
