package recruitment.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import recruitment.model.JobSeeker;
import recruitment.model.PastExperience;

public interface PExpManager {
	public void add(PastExperience pe) throws Exception;
	public boolean delete(PastExperience pe) throws Exception;
	public boolean update(PastExperience pe) throws Exception;
	public List<PastExperience> getPExbyJsId(PastExperience pe)throws Exception;
}
