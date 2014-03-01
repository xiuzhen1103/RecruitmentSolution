package recruitment.dao.impl;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import recruitment.dao.EmployerDao;
import recruitment.model.Employer;
import recruitment.model.JobSeeker;

@Component("employerDao")
public class EmployerDaoImpl implements EmployerDao{
	private HibernateTemplate hibernateTemplate; 

	public void save(Employer emp) throws DataAccessException{
		hibernateTemplate.save(emp);	
	}

	public boolean empEmailExists(String email) throws DataAccessException{
		List<Employer> employers = hibernateTemplate.find("from Employer emp where emp.email = '" + email + "'");
		if(employers != null && employers.size() > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean empUserNameExists(String username) throws DataAccessException{
		List<Employer> employers = hibernateTemplate.find("from Employer emp where emp.username = '" + username + "'");
		if(employers != null && employers.size() > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<Employer> getEmployers() throws DataAccessException{
		return (List<Employer>)this.hibernateTemplate.find("from Employer");
	}

	@Override
	public Employer loadByEmpId(Integer empId) throws DataAccessException{
		return (Employer) this.hibernateTemplate.load(Employer.class, empId);
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}


	@Override
	public boolean empAuthenticate(String email, String password) throws DataAccessException{

		List<Employer> employers = hibernateTemplate.find("from Employer e where e.email='"+email + "' and e.password='"+ password + "'");

		if(employers != null && employers.size() > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteEmp(final Integer empId) throws DataAccessException{
		List<Employer> employers = hibernateTemplate.find("from Employer emp where emp.empId = '" + empId + "'");
		if(employers != null && employers.size() > 0) {
			hibernateTemplate.executeWithNativeSession(
					new HibernateCallback() {
						@Override
						public Object doInHibernate(Session session)
						throws HibernateException, SQLException {
							return session.createQuery
							("delete Employer emp where emp.empId='"+empId + "'").executeUpdate();
						}					
					});
			return true;
		}
		return false;
	}

	@Override
	public boolean updateEmp(Integer empId, String phone, String conatctName,
			String companyName, String address, String webSite,
			Integer companySize, String companyType) throws DataAccessException{
		Employer emp = (Employer) this.hibernateTemplate.load(Employer.class, empId);
		if(emp!=null) {
		emp.setPhone(phone);
		emp.setContactName(conatctName);
		emp.setCompanyName(companyName);
		emp.setAddress(address);
		emp.setWebSite(webSite);
		emp.setCompanySize(companySize);
		emp.setCompanyType(companyType);
		this.hibernateTemplate.saveOrUpdate(emp);
		return true;
		}
		return false;
	}

}
