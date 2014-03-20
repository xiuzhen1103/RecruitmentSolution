package recruitment.dao.impl;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.struts2.ServletActionContext;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import recruitment.dao.EmployerDao;
import recruitment.model.Employer;


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
	public List<Employer> getEmployers(Employer emp) throws DataAccessException{
		StringBuffer hql = new StringBuffer();
		Map<String,Object> map = new HashMap<String,Object>();
		hql.append( " from Employer e where 1=1 ");
		if(null!=emp&&emp.getEmpId()!=null&&emp.getEmpId()!=0){
			hql.append(" and LOWER(e.empId) like LOWER(:empId)" );
			
			map.put("empId",+ emp.getEmpId());
		}
		if(null!= emp &&null!=emp.getCompanyName()&&!"".equals(emp.getCompanyName())) {
			hql.append(" and LOWER(e.companyName) like LOWER(:companyName) ");
			map.put("companyName","%"+ emp.getCompanyName()+"%");
		}
		
		if(null!= emp &&null!=emp.getEmail()&&!"".equals(emp.getEmail())) {
			hql.append(" and LOWER(e.email) like LOWER(:email) ");
			map.put("email","%"+ emp.getEmail()+"%");
		}
		
		if(null!= emp &&null!=emp.getContactName()&&!"".equals(emp.getContactName())) {
			hql.append(" and LOWER(e.contactName) like LOWER(:contactName) ");
			map.put("contactName","%"+ emp.getContactName()+"%");
		}
		
		Query query  = this.hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(hql.toString());
		if (null != map && map.size() >= 1) {
			Iterator<String> it = map.keySet().iterator();
			while (it.hasNext()) {
				String key = (String) it.next();
				query.setParameter(key, map.get(key));
			}
		}
		return query.list();
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
	public Employer empAuthenticate(String email, String password) throws DataAccessException{
		Employer employer = null;
		List<Employer> employers = hibernateTemplate.find("from Employer e where e.email='"+email + "' and e.password='"+ password + "'");
		if(employers != null && employers.size() > 0) {
			employer  = employers.get(0);
			ServletActionContext.getRequest().getSession().setAttribute("employer", employer);
		}
			return employer;
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

	@Override
	public boolean updatePassword(Integer empId, String currentPassword, String password, String password2)
			throws DataAccessException {
		Employer emp = (Employer) this.hibernateTemplate.load(Employer.class, empId);
		if(emp!=null && emp.getPassword().equals(currentPassword) && password.equals(password2)) {
			emp.setPassword(password);
			this.hibernateTemplate.saveOrUpdate(emp);
			return true;
		}
		return false;
	}
	
	
	
	

}
