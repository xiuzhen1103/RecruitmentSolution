package recruitment.dao;
import org.springframework.dao.DataAccessException;

import recruitment.model.ApplyJob;

public interface ApplyJobDao {

	public void save(ApplyJob applyJob) throws DataAccessException;

}
