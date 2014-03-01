package recruitment.service;

import org.springframework.dao.DataAccessException;

import recruitment.model.JobCategory;

public interface JobCategoryManager {
	public boolean delete(Integer jobCaId) throws Exception;;
	public void add(JobCategory jobCa) throws Exception;
	public boolean update(Integer jobCaId, String name, Integer parentId, Integer level) throws Exception;;
}
