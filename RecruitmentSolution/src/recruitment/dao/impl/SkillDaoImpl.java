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
import recruitment.dao.SkillDao;
import recruitment.model.Skill;
import recruitment.model.SkillCategory;
@Component("skillDao")
public class SkillDaoImpl implements SkillDao{
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
	public boolean deleteSkill(final Integer skillId) throws DataAccessException {
		List<Skill> skills = hibernateTemplate.find("from Skill s where s.skillId = '" + skillId + "'");
		if(skills != null && skills.size() > 0) {
			hibernateTemplate.executeWithNativeSession(
					new HibernateCallback() {
						@Override
						public Object doInHibernate(Session session)
						throws HibernateException, SQLException {
							return session.createQuery
							("delete Skill s where s.skillId='"+ skillId + "'").executeUpdate();
						}					
					});
			return true;
		}
		return false;
	}

	@Override
	public void save(Skill skill) throws DataAccessException {
		hibernateTemplate.save(skill);
	}

	@Override
	public boolean updateSkill(Integer skillId, String name,
			SkillCategory skillCategory) throws DataAccessException {
		Skill s = (Skill) this.hibernateTemplate.load(Skill.class,skillId);
		if(s!=null) {
			s.setName(name);
			s.setSkillCategory(skillCategory);
			//s.setSkillCategory((SkillCategory)this.hibernateTemplate.load(SkillCategory.class, skillCategory.getSkillCategoryId()));
			this.hibernateTemplate.saveOrUpdate(s);
			return true;
		}
		return false;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Skill> getSkills(Skill skill) throws DataAccessException {
		StringBuffer hql = new StringBuffer();
		Map<String,Object> map = new HashMap<String,Object>();
		hql.append( " from Skill s where 1=1 ");
		if(null!=skill && skill.getSkillId()!=null && skill.getSkillId()!=0) {
			hql.append(" and s.skillId like :skillId ");
			map.put("skillId",+ skill.getSkillId());
		}
		if(null!= skill &&null!=skill.getName()&&!"".equals(skill.getName())) {
			hql.append(" and LOWER(s.name) like LOWER(:name) ");
			map.put("name","%"+ skill.getName()+"%");
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
	
	@SuppressWarnings("unchecked")
	public List<Skill> getSkillsBySc(SkillCategory sc) throws DataAccessException {
		return (List<Skill>) this.hibernateTemplate.find("from Skill s where s.skillCategory.skillCategoryId = '" + sc.getSkillCategoryId() + "'");
	}
	
	@Override
	public Skill loadById(Integer skillId) throws DataAccessException {
		return (Skill) this.hibernateTemplate.load(Skill.class, skillId);
	}

	

}
