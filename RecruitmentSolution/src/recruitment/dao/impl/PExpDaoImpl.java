package recruitment.dao.impl;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import recruitment.dao.PastExperienceDao;
import recruitment.model.JobSeeker;
import recruitment.model.PastExperience;
@Component("pxpDao")
public class PExpDaoImpl implements PastExperienceDao {
	private HibernateTemplate hibernateTemplate; 

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public boolean deletePEx(final Integer pxId) throws DataAccessException {
		List<PastExperience> pxs = hibernateTemplate.find("from PastExperience p where p.pxId = '" + pxId + "'");
		if(pxs != null && pxs.size() > 0) {
			hibernateTemplate.executeWithNativeSession(
					new HibernateCallback() {
						@Override
						public Object doInHibernate(Session session)
								throws HibernateException, SQLException {
							return session.createQuery
							("delete PastExperience p where p.pxId='"+pxId + "'").executeUpdate();
						}					
					});
			return true;
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PastExperience> getPExbyJsId(PastExperience pe) 
			throws DataAccessException {
		
		StringBuffer hql = new StringBuffer();
		Map<String,Object> map = new HashMap<String,Object>();

		hql.append(" from PastExperience p where 1=1 ");
		if(null!=pe && pe.getPxId()!=null&& pe.getPxId()!=0){
			hql.append(" and p.pxId like :pxId" );
			map.put("pxId",+ pe.getPxId());
		}
		
		if(null!=pe && null!=pe.getJobSeeker()&& null!=pe.getJobSeeker().getJsId() && pe.getJobSeeker().getJsId()!=0)  {
			hql.append(" and p.jobSeeker.jsId like :jsId" );
			map.put("jsId",+ pe.getJobSeeker().getJsId());
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
	public void save(PastExperience pe) throws DataAccessException {
		hibernateTemplate.save(pe);
	}

	@Override
	public boolean updatePEx(Integer pxId, String jobDescription, String duty,
			String empName, String email, String phone, String address,
			Date startDate, Date endDate, String reasonForLeave,
			JobSeeker jobSeeker) throws DataAccessException {
		PastExperience px = (PastExperience) this.hibernateTemplate.load(PastExperience.class,pxId);
		if(px!=null) {
			px.setJobDescription(jobDescription);
			px.setDuty(duty);
			px.setEmpName(empName);
			px.setEmail(email);
			px.setPhone(phone);
			px.setAddress(address);
			px.setStartDate(startDate);
			px.setEndDate(endDate);
			px.setReasonForLeave(reasonForLeave);
			px.setJobSeeker(jobSeeker);
			//pEx.setJobSeeker((JobSeeker)this.hibernateTemplate.load(JobCategory.class, jobSeeker.getJsId()));
			this.hibernateTemplate.saveOrUpdate(px);
			return true;
		}
		return false;
	}
}


