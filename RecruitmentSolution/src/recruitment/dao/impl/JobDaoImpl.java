package recruitment.dao.impl;

import java.sql.SQLException;
import java.util.Date;
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

import recruitment.dao.JobDao;
import recruitment.model.ApplyJob;
import recruitment.model.Area;
import recruitment.model.CV;
import recruitment.model.Employer;
import recruitment.model.Job;
import recruitment.model.JobCategory;
import recruitment.model.JobSeeker;
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
	@SuppressWarnings("unchecked")
	@Override
	public boolean deleteJob(final Integer jobId) throws DataAccessException {
		List<Job> jobs = hibernateTemplate.find("from Job j where j.jobId = '" + jobId + "'");

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

	@SuppressWarnings("unchecked")
	@Override
	public List<Job> getJobs(final Job job) throws DataAccessException {
		StringBuffer hql = new StringBuffer();
		Map<String,Object> map = new HashMap<String,Object>();

		hql.append(" from Job j where 1=1 ");
		if(null!=job && job.getJobId()!=null && job.getJobId()!=0)  {
			hql.append(" and j.jobId = :jobId");
			map.put("jobId",+ job.getJobId());
		}

		if(null!=job &&null!=job.getEmployer() && job.getEmployer().getEmpId()!=0)  {
			hql.append(" and j.employer.empId =:empId");
			map.put("empId",+ job.getEmployer().getEmpId());
		}

		if(null!= job &&null!=job.getTitle()&&!"".equals(job.getTitle())) {
			hql.append(" and LOWER(j.title) like LOWER(:title) ");
			map.put("title","%"+ job.getTitle()+"%");
		}

		if(null!=job &&null!=job.getJobCategory()&&!"".equals(job.getJobCategory().getName())) {
			hql.append(" and LOWER(j.jobCategory.name) like LOWER(:name) " );
			map.put("name","%"+ job.getJobCategory().getName()+"%");
		}
		
		if(null!=job &&null!=job.getCountryId()&& job.getCountryId().getAreaId()!=0) {
			hql.append(" and j.countryId.areaId = :countryId " );
			map.put("countryId",+ job.getCountryId().getAreaId());
		}
		
		if(null!=job &&null!=job.getCountyId()&& job.getCountyId().getAreaId()!=0) {
			hql.append(" and j.countyId.areaId = :countyId " );
			map.put("countyId",+ job.getCountyId().getAreaId());
		}
		
		if(null!=job &&null!=job.getDistrictId()&& null!=job.getDistrictId().getAreaId() && job.getDistrictId().getAreaId()!=0) {
			hql.append(" and j.districtId.areaId = :districtId" );
			map.put("districtId",+ job.getDistrictId().getAreaId());
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

	public JobSeeker getJobSeeker() throws DataAccessException {
		JobSeeker js = (JobSeeker) ServletActionContext.getRequest().getSession().getAttribute("jobSeeker");
		Integer jsId =js.getJsId();
		return (JobSeeker) this.hibernateTemplate.load(JobSeeker.class, jsId);
	}

	
	public List<Job> getJobsByCategory(final Job job) throws DataAccessException {
		//List<Job>jobs = getJobs(job);
		Integer id = getJobSeeker().getJobCategory().getJobCaId();
		//return  hibernateTemplate.find(" from  Job j where j.jobCategory.jobCaId =" + id);
		
		StringBuffer hql = new StringBuffer();
		Map<String,Object> map = new HashMap<String,Object>();

		hql.append(" from Job j where j.jobCategory.jobCaId =" + id + " and 1=1 ");
		if(null!=job && job.getJobId()!=null && job.getJobId()!=0)  {
			hql.append(" and j.jobId = :jobId");
			map.put("jobId",+ job.getJobId());
		}
		
		if(null!=job &&null!=job.getEmployer() && job.getEmployer().getEmpId()!=0)  {
			hql.append(" and j.employer.empId =:empId");
			map.put("empId",+ job.getEmployer().getEmpId());
		}

		if(null!= job &&null!=job.getTitle()&&!"".equals(job.getTitle())) {
			//hql.append(" and j.title like :title ");
			hql.append(" and LOWER(j.title) like LOWER(:title) ");
			map.put("title","%"+ job.getTitle()+"%");
		}

		if(null!=job &&null!=job.getJobCategory()&&!"".equals(job.getJobCategory().getName())) {
			hql.append(" and LOWER(j.jobCategory.name) like LOWER(:name) " );
			map.put("name","%"+ job.getJobCategory().getName()+"%");
		}

		if(null!=job &&null!=job.getCountryId()&& job.getCountryId().getAreaId()!=0) {
			hql.append(" and j.countryId.areaId = :countryId " );
			map.put("countryId",+ job.getCountryId().getAreaId());
		}
		
		if(null!=job &&null!=job.getCountyId()&& job.getCountyId().getAreaId()!=0) {
			hql.append(" and j.countyId.areaId = :countyId " );
			map.put("countyId",+ job.getCountyId().getAreaId());
		}
		
		if(null!=job &&null!=job.getDistrictId()&& null!=job.getDistrictId().getAreaId() && job.getDistrictId().getAreaId()!=0) {
			hql.append(" and j.districtId.areaId = :districtId" );
			map.put("districtId",+ job.getDistrictId().getAreaId());
		
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
	public Job loadByJobId(Integer jobId) throws DataAccessException {
		return (Job) this.hibernateTemplate.load(Job.class, jobId);
	}

	@Override
	public void save(Job job) throws DataAccessException {
		Integer radioList = job.getRadioList();
		JobCategory jc  = (JobCategory) this.hibernateTemplate.load(JobCategory.class, radioList);
		job.setJobCategory(jc);
		hibernateTemplate.save(job);
		this.hibernateTemplate.flush();
	}

	@Override
	public boolean updateJob(Integer jobId, String jobDesc, String startDate,
			String address, String phone, Integer numPosition, String requirement,
			Integer salary, Employer employer, Area countryId, Area countyId, Area districtId,
			JobCategory jobCategory) throws DataAccessException {
		Job job = (Job) this.hibernateTemplate.load(Job.class,jobId);
		if(job!=null) {
			job.setJobDesc(jobDesc);
			job.setStartDate(startDate);
			job.setAddress(address);
			job.setPhone(phone);
			job.setNumPosition(numPosition);
			job.setNumPosition(numPosition);
			job.setRequirement(requirement);
			job.setSalary(salary);
			job.setEmployer(employer);
			job.setCountryId(countryId);
			job.setCountryId(countyId);
			job.setCountryId(districtId);
			job.setJobCategory(jobCategory);
			this.hibernateTemplate.saveOrUpdate(job);
			return true;
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Job> loadByTitle(String title) throws DataAccessException {
		return (List<Job>)this.hibernateTemplate.find("from Job j where j.title = '" + title + "'");
	}
	

	@SuppressWarnings("unchecked")
	@Override
	public List<JobSeeker> listJsByApplyJobId(Integer jobId) throws DataAccessException {
		StringBuffer in = new StringBuffer();		
		List<ApplyJob> applyJobs = (List<ApplyJob>) this.hibernateTemplate.find("from ApplyJob ap where ap.job.jobId = '" + jobId + "'");
		for(ApplyJob a : applyJobs) {
			in.append(String.valueOf(a.getJobseeker().getJsId())).append(",");
		}
		String ids = in.substring(0,in.length()-1);
		System.out.println(ids.toString());
		return (List<JobSeeker>) hibernateTemplate.find("from JobSeeker js where js.jsId in(" + ids + ")");
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CV> listCVByJsId(Integer jobId, Integer jsId) throws DataAccessException {
		StringBuffer in = new StringBuffer();
		//List<JobSeeker> jsList =listJsByApplyJobId(jobId);
		
		List<ApplyJob> applyJobs = (List<ApplyJob>) this.hibernateTemplate.find
		("from ApplyJob ap where ap.job.jobId = " + jobId + " and ap.jobseeker.jsId = " + jsId);
		
		for(ApplyJob a : applyJobs) {
			in.append(String.valueOf(a.getCv().getCvId())).append(",");
		}
		
		String ids = in.substring(0,in.length()-1);
		System.out.println(ids.toString());
		
		return (List<CV>) hibernateTemplate.find("from CV cv where cv.cvId in(" + ids + ")");
		
	}
	

}