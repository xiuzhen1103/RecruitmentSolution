package recruitment.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import recruitment.dao.SkillDao;
import recruitment.model.Skill;
import recruitment.model.SkillCategory;
import recruitment.service.SkillManager;
@Component("skillManager")
public class SkillManagerImpl implements SkillManager {
	private SkillDao skillDao;

	public SkillDao getSkillDao() {
		return skillDao;
	}
	@Resource
	public void setSkillDao(SkillDao skillDao) {
		this.skillDao = skillDao;
	}

	@Override
	public void add(Skill skill) throws Exception {
		skillDao.save(skill);
	}

	@Override
	public boolean delete(Skill skill) throws Exception {
		return skillDao.deleteSkill(skill.getSkillId());
	}

	@Override
	public List<Skill> getSkills(Skill skill) throws Exception {
		return skillDao.getSkills(skill);
	}

	@Override
	public Skill load(Skill skill) throws Exception {
		return skillDao.loadById(skill.getSkillId());
	}

	@Override
	public boolean update(Skill skill) throws Exception {
		return skillDao.updateSkill(skill.getSkillId(),skill.getName(), skill.getSkillCategory());
	}
	@Override
	public List<Skill> getSkillsBySc(SkillCategory sc) throws Exception {
		return skillDao.getSkillsBySc(sc);
	}

}
