package recruitment.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import recruitment.dao.JobSeekerDao;
import recruitment.model.Employer;
import recruitment.model.Job;
import recruitment.model.JobSeeker;
import recruitment.model.JobSeekerSkill;
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
	public JobSeeker loadByJsId(JobSeeker js) throws Exception{
		return jobSeekerDao.loadByJsId(js.getJsId());
	}

	@Override
	public JobSeeker login(JobSeeker js) throws Exception {
		return jobSeekerDao.jsAuthenticate(js.getEmail(), js.getPassword());
	}


	@Override
	public boolean deleteJobSeeker(JobSeeker js) throws Exception{
		return jobSeekerDao.deleteJs(js.getJsId());
	}

	@Override
	public boolean update(JobSeeker js) throws Exception {
		return jobSeekerDao.updateJs(js.getJsId(), js.getName(), js.getAddress(), 
				js.getPhone(), js.getExpectedSalary());
	}

	@Override
	public List<JobSeeker> getJobSeekers(JobSeeker js) throws Exception {
		return jobSeekerDao.getJobSeekers(js);
	}

	@Override
	public JobSeeker loadByEmail(JobSeeker js) throws Exception {
		return jobSeekerDao.loadByEmail(js);
	}

	@Override
	public boolean updatePassword(JobSeeker js, String currentPassword)
			throws Exception {
		return jobSeekerDao.updatePassword(js.getJsId(), currentPassword, js.getPassword(), js.getPassword2());
	}

	@Override
	public List<JobSeeker> getJobsByCategory(JobSeeker js) throws Exception {
		// TODO Auto-generated method stub
		return jobSeekerDao.getJsByJobCategory(js);
	}






}
