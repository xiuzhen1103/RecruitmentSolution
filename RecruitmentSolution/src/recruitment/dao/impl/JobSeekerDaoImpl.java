package recruitment.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import recruitment.dao.JobSeekerDao;
import recruitment.model.Employer;
import recruitment.model.Job;
import recruitment.model.JobCategory;
import recruitment.model.JobSeeker;
import recruitment.model.Skill;

@Component("jobSeekerDao")
public class JobSeekerDaoImpl implements JobSeekerDao {

	private HibernateTemplate hibernateTemplate; 
	public void save(JobSeeker js) throws DataAccessException{
		Integer radioList = js.getRadioList();
		JobCategory jc  = (JobCategory) this.hibernateTemplate.load(JobCategory.class, radioList);
		js.setJobCategory(jc);
		//Integer[] checkboxList = js.getCheckboxes();
		//Skill sc = (Skill) this.hibernateTemplate.load(Skill.class, checkboxList);
		//js.setSkill(sc);
		hibernateTemplate.save(js);	
	}

	@SuppressWarnings("unchecked")
	public boolean jSUserNameExists(String username) throws DataAccessException{
		List<JobSeeker> jobSeekers = hibernateTemplate.find("from JobSeeker js where js.username = '" + username + "'");
		if(jobSeekers != null && jobSeekers.size() > 0) {
			return true;
		}
		return false;
	}

	@SuppressWarnings("unchecked")
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

	@SuppressWarnings("unchecked")
	@Override
	public List<JobSeeker> getJobSeekers(JobSeeker js) throws DataAccessException{
		StringBuffer hql = new StringBuffer();
		Map<String,Object> map = new HashMap<String,Object>();
		hql.append( " from JobSeeker js where 1= 1");
		if(null!=js&&js.getJsId()!=null&&js.getJsId()!=0){
			hql.append(" and js.jsId like :jsId" );
			map.put("jsId",+ js.getJsId());
		}
		if(null!= js &&null!=js.getEmail()&&!"".equals(js.getEmail())) {
			hql.append(" and LOWER(js.email) like LOWER(:email) ");
			map.put("email","%"+ js.getEmail()+"%");
		}

		if(null!= js &&null!=js.getUsername()&&!"".equals(js.getUsername())) {
			hql.append(" and LOWER(js.username) like LOWER(:username) ");
			map.put("username","%"+ js.getUsername()+"%");
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
	public List<JobSeeker> getJsByJobCategory(JobSeeker js) throws DataAccessException{
		StringBuffer in = new StringBuffer();
		Employer emp = (Employer) ServletActionContext.getRequest().getSession().getAttribute("employer");
		Integer empId =emp.getEmpId();
		List<Job> jobs =  (List<Job>) hibernateTemplate.find("from Job j where j.employer.empId =" + empId);
		for(Job j : jobs) {
			in.append(String.valueOf(j.getJobCategory().getJobCaId())).append(","); 
		}
		String ids = in.substring(0,in.length()-1);
		System.out.println(ids.toString());
		return (List<JobSeeker>) hibernateTemplate.find("from JobSeeker js where js.jobCategory.jobCaId in(" + ids + ")");
	}


	public JobSeeker loadByEmail(JobSeeker js) throws DataAccessException {
		StringBuffer hql = new StringBuffer();
		hql.append( " from JobSeeker ");
		if(null!=js&&js.getEmail()!=null){
			hql.append(" where email =  "+js.getEmail());
		}
		return (JobSeeker)this.hibernateTemplate.find(hql.toString());
	}


	@Override
	public JobSeeker loadByJsId(Integer jsId) throws DataAccessException{
		return (JobSeeker) this.hibernateTemplate.load(JobSeeker.class, jsId);
	}

	@Override
	public JobSeeker jsAuthenticate(String email, String password) throws DataAccessException{
		JobSeeker jobSeeker = null;
		List<JobSeeker> jobseekers = hibernateTemplate.find("from JobSeeker js where js.email='"+email + "' and js.password='"+ password + "'");
		if(jobseekers != null && jobseekers.size() > 0) {
			jobSeeker  = jobseekers.get(0);
			ServletActionContext.getRequest().getSession().setAttribute("jobSeeker", jobSeeker);
		}
		return jobSeeker ;
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

	@Override
	public boolean updatePassword(Integer jsId, String currentPassword,
			String password, String password2) throws DataAccessException {
		JobSeeker js = (JobSeeker) this.hibernateTemplate.load(JobSeeker.class, jsId);
		if(js!=null && js.getPassword().equals(currentPassword) && password.equals(password2)) {
			js.setPassword(password);
			this.hibernateTemplate.saveOrUpdate(js);
			return true;
		}
		return false;
	}

}