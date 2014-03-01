package recruitment.dao.impl;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import recruitment.dao.JobSeekerDao;
import recruitment.model.Employer;
import recruitment.model.JobSeeker;


@Component("jobSeekerDao")
public class JobSeekerDaoImpl implements JobSeekerDao {

	private HibernateTemplate hibernateTemplate; 
	public void save(JobSeeker js) throws DataAccessException{
		hibernateTemplate.save(js);	
	}

	public boolean jSUserNameExists(String username) throws DataAccessException{
		List<JobSeeker> jobSeekers = hibernateTemplate.find("from JobSeeker js where js.username = '" + username + "'");
		if(jobSeekers != null && jobSeekers.size() > 0) {
			return true;
		}
		return false;
	}

	public boolean jSEmailExists(String email) throws DataAccessException{
		List<JobSeeker> jobSeekers = hibernateTemplate.find("from JobSeeker js where js.email = '" + email + "'");
		if(jobSeekers != null && jobSeekers.size() > 0) {
			return true;
		}
		return false;
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public List<JobSeeker> getJobSeekers() throws DataAccessException{
		return  (List<JobSeeker>)this.hibernateTemplate.find("from JobSeeker");
	}

	@Override
	public JobSeeker loadByJsId(Integer jsId) throws DataAccessException{
		return (JobSeeker) this.hibernateTemplate.load(JobSeeker.class, jsId);
	}

	@Override
	public boolean jsAuthenticate(String email, String password) throws DataAccessException{
		List<JobSeeker> jobseekers = hibernateTemplate.find("from JobSeeker js where js.email='"+email + "' and js.password='"+ password + "'");
		if(jobseekers != null && jobseekers.size() > 0) {
			return true;
		}
		return false;
	}

	public boolean updateJs(final Integer jsId,
			final String name, final String address, final String phone,
			final Integer expectedSalary) throws DataAccessException
			{
		JobSeeker js = (JobSeeker) this.hibernateTemplate.load(JobSeeker.class, jsId);
		if(js!=null) {
			js.setName(name);
			js.setAddress(address);
			js.setPhone(phone);
			js.setExpectedSalary(expectedSalary);
			this.hibernateTemplate.saveOrUpdate(js);

			return true;
		}
		return false;
			}

	@Override
	public boolean deleteJs(final Integer jsId) throws DataAccessException{
		List<JobSeeker> jobSeekers = hibernateTemplate.find("from JobSeeker js where js.jsId = '" + jsId + "'");
		if(jobSeekers != null && jobSeekers.size() > 0) {
			hibernateTemplate.executeWithNativeSession(
					new HibernateCallback() {
						@Override
						public Object doInHibernate(Session session)
						throws HibernateException, SQLException {
							return session.createQuery("delete JobSeeker js where js.jsId='"+jsId + "'").executeUpdate();
						}					
					});
			return true;
		}
		return false;
	}

	

	


}
