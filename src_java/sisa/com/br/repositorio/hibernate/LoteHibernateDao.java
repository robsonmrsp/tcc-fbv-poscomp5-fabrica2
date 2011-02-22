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
			throw new Exception("O Lote com o Código: "+codigo+" nï¿½o foi encontrado.");
		return lote;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Lote> getList() throws Exception {
		return (List<Lote>) getHibernateTemplate().loadAll(Lote.class);
	}
	
	@Override
	public void remove(Lote lote) throws Exception {
		getHibernateTemplate().delete(lote);	
	}
	
	@Override
	public Lote save(Lote lote) throws Exception {
		getHibernateTemplate().saveOrUpdate(lote);
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
		}
		return criteria.list();
	}


	@Override
	public Lote consultaLote(String pCodigo, String pNu_Lotm,String pNu_Quadra)
			throws Exception {
		 Lote resposta = null;
		 Criteria criteria = getSession().createCriteria(Lote.class,
			"lote");
			if (pCodigo != null) {
				criteria.add(Restrictions.like("lote.nu_lote",pCodigo,MatchMode.ANYWHERE));
			}
			if(pNu_Lotm != null && !pNu_Lotm.equals("")){
				criteria.add(Restrictions.like("lote.nu_lotm",pNu_Lotm, MatchMode.EXACT));
			}	
			if(pNu_Quadra != null && !pNu_Quadra.equals("")){
				criteria.add(Restrictions.like("lote.nu_quadra",pNu_Quadra, MatchMode.ANYWHERE));
			}	
		
		return resposta;
	}

}
