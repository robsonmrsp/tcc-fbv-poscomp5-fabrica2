package sisa.com.br.repositorio.hibernate;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

import java.util.ArrayList;

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
	
	public List<Transacao> getListMenu(int id) throws Exception{
		List<Transacao> listaTransacao = new ArrayList<Transacao>();
		
		Session session = (Session)getSessionFactory().openSession();
		Connection conn = session.connection();
		
		String sql = "select distinct(t.Id_Transacao), t.Nome, t.idPai from usuario u inner join usuario_perfil up on u.Id_Usuario = up.Id_Usuario inner join " +
				"transacao_perfil tp on up.Id_Perfil = tp.Id_Perfil inner join " +
				"transacao t on t.Id_Transacao = tp.Id_Transacao " +
				"where upper(t.ativa) = 'S' and u.Id_Usuario = " + id +
				" group by t.Nome, t.idPai" + 
				" order by t.idPai, t.Id_Transacao, t.ordem";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet resultSet = ps.executeQuery();
		
		while (resultSet.next()){
			
			Transacao transacao = new Transacao();
			transacao.setId(resultSet.getInt(1));
			transacao.setNome(resultSet.getString(2));
			transacao.setidPai(resultSet.getInt(3));
			
			listaTransacao.add(transacao);
		}
		
		resultSet.close();
		
		try{
			ps.close();
		}catch(SQLException e){
			//TUDO: handle exception
		}
		
		return listaTransacao;
	}

}
