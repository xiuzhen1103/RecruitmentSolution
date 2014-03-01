package recruitment.service;

import java.util.List;

import recruitment.model.Employer;

public interface EmployerManager {
public abstract boolean checkEmpUsernameExists(Employer emp) throws Exception;
	
	public abstract boolean checkEmpEmailExists(Employer emp) throws Exception;
	
	public abstract void addEmp(Employer emp) throws Exception;
	
	public List<Employer> getEmployers() throws Exception;
	
	public Employer loadByEmpId(Integer empId) throws Exception;

	public boolean login(String email, String password) throws Exception;
	
	public boolean deleteEmployer(Integer empId) throws Exception;
	
	public boolean update(Integer empId, String phone, String conatctName,
			String companyName, String address, String webSite,
			Integer companySize, String companyType) throws Exception;

}
