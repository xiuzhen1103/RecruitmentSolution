package recruitment.service.impl;

import java.util.List;

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
	public boolean delete(JobCategory jc) throws Exception {
		return jcDao.delete(jc.getJobCaId());
	}

	@Override
	public void add(JobCategory jc) throws Exception {
		jcDao.save(jc);
	}
	@Override
	public boolean update(JobCategory jc)
			throws Exception {
		return jcDao.update(jc.getJobCaId(), jc.getName(), jc.getLevel(), jc.getParentJobCategory());
	}
	@Override
	public List<JobCategory> getJobCategory(JobCategory jc) throws Exception {
		return jcDao.getJobCategories(jc);
	}
	@Override
	public JobCategory load(JobCategory jc) throws Exception {
		return jcDao.loadById(jc.getJobCaId());
	}
	

}
