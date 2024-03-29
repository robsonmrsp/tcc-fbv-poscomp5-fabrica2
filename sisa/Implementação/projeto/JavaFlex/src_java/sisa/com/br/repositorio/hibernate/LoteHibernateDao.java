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

import sisa.com.br.entidade.Lote;
import sisa.com.br.repositorio.LoteRepository;

@Repository(value="loteRepository")
public class LoteHibernateDao extends HibernateDaoSupport implements
		LoteRepository {
	
	@Autowired
	public LoteHibernateDao(@Qualifier("sessionFactory")SessionFactory factory) {
		super.setSessionFactory(factory);
	}
	
	@Override
	public Lote findById(Lote lote) throws Exception {
		Integer codigo = lote.getCd_lote();
		lote = (Lote) getHibernateTemplate().get(Lote.class, lote.getCd_lote());
		
		if (lote == null)
			throw new Exception("O Lote com o C�digo: "+codigo+" n�o foi encontrado.");
		return lote;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Lote> getList() throws Exception {
		return (List<Lote>) getHibernateTemplate().loadAll(Lote.class);
	}
	
	@Override
	public void remove(Lote lote) throws Exception {
		lote = (Lote)getHibernateTemplate().load(Lote.class,lote.getCd_lote());  
		getHibernateTemplate().delete(lote);	
	}
	
	@Override
	public Lote save(Lote lote) throws Exception {
		
		Lote resposta = null;
		
		Criteria criteria = getSession().createCriteria(Lote.class,
				"lote");
		criteria.add(Restrictions.like("lote.nu_lotm",lote.getNu_lotm(),MatchMode.EXACT));
		criteria.add(Restrictions.like("lote.nu_quadra",lote.getNu_quadra(),MatchMode.EXACT));
		criteria.add(Restrictions.like("lote.nu_lote",lote.getNu_lote(),MatchMode.EXACT));
		
		
		resposta = (Lote) criteria.uniqueResult();
				
		if(resposta != null){
			throw new Exception();
		}else{
			getHibernateTemplate().save(lote);
			return lote;
		}
		
		
	}
	
	public Lote update(Lote lote) throws Exception {
		getHibernateTemplate().update(lote);
		return lote;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Lote> consultaLote(Lote lote)
			throws Exception {
		Criteria criteria = getSession().createCriteria(Lote.class,
		"lote");
		if (lote != null) {
		
			if (lote.getNu_lote() != null) {
				criteria.add(Restrictions.like("lote.nu_lote",lote.getNu_lote(), MatchMode.ANYWHERE));
			}
			if (lote.getNu_lotm() != null) {
				criteria.add(Restrictions.like("lote.nu_lotm",lote.getNu_lotm(), MatchMode.EXACT));
			}
			if(lote.getNu_quadra() != null){
				criteria.add(Restrictions.like("lote.nu_quadra",lote.getNu_quadra(), MatchMode.ANYWHERE));
			}
			if (lote.getSituacao() != null)
			{
				criteria.add(Restrictions.eq("lote.situacao", lote.getSituacao()));
			}
		}
		return criteria.list();
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Lote> consultaLote(String pNu_Lote, String pNu_Lotm,String pNu_Quadra,String situacao)
			throws Exception {
		
		 Criteria criteria = getSession().createCriteria(Lote.class,
			"lote");
			if (pNu_Lote != null) {
				criteria.add(Restrictions.like("lote.nu_lote",pNu_Lote,MatchMode.ANYWHERE));
			}
			if(pNu_Lotm != null && !pNu_Lotm.equals("")){
				criteria.add(Restrictions.like("lote.nu_lotm",pNu_Lotm, MatchMode.EXACT));
			}	
			if(pNu_Quadra != null && !pNu_Quadra.equals("")){
				criteria.add(Restrictions.like("lote.nu_quadra",pNu_Quadra, MatchMode.ANYWHERE));
			}
			if(situacao != null && !situacao.equals("")){
				criteria.add(Restrictions.like("lote.situacao",situacao,MatchMode.EXACT));
			}
				
		return criteria.list();
	}

}
