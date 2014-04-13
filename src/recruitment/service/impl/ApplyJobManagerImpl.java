package recruitment.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import recruitment.dao.ApplyJobDao;
import recruitment.model.ApplyJob;
import recruitment.service.ApplyJobManager;

@Component("applyJobManager")
public class ApplyJobManagerImpl implements ApplyJobManager {
    private ApplyJobDao applyJobDao;

    public ApplyJobDao getApplyJobDao() {
        return applyJobDao;
    }

    @Resource
    public void setApplyJobDao(ApplyJobDao applyJobDao) {
        this.applyJobDao = applyJobDao;
    }

    @Override
    public void add(ApplyJob applyJob) throws Exception {
        applyJobDao.save(applyJob);
    }

    @Override
    public boolean isJobAppliedByJs(Integer jobId, Integer jsId) {
        return applyJobDao.getByJobAndJs(jobId, jsId) != null;
    }

}
