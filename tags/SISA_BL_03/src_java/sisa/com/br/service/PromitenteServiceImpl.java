package sisa.com.br.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import sisa.com.br.entidade.Promitente;
import sisa.com.br.repositorio.PromitenteRepository;

@Service(value="promitenteService")
@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class PromitenteServiceImpl implements PromitenteService {

	private PromitenteRepository promitenteRepository;
	
	@Autowired
	public void setPromitenteRepository(PromitenteRepository promitenteRepository) {
		this.promitenteRepository = promitenteRepository;
	}

	public List<Promitente> consultaPromitente(Promitente promitente)
			throws Exception {
		try{
			return this.promitenteRepository.consultaPromitente(promitente);
		}
		catch (Exception e) {
			throw new Exception("Não foi possível localizar o promitente: " + e.getMessage());
		}
	}

	public Promitente findById(String id) throws Exception {
		try {
			return this.promitenteRepository.findById(id);
		} catch (Exception e) {
			throw new Exception("Não foi possível procurar pelo ID: " + e.getMessage());
		}
	}

	public List<Promitente> getList() throws Exception {
		try {
			return this.promitenteRepository.getList();
		} catch (Exception e) {
			throw new Exception("Não foi possível listar os promitentes: " + e.getMessage());
		}
	}

	public void remove(Promitente promitente) throws Exception {
		try {
			this.promitenteRepository.remove(promitente);
		} catch (Exception e) {
			throw new Exception("Não foi possível remover o promitente: " + e.getMessage());
		}
	}

	public Promitente save(Promitente promitente) throws Exception {
		try {
			return this.promitenteRepository.save(promitente);
		} catch (Exception e) {
			throw new Exception("Não foi possível salvar o promitente: " + e.getMessage());
		}
	}

}
