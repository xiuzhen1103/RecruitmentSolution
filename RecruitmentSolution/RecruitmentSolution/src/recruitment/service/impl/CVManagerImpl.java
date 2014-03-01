package recruitment.service.impl;

import java.sql.Blob;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import recruitment.dao.CVDao;
import recruitment.model.CV;
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
	public boolean deleteCV(Integer cvId) throws Exception {
		return cvDao.deleteCV(cvId);
	}

	@Override
	public boolean updateCV(Integer cvId, String cvTitle, String cvDesc,
			String coverLetter, String updateCV,JobSeeker jobSeeker) throws Exception {
		return cvDao.updateCV(cvId, cvTitle, cvDesc, coverLetter, updateCV, jobSeeker);
	}

}
