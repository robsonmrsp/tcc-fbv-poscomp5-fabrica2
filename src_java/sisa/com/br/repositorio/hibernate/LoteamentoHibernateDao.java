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

import sisa.com.br.entidade.Loteamento;
import sisa.com.br.repositorio.LoteamentoRepository;

@Repository(value="loteamentoRepository")
public class LoteamentoHibernateDao extends HibernateDaoSupport implements
		LoteamentoRepository {
	
	@Autowired
	public LoteamentoHibernateDao(@Qualifier("sessionFactory")SessionFactory factory) {
		super.setSessionFactory(factory);
	}
	
	@Override
	public Loteamento findById(Loteamento loteamento) throws Exception {
		String codigo = loteamento.getNu_lotm();
		loteamento = (Loteamento) getHibernateTemplate().get(Loteamento.class, loteamento.getNu_lotm());
		
		if (loteamento == null)
			throw new Exception("O Loteamento com o Código: "+codigo+" nï¿½o foi encontrado.");
		return loteamento;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Loteamento> getList() throws Exception {
		return (List<Loteamento>) getHibernateTemplate().loadAll(Loteamento.class);
	}
	
	@Override
	public void remove(Loteamento loteamento) throws Exception {
		getHibernateTemplate().delete(loteamento);	
	}
	
	@Override
	public Loteamento save(Loteamento loteamento) throws Exception {
		
		Loteamento resposta = null;
		
		Criteria criteria = getSession().createCriteria(Loteamento.class,
				"loteamento");
		criteria.add(Restrictions.like("loteamento.nu_lotm",loteamento.getNu_lotm(),MatchMode.EXACT));
		

		resposta = (Loteamento) criteria.uniqueResult();
		
		
		if(resposta != null){
			throw new Exception();
		}else{
			getHibernateTemplate().saveOrUpdate(loteamento);
			return loteamento;
		}
	}
	
	public Loteamento update(Loteamento loteamento) throws Exception {
		getHibernateTemplate().update(loteamento);
		return loteamento;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Loteamento> consultaLoteamento(Loteamento loteamento)
			throws Exception {
		Criteria criteria = getSession().createCriteria(Loteamento.class,
		"loteamento");
		if (loteamento != null) {
		
			if (loteamento.getDs_lotm()!= null) {
				criteria.add(Restrictions.like("loteamento.ds_lotm", loteamento.getDs_lotm(), MatchMode.ANYWHERE));
			}
			if (loteamento.getNu_lotm() != null) {
				criteria.add(Restrictions.like("loteamento.nu_lotm",loteamento.getNu_lotm(), MatchMode.ANYWHERE));
			}
		}
		return criteria.list();
	}


	@Override
	public Loteamento consultaLoteamento(String codigo, String nome)
			throws Exception {
		 Loteamento resposta = null;
			if (codigo != null) {
				Criteria criteria = getSession().createCriteria(Loteamento.class,
						"loteamento");
				criteria.add(Restrictions.like("loteamento.nu_lotm", codigo));
				criteria.add(Restrictions.like("loteamento.ds_lotm", nome));

				resposta = (Loteamento) criteria.uniqueResult();
			}
		return resposta;
	}

}
