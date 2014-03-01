package recruitment.dao;

import java.sql.Blob;
import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.CV;
import recruitment.model.Job;
import recruitment.model.JobSeeker;


public interface CVDao {
	public void save(CV cv) throws DataAccessException;
	public boolean deleteCV(Integer cvId) throws DataAccessException;
	public List<CV> getCVbyJsId(CV cv) throws DataAccessException;
	public boolean updateCV(Integer cvId, String cvTitle, String coverLetter, JobSeeker jobSeeker)throws DataAccessException;
	public CV loadByCVId(Integer cvId) throws DataAccessException;
}
