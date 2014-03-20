package recruitment.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.Employer;
import recruitment.model.JobSeeker;

public interface EmployerDao {
	public void save(Employer emp) throws DataAccessException;
	public boolean empUserNameExists(String username) throws DataAccessException; 
	public boolean empEmailExists(String email)throws DataAccessException;
	public List<Employer> getEmployers(Employer emp) throws DataAccessException;
	public Employer loadByEmpId(Integer empId) throws DataAccessException;
	public Employer empAuthenticate(String email, String password) throws DataAccessException;
	public boolean deleteEmp(Integer empId) throws DataAccessException;
	public boolean updateEmp(Integer empId, String phone, String conatctName, String companyName,
			String address, String webSite, Integer companySize, String companyType) throws DataAccessException;
	public boolean updatePassword(Integer empId,String currentPassword, String password, String password2) throws DataAccessException;
	
}
