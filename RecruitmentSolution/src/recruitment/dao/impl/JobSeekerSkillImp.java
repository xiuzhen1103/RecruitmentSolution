package recruitment.dao.impl;

import java.sql.SQLException;
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

import recruitment.dao.JobSeekerSkillDao;
import recruitment.model.Job;
import recruitment.model.JobSeekerSkill;
@Component("jobSeekerSkillDao")
public class JobSeekerSkillImp implements JobSeekerSkillDao {
	private HibernateTemplate hibernateTemplate; 

	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public boolean deleteJobSeekerSkill(final Integer jobSeekerSkillId) {
	List<JobSeekerSkill> skills = hibernateTemplate.find("from JobSeekerSkill j where j.jobSeekerSkillId = '" + jobSeekerSkillId + "'");

	if(skills != null && skills.size() > 0) {
		hibernateTemplate.executeWithNativeSession(
				new HibernateCallback() {
					@Override
					public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
						return session.createQuery
						("delete JobSeekerSkill j where j.jobSeekerSkillId='"+jobSeekerSkillId + "'").executeUpdate();
					}					
				});
		return true;
	}
	return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<JobSeekerSkill> getJobSeekerSkills(JobSeekerSkill jobSeekerSkill)
			throws DataAccessException {
		StringBuffer hql = new StringBuffer();
		Map<String,Object> map = new HashMap<String,Object>();

		hql.append(" from JobSeekerSkill j where 1=1 ");
		if(null!=jobSeekerSkill && jobSeekerSkill.getJobSeekerSkillId()!=null&& jobSeekerSkill.getJobSeekerSkillId()!=0){
			hql.append(" and j.jobSeekerSkillId like :jobSeekerSkillId" );
			map.put("jobSeekerSkillId",+ jobSeekerSkill.getJobSeekerSkillId());
		}
		
		if(null!=jobSeekerSkill && null!=jobSeekerSkill.getJobSeeker()&& null!=jobSeekerSkill.getJobSeeker().getJsId() && jobSeekerSkill.getJobSeeker().getJsId()!=0)  {
			hql.append(" and j.jobSeeker.jsId like :jsId" );
			map.put("jsId",+ jobSeekerSkill.getJobSeeker().getJsId());
		}
		if(null!=jobSeekerSkill && null!=jobSeekerSkill.getSkill()&& null!=jobSeekerSkill.getSkill().getSkillId() && jobSeekerSkill.getSkill().getSkillId()!=0)  {
			hql.append(" and j.skill.skillId like :skillId" );
			map.put("skillId",+ jobSeekerSkill.getSkill().getSkillId());
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
	public void save(JobSeekerSkill jobSeekerSkill) throws DataAccessException {
		hibernateTemplate.save(jobSeekerSkill);

	}

}
