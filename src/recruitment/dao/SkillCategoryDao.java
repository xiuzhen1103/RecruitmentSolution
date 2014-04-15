package recruitment.dao;
import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.SkillCategory;

public interface SkillCategoryDao {
	public void save(SkillCategory sc) throws DataAccessException;
	public List<SkillCategory> getSkillCategory(SkillCategory sc) throws DataAccessException;
	public boolean deletePSkillCategory(Integer skillCategoryId) throws DataAccessException;
	public SkillCategory loadById(Integer skillCategoryId) throws DataAccessException;
	public List<SkillCategory> listMainSkillCategory(SkillCategory sc) throws DataAccessException;
	public boolean updateSkillCategory(Integer skillCategoryId, String name);
	public List<SkillCategory> getSubSkillCategory(SkillCategory sc)
			throws DataAccessException;
	
}
