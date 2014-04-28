package recruitment.service;

import java.util.List;

import recruitment.model.Employer;

public interface EmployerManager {
public abstract boolean checkEmpUsernameExists(Employer emp) throws Exception;
	
	public boolean checkEmpEmailExists(Employer emp) throws Exception;
	
	public void addEmp(Employer emp) throws Exception;
	
	public List<Employer> getEmployers(Employer emp) throws Exception;
	
	public Employer loadByEmpId(Employer emp) throws Exception;

	public Employer login(Employer emp) throws Exception;
	
	public boolean deleteEmployer(Employer emp) throws Exception;
	
	public boolean update(Employer emp) throws Exception;
	
	public boolean updatePassword(Employer emp, String currentPassword) throws Exception;

	public  List<Employer> sortEmpByParamAsc(String sort);

	public  List<Employer> sortEmpByParamDesc(String sort);
	
}