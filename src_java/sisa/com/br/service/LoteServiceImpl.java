package sisa.com.br.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import flex.messaging.io.ArrayList;

import sisa.com.br.entidade.Lote;
import sisa.com.br.entidade.Transacao;
import sisa.com.br.repositorio.LoteRepository;

@Service(value = "loteService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class LoteServiceImpl implements LoteService {

	private LoteRepository loteRepository;

	@Autowired
	public void setLoteRepository(LoteRepository loteRepository) {
		this.loteRepository = loteRepository;
	}

	public Lote save(Lote lote) throws Exception {
		try {
//			Set<Transacao> transacao = lote.getListaTransacao();
//			lote.setListaTransacao(new HashSet<Transacao>());
//			lote = this.loteRepository.save(lote);
//			lote.setListaTransacao(transacao);
			this.loteRepository.save(lote);
			return lote;
		} catch (Exception e) {
			throw new Exception("Não foi possível salvar. " + e.getCause());
		}
	}

	public Lote findById(Lote lote) throws Exception {
		try {
			return this.loteRepository.findById(lote);
		} catch (Exception e) {
			throw new Exception("Não foi possível procurar pelo número."
					+ e.getMessage());
		}
	}

	public List<Lote> getList() throws Exception {
		try {
			return this.loteRepository.getList();
		} catch (Exception e) {
			throw new Exception("Não foi possível listar. " + e.getMessage());
		}
	}

	public void remove(Lote lote) throws Exception {
		try {
			this.loteRepository.remove(lote);
		} catch (Exception e) {
			throw new Exception("Não foi possível excluir. " + e.getMessage());
		}

	}

	public List<Lote> consultaLote(Lote lote) throws Exception {

		try {
			return this.loteRepository.consultaLote(lote);
		} catch (Exception e) {
			throw new Exception("Não foi possível localizar. " + e.getMessage());
		}
	}

}
