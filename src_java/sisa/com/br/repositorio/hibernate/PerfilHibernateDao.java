package sisa.com.br.repositorio.hibernate;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import sisa.com.br.entidade.Perfil;
import sisa.com.br.entidade.Transacao;
import sisa.com.br.repositorio.PerfilRepository;


@Repository(value="perfilRepository")
public class PerfilHibernateDao extends HibernateDaoSupport implements PerfilRepository {

	
	@Autowired
	public PerfilHibernateDao(@Qualifier("sessionFactory")SessionFactory factory) {
		super.setSessionFactory(factory);
	}
	
	public Perfil findById(Perfil perfil) throws Exception {
		Integer id = perfil.getId();
		perfil = (Perfil) getHibernateTemplate().get(Perfil.class, perfil.getId());
		
		if (perfil == null)
			throw new Exception("O perfil com a ID: "+id+" do(a) "+Perfil.class.getSimpleName()+" n‹o foi encontrado.");
		return perfil;
	}

	public List<Perfil> getList() throws Exception {
		List<Perfil> listaPerfil = new ArrayList<Perfil>();
		try{
			for (Object lista : getHibernateTemplate().loadAll(Perfil.class)) {
				listaPerfil.add((Perfil)lista);
				
			}
		} catch (Exception e) {
			throw new Exception("Não foi possível listar."+e.getMessage());
		}
		return listaPerfil;
	}

	public void remove(Perfil perfil) throws Exception {
		getHibernateTemplate().delete(perfil);	
		
	}

	public Perfil save(Perfil perfil) throws Exception {
		getHibernateTemplate().saveOrUpdate(perfil);
		return perfil;
	}
	

	public List<Perfil> consultaPerfil(Perfil perfil) throws Exception {
		Criteria criteria = getSession().createCriteria(Perfil.class,
				"perfil");
		if (perfil != null) {

			if (perfil.getDescricao() != null) {
				criteria.add(Restrictions.like("perfil.descricao", perfil
						.getDescricao(), MatchMode.START));
			}
		}
		//	        
		return criteria.list();
	}

}
