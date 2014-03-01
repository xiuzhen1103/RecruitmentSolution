package recruitment.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import recruitment.dao.JobSeekerSkillDao;
import recruitment.model.JobSeekerSkill;
@Component("jobSeekerSkillManager")
public class JobSeekerSkillManager implements
		recruitment.service.JobSeekerSkillManager {
	private JobSeekerSkillDao jobSeekerSkillDao;
	
	public JobSeekerSkillDao getJobSeekerSkillDao() {
		return jobSeekerSkillDao;
	}
	@Resource
	public void setJobSeekerSkillDao(JobSeekerSkillDao jobSeekerSkillDao) {
		this.jobSeekerSkillDao = jobSeekerSkillDao;
	}

	@Override
	public void add(JobSeekerSkill jobSeekerSkill) throws Exception {
		jobSeekerSkillDao.save(jobSeekerSkill);

	}

	@Override
	public boolean delete(JobSeekerSkill jobSeekerSkillId) throws Exception {
		return jobSeekerSkillDao.deleteJobSeekerSkill(jobSeekerSkillId.getJobSeekerSkillId());
	}

	@Override
	public List<JobSeekerSkill> getJobSeekerSkills(JobSeekerSkill jobSeekerSkill)
			throws Exception {
		return jobSeekerSkillDao.getJobSeekerSkills(jobSeekerSkill);
	}

}
