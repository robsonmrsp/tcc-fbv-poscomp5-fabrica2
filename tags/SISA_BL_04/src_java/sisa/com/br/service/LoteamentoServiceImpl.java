package sisa.com.br.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import sisa.com.br.entidade.Lote;
import sisa.com.br.entidade.Loteamento;
import sisa.com.br.repositorio.LoteamentoRepository;


@Service(value="loteamentoService")
@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class LoteamentoServiceImpl implements LoteamentoService {
	
	
	private LoteamentoRepository loteamentoRepository;
	

	@Autowired
	public void setLoteamentoRepository(LoteamentoRepository loteamentoRepository) {
		this.loteamentoRepository = loteamentoRepository;
	}

	public Loteamento save(Loteamento loteamento) throws Exception {
		try {
			
			this.loteamentoRepository.save(loteamento);
			return loteamento;
		} catch (Exception e) {
			throw new Exception("Não foi possível salvar. Verifique se já existe loteamento com esse código");
		}
	}
	public Loteamento update(Loteamento loteamento) throws Exception {
		try {
			
			this.loteamentoRepository.update(loteamento);
			return loteamento;
		} catch (Exception e) {
			throw new Exception("Não foi possível atualizar.");
		}
	}

	public Loteamento findById(Loteamento loteamento) throws Exception {
		try {	
			return this.loteamentoRepository.findById(loteamento);
		} catch (Exception e) {
			throw new Exception("Não foi possível procurar pela ID."+e.getMessage());
		}
	}

	public List<Loteamento> getList() throws Exception {
		try {	
			return this.loteamentoRepository.getList();
		} catch (Exception e) {
			throw new Exception("N‹o foi possível listar."+e.getMessage());
		}
	}

	public void remove(Loteamento pLoteamento) throws Exception {
		try {	
			
			ArrayList<Loteamento> array = (ArrayList<Loteamento>) this.loteamentoRepository.consultaLoteamento(pLoteamento);
			
			Loteamento loteamento = array.get(0);
			
			Set<Lote> hashLote = (Set<Lote>) loteamento.getLotes();
						
			if(!hashLote.isEmpty()){
				throw new Exception();
			}
			
			this.loteamentoRepository.remove(loteamento);
		} catch (Exception e) {
			throw new Exception("Não foi possível excluir. Existe Lote(s) Associados a esse Loteamento");
		}
		
	}

	public List<Loteamento> consultaLoteamento(Loteamento loteamento) throws Exception {
				
		try {	
			return this.loteamentoRepository.consultaLoteamento(loteamento);
		} catch (Exception e) {
			throw new Exception("Não foi possível localizar." +e.getMessage());
		}
	}
	
	public Loteamento consultaLoteamento(String codigo, String nome) throws Exception {
		try {	
			Loteamento loteamentoConsulta = null;
			loteamentoConsulta =  this.loteamentoRepository.consultaLoteamento(codigo,nome);
			
			if( loteamentoConsulta == null){
				
				throw new Exception("Código ou nome incorreto");
			}else{
				return loteamentoConsulta;
			}
			
		} catch (Exception e) {
			throw new Exception("Não foi possível procurar pela ID."+e.getMessage());
		}
	}

	
}
