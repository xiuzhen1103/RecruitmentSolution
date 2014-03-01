package recruitment.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.Employer;
import recruitment.model.Job;
import recruitment.model.JobSeeker;
import recruitment.model.JobSeekerSkill;


public interface JobSeekerManager {

	public boolean checkJsUsernameExists(JobSeeker js) throws Exception;
	
	public  boolean checkJsEmailExists(JobSeeker js) throws Exception;
	
	public void add(JobSeeker js) throws Exception;
	
	public List<JobSeeker> getJobSeekers(JobSeeker js)throws Exception;
	
	public JobSeeker loadByJsId(JobSeeker js) throws Exception;
	
	public JobSeeker login(JobSeeker js) throws Exception;
	
	public boolean deleteJobSeeker(JobSeeker js) throws Exception;
	
	public boolean update(JobSeeker js) throws Exception;

	public JobSeeker loadByEmail(JobSeeker js) throws Exception;
	
	public boolean updatePassword(JobSeeker js, String currentPassword) throws Exception;
	
	public List<JobSeeker> getJobsByCategory(JobSeeker js) throws Exception;
	

}