package recruitment.service.impl;

import java.util.List;

import org.hibernate.FlushMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import recruitment.service.DbDao;

@Transactional(readOnly = false)
public class DbDaoImpl extends HibernateDaoSupport implements DbDao {

	@Override
	public Object get(Class clazz, int id) {
		return super.getHibernateTemplate().get(clazz, id);
	}

	@Override
	public void save(Object ob) {
		Session session = this.getSessionFactory().getCurrentSession();
		session.setFlushMode(FlushMode.AUTO);
		session.saveOrUpdate(ob);
		session.flush();
	}

	@Override
	public Object searchOne(String hql, Object... param1) {
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createQuery(hql);
		int i = 0;
		for (Object ob : param1) {
			query.setParameter(i++, ob);
		}
		return query.uniqueResult();
	}

	@Override
	public List searchAll(String hql, Object... param1) {
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createQuery(hql);
		int i = 0;
		for (Object ob : param1) {
			query.setParameter(i++, ob);
		}
		return query.list();
	}


	@Override
	public void delete(Object ob) {
		super.getHibernateTemplate().delete(ob);
	}

}
