package recruitment.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import recruitment.model.JobSeekerSkill;
import recruitment.model.Skill;
import recruitment.service.JobSeekerSkillManager;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("jsskill")
@Scope("prototype")
public class JobSeekerSkillAction extends ActionSupport implements ModelDriven{
	private List<JobSeekerSkill> jobSeekerSkills;
	private JobSeekerSkill jobSeekerSkill = new JobSeekerSkill();
	private JobSeekerSkillManager jm;
	private String message="";
	private SkillAction skillAction;
	
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
		boolean deleted = jm.delete(jobSeekerSkill);
		if(deleted) {
			message  = "deleted succeeded ";
			return "success";
		}
		message = "deleted failed";
		return "fail";
	}
	
	public String list() throws Exception {
		this.jobSeekerSkills = jm.getJobSeekerSkills(jobSeekerSkill);
		return "list";	
	}

	
	

}
