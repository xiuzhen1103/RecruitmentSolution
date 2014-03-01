package recruitment.dao.impl;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import recruitment.dao.JobDao;
import recruitment.model.Area;
import recruitment.model.Employer;
import recruitment.model.Job;
import recruitment.model.JobCategory;
@Component("jobDao")
public class JobDaoImpl implements JobDao {
	private HibernateTemplate hibernateTemplate; 
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	@Override
	public boolean deleteJob(final Integer jobId) throws DataAccessException {
		List<Job> jobs = hibernateTemplate.find("from Job j where j.areaId = '" + jobId + "'");
		if(jobs != null && jobs.size() > 0) {
			hibernateTemplate.executeWithNativeSession(
					new HibernateCallback() {
						@Override
						public Object doInHibernate(Session session)
						throws HibernateException, SQLException {
							return session.createQuery
							("delete Job j where j.jobId='"+jobId + "'").executeUpdate();
						}					
					});
			return true;
		}
		return false;
	}
	

	@Override
	public List<Job> getJobs() throws DataAccessException {
		return (List<Job>)this.hibernateTemplate.find("from Job");
	}

	@Override
	public Job loadByJobId(Integer jobId) throws DataAccessException {
		return (Job) this.hibernateTemplate.load(Job.class, jobId);
	}

	@Override
	public void save(Job job) throws DataAccessException {
		hibernateTemplate.save(job);
	}
	@Override
	public boolean updateJob(Integer jobId, String jobDesc, Date startDate,
			String address, String phone, Integer numPosition, String requirement,
			Integer salary, Employer employer, Area area,
			JobCategory jobCategory) throws DataAccessException {
		Job j = (Job) this.hibernateTemplate.load(Job.class,jobId);
		if(j!=null) {
			j.setJobDesc(jobDesc);
			j.setStartDate(startDate);
			j.setAddress(address);
			j.setPhone(phone);
			j.setNumPosition(numPosition);
			j.setNumPosition(numPosition);
			j.setRequirement(requirement);
			j.setJobCategory(jobCategory);
			j.setEmployer(employer);
			j.setArea(area);
			j.setJobCategory(jobCategory);
			this.hibernateTemplate.saveOrUpdate(j);
			return true;
		}
		return false;
	}

}
