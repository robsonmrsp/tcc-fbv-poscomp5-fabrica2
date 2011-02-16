package sisa.com.br.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import sisa.com.br.controller.UsuarioUtils;
import sisa.com.br.entidade.Usuario;
import sisa.com.br.repositorio.UsuarioRepository;
import flex.messaging.FlexContext;


@Service(value="usuarioService")
@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class UsuarioServiceImpl implements UsuarioService {
	
	
	private UsuarioRepository usuarioRepository;
	private UsuarioUtils utils = new UsuarioUtils();

	@Autowired
	public void setUsuarioRepository(UsuarioRepository usuarioRepository) {
		this.usuarioRepository = usuarioRepository;
	}

	public Usuario save(Usuario usuario) throws Exception {
		try {
			
			System.out.println("teste");
			this.usuarioRepository.save(usuario);
			return usuario;
		} catch (Exception e) {
			throw new Exception("N‹o foi poss’vel salvar." +e.getCause());
		}
	}

	public Usuario findById(Usuario usuario) throws Exception {
		try {	
			return this.usuarioRepository.findById(usuario);
		} catch (Exception e) {
			throw new Exception("N‹o foi poss’vel procurar pela ID."+e.getMessage());
		}
	}

	public List<Usuario> getList() throws Exception {
		try {	
			return this.usuarioRepository.getList();
		} catch (Exception e) {
			throw new Exception("N‹o foi poss’vel listar."+e.getMessage());
		}
	}

	public void remove(Usuario usuario) throws Exception {
		try {	
			this.usuarioRepository.remove(usuario);
		} catch (Exception e) {
			throw new Exception("N‹o foi poss’vel excluir." +e.getMessage());
		}
		
	}

	public List<Usuario> consultaUsuario(Usuario usuario) throws Exception {
				
		try {	
			return this.usuarioRepository.consultaUsuario(usuario);
		} catch (Exception e) {
			throw new Exception("N‹o foi poss’vel localizar." +e.getMessage());
		}
	}

	public Usuario consultaUsuario(String usuario, String senha) throws Exception {
		try {	
			Usuario usuarioLogado = null;
			usuarioLogado =  this.usuarioRepository.consultaUsuario(usuario,senha);
			
			if( usuarioLogado == null){
				
				throw new Exception("Usu‡rio ou senha incorreto");
			}else{
			
			if( utils.isUsuarioLogado(usuarioLogado.getId()))
				{
					  //usu‡rio j‡ est‡ logado
					  throw new Exception("Usu‡rio j‡ logado");
				} else {
				 
					//usu‡rio logado com sucesso
					//registro atributos na sess‹o
					FlexContext.getFlexClient().setAttribute("usuario", usuarioLogado.getId());
					 
					//registro esse usu‡rio na lista dos usu‡rios logados
					UsuarioUtils.usuariosLogados.put(usuarioLogado.getId(), usuarioLogado.getLogin());
					 
					//retorno o objeto inteiro desse usu‡rio para ser armazenado no Flex para consultas posteriores
					return usuarioLogado;
				 
				}
			}
			
		} catch (Exception e) {
			throw new Exception("Nï¿½o foi possï¿½vel procurar pela ID."+e.getMessage());
		}
	}

	public void pingSessao()
	{
		
		
	}

}
