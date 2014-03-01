package recruitment.dao;

import java.util.Date;
import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.Area;
import recruitment.model.Employer;
import recruitment.model.Job;
import recruitment.model.JobCategory;



public interface JobDao {
	public Job loadByJobId(Integer jobId) throws DataAccessException;
	public boolean deleteJob(Integer jobId) throws DataAccessException;
	public void save(Job job) throws DataAccessException;
	public List<Job> getJobs() throws DataAccessException;
	public boolean updateJob(Integer jobId, String jobDesc, Date startDate, String address,
			String phone, Integer numPosition, String requirement, Integer salary, Employer employer, Area area, JobCategory jobCategory) throws DataAccessException;
}
