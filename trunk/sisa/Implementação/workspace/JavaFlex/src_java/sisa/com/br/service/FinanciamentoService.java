package sisa.com.br.service;

import java.util.List;

import sisa.com.br.entidade.Financiamento;

public interface FinanciamentoService {
	Financiamento findById(int id) throws Exception;
	List<Financiamento> getList() throws Exception;

}
