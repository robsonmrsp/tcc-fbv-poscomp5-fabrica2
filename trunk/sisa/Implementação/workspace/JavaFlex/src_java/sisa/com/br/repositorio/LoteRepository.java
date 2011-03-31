package sisa.com.br.repositorio;

import java.util.List;

import sisa.com.br.entidade.Lote;


public interface LoteRepository {
	Lote consultaLote(String nu_lote,String nu_lotm,String nu_quadra) throws Exception;
	Lote save(Lote lote) throws Exception;
    Lote update(Lote lote) throws Exception;
	Lote findById(Lote lote) throws Exception;
	List<Lote> getList() throws Exception;
	List<Lote> consultaLote(Lote lote)throws Exception;
	void remove(Lote lote) throws Exception;
}
