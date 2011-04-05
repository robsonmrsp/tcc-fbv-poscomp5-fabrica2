package sisa.com.br.repositorio.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import sisa.com.br.entidade.Financiamento;
import sisa.com.br.repositorio.FinanciamentoRepository;

@Repository(value="financiamentoRepository")
public class FinanciamentoHibernateDao extends HibernateDaoSupport implements FinanciamentoRepository {

	@Autowired
	public FinanciamentoHibernateDao(@Qualifier("sessionFactory")SessionFactory factory) {
		super.setSessionFactory(factory);
	}

	@Override
	public Financiamento findById(int id) throws Exception {
		Financiamento financiamento = (Financiamento) getHibernateTemplate().get(Financiamento.class, id);
		
		if (financiamento == null)
			throw new Exception("o Financiamento: "+id+" da "+Financiamento.class.getSimpleName()+" não foi encontrado.");
		return financiamento;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Financiamento> getList() throws Exception {
		return (List<Financiamento>) getHibernateTemplate().loadAll(Financiamento.class);
	}

}
