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

import sisa.com.br.entidade.Promitente;
import sisa.com.br.repositorio.PromitenteRepository;

@Repository(value="promitenteRepository")
public class PromitenteHibernateDao extends HibernateDaoSupport implements PromitenteRepository {

	@Autowired
	public PromitenteHibernateDao(@Qualifier("sessionFactory")SessionFactory factory) {
		super.setSessionFactory(factory);
	}

	@SuppressWarnings("unchecked")
	public List<Promitente> find(Promitente promitente)
			throws Exception {
		Criteria criteria = getSession().createCriteria(Promitente.class,
		"promitente");
		if (promitente != null) {
		
			if (promitente.getCpfCnpj() != null) {
				criteria.add(Restrictions.eq("promitente.cpfCnpj", promitente.getCpfCnpj()));
			}
			if (promitente.getNome() != null) {
				criteria.add(Restrictions.like("promitente.nome", promitente
						.getNome(), MatchMode.START));
			}
		}
		//	        
		return criteria.list();
	}

	public Promitente findById(String id) throws Exception {
		Promitente promitente = (Promitente) getHibernateTemplate().get(Promitente.class, id);
		
		/*if (promitente == null)
			throw new Exception("Promitente não cadastrado!");*/
		return promitente;
	}

	@SuppressWarnings("unchecked")
	public List<Promitente> getList() throws Exception {
		return (List<Promitente>) getHibernateTemplate().loadAll(Promitente.class);
	}

	public void remove(Promitente promitente) throws Exception {
		getHibernateTemplate().delete(promitente);
	}

	public Promitente save(Promitente promitente) throws Exception {
		getHibernateTemplate().saveOrUpdate(promitente);
		return promitente;
	}

}
