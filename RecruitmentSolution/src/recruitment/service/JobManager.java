package recruitment.service;

import java.util.Date;
import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.Area;
import recruitment.model.CV;
import recruitment.model.Employer;
import recruitment.model.Job;
import recruitment.model.JobCategory;
import recruitment.model.JobSeeker;

public interface JobManager {
	public List<Job> loadTitle(Job job) throws Exception;
	public Job loadById(Job job) throws Exception;
	public boolean delete(Job job) throws Exception;
	public void add(Job job) throws Exception;
	public List<Job> getJobs(Job job) throws Exception;
	public boolean update(Job joby) throws Exception;
	public List<Job> getJobsByCategory(Job job) throws Exception;
	public List<JobSeeker> listJsByApplyJobId(Job jobId)
	throws Exception;
	public List<CV> listCVByJsId(Job jobId, JobSeeker jsId) throws Exception;
}
