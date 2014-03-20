package recruitment.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import recruitment.model.Skill;
import recruitment.model.SkillCategory;
import recruitment.service.SkillCategoryManager;
import recruitment.service.SkillManager;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("sk")
@Scope("prototype")
public class SkillAction extends ActionSupport implements ModelDriven{
	private SkillManager sm;
	private List <Skill> skills;
	private Skill skill = new Skill();
	private String message = "";
	private SkillCategory skillCategory;



	public SkillManager getSm() {
		return sm;
	}
	@Resource(name="skillManager")
	public void setSm(SkillManager sm) {
		this.sm = sm;
	}

	public List<Skill> getSkills() {
		return skills;
	}

	public void setSkills(List<Skill> skills) {
		this.skills = skills;
	}

	public Skill getSkill() {
		return skill;
	}

	public void setSkill(Skill skill) {
		this.skill = skill;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public Object getModel() {
		return this.skill;
	}
	
	public String execute() throws Exception {
		sm.add(this.skill);
		return "success";	
	}
	
	public String delete() throws Exception {
		boolean deleted = sm.delete(this.skill);
		if(deleted) {
			message  = "deleted succeeded ";
			return "success";
		}
		message = "deleted failed";
		return "fail";
	}
	
	public String list() throws Exception {
		this.skills = sm.getSkills(this.skill);
		return "list";	
	}
	
	public String load() throws Exception {
		this.skill = this.sm.load(this.skill);
		return "load";
	}
	
	public String update() throws Exception {
		boolean updated = sm.update(this.skill);
		if(updated) {
			message = "update succeeded";
			return "success";
		}
		else {
			message = "update failed";
			return "failed";
		}	
	}


	public SkillCategory getSkillCategory() {
		return skillCategory;
	}
	public void setSkillCategory(SkillCategory skillCategory) {
		this.skillCategory = skillCategory;
	}

	
	

}
