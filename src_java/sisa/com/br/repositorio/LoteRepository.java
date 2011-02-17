package sisa.com.br.repositorio;

import java.util.List;

import sisa.com.br.entidade.Lote;

public interface LoteRepository {

	Lote save(Lote perfil) throws Exception;

	Lote findById(Lote perfil) throws Exception;

	List<Lote> getList() throws Exception;

	List<Lote> consultaLote(Lote perfil) throws Exception;

	void remove(Lote perfil) throws Exception;
}
