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
			throw new Exception("N‹o foi poss’vel salvar." +e.getCause());
		}
	}

	public Lote findById(Lote lote) throws Exception {
		try {	
			return this.loteRepository.findById(lote);
		} catch (Exception e) {
			throw new Exception("N‹o foi poss’vel procurar pela ID."+e.getMessage());
		}
	}

	public List<Lote> getList() throws Exception {
		try {	
			return this.loteRepository.getList();
		} catch (Exception e) {
			throw new Exception("N‹o foi poss’vel listar."+e.getMessage());
		}
	}

	public void remove(Lote lote) throws Exception {
		try {	
			this.loteRepository.remove(lote);
		} catch (Exception e) {
			throw new Exception("N‹o foi poss’vel excluir." +e.getMessage());
		}
		
	}

	public List<Lote> consultaLote(Lote lote) throws Exception {
				
		try {	
			return this.loteRepository.consultaLote(lote);
		} catch (Exception e) {
			throw new Exception("N‹o foi poss’vel localizar." +e.getMessage());
		}
	}
	
	public Lote consultaLote(String cd_lote,String nu_lotm,String nu_quadra) throws Exception {
		try {	
			Lote loteConsulta = null;
			loteConsulta =  this.loteRepository.consultaLote(cd_lote,nu_lotm,nu_quadra);
			
			if( loteConsulta == null){
				
				throw new Exception("Código,loteamento ou quadra incorreto(s)");
			}else{
				return loteConsulta;
			}
			
		} catch (Exception e) {
			throw new Exception("Nï¿½o foi possï¿½vel procurar pela ID."+e.getMessage());
		}
	}

	
}
