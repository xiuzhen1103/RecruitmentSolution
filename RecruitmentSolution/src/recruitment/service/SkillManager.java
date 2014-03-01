package recruitment.service;
import java.util.List;

import recruitment.model.Skill;
import recruitment.model.SkillCategory;

public interface SkillManager {
	public void add(Skill skill) throws Exception;
	public boolean delete(Skill skill) throws Exception;
	public boolean update(Skill skill)throws Exception;
	public List<Skill> getSkills(Skill skill) throws Exception;
	public Skill load(Skill skill) throws Exception;
	public List<Skill> getSkillsBySc(SkillCategory sc) throws Exception;
	

}
