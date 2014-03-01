package recruitment.service;

import java.util.Date;
import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.Area;
import recruitment.model.Employer;
import recruitment.model.Job;
import recruitment.model.JobCategory;

public interface JobManager {
	public Job loadById(Integer jobId) throws Exception;
	public boolean delete(Integer jobId) throws Exception;
	public void add(Job job) throws Exception;
	public List<Job> getJobs() throws Exception;
	public boolean update(Integer jobId, String jobDesc, Date startDate, String address,
			String phone, Integer numPosition, String requirement, Integer salary, Employer employer, 
			Area area, JobCategory jobCategory) throws Exception;

}
