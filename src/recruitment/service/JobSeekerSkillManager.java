package recruitment.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.JobSeekerSkill;

public interface JobSeekerSkillManager {
	public List<JobSeekerSkill> getJobSeekerSkills(JobSeekerSkill jobSeekerSkill) throws Exception;
	public void add(JobSeekerSkill jobSeekerSkill) throws Exception;
	boolean delete(Integer id) throws Exception;
}
