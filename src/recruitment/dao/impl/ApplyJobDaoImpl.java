package recruitment.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import recruitment.dao.ApplyJobDao;
import recruitment.model.ApplyJob;
import recruitment.model.CV;
import recruitment.model.Job;
import recruitment.model.JobSeeker;

@Component("applyJobDao")
public class ApplyJobDaoImpl implements ApplyJobDao {
    private HibernateTemplate hibernateTemplate;

    public HibernateTemplate getHibernateTemplate() {
        return hibernateTemplate;
    }

    @Resource
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    @Override
    public void save(ApplyJob applyJob) throws DataAccessException {
        Integer radioList = applyJob.getRadioList();
        CV cv = (CV) this.hibernateTemplate.load(CV.class, radioList);
        applyJob.setCv(cv);
        Job j = (Job) this.hibernateTemplate.load(Job.class, applyJob.getJob().getJobId());
        applyJob.setJob(j);

        JobSeeker jobSeeker = (JobSeeker) ServletActionContext.getRequest().getSession().getAttribute("jobSeeker");
        applyJob.setJobseeker(jobSeeker);

        hibernateTemplate.save(applyJob);
    }

    @Override
    @SuppressWarnings("unchecked")
    public ApplyJob getByJobAndJs(Integer jobId, Integer jsId) throws DataAccessException {
        List<ApplyJob> ajs = hibernateTemplate.find("from ApplyJob aj where aj.job.jobId = ? and aj.jobseeker.jsId = ?",
                new Integer[] { jobId, jsId });
        if (ajs != null && ajs.size() > 0) {
            return ajs.get(0);
        }
        return null;
    }

}
