package recruitment.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import recruitment.dao.JobSeekerDao;
import recruitment.dao.impl.JobSeekerDaoImpl;
import recruitment.model.JobSeeker;
import recruitment.service.JobSeekerManager;


@Component("userManager")
public class JobSeekerManagerImpl implements JobSeekerManager {

	private JobSeekerDao jobSeekerDao;

	public JobSeekerDao getJobSeekerDaoDao() {
		return jobSeekerDao;
	}

	@Resource
	public void setJobSeekerDao(JobSeekerDao jobSeekerDao){
		this.jobSeekerDao = jobSeekerDao;
	}

	public boolean checkJsUsernameExists(JobSeeker js) throws Exception {
		return jobSeekerDao.jSUserNameExists(js.getUsername());
	}

	@Override
	public boolean checkJsEmailExists(JobSeeker js) throws Exception {
		return jobSeekerDao.jSEmailExists(js.getEmail());
	}

	public void add(JobSeeker js) throws Exception {
		jobSeekerDao.save(js);
	}

	@Override
	public List<JobSeeker> getJobSeekers() throws Exception{
		return this.jobSeekerDao.getJobSeekers();
	}

	@Override
	public JobSeeker loadByJsId(Integer jsId) throws Exception{
		return this.jobSeekerDao.loadByJsId(jsId);
	}

	@Override
	public boolean login(String email, String password) throws Exception {
		return jobSeekerDao.jsAuthenticate(email, password);
	}


	@Override
	public boolean deleteJobSeeker(Integer jsId) throws Exception{
		return jobSeekerDao.deleteJs(jsId);
	}

	@Override
	public boolean update(Integer jsId, String username, String password,
			String name, String address, String email, String phone,
			Integer expectedSalary) throws Exception {
		return jobSeekerDao.updateJs(jsId, name, address, phone, expectedSalary);
	}

}
