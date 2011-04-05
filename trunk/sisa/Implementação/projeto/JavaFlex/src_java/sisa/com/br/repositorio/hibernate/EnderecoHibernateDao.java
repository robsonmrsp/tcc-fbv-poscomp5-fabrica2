package sisa.com.br.repositorio.hibernate;


import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import sisa.com.br.entidade.Endereco;
import sisa.com.br.repositorio.EnderecoRepository;

@Repository(value="enderecoRepository")
public class EnderecoHibernateDao extends HibernateDaoSupport implements EnderecoRepository {

	
	@Autowired
	public EnderecoHibernateDao(@Qualifier("sessionFactory")SessionFactory factory) {
		super.setSessionFactory(factory);
	}
	
	public Endereco findById(Endereco endereco) throws Exception {
		int id = endereco.getCodigo();
		endereco = (Endereco) getHibernateTemplate().get(Endereco.class, endereco.getCodigo());
		
		if (endereco == null)
			throw new Exception("O vendedor com a ID: "+id+" do(a) "+Endereco.class.getSimpleName()+" não foi encontrado.");
		return endereco;
	}

	public List<Endereco> getList() throws Exception {

		return (List<Endereco>) getHibernateTemplate().loadAll(Endereco.class);
	}

	public void remove(Endereco endereco) throws Exception {
		getHibernateTemplate().delete(endereco);	
		
	}

	public Endereco save(Endereco endereco) throws Exception {
		getHibernateTemplate().saveOrUpdate(endereco);
		return endereco;
	}

	public List<Endereco> consultaEndereco(Endereco endereco) throws Exception {
		Criteria criteria = getSession().createCriteria(Endereco.class,
				"endereco");
		if (endereco != null) {

			if (endereco.getCodigo() != 0) {
				//criteria.add(Restrictions.like("endereco.cd_vend", endereco.getCd_endereco(), MatchMode.START));
			}
		}
		//	        
		return criteria.list();
	}
	
	public Endereco consultaEndereco(int endereco) throws Exception {
		Endereco resposta = null;
		if (endereco != 0) {
			Criteria criteria = getSession().createCriteria(Endereco.class,
					"endereco");
			criteria.add(Restrictions.like("endereco.cd_endereco", endereco));

			resposta = (Endereco) criteria.uniqueResult();
		}
		return resposta;
    
	}
}
