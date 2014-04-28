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
import org.springframework.util.StringUtils;

import recruitment.dao.InterviewRecordDao;
import recruitment.model.CV;
import recruitment.model.InterviewRecord;

@Component("interviewRecordDao")
public class InterviewRecordDaoImpl implements InterviewRecordDao {

    private HibernateTemplate hibernateTemplate;

    public HibernateTemplate getHibernateTemplate() {
        return hibernateTemplate;
    }

    @Resource
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    @Override
    @SuppressWarnings("unchecked")
    public InterviewRecord loadById(Integer InterviewId) throws DataAccessException {
        List<InterviewRecord> irs = (List<InterviewRecord>) this.hibernateTemplate.find(
                "from InterviewRecord ir join fetch ir.job where ir.interviewId = ?", InterviewId);
        if (null != irs && irs.size() > 0) {
            return irs.get(0);
        }
        return null;
    }

    @Override
    @SuppressWarnings("unchecked")
    public InterviewRecord loadByJobAndJsAndEmp(Integer jobId, Integer jsId, Integer empId) {
        List<InterviewRecord> irs = (List<InterviewRecord>) this.hibernateTemplate.find(
                "from InterviewRecord ir where ir.job.jobId = ? and ir.js.jsId = ? and ir.em.empId = ?",
                new Integer[]{jobId, jsId, empId});
        if (null != irs && irs.size() > 0) {
            return irs.get(0);
        }
        return null;
    }

    @Override
    public void save(InterviewRecord interviewRecord) throws DataAccessException {
        this.hibernateTemplate.save(interviewRecord);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<InterviewRecord> getInterviewRecords(InterviewRecord ir) throws DataAccessException {
        String hql = "from InterviewRecord ir where 1=1";
        if (ir.getEm() != null) {
            if (ir.getEm().getEmpId() != null) {
                hql += " and ir.em.empId = " + ir.getEm().getEmpId();
            }
        }
        if (ir.getJs() != null) {
            if (ir.getJs().getJsId() != null) {
                hql += " and ir.js.jsId = " + ir.getJs().getJsId();
            }
            if (StringUtils.hasText(ir.getJs().getName())) {
                hql += " and ir.js.name LIKE '%" + ir.getJs().getName() + "%'";
            }
        }
        if (ir.getJob() != null) {
            if (StringUtils.hasText(ir.getJob().getTitle())) {
                hql += " and ir.job.title LIKE '%" + ir.getJob().getTitle() + "%'";
            }
        }
        hql += " order by ir.interviewId desc";
        return this.hibernateTemplate.find(hql);
    }

    @Override
    public void updateInterviewRecord(InterviewRecord ir) throws DataAccessException {
        this.hibernateTemplate.update(ir);
    }
    
    @Override
	public boolean deleteIr(final Integer irId) throws DataAccessException {
		List<CV> cvs = hibernateTemplate.find("from InterviewRecord ir where ir.interviewId = '" + irId + "'");
		if(cvs != null && cvs.size() > 0) {
			hibernateTemplate.executeWithNativeSession(
					new HibernateCallback() {
						@Override
						public Object doInHibernate(Session session)
						throws HibernateException, SQLException {
							return session.createQuery
							("delete InterviewRecord ir where ir.interviewId='"+irId + "'").executeUpdate();
						}					
					});
			return true;
		}
		return false;
	}

}
