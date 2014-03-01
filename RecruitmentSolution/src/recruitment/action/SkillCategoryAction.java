package recruitment.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import recruitment.model.SkillCategory;
import recruitment.service.SkillCategoryManager;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Component("sc")
@Scope("prototype")
public class SkillCategoryAction extends ActionSupport implements ModelDriven{

	private SkillCategoryManager scm;
	private SkillCategory skillCategory = new SkillCategory();
	private List<SkillCategory> scs ;
	private String message="";
	
	public List<SkillCategory> getScs() {
		return scs;
	}
	public void setScs(List<SkillCategory> scs) {
		this.scs = scs;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public SkillCategoryManager getScm() {
		return scm;
	}
	@Resource(name ="skillCategoryManager")
	public void setScm(SkillCategoryManager scm) {
		this.scm = scm;
	}

	public SkillCategory getSkillCategory() {
		return skillCategory;
	}

	public void setSkillCategory(SkillCategory skillCategory) {
		this.skillCategory = skillCategory;
	}
	
	public String execute() throws Exception {
		scm.add(skillCategory);
		return "success";
	}
	
	public String delete() throws Exception {
		boolean deleted = scm.delete(this.skillCategory);
		if(deleted) {
			message = "delete succeeded";
			return "success";
		}
		else {
			message = "delete failed";
			return "failed";
		}
	}
	
	public String list() throws Exception {
		this.scs = scm.getSkillCategory(this.skillCategory);
		return "list";
	}
	
	@Override
	public Object getModel() {
		return skillCategory;
	}
	
	public String load() throws Exception {
		this.skillCategory = scm.load(this.skillCategory);
		return "load";
	}
	
	public String update() throws Exception {
		boolean updated = scm.update(this.skillCategory);
		if(updated) {
			message = "update succeeded";
			return "success";
		}
		else {
			message = "update failed";
			return "failed";
		}	
	}
	
	
}
