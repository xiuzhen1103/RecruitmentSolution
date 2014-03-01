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
public class JobCategory {
	private Integer jobCaId;
	private String name;
	private Integer level=0;
	private JobCategory parentJobCategory;
	private List<JobCategory> childrenJobCategory = new ArrayList<JobCategory>();
	
	//1  类别  0
	//2  销售  1
	//3  IT    1
	//4  房产销售  2  

	@Id
	@GeneratedValue
	public Integer getJobCaId() {
		return jobCaId;
	}
	
	@ManyToOne
	@JoinColumn(name = "parentId")
	public JobCategory getParentJobCategory() {
		return parentJobCategory;
	}
	public void setParentJobCategory(JobCategory parentJobCategory) {
		this.parentJobCategory = parentJobCategory;
	}
	
	@OneToMany(mappedBy="parentJobCategory")
	public List<JobCategory> getChildrenJobCategory() {
		return childrenJobCategory;
	}
	public void setChildrenJobCategory(List<JobCategory> childrenJobCategory) {
		this.childrenJobCategory = childrenJobCategory;
	}
	public void setJobCaId(Integer jobCaId) {
		this.jobCaId = jobCaId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
//	@ManyToOne
//	@JoinColumn(name = "id")
//	public Integer getParentId() {
//		return parentId;
//	}
//	public void setParentId(Integer parentId) {
//		this.parentId = parentId;
//	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
}
