package recruitment.service.impl;

import java.sql.Blob;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import recruitment.dao.CVDao;
import recruitment.model.CV;
import recruitment.model.Job;
import recruitment.model.JobSeeker;
import recruitment.service.CVManager;
@Component("cvManager")
public class CVManagerImpl implements CVManager {
	private CVDao cvDao;

	public CVDao getCvDao() {
		return cvDao;
	}
	@Resource
	public void setCvDao(CVDao cvDao) {
		this.cvDao = cvDao;
	}

	@Override
	public void addCV(CV cv) throws Exception {
		cvDao.save(cv);
	}

	@Override
	public boolean deleteCV(CV cv) throws Exception {
		return cvDao.deleteCV(cv.getCvId());
	}

	@Override
	public boolean updateCV(CV cv) throws Exception {
		return cvDao.updateCV(cv.getCvId(), cv.getCvTitle(), 
				cv.getCoverLetter(), cv.getJobSeeker());
	}
	@Override
	public List<CV> getCVByJsId(CV cv) throws Exception {
		return cvDao.getCVbyJsId(cv);
	}
	@Override
	public CV loadByCVId(Integer cvId) throws Exception {
		return cvDao.loadByCVId(cvId);
	}

}
