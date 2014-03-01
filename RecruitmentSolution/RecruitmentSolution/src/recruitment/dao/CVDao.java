package recruitment.dao;

import java.sql.Blob;

import org.springframework.dao.DataAccessException;

import recruitment.model.CV;
import recruitment.model.JobSeeker;


public interface CVDao {
	public void save(CV cv) throws DataAccessException;
	public boolean deleteCV(Integer cvId) throws DataAccessException;
	public boolean updateCV(Integer cvId, String cvTitle, String cvDesc, String coverLetter, String updateCV, JobSeeker jobSeeker)throws DataAccessException;
}
