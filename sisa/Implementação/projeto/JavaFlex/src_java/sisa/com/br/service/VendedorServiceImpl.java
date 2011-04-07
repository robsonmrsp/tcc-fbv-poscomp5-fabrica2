package sisa.com.br.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import sisa.com.br.entidade.Endereco;
import sisa.com.br.entidade.Vendedor;
import sisa.com.br.repositorio.EnderecoRepository;
import sisa.com.br.repositorio.VendedorRepository;


@Service(value="vendedorService")
@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class VendedorServiceImpl implements VendedorService {
	
	
	private VendedorRepository vendedorRepository;
	private EnderecoRepository enderecoRepository;

	@Autowired
	public void setVendedorRepository(VendedorRepository vendedorRepository) {
		this.vendedorRepository = vendedorRepository;
	}
	
	@Autowired
	public void setEnderecoRepository(EnderecoRepository enderecoRepository){
		this.enderecoRepository = enderecoRepository;
	}

	public Vendedor save(Vendedor vendedor) throws Exception {
		try {
			
			System.out.println("teste");
			Endereco endereco = this.enderecoRepository.save(vendedor.getEndereco());
			vendedor.setEndereco(endereco);
			this.vendedorRepository.save(vendedor);
			return vendedor;
		} catch (Exception e) {
			throw new Exception("Não possível salvar." +e.getCause());
		}
	}

	public Vendedor findById(Vendedor vendedor) throws Exception {
		try {	
			return this.vendedorRepository.findById(vendedor);
		} catch (Exception e) {
			throw new Exception("N‹o foi poss’vel procurar pela ID."+e.getMessage());
		}
	}

	public List<Vendedor> getList() throws Exception {
		try {	
			return this.vendedorRepository.getList();
		} catch (Exception e) {
			throw new Exception("Não foi possível listar."+e.getMessage());
		}
	}

	public void remove(Vendedor vendedor) throws Exception {
		try {	
			this.vendedorRepository.remove(vendedor);
		} catch (Exception e) {
			throw new Exception("Não foi possível excluir." +e.getMessage());
		}
		
	}

	public List<Vendedor> consultaVendedor(Vendedor vendedor) throws Exception {
				
		try {	
			return this.vendedorRepository.consultaVendedor(vendedor);
		} catch (Exception e) {
			throw new Exception("Não foi possível localizar." +e.getMessage());
		}
	}

	public Vendedor consultaVendedor(String vendedor) throws Exception {
		try {	
			Vendedor vendedorLogado = null;
			vendedorLogado =  this.vendedorRepository.consultaVendedor(vendedor);
			
			if( vendedorLogado == null){
				
				throw new Exception("Usu‡rio ou senha incorreta");
			}else{
			
			/*if( utils.isVendedorLogado(vendedorLogado.getCd_vend()))
				{
					  //usu‡rio j‡ est‡ logado
					  throw new Exception("Usu‡rio j‡ logado");
				} else {
				 
					//usu‡rio logado com sucesso
					//registro atributos na sess‹o
					FlexContext.getFlexClient().setAttribute("vendedor", vendedorLogado.getId());
					 
					//registro esse usu‡rio na lista dos usu‡rios logados
					VendedorUtils.vendedorsLogados.put(vendedorLogado.getId(), vendedorLogado.getLogin());
					 
					//retorno o objeto inteiro desse usu‡rio para ser armazenado no Flex para consultas posteriores
					return vendedorLogado;
				 
				}*/
			}
			
		} catch (Exception e) {
			throw new Exception("Nï¿½o foi possï¿½vel procurar pela ID."+e.getMessage());
		}
		return null;
	}

	public void pingSessao()
	{
		
		
	}
}
