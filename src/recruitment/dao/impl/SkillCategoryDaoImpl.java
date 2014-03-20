package recruitment.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import recruitment.dao.SkillCategoryDao;
import recruitment.model.Area;
import recruitment.model.SkillCategory;

@Component("skillCategoryDao")
public class SkillCategoryDaoImpl implements SkillCategoryDao{
	private HibernateTemplate hibernateTemplate; 

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean deletePSkillCategory(final Integer skillCategoryId) throws DataAccessException {
		List<SkillCategory> scs = hibernateTemplate.find("from SkillCategory sc where sc.skillCategoryId = '" + skillCategoryId + "'");
		if(scs != null && scs.size() > 0) {
			hibernateTemplate.executeWithNativeSession(
					new HibernateCallback() {
						@Override
						public Object doInHibernate(Session session)
						throws HibernateException, SQLException {
							return session.createQuery("delete SkillCategory sc where sc.skillCategoryId='"+skillCategoryId + "'").executeUpdate();
						}					
					});
			return true;
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SkillCategory> getSkillCategory(SkillCategory sc)
	throws DataAccessException {
		StringBuffer hql = new StringBuffer();
		Map<String,Object> map = new HashMap<String,Object>();
		hql.append( " from SkillCategory sc where 1=1 ");
		if(null!=sc && sc.getSkillCategoryId()!=null && sc.getSkillCategoryId()!=0) {
			hql.append(" and sc.skillCategoryId like :skillCategoryId ");
			map.put("skillCategoryId",+ sc.getSkillCategoryId());
		}

		if(null!= sc &&null!=sc.getName()&&!"".equals(sc.getName())) {
			hql.append(" and LOWER(sc.name) like LOWER(:name) ");
			map.put("name","%"+ sc.getName()+"%");
		}

		Query query  = this.hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql.toString());
		if (null != map && map.size() >= 1) {
			Iterator<String> it = map.keySet().iterator();
			while (it.hasNext()) {
				String key = (String) it.next();
				query.setParameter(key, map.get(key));
			}
		}
		return query.list();
	}

	@Override
	public void save(SkillCategory sc) throws DataAccessException {
		hibernateTemplate.save(sc);
	}

	@Override
	public boolean updateSkillCategory(Integer skillCategoryId, String name) throws DataAccessException {
		SkillCategory sc = (SkillCategory) this.hibernateTemplate.load(SkillCategory.class,skillCategoryId);
		if(sc!=null) {
			sc.setName(name);
			
			this.hibernateTemplate.saveOrUpdate(sc);
			return true;
		}
		return false;
	}

	@Override
	public SkillCategory loadById(Integer skillCategoryId)
	throws DataAccessException {
		return (SkillCategory) this.hibernateTemplate.load(SkillCategory.class, skillCategoryId);
	}

	@Override
	public List<SkillCategory> listMainSkillCategory(SkillCategory sc) {
		StringBuffer hql = new StringBuffer();
		Map<String,Object> map = new HashMap<String,Object>();
		hql.append( " from SkillCategory s where 1=1 and level =0");
		if(null!=sc && sc.getSkillCategoryId()!=null )  {
			hql.append(" and s.skillCategoryId = :skillCategoryId");
			map.put("skillCategoryId",+ sc.getSkillCategoryId());
		}
		if(null!= sc &&null!=sc.getName()&&!"".equals(sc.getName())) {
			hql.append(" and LOWER(s.name) like LOWER(:name) ");
			map.put("name","%"+ sc.getName()+"%");
		}
		Query query  = this.hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql.toString());
		if (null != map && map.size() >= 1) {
			Iterator<String> it = map.keySet().iterator();
			while (it.hasNext()) {
				String key = it.next();
				query.setParameter(key, map.get(key));
			}
		}
		return query.list();
	}
	
	@Override
	public List<SkillCategory> getSubSkillCategory(SkillCategory sc) throws DataAccessException {
		SkillCategory scs = this.loadById(sc.getSkillCategoryId());
			return scs.getChildrenSkillJobCategory();
	}
	


}
