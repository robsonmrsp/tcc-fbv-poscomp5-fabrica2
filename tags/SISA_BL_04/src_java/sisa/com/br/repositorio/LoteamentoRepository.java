package sisa.com.br.repositorio;

import java.util.List;

import sisa.com.br.entidade.Loteamento;

public interface LoteamentoRepository {
	
	Loteamento consultaLoteamento(String codigo, String nome) throws Exception;
	Loteamento save(Loteamento loteamento) throws Exception;
	Loteamento update(Loteamento loteamento) throws Exception;
	Loteamento findById(Loteamento loteamento) throws Exception;
	List<Loteamento> getList() throws Exception;
	List<Loteamento> consultaLoteamento(Loteamento loteamento)throws Exception;
	void remove(Loteamento loteamento) throws Exception;

}





