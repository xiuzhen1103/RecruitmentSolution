package recruitment.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import recruitment.model.JobSeekerSkill;
import recruitment.model.Skill;
import recruitment.model.SkillCategory;
import recruitment.service.JobSeekerSkillManager;
import recruitment.service.SkillCategoryManager;
import recruitment.service.SkillManager;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("jsskill")
@Scope("prototype")
public class JobSeekerSkillAction extends ActionSupport implements ModelDriven{
	private List<JobSeekerSkill> jobSeekerSkills;
	private JobSeekerSkill jobSeekerSkill;
	private JobSeekerSkillManager jm;
	private String message="";
	private List<SkillCategory> listMSkillCategory;
	private List<SkillCategory> listSSkillCategory;
	private SkillCategoryManager skillCategoryMan;
	private SkillCategory skillCategory;
	private List<Skill> listSkill;
	private SkillManager skillManager;
	private Integer id;
	
	@Override
	public Object getModel() {
		return jobSeekerSkill;
	}
	public List<JobSeekerSkill> getJobSeekerSkills() {
		return jobSeekerSkills;
	}
	public void setJobSeekerSkills(List<JobSeekerSkill> jobSeekerSkills) {
		this.jobSeekerSkills = jobSeekerSkills;
	}
	public JobSeekerSkill getJobSeekerSkill() {
		return jobSeekerSkill;
	}
	public void setJobSeekerSkill(JobSeekerSkill jobSeekerSkill) {
		this.jobSeekerSkill = jobSeekerSkill;
	}
	
	public JobSeekerSkillManager getJm() {
		return jm;
	}
	@Resource(name="jobSeekerSkillManager")
	public void setJm(JobSeekerSkillManager jm) {
		this.jm = jm;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String execute() throws Exception {		
		jm.add(jobSeekerSkill);
		return "success";	
	}
	
	public String delete() throws Exception {
		boolean deleted = jm.delete(id);
		if(deleted) {
			message  = "deleted succeeded ";
			//this.jobSeekerSkill = null;
			return "deleted";
		}
		message = "deleted failed";
		return "fail";
	}
	
	public String list() throws Exception {
		this.jobSeekerSkills = jm.getJobSeekerSkills(jobSeekerSkill);
		return "list";	
	}
	public String add() throws Exception {
		this.listMSkillCategory = skillCategoryMan.listMainSkillCategory(skillCategory);
		return "add";	
	}

	public SkillCategoryManager getSkillCategoryMan() {
		return skillCategoryMan;
	}
	@Resource(name="skillCategoryManager")
	public void setSkillCategoryMan(SkillCategoryManager skillCategoryMan) {
		this.skillCategoryMan = skillCategoryMan;
	}
	
	public SkillCategory getSkillCategory() {
		return skillCategory;
	}
	public void setSkillCategory(SkillCategory skillCategory) {
		this.skillCategory = skillCategory;
	}
	public List<SkillCategory> getListMSkillCategory() {
		return listMSkillCategory;
	}
	public void setListMSkillCategory(List<SkillCategory> listMSkillCategory) {
		this.listMSkillCategory = listMSkillCategory;
	}
	public List<SkillCategory> getListSSkillCategory() {
		return listSSkillCategory;
	}
	public void setListSSkillCategory(List<SkillCategory> listSSkillCategory) {
		this.listSSkillCategory = listSSkillCategory;
	}
	
	public String listSubSkillCategory() throws Exception {
		this.listSSkillCategory = skillCategoryMan.getSubSkillCategory(skillCategory);
		StringBuffer sb = new StringBuffer();
		sb.append("0").append("_").append("Please Choose Sub Category").append(",");
		for(SkillCategory subskillCategory : listSSkillCategory) {
			sb.append(subskillCategory.getSkillCategoryId()).append("_").append(subskillCategory.getName()).append(","); 
		}
		ServletActionContext.getResponse().getWriter().print(sb.toString());
		return null;
	}

	public String listSkill() throws Exception {
		this.listSkill = skillManager.getSkillsBySc(skillCategory);
		StringBuffer sb = new StringBuffer();
		//sb.append("0").append("_").append("Please Select Skills").append(",");
		for(Skill skill : listSkill) {
			String  temp = "<input type=\"checkbox\" name=\"jobSeekerSkill.checkboxes\" value=\""+skill.getSkillId()+"\"/> " + skill.getName();
			sb.append(temp); 
		}
		System.out.println(sb.toString());
		ServletActionContext.getResponse().getWriter().print(sb.toString());
		return null;
	}
	public List<Skill> getListSkill() {
		return listSkill;
	}
	public void setListSkill(List<Skill> listSkill) {
		this.listSkill = listSkill;
	}
	public SkillManager getSkillManager() {
		return skillManager;
	}
	@Resource(name="skillManager")
	public void setSkillManager(SkillManager skillManager) {
		this.skillManager = skillManager;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	

}
