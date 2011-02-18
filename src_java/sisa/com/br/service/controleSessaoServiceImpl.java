package sisa.com.br.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import sisa.com.br.controller.UsuarioUtils;
import sisa.com.br.entidade.Usuario;


@Service(value="controleSessaoService")
@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class controleSessaoServiceImpl implements controleSessaoService{
	

	
	public void destruirSessao(Usuario usuarioLogado){
		
	
		UsuarioUtils.usuariosLogados.remove(usuarioLogado.getId());
		
	}

}
