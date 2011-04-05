package sisa.com.br.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import sisa.com.br.entidade.Transacao;
import sisa.com.br.repositorio.TransacaoRepository;


@Service(value="transacaoService")
@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class TransacaoServiceImpl implements TransacaoService {
	
	
	private TransacaoRepository transacaoRepository;

	@Autowired
	public void setTransacaoRepository(TransacaoRepository transacaoRepository) {
		this.transacaoRepository = transacaoRepository;
	}

	public Transacao save(Transacao transacao) throws Exception {
		try {
			
			this.transacaoRepository.save(transacao);
			return transacao;
		} catch (Exception e) {
			throw new Exception("Não foi possível salvar." +e.getCause());
		}
	}

	public Transacao findById(Transacao transacao) throws Exception {
		try {	
			return this.transacaoRepository.findById(transacao);
		} catch (Exception e) {
			throw new Exception("Não foi possível procurar pela ID."+e.getMessage());
		}
	}

	public List<Transacao> getList() throws Exception {
		try {	
			return this.transacaoRepository.getList();
		} catch (Exception e) {
			throw new Exception("Não foi possível listar."+e.getMessage());
		}
	}

	public void remove(Transacao transacao) throws Exception {
		try {	
			this.transacaoRepository.remove(transacao);
		} catch (Exception e) {
			throw new Exception("Não foi possível excluir." +e.getMessage());
		}
		
	}

	public List<Transacao> consultaTransacao(Transacao transacao) throws Exception {
				
		try {	
			return this.transacaoRepository.consultaTransacao(transacao);
		} catch (Exception e) {
			throw new Exception("Não foi possível localizar." +e.getMessage());
		}
	}
	
	public List<Transacao> getListMenu(int id) throws Exception{
		List<Transacao> lista = null;
		try {	
			lista =this.transacaoRepository.getListMenu(id);
			
			return lista;
		} catch (Exception e) {
			throw new Exception("Não foi possível localizar." +e.getMessage());
		}
	}

}
