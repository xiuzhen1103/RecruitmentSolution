package recruitment.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.Skill;
import recruitment.model.SkillCategory;


public interface SkillDao {
	public void save(Skill skill) throws DataAccessException;
	public boolean deleteSkill(Integer skillId) throws DataAccessException;
	public List<Skill> getSkills(Skill skill) throws DataAccessException;
	public boolean updateSkill(Integer skillId, String name, SkillCategory skillCategory)throws DataAccessException;
	public Skill loadById(Integer skillId) throws DataAccessException;
	public List<Skill> getSkillsBySc(SkillCategory sc) throws DataAccessException;
}
