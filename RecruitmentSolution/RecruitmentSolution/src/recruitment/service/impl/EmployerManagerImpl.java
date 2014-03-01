package recruitment.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import recruitment.dao.EmployerDao;
import recruitment.model.Employer;
import recruitment.service.EmployerManager;


@Component("empManager")
public class EmployerManagerImpl implements EmployerManager {
	private EmployerDao employerDao;

	public EmployerDao getEmployerDao() {
		return employerDao;
	}
	@Resource
	public void setEmployerDao(EmployerDao employerDao) {
		this.employerDao = employerDao;
	}

	@Override
	public void addEmp(Employer emp) throws Exception {
		employerDao.save(emp);
	}

	@Override
	public boolean checkEmpEmailExists(Employer emp) throws Exception {
		return employerDao.empEmailExists(emp.getEmail());
	}

	@Override
	public boolean checkEmpUsernameExists(Employer emp) throws Exception {
		return employerDao.empUserNameExists(emp.getUsername());
	}

	@Override
	public Employer loadByEmpId(Integer empId) throws Exception{
		return this.employerDao.loadByEmpId(empId);
	}
	@Override
	public List<Employer> getEmployers() throws Exception{
			return this.employerDao.getEmployers();
		}
	@Override
	public boolean login(String email, String password) throws Exception {
		return employerDao.empAuthenticate(email, password);
	}
	@Override
	public boolean deleteEmployer(Integer empId) throws Exception {
		return employerDao.deleteEmp(empId);
	}
	@Override
	public boolean update(Integer empId, String phone, String conatctName,
			String companyName, String address, String webSite,
			Integer companySize, String companyType) throws Exception{
		return employerDao.updateEmp(empId, phone, conatctName, companyName, address, webSite, companySize, companyType);
	}
}
