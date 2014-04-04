package recruitment.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
@Entity
public class JobSkill {
	private Integer jobSkillId;
	private Job job;
	private Skill skill;
	
	@Id
	@GeneratedValue
	public Integer getJobSkillId() {
		return jobSkillId;
	}
	public void setJobSkillId(Integer jobSkillId) {
		this.jobSkillId = jobSkillId;
	}
	
	 @ManyToOne(fetch = FetchType.LAZY)
	 @JoinColumn(name = "jobId", nullable = false)
	public Job getJob() {
		return job;
	}
	public void setJob(Job job) {
		this.job = job;
	}
	 @ManyToOne(fetch = FetchType.LAZY)
	 @JoinColumn(name = "skillId", nullable = false)
	public Skill getSkill() {
		return skill;
	}
	public void setSkill(Skill skill) {
		this.skill = skill;
	}
	
}
