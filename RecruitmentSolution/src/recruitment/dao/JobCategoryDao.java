package recruitment.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import recruitment.model.JobCategory;

public interface JobCategoryDao {
	public List<JobCategory> getJobCategories(JobCategory jc) throws DataAccessException;
	public boolean delete(Integer jobCaId) throws DataAccessException;;
	public void save(JobCategory jobCa) throws DataAccessException;
	public JobCategory loadById(Integer jobCaId) throws DataAccessException;
	public boolean update(Integer jobCaId, String name, Integer level,JobCategory parentJobCategory) throws DataAccessException;;
}
