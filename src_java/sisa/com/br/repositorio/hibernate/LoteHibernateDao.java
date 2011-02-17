package sisa.com.br.repositorio.hibernate;

import java.util.ArrayList;
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

@Repository(value = "loteRepository")
public class LoteHibernateDao extends HibernateDaoSupport implements
		LoteRepository {

	@Autowired
	public LoteHibernateDao(@Qualifier("sessionFactory") SessionFactory factory) {
		super.setSessionFactory(factory);
	}

	public Lote findById(Lote lote) throws Exception {
		String numero = lote.getNumero();
		lote = (Lote) getHibernateTemplate().get(Lote.class, lote.getNumero());

		if (lote == null)
			throw new Exception("O lote com o número " + numero
					+ " não foi encontrado.");
		return lote;
	}

	public List<Lote> getList() throws Exception {
		List<Lote> listaLote = new ArrayList<Lote>();
		try {
			for (Object lista : getHibernateTemplate().loadAll(Lote.class)) {
				listaLote.add((Lote) lista);

			}
		} catch (Exception e) {
			throw new Exception("Não foi possível listar." + e.getMessage());
		}
		return listaLote;
	}

	public void remove(Lote lote) throws Exception {
		getHibernateTemplate().delete(lote);

	}

	public Lote save(Lote lote) throws Exception {
		getHibernateTemplate().saveOrUpdate(lote);
		return lote;
	}

	@SuppressWarnings("unchecked")
	public List<Lote> consultaLote(Lote lote) throws Exception {
		Criteria criteria = getSession().createCriteria(Lote.class, "lote");
		if (lote != null) {

			if (lote.getQuadra() != null) {
				criteria.add(Restrictions.like("lote.descricao", lote
						.getQuadra(), MatchMode.START));
			}
		}
		   
		return criteria.list();
	}

}
