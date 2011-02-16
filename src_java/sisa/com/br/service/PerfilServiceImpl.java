package sisa.com.br.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import flex.messaging.io.ArrayList;

import sisa.com.br.entidade.Perfil;
import sisa.com.br.entidade.Transacao;
import sisa.com.br.repositorio.PerfilRepository;


@Service(value="perfilService")
@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class PerfilServiceImpl implements PerfilService {
	
	
	private PerfilRepository perfilRepository;

	@Autowired
	public void setPerfilRepository(PerfilRepository perfilRepository) {
		this.perfilRepository = perfilRepository;
	}

	public Perfil save(Perfil perfil) throws Exception {
		try {
			Set<Transacao> transacao = perfil.getListaTransacao();
			perfil.setListaTransacao(new HashSet<Transacao>());
			perfil = this.perfilRepository.save(perfil);
			perfil.setListaTransacao(transacao);
			this.perfilRepository.save(perfil);
			return perfil;
		} catch (Exception e) {
			throw new Exception("Não foi possível salvar." +e.getCause());
		}
	}

	public Perfil findById(Perfil perfil) throws Exception {
		try {	
			return this.perfilRepository.findById(perfil);
		} catch (Exception e) {
			throw new Exception("Não foi possível procurar pela ID."+e.getMessage());
		}
	}

	public List<Perfil> getList() throws Exception {
		try {	
			return this.perfilRepository.getList();
		} catch (Exception e) {
			throw new Exception("Não foi possível listar."+e.getMessage());
		}
	}

	public void remove(Perfil perfil) throws Exception {
		try {	
			this.perfilRepository.remove(perfil);
		} catch (Exception e) {
			throw new Exception("Não foi possível excluir." +e.getMessage());
		}
		
	}

	public List<Perfil> consultaPerfil(Perfil perfil) throws Exception {
				
		try {	
			return this.perfilRepository.consultaPerfil(perfil);
		} catch (Exception e) {
			throw new Exception("Não foi possível localizar." +e.getMessage());
		}
	}

}
