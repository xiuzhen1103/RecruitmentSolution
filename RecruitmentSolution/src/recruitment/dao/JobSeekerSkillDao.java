package recruitment.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.Job;
import recruitment.model.JobSeekerSkill;

public interface JobSeekerSkillDao {
	public List<JobSeekerSkill> getJobSeekerSkills(JobSeekerSkill jobSeekerSkill) throws DataAccessException;
	public void save(JobSeekerSkill jobSeekerSkill) throws DataAccessException;
	public boolean deleteJobSeekerSkill(Integer jobSeekerSkillId) throws DataAccessException;
}
