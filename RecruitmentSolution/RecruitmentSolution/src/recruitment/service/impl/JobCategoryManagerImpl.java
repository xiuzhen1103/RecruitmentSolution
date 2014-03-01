package recruitment.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import recruitment.dao.JobCategoryDao;
import recruitment.model.JobCategory;
import recruitment.service.JobCategoryManager;
@Component("jobCategoryManager")
public class JobCategoryManagerImpl implements JobCategoryManager{
	private JobCategoryDao jcDao;

	public JobCategoryDao getJcDao() {
		return jcDao;
	}
	@Resource
	public void setJcDao(JobCategoryDao jcDao) {
		this.jcDao = jcDao;
	}

	@Override
	public boolean delete(Integer jobCaId) throws Exception {
		return jcDao.delete(jobCaId);
	}

	@Override
	public void add(JobCategory jobCa) throws Exception {
		jcDao.save(jobCa);
		
	}

	@Override
	public boolean update(Integer jobCaId, String name, Integer parentId, Integer level)
			throws Exception {
		return jcDao.update(jobCaId, name, parentId, level);
	}
	

}
