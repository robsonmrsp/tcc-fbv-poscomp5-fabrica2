package sisa.com.br.repositorio;

import java.util.List;

import sisa.com.br.entidade.Financiamento;

public interface FinanciamentoRepository {
	Financiamento findById(int id) throws Exception;
	List<Financiamento> getList() throws Exception;
}
