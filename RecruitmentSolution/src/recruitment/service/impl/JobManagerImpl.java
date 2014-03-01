package recruitment.service.impl;


import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Component;
import recruitment.dao.JobDao;
import recruitment.model.CV;
import recruitment.model.Job;
import recruitment.model.JobSeeker;

import recruitment.service.JobManager;
@Component("jobManager")
public class JobManagerImpl implements JobManager {
	private JobDao jobDao;
	
	public JobDao getJobDao() {
		return jobDao;
	}
	
	@Resource
	public void setJobDao(JobDao jobDao) {
		this.jobDao = jobDao;
	}

	@Override
	public void add(Job job) throws Exception {
		jobDao.save(job);
	}

	@Override
	public boolean delete(Job job) throws Exception {
		return jobDao.deleteJob(job.getJobId());
	}

	@Override
	public List<Job> getJobs(Job job) throws Exception {
		return jobDao.getJobs(job);
	}

	@Override
	public Job loadById(Job job) throws Exception {
		return jobDao.loadByJobId(job.getJobId());
	}

	@Override
	public boolean update(Job job) throws Exception {
		return jobDao.updateJob(job.getJobId(), job.getJobDesc(), job.getStartDate(), job.getAddress(),
				job.getPhone(), job.getNumPosition(),
				job.getRequirement(), job.getSalary(), job.getEmployer(), job.getCountryId(),
				job.getCountyId(),job.getDistrictId(), job.getJobCategory());
	}

	@Override
	public List<Job> loadTitle(Job job) throws Exception {
		// TODO Auto-generated method stub
		return jobDao.loadByTitle(job.getTitle());
	}

	@Override
	public List<Job> getJobsByCategory(Job job) throws Exception {
		return jobDao.getJobsByCategory(job);
	}

	@Override
	public List<JobSeeker> listJsByApplyJobId(Job job) throws Exception {
		return jobDao.listJsByApplyJobId(job.getJobId());
	}

	@Override
	public List<CV> listCVByJsId(Job job, JobSeeker js) throws Exception {
		return jobDao.listCVByJsId(job.getJobId(), js.getJsId());
	}

	





}
