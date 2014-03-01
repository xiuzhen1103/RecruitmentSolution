package recruitment.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.dao.DataAccessException;

import recruitment.model.Job;
import recruitment.model.JobSeeker;


public interface JobSeekerDao {
	public void save(JobSeeker js) throws DataAccessException;
	public boolean jSUserNameExists(String username) throws DataAccessException; 
	public boolean jSEmailExists(String email) throws DataAccessException;
	public List<JobSeeker> getJobSeekers(JobSeeker js) throws DataAccessException;
	public JobSeeker loadByJsId(Integer jsId) throws DataAccessException;
	public JobSeeker jsAuthenticate(String email, String password) throws DataAccessException;
	public boolean deleteJs(Integer jsId) throws DataAccessException;
	public boolean updateJs(Integer jsId,String name,String address,
			String phone, Integer expectedSalary) throws DataAccessException;
	public JobSeeker loadByEmail(JobSeeker js) throws DataAccessException;
	public boolean updatePassword(Integer jsId,String currentPassword, String password, String password2) throws DataAccessException;
	public List<JobSeeker> getJsByJobCategory(JobSeeker js) throws DataAccessException;


}
