package recruitment.dao.impl;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import recruitment.dao.JobCategoryDao;
import recruitment.model.Administrator;
import recruitment.model.Area;
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
		List<JobCategory> jobCategories = hibernateTemplate.find("from JobCategory jc where jc.areaId = '" + jobCaId + "'");
		if(jobCategories != null && jobCategories.size() > 0) {
			hibernateTemplate.executeWithNativeSession(
					new HibernateCallback() {
						@Override
						public Object doInHibernate(Session session)
						throws HibernateException, SQLException {
							return session.createQuery
							("delete JobCategory jc where jc.areaId='"+jobCaId + "'").executeUpdate();
						}					
					});
			return true;
		}
		return false;
	}
	@Override
	public boolean update(Integer jobCaId, String name, Integer parentId, Integer level)
	throws DataAccessException {
		JobCategory jc = (JobCategory) this.hibernateTemplate.load(JobCategory.class,jobCaId);
		if(jc!=null) {
			jc.setName(name);
			jc.setParentJobCategory((JobCategory)this.hibernateTemplate.load(JobCategory.class, parentId));
			this.hibernateTemplate.saveOrUpdate(jc);
			return true;
		}
		return false;
	}

}
