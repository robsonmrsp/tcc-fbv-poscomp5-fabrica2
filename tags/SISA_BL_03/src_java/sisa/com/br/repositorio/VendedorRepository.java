package sisa.com.br.repositorio;

import java.util.List;

import sisa.com.br.entidade.Vendedor;

public interface VendedorRepository {	
	Vendedor consultaVendedor(String vendedor) throws Exception;	
	Vendedor save(Vendedor vendedor) throws Exception;
	Vendedor findById(Vendedor vendedor) throws Exception;
	List<Vendedor> getList() throws Exception;
	List<Vendedor> consultaVendedor(Vendedor vendedor)throws Exception;
	void remove(Vendedor vendedor) throws Exception;
}
