package recruitment.service;

import java.util.List;

import recruitment.model.SkillCategory;

public interface SkillCategoryManager {
	public boolean delete(SkillCategory sc) throws Exception;
	public void add(SkillCategory sc) throws Exception;
	public List<SkillCategory> getSkillCategory(SkillCategory sc) throws Exception;
	public SkillCategory load(SkillCategory skillCategory)throws Exception;
	public boolean update(SkillCategory skillCategory)throws Exception;
	public List<SkillCategory> getSubSkillCategory(SkillCategory sc) throws Exception;
	public List<SkillCategory> listMainSkillCategory(SkillCategory sc) throws Exception;
	
	

}
