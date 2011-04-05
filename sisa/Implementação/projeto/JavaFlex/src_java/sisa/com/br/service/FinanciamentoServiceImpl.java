package sisa.com.br.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import sisa.com.br.entidade.Financiamento;
import sisa.com.br.repositorio.FinanciamentoRepository;

@Service(value="financiamentoService")
@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class FinanciamentoServiceImpl implements FinanciamentoService {

	private FinanciamentoRepository financiamentoRepository;

	@Autowired
	public void setFinanciamentoRepository(FinanciamentoRepository financiamentoRepository) {
		this.financiamentoRepository = financiamentoRepository;
	}

	@Override
	public Financiamento findById(int id) throws Exception {
		try {
			return this.financiamentoRepository.findById(id);
		} catch (Exception e) {
			throw new Exception("Não foi possível localizar pela : " + e.getMessage());
		}
	}

	@Override
	public List<Financiamento> getList() throws Exception {
		try{
			return financiamentoRepository.getList();
		} catch (Exception e) {
			throw new Exception("Não foi possível listar os Financiamentos: " + e.getMessage());
		}
	}

}
