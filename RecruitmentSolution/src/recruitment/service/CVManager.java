package recruitment.service;

import java.sql.Blob;
import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.CV;
import recruitment.model.Job;
import recruitment.model.JobSeeker;


public interface CVManager {
	public void addCV(CV cv) throws Exception;
	public boolean deleteCV(CV cv) throws Exception;
	public boolean updateCV(CV cv)throws Exception;	
	public List<CV> getCVByJsId(CV cv)throws Exception;	
	public CV loadByCVId(Integer cvId) throws Exception;
}
