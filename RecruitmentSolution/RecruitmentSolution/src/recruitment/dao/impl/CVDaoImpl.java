package recruitment.dao.impl;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

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
	public boolean updateCV(Integer cvId, String cvTitle, String cvDesc, String coverLetter, 
			String updateCV, JobSeeker jobSeeker) throws DataAccessException {
		
		CV cv = (CV) this.hibernateTemplate.load(CV.class,cvId);
		if(cv!=null) {
			cv.setCvTitle(cvTitle);
			cv.setCvDesc(cvDesc);
			cv.setCoverLetter(coverLetter);
			cv.setUploadCV(updateCV);
			this.hibernateTemplate.saveOrUpdate(cv);
			return true;
		}
		return false;
	}


}
