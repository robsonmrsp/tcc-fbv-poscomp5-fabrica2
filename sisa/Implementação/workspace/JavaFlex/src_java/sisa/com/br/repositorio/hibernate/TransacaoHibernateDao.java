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

import sisa.com.br.entidade.Transacao;
import sisa.com.br.repositorio.TransacaoRepository;


@Repository(value="transacaoRepository")
public class TransacaoHibernateDao extends HibernateDaoSupport implements TransacaoRepository {

	
	@Autowired
	public TransacaoHibernateDao(@Qualifier("sessionFactory")SessionFactory factory) {
		super.setSessionFactory(factory);
	}
	
	public Transacao findById(Transacao transacao) throws Exception {
		Integer id = transacao.getId();
		transacao = (Transacao) getHibernateTemplate().get(Transacao.class, transacao.getId());
		
		if (transacao == null)
			throw new Exception("O transacao com a ID: "+id+" do(a) "+Transacao.class.getSimpleName()+" n‹o foi encontrado.");
		return transacao;
	}

	public List<Transacao> getList() throws Exception {

		 return getHibernateTemplate().loadAll(Transacao.class);

	}

	public void remove(Transacao transacao) throws Exception {
		getHibernateTemplate().delete(transacao);	
		
	}

	public Transacao save(Transacao transacao) throws Exception {
		getHibernateTemplate().saveOrUpdate(transacao);
		return transacao;
	}

	public List<Transacao> consultaTransacao(Transacao transacao) throws Exception {
		Criteria criteria = getSession().createCriteria(Transacao.class,
				"transacao");
		if (transacao != null) {

			if (transacao.getNome() != null) {
				criteria.add(Restrictions.like("transacao.nome", transacao
						.getNome(), MatchMode.START));
			}
			if (transacao.getTitulo() != null && !transacao.getTitulo().equals("")) {
				criteria.add(Restrictions.like("transacao.titulo", transacao
						.getTitulo(), MatchMode.START));
			}
			if (transacao.getAtiva() != null) {
				criteria.add(Restrictions.like("transacao.ativa", transacao
						.getAtiva(), MatchMode.START));
			}
		}
		//	        
		return criteria.list();
	}

}
