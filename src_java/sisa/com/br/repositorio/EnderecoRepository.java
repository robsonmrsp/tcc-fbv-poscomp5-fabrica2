package sisa.com.br.repositorio;

import java.util.List;

import sisa.com.br.entidade.Endereco;

public interface EnderecoRepository {
	
	Endereco consultaEndereco(int endereco) throws Exception;	
	Endereco save(Endereco endereco) throws Exception;
	Endereco findById(Endereco endereco) throws Exception;
	List<Endereco> getList() throws Exception;
	List<Endereco> consultaEndereco(Endereco endereco)throws Exception;
	void remove(Endereco endereco) throws Exception;
}
