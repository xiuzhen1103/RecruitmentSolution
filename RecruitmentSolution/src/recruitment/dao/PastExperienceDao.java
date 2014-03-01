package recruitment.dao;

import java.util.Date;
import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.JobSeeker;
import recruitment.model.PastExperience;

public interface PastExperienceDao {
	public void save(PastExperience pe) throws DataAccessException;
	public boolean deletePEx(Integer pxId) throws DataAccessException;
	public boolean updatePEx(Integer pxId, String jobDescription, String duty, String empName,
			String email, String phone,String address,Date startDate, Date endDate, String reasonForLeave, JobSeeker jobSeeker) throws DataAccessException;
	public List<PastExperience> getPExbyJsId(PastExperience pe) throws DataAccessException;

}
