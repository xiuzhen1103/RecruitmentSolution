package recruitment.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import recruitment.dao.JobDao;
import recruitment.model.Area;
import recruitment.model.Employer;
import recruitment.model.Job;
import recruitment.model.JobCategory;
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
	public boolean delete(Integer jobId) throws Exception {
		return jobDao.deleteJob(jobId);
	}

	@Override
	public List<Job> getJobs() throws Exception {
		return jobDao.getJobs();
	}

	@Override
	public Job loadById(Integer jobId) throws Exception {
		return jobDao.loadByJobId(jobId);
	}

	@Override
	public boolean update(Integer jobId, String jobDesc, Date startDate,
			String address, String phone, Integer numPosition,
			String requirement, Integer salary, Employer employer, Area area,
			JobCategory jobCategory) throws Exception {
		return jobDao.updateJob(jobId, jobDesc, startDate, address, phone, numPosition, requirement, salary, employer, area, jobCategory);
	}

}
