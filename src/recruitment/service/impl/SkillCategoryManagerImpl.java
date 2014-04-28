package recruitment.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import recruitment.dao.SkillCategoryDao;
import recruitment.model.SkillCategory;
import recruitment.service.SkillCategoryManager;
@Component("skillCategoryManager")
public class SkillCategoryManagerImpl implements SkillCategoryManager {
	private SkillCategoryDao skillCategoryDao;

	public SkillCategoryDao getSkillCategoryDao() {
		return skillCategoryDao;
	}
	@Resource
	public void setSkillCategoryDao(SkillCategoryDao skillCategoryDao) {
		this.skillCategoryDao = skillCategoryDao;
	}

	@Override
	public void add(SkillCategory sc) throws Exception {
		skillCategoryDao.save(sc);
	}

	@Override
	public boolean delete(SkillCategory sc) throws Exception {
		return skillCategoryDao.deletePSkillCategory(sc.getSkillCategoryId());
	}

	@Override
	public List<SkillCategory> getSkillCategory(SkillCategory sc) throws Exception {
		return skillCategoryDao.getSkillCategory(sc);
	}
	@Override
	public SkillCategory load(SkillCategory skillCategory) throws Exception {

		return skillCategoryDao.loadById(skillCategory.getSkillCategoryId());
	}
	@Override
	public boolean update(SkillCategory skillCategory) throws Exception {
		return skillCategoryDao.updateSkillCategory(skillCategory.getSkillCategoryId(), skillCategory.getName());
	}
	@Override
	public List<SkillCategory> listMainSkillCategory(SkillCategory sc)
			throws Exception {
		return skillCategoryDao.listMainSkillCategory(sc);
	}
	
	public List<SkillCategory> getSubSkillCategory(SkillCategory sc) throws Exception {
		return skillCategoryDao.getSubSkillCategory(sc);
	}


}
