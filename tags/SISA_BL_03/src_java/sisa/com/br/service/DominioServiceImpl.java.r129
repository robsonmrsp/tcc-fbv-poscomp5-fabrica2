package sisa.com.br.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import sisa.com.br.dominio.DominioEstadoCivil;
import sisa.com.br.dominio.DominioSituacaoProposta;
import sisa.com.br.dominio.DominioTipoSexo;
import sisa.com.br.dominio.objDominio;


@Service(value="dominioService")
@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class DominioServiceImpl implements DominioService {
	
	public List<objDominio> listarTipoSexo() {
		
		List<objDominio> sexos = DominioTipoSexo.getListaSexo();
		
		return sexos;	
	}

	public List<objDominio> listarEstadoCivil() throws Exception {
		
		List<objDominio> estadosCivil = DominioEstadoCivil.getLista();
		
		return estadosCivil;
	}
	
	@Override
	public List<objDominio> listarSituacoesPropostas() throws Exception {
		return DominioSituacaoProposta.getLista();
	}
}
