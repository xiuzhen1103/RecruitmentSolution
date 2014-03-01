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

import recruitment.dao.JobCategoryDao;
import recruitment.model.Administrator;
import recruitment.model.Area;
import recruitment.model.Job;
import recruitment.model.JobCategory;

@Component("jobCategoryDao")
public class JobCategoryDaoImpl implements JobCategoryDao {
	private HibernateTemplate hibernateTemplate; 

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public void save(JobCategory jobCa) throws DataAccessException {
		hibernateTemplate.save(jobCa);

	}
	@Override
	public boolean delete(final Integer jobCaId) throws DataAccessException {
		List<JobCategory> jobCategories = hibernateTemplate.find("from JobCategory jc where jc.jobCaId = '" + jobCaId + "'");
		if(jobCategories != null && jobCategories.size() > 0) {
			hibernateTemplate.executeWithNativeSession(
					new HibernateCallback() {
						@Override
						public Object doInHibernate(Session session)
						throws HibernateException, SQLException {
							return session.createQuery
							("delete JobCategory jc where jc.jobCaId='"+jobCaId + "'").executeUpdate();
						}					
					});
			return true;
		}
		return false;
	}
	@Override
	public boolean update(Integer jobCaId, String name, Integer level,JobCategory parentJobCategory)
	throws DataAccessException {
		JobCategory jc = (JobCategory) this.hibernateTemplate.load(JobCategory.class,jobCaId);
		if(jc!=null) {
			//jc.setParentJobCategory(parentJobCategory);
			jc.setName(name);
			jc.setLevel(level);
			jc.setParentJobCategory((JobCategory)this.hibernateTemplate.load(JobCategory.class, parentJobCategory.getJobCaId()));
			
			this.hibernateTemplate.saveOrUpdate(jc);
			return true;
		}
		return false;
	}

	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<JobCategory> getJobCategories(JobCategory jc) throws DataAccessException {
		StringBuffer hql = new StringBuffer();
		Map<String,Object> map = new HashMap<String,Object>();
		hql.append( " from JobCategory jc where 1=1 ");

			if(null!=jc && jc.getJobCaId()!=null && jc.getJobCaId()!=0)  {
				hql.append(" and jc.jobCaId like :jobCaId");
				map.put("jobCaId",+ jc.getJobCaId());
			}
		
		
		if(null!= jc &&null!=jc.getName()&&!"".equals(jc.getName())) {
			hql.append(" and LOWER(jc.name) like LOWER(:name) ");
			map.put("name","%"+ jc.getName()+"%");
		}
		
		if(null!=jc && jc.getLevel()!=null)  {
			hql.append(" and jc.level like :level");
			map.put("level",+ jc.getLevel());
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
	public JobCategory loadById(Integer jobCaId) throws DataAccessException {
		return (JobCategory) this.hibernateTemplate.load(JobCategory.class, jobCaId);
	}

}
