package recruitment.service;

import java.sql.Blob;

import org.springframework.dao.DataAccessException;

import recruitment.model.CV;
import recruitment.model.JobSeeker;


public interface CVManager {
	public void addCV(CV cv) throws Exception;
	public boolean deleteCV(Integer cvId) throws Exception;
	public boolean updateCV(Integer cvId, String cvTitle, String cvDesc, String coverLetter, String updateCV, JobSeeker jobSeeker)throws Exception;
	
}
