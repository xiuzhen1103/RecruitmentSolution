package recruitment.vo;

public class JobCategoryInfo {
	private Integer jobCaId=0;
	private String name;
	private Integer level=0;
	private Integer parentId=0;

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
	public Integer getJobCaId() {
		return jobCaId;
	}
	public void setJobCaId(Integer jobCaId) {
		this.jobCaId = jobCaId;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	
	

}
