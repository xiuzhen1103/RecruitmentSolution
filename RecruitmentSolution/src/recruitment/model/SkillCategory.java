package recruitment.model;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
public class SkillCategory {
	private Integer skillCategoryId;
	private String name;

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
	
}
