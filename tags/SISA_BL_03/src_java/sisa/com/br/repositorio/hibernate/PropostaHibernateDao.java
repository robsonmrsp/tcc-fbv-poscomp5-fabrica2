package sisa.com.br.repositorio.hibernate;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import sisa.com.br.entidade.Proposta;
import sisa.com.br.repositorio.PropostaRepository;

@Repository(value="propostaRepository")
public class PropostaHibernateDao extends HibernateDaoSupport implements PropostaRepository {

	@Autowired
	public PropostaHibernateDao(@Qualifier("sessionFactory")SessionFactory factory) {
		super.setSessionFactory(factory);
	}

	@SuppressWarnings("unchecked")
	public List<Proposta> consultaProposta(Proposta proposta)
			throws Exception {
		Criteria criteria = getSession().createCriteria(Proposta.class,
		"proposta");
		if (proposta != null) {
			if (proposta.getLoteamento() != null){
				criteria.add(Restrictions.eq("proposta.loteamento", proposta.getLoteamento()));
			}
			if (proposta.getPromitente() != null){
				criteria.add(Restrictions.eq("proposta.promitente", proposta.getPromitente()));
			}
			/*if (proposta.getCpfCnpj() != null) {
				criteria.add(Restrictions.eq("proposta.cpfCnpj", proposta.getCpfCnpj()));
			}
			if (proposta.getNome() != null) {
				criteria.add(Restrictions.like("proposta.nome", proposta
						.getNome(), MatchMode.START));
			}*/
		}
		//	        
		return criteria.list();
	}

	public Proposta findById(String id) throws Exception {
		Proposta proposta = (Proposta) getHibernateTemplate().get(Proposta.class, id);
		
		if (proposta == null)
			throw new Exception("A Proposta com o número: "+id+" da "+Proposta.class.getSimpleName()+" não foi encontrada.");
		return proposta;
	}

	@SuppressWarnings("unchecked")
	public List<Proposta> getList() throws Exception {
		return (List<Proposta>) getHibernateTemplate().loadAll(Proposta.class);
	}

	public void remove(Proposta proposta) throws Exception {
		getHibernateTemplate().delete(proposta);
	}

	public Proposta save(Proposta proposta) throws Exception {
		getHibernateTemplate().saveOrUpdate(proposta);
		return proposta;
	}

}
