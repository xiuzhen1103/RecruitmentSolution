package recruitment.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Skill {
	private Integer skillId;
	private String name;
	private SkillCategory skillCategory;
	private Set<JobSeekerSkill> jobSeekerSkill = new HashSet<JobSeekerSkill>(0);
	private Set<JobSkill> jobSkills = new HashSet<JobSkill>(0);

	@Id
	@GeneratedValue
	public Integer getSkillId() {
		return skillId;
	}

	public void setSkillId(Integer skillId) {
		this.skillId = skillId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@ManyToOne
	@JoinColumn(name = "skillCategoryId")
	public SkillCategory getSkillCategory() {
		return skillCategory;
	}

	public void setSkillCategory(SkillCategory skillCategory) {
		this.skillCategory = skillCategory;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "skill")
	public Set<JobSeekerSkill> getJobSeekerSkill() {
		return jobSeekerSkill;
	}

	public void setJobSeekerSkill(Set<JobSeekerSkill> jobSeekerSkill) {
		this.jobSeekerSkill = jobSeekerSkill;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "skill")
	public Set<JobSkill> getJobSkills() {
		return jobSkills;
	}

	public void setJobSkills(Set<JobSkill> jobSkills) {
		this.jobSkills = jobSkills;
	}

	@Override
	public String toString() {
		return "Skill [skillId=" + skillId + ", name=" + name
				+ ", skillCategory=" + skillCategory + "]";
	}

}
