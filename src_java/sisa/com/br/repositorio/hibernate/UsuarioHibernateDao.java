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

import sisa.com.br.entidade.Usuario;
import sisa.com.br.repositorio.UsuarioRepository;


@Repository(value="usuarioRepository")
public class UsuarioHibernateDao extends HibernateDaoSupport implements UsuarioRepository {

	
	@Autowired
	public UsuarioHibernateDao(@Qualifier("sessionFactory")SessionFactory factory) {
		super.setSessionFactory(factory);
	}
	
	public Usuario findById(Usuario usuario) throws Exception {
		Integer id = usuario.getId();
		usuario = (Usuario) getHibernateTemplate().get(Usuario.class, usuario.getId());
		
		if (usuario == null)
			throw new Exception("O usuário com a ID: "+id+" do(a) "+Usuario.class.getSimpleName()+" nï¿½o foi encontrada.");
		return usuario;
	}

	public List<Usuario> getList() throws Exception {
		List<Usuario> listaUsuario = new ArrayList<Usuario>();
		try{
			for (Object lista : getHibernateTemplate().loadAll(Usuario.class)) {
				listaUsuario.add((Usuario)lista);
				
			}
		} catch (Exception e) {
			throw new Exception("Não foi possível listar."+e.getMessage());
		}
		return listaUsuario;
	}

	public void remove(Usuario usuario) throws Exception {
		getHibernateTemplate().delete(usuario);	
		
	}

	public Usuario save(Usuario usuario) throws Exception {
		getHibernateTemplate().saveOrUpdate(usuario);
		return usuario;
	}

	public List<Usuario> consultaUsuario(Usuario usuario) throws Exception {
		Criteria criteria = getSession().createCriteria(Usuario.class,
				"usuario");
		if (usuario != null) {

			if (usuario.getLogin() != null) {
				criteria.add(Restrictions.like("usuario.login", usuario
						.getLogin(), MatchMode.START));
			}
			if (usuario.getNome() != null) {
				criteria.add(Restrictions.like("usuario.nome", usuario
						.getNome(), MatchMode.START));
			}
		}
		//	        
		return criteria.list();
	}
	
	public Usuario consultaUsuario(String usuario, String senha) throws Exception {
        Usuario resposta = null;
		if (usuario != null) {
			Criteria criteria = getSession().createCriteria(Usuario.class,
					"usuario");
			criteria.add(Restrictions.like("usuario.login", usuario));
			criteria.add(Restrictions.like("usuario.senha", senha));

			resposta = (Usuario) criteria.uniqueResult();
		}
		return resposta;
    
	}

}
