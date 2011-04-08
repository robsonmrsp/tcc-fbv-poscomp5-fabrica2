package sisa.com.br.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import sisa.com.br.entidade.Lote;
import sisa.com.br.repositorio.LoteRepository;


@Service(value="loteService")
@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class LoteServiceImpl implements LoteService {
	
	
	private LoteRepository loteRepository;
	

	@Autowired
	public void setLoteRepository(LoteRepository loteRepository) {
		this.loteRepository = loteRepository;
	}

	public Lote save(Lote lote) throws Exception {
		try {
			
			this.loteRepository.save(lote);
			return lote;
		} catch (Exception e) {
			throw new Exception("Não foi possível salvar. Verifique se já existe lote com esse Número,Quadra e Loteamento.");
		}
	}
	public Lote update(Lote lote) throws Exception {
		try {
			
			this.loteRepository.update(lote);
			return lote;
		} catch (Exception e) {
			throw new Exception("Não foi possível salvar." +e.getCause());
		}
	}

	public Lote findById(Lote lote) throws Exception {
		try {	
			return this.loteRepository.findById(lote);
		} catch (Exception e) {
			throw new Exception("Não foi possível procurar pela ID."+e.getMessage());
		}
	}

	public List<Lote> getList() throws Exception {
		try {	
			return this.loteRepository.getList();
		} catch (Exception e) {
			throw new Exception("Não foi possível listar."+e.getMessage());
		}
	}

	public void remove(Lote lote) throws Exception {
		try {	
			this.loteRepository.remove(lote);
		} catch (Exception e) {
			throw new Exception("Não foi possível excluir." +e.getMessage());
		}
		
	}

	public List<Lote> consultaLote(Lote lote) throws Exception {
				
		try {	
			return this.loteRepository.consultaLote(lote);
		} catch (Exception e) {
			throw new Exception("Não foi possível localizar." +e.getMessage());
		}
	}
	
	public List<Lote> consultaLote(String nu_lote,String nu_lotm,String nu_quadra,String situacao) throws Exception {
		try {	
			return this.loteRepository.consultaLote(nu_lote,nu_lotm,nu_quadra,situacao);
									
		} catch (Exception e) {
			throw new Exception("Não foi possível procurar pela ID."+e.getMessage());
		}
	}

	
}
