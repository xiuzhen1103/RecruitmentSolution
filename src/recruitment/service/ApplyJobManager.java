package recruitment.service;

import recruitment.model.ApplyJob;

public interface ApplyJobManager {
	public void add(ApplyJob applyJob) throws Exception;
	
	boolean isJobAppliedByJs(Integer jobId, Integer jsId);

}
