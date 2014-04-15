package recruitment.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.CV;


public interface CVManager {
	public void addCV(CV cv) throws Exception;
	public boolean deleteCV(CV cv) throws Exception;
	public boolean updateCV(CV cv)throws Exception;	
	public List<CV> getCVByJsId()throws Exception;	
	public CV loadByCVId(Integer cvId) throws Exception;
	public List<CV> getOneCVDetail(Integer jsId) throws DataAccessException;
}
