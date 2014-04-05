package recruitment.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.Area;
import recruitment.model.CV;
import recruitment.model.Employer;
import recruitment.model.Job;
import recruitment.model.JobSeeker;

public interface JobDao {
    public Job loadByJobId(Integer jobId) throws DataAccessException;
	public Job getByJobId(Integer jobId) throws DataAccessException;
	public List<Job> loadByTitle(String title) throws DataAccessException;
	public boolean deleteJob(Integer jobId) throws DataAccessException;
	public void save(Job job) throws DataAccessException;
	public List<Job> getJobs(Job job) throws DataAccessException;

	public List<Job> getJobsByCategory(final Job job) throws DataAccessException;
	public List<JobSeeker> listJsByApplyJobId(Integer jobId)
			throws DataAccessException;
	public List<CV> listCVByJsId(Integer jobId, Integer jsId)
			throws DataAccessException;

	 public boolean updateJob(Integer jobId, String jobDesc, String startDate,
			String address, String phone, Integer numPosition,
			String requirement, Integer salary, Employer employer,
			Area countryId, Area countyId, Area districtId
			) throws DataAccessException;

}
