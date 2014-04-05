package recruitment.dao.impl;
import java.sql.SQLException;
import java.util.List;
import javax.annotation.Resource;
import org.apache.struts2.ServletActionContext;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import recruitment.dao.CVDao;
import recruitment.model.CV;
import recruitment.model.JobSeeker;

@Component("cvDao")
public class CVDaoImpl implements CVDao {
	private HibernateTemplate hibernateTemplate; 

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public boolean deleteCV(final Integer cvId) throws DataAccessException {
		List<CV> cvs = hibernateTemplate.find("from CV cv where cv.cvId = '" + cvId + "'");
		if(cvs != null && cvs.size() > 0) {
			hibernateTemplate.executeWithNativeSession(
					new HibernateCallback() {
						@Override
						public Object doInHibernate(Session session)
						throws HibernateException, SQLException {
							return session.createQuery
							("delete CV cv where cv.cvId='"+cvId + "'").executeUpdate();
						}					
					});
			return true;
		}
		return false;
	}

	@Override
	public void save(CV cv) throws DataAccessException {
		hibernateTemplate.save(cv);
	}

	@Override
	public boolean updateCV(Integer cvId, String cvTitle, String coverLetter, 
			JobSeeker jobSeeker) throws DataAccessException {

		CV cv = (CV) this.hibernateTemplate.load(CV.class,cvId);
		if(cv!=null) {
			cv.setCvTitle(cvTitle);
			cv.setCoverLetter(coverLetter);
			this.hibernateTemplate.saveOrUpdate(cv);
			return true;
		}
		return false;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<CV> getCVbyJsId(CV cv) throws DataAccessException {
		JobSeeker js = (JobSeeker) ServletActionContext.getRequest().getSession().getAttribute("jobSeeker");
		Integer id = js.getJsId();
		StringBuffer hql = new StringBuffer();
		hql.append( " from CV ");
		hql.append(" where jsId =  "+  id);
		List<CV>  list = null;
		try{
			list = 	(List<CV>)this.hibernateTemplate.find(hql.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public CV loadByCVId(Integer cvId) throws DataAccessException{
		return (CV) this.hibernateTemplate.load(CV.class, cvId);
	}



}
