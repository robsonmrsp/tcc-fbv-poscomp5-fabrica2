package sisa.com.br.repositorio.hibernate;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
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

	public Lote findById(Lote Lote) throws Exception {
		String numero = Lote.getNumero();
		Lote = (Lote) getHibernateTemplate().get(Lote.class, Lote.getNumero());

		if (Lote == null)
			throw new Exception("O usu‡rio com a ID: " + numero + " do(a) "
					+ Lote.class.getSimpleName() + " nï¿½o foi encontrada.");
		return Lote;
	}

	public List<Lote> getList() throws Exception {

		return (List<Lote>) getHibernateTemplate().loadAll(Lote.class);
	}

	public void remove(Lote Lote) throws Exception {
		getHibernateTemplate().delete(Lote);

	}

	public Lote save(Lote Lote) throws Exception {
		getHibernateTemplate().saveOrUpdate(Lote);
		return Lote;
	}

	public List<Lote> consultaLote(Lote Lote) throws Exception {
		Criteria criteria = getSession().createCriteria(Lote.class, "Lote");
		if (Lote != null) {

			// if (Lote.getLogin() != null) {
			// criteria.add(Restrictions.like("Lote.login", Lote.getLogin(),
			// MatchMode.START));
			// }
			// if (Lote.getNome() != null) {
			// criteria.add(Restrictions.like("Lote.nome", Lote.getNome(),
			// MatchMode.START));
			// }
		}

		return criteria.list();
	}

	public Lote consultaLote(String numero) throws Exception {
		Lote resposta = null;
		if (numero != null) {
			Criteria criteria = getSession().createCriteria(Lote.class, "Lote");
			criteria.add(Restrictions.like("Lote.numero", numero));

			resposta = (Lote) criteria.uniqueResult();
		}
		return resposta;

	}

}
