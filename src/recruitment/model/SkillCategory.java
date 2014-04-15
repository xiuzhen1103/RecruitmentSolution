package recruitment.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class SkillCategory {
	private Integer skillCategoryId;
	private String name;
	private Integer level;
	private SkillCategory parentSkillCategory;
	private List<SkillCategory> childrenSkillJobCategory = new ArrayList<SkillCategory>();
	
	@Id
	@GeneratedValue
	public Integer getSkillCategoryId() {
		return skillCategoryId;
	}
	public void setSkillCategoryId(Integer skillCategoryId) {
		this.skillCategoryId = skillCategoryId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	@ManyToOne
	@JoinColumn(name = "parentId")
	public SkillCategory getParentSkillCategory() {
		return parentSkillCategory;
	}
	public void setParentSkillCategory(SkillCategory parentSkillCategory) {
		this.parentSkillCategory = parentSkillCategory;
	}
	@OneToMany(mappedBy="parentSkillCategory")
	public List<SkillCategory> getChildrenSkillJobCategory() {
		return childrenSkillJobCategory;
	}
	public void setChildrenSkillJobCategory(
			List<SkillCategory> childrenSkillJobCategory) {
		this.childrenSkillJobCategory = childrenSkillJobCategory;
	}

}
