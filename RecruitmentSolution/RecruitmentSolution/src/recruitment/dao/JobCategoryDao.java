package recruitment.dao;

import org.springframework.dao.DataAccessException;

import recruitment.model.Administrator;
import recruitment.model.JobCategory;

public interface JobCategoryDao {
	public boolean delete(Integer id) throws DataAccessException;;
	public void save(JobCategory jobCa) throws DataAccessException;
	public boolean update(Integer jobCaId, String name, Integer parentId, Integer level) throws DataAccessException;;
}
