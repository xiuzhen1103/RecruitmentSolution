package recruitment.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class JobSeekerSkill {
	private Integer jobSeekerSkillId;
	private Skill skill;
	private JobSeeker jobSeeker;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getJobSeekerSkillId() {
		return jobSeekerSkillId;
	}
	public void setJobSeekerSkillId(Integer jobSeekerSkillId) {
		this.jobSeekerSkillId = jobSeekerSkillId;
	}
	
	 @ManyToOne
	 @JoinColumn(name = "skillId")
	public Skill getSkill() {
		return skill;
	}
	public void setSkill(Skill skill) {
		this.skill = skill;
	}
	@ManyToOne
	 @JoinColumn(name = "jsId")
	public JobSeeker getJobSeeker() {
		return jobSeeker;
	}
	public void setJobSeeker(JobSeeker jobSeeker) {
		this.jobSeeker = jobSeeker;
	}

	
	
	
	
}
