package recruitment.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.JobSeeker;


public interface JobSeekerDao {
	public void save(JobSeeker js) throws DataAccessException;
	public boolean jSUserNameExists(String username) throws DataAccessException; 
	public boolean jSEmailExists(String email) throws DataAccessException;
	public List<JobSeeker> getJobSeekers() throws DataAccessException;
	public JobSeeker loadByJsId(Integer jsId) throws DataAccessException;
	public boolean jsAuthenticate(String email, String password) throws DataAccessException;
	public boolean deleteJs(Integer jsId) throws DataAccessException;
	public boolean updateJs(Integer jsId,String name,String address,
			String phone, Integer expectedSalary) throws DataAccessException;
}
