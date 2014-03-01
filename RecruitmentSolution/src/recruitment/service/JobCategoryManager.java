package recruitment.service;

import java.util.List;
import recruitment.model.JobCategory;

public interface JobCategoryManager {
	public boolean delete(JobCategory jc) throws Exception;;
	public void add(JobCategory jc) throws Exception;
	public boolean update(JobCategory jc) throws Exception;
	public List<JobCategory> getJobCategory(JobCategory jc) throws Exception;
	public JobCategory load(JobCategory jc) throws Exception;
}
