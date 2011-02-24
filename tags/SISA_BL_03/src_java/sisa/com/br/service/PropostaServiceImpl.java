package sisa.com.br.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import sisa.com.br.entidade.Proposta;
import sisa.com.br.repositorio.PropostaRepository;;

@Service(value="propostaService")
@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class PropostaServiceImpl implements PropostaService {

	private PropostaRepository propostaRepository;

	@Autowired
	public void setPropostaRepository(PropostaRepository propostaRepository) {
		this.propostaRepository = propostaRepository;
	}

	@Override
	public Proposta add(Proposta proposta) throws Exception {
		try {
			if (findById(proposta.getNumero()) != null){
				throw new Exception("Proposta com o n�mero '" + proposta.getNumero() + "' j� cadastrada!");
			}
			return this.propostaRepository.save(proposta);
		} catch (Exception e) {
			throw new Exception("N�o foi poss�vel incluir a proposta: " + e.getMessage());
		}
	}

	@Override
	public List<Proposta> consultaProposta(Proposta proposta) throws Exception {
		try{
			return this.propostaRepository.consultaProposta(proposta);
		}
		catch (Exception e) {
			throw new Exception("N�o foi poss�vel localizar a proposta: " + e.getMessage());
		}
	}

	@Override
	public Proposta findById(String id) throws Exception {
		try {
			return this.propostaRepository.findById(id);
		} catch (Exception e) {
			throw new Exception("N�o foi poss�vel localizar pelo n�mero: " + e.getMessage());
		}
	}

	@Override
	public List<Proposta> getList() throws Exception {
		try {
			return this.propostaRepository.getList();
		} catch (Exception e) {
			throw new Exception("N�o foi poss�vel listar as propostas: " + e.getMessage());
		}
	}

	@Override
	public void remove(Proposta proposta) throws Exception {
		try {
			this.propostaRepository.remove(proposta);
		} catch (Exception e) {
			throw new Exception("N�o foi poss�vel remover a proposta: " + e.getMessage());
		}
	}

	@Override
	public Proposta update(Proposta proposta) throws Exception {
		try {
			if (findById(proposta.getNumero()) == null){
				throw new Exception("Proposta com o n�mero '" + proposta.getNumero() + "' n�o cadastrada!");
			}
			return this.propostaRepository.save(proposta);
		} catch (Exception e) {
			throw new Exception("N�o foi poss�vel atualizar a proposta: " + e.getMessage());
		}
	}

}
