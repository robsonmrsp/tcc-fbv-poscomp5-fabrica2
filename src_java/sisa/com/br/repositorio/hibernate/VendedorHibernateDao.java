package sisa.com.br.repositorio.hibernate;


import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import sisa.com.br.entidade.Vendedor;
import sisa.com.br.repositorio.VendedorRepository;



@Repository(value="vendedorRepository")
public class VendedorHibernateDao extends HibernateDaoSupport implements VendedorRepository {

	
	@Autowired
	public VendedorHibernateDao(@Qualifier("sessionFactory")SessionFactory factory) {
		super.setSessionFactory(factory);
	}
	
	public Vendedor findById(Vendedor vendedor) throws Exception {
		String id = vendedor.getCd_vend();
		vendedor = (Vendedor) getHibernateTemplate().get(Vendedor.class, vendedor.getCd_vend());
		
		if (vendedor == null)
			throw new Exception("O vendedor com a ID: "+id+" do(a) "+Vendedor.class.getSimpleName()+" não foi encontrado.");
		return vendedor;
	}

	public List<Vendedor> getList() throws Exception {

		return (List<Vendedor>) getHibernateTemplate().loadAll(Vendedor.class);
	}

	public void remove(Vendedor vendedor) throws Exception {
		getHibernateTemplate().delete(vendedor);	
		
	}

	public Vendedor save(Vendedor vendedor) throws Exception {
		getHibernateTemplate().saveOrUpdate(vendedor);
		return vendedor;
	}

	public List<Vendedor> consultaVendedor(Vendedor vendedor) throws Exception {
		Criteria criteria = getSession().createCriteria(Vendedor.class,
				"vendedor");
		if (vendedor != null) {

			if (vendedor.getCd_vend() != null) {
				criteria.add(Restrictions.like("vendedor.cd_vend", vendedor.getCd_vend(), MatchMode.START));
			}
			if (vendedor.getDs_razao_nome() != null) {
				criteria.add(Restrictions.like("usuario.nome", vendedor.getDs_razao_nome(), MatchMode.START));
			}
		}
		//	        
		return criteria.list();
	}
	
	public Vendedor consultaVendedor(String vendedor) throws Exception {
		Vendedor resposta = null;
		if (vendedor != null) {
			Criteria criteria = getSession().createCriteria(Vendedor.class,
					"vendedor");
			criteria.add(Restrictions.like("vendedor.cd_vend", vendedor));

			resposta = (Vendedor) criteria.uniqueResult();
		}
		return resposta;
    
	}
}
