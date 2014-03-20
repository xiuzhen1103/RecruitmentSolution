package recruitment.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Component;
import recruitment.dao.PastExperienceDao;
import recruitment.model.PastExperience;
import recruitment.service.PExpManager;
@Component("pxManager")
public class PExpManagerImp implements PExpManager {
	private PastExperienceDao pxpDao; 

	public PastExperienceDao getPxpDao() {
		return pxpDao;
	}
	@Resource
	public void setPxpDao(PastExperienceDao pxpDao) {
		this.pxpDao = pxpDao;
	}
	@Override
	public void add(PastExperience pe) throws Exception {
		pxpDao.save(pe);
	}

	@Override
	public boolean delete(PastExperience pe) throws Exception {
		return pxpDao.deletePEx(pe.getPxId());
	}

	@Override
	public List<PastExperience> getPExbyJsId(PastExperience pe) throws Exception {
		return pxpDao.getPExbyJsId(pe);
	}
	@Override
	public boolean update(PastExperience pe) throws Exception {
		return pxpDao.updatePEx(pe.getPxId(), pe.getJobDescription(), pe.getDuty(),
				pe.getEmpName(), pe.getEmail(), pe.getPhone(), pe.getAddress(), 
				pe.getStartDate(), pe.getEndDate(), pe.getReasonForLeave(), pe.getJobSeeker());
	}

}
