package recruitment.service;

import java.util.List;

import recruitment.model.JobSeeker;


public interface JobSeekerManager {

	public boolean checkJsUsernameExists(JobSeeker js) throws Exception;
	
	public  boolean checkJsEmailExists(JobSeeker js) throws Exception;
	
	public void add(JobSeeker js) throws Exception;
	
	public List<JobSeeker> getJobSeekers()throws Exception;
	
	public JobSeeker loadByJsId(Integer jsId) throws Exception;
	
	public boolean login(String email, String password) throws Exception;
	
	public boolean deleteJobSeeker(Integer jsId) throws Exception;
	
	public boolean update(Integer jsId, String username, String password,
			String name, String address, String email, String phone,
			Integer expectedSalary) throws Exception;

}