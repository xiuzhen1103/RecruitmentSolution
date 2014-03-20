package recruitment.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

@Entity
public class JobSeekerSkill {
	private Integer jobSeekerSkillId;
	private Skill skill;
	private JobSeeker jobSeeker;
	private Integer[] checkboxes;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getJobSeekerSkillId() {
		return jobSeekerSkillId;
	}
	public void setJobSeekerSkillId(Integer jobSeekerSkillId) {
		this.jobSeekerSkillId = jobSeekerSkillId;
	}
	
	 @ManyToOne(fetch = FetchType.LAZY)
	 @JoinColumn(name = "skillId",  nullable = false)
	public Skill getSkill() {
		return skill;
	}
	public void setSkill(Skill skill) {
		this.skill = skill;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	 @JoinColumn(name = "jsId", nullable = false)
	public JobSeeker getJobSeeker() {
		return jobSeeker;
	}
	public void setJobSeeker(JobSeeker jobSeeker) {
		this.jobSeeker = jobSeeker;
	}
	@Transient
	public Integer[] getCheckboxes() {
		return checkboxes;
	}
	public void setCheckboxes(Integer[] checkboxes) {
		this.checkboxes = checkboxes;
	}
	
	

	
	
	
	
}
