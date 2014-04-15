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
	public Employer loadByEmpId(Employer emp) throws Exception{
		return this.employerDao.loadByEmpId(emp.getEmpId());
	}
	@Override
	public List<Employer> getEmployers(Employer emp) throws Exception{
			return this.employerDao.getEmployers(emp);
		}
	@Override
	public Employer login(Employer emp) throws Exception {
		return employerDao.empAuthenticate(emp.getEmail(), emp.getPassword());
	}
	@Override
	public boolean deleteEmployer(Employer emp) throws Exception {
		return employerDao.deleteEmp(emp.getEmpId());
	}
	@Override
	public boolean update(Employer emp) throws Exception{
		return employerDao.updateEmp(emp.getEmpId(), emp.getPhone(), emp.getContactName(),
				emp.getCompanyName(), emp.getAddress(), emp.getAddress(), 
				emp.getCompanySize(), emp.getCompanyType());
	}
	@Override
	public boolean updatePassword(Employer emp, String currentPassword)
			throws Exception {
		return employerDao.updatePassword(emp.getEmpId(), currentPassword, emp.getPassword(), emp.getPassword2());
	}
	
}

