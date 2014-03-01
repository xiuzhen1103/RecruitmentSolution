package recruitment.vo;

import java.util.Date;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import recruitment.model.Area;
import recruitment.model.Employer;
import recruitment.model.JobCategory;

public class JobInfo {
	private Integer jobId=0;
	private String jobDesc;
	private Date startDate;
	private String address;
	private String phone;
	private Integer numPosition;
	private String requirement;
	private Integer salary;
	private Employer employer;
	private Area area;
	private JobCategory jobCategory;
	public Integer getJobId() {
		return jobId;
	}
	public void setJobId(Integer jobId) {
		this.jobId = jobId;
	}
	public String getJobDesc() {
		return jobDesc;
	}
	public void setJobDesc(String jobDesc) {
		this.jobDesc = jobDesc;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getNumPosition() {
		return numPosition;
	}
	public void setNumPosition(Integer numPosition) {
		this.numPosition = numPosition;
	}
	public String getRequirement() {
		return requirement;
	}
	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}
	public Integer getSalary() {
		return salary;
	}
	public void setSalary(Integer salary) {
		this.salary = salary;
	}
	
	//@ManyToOne
	//@JoinColumn(name = "empId")
	public Employer getEmployer() {
		return employer;
	}
	public void setEmployer(Employer employer) {
		this.employer = employer;
	}
	
	//@ManyToOne
	//@JoinColumn(name = "areaId")
	public Area getArea() {
		return area;
	}
	public void setArea(Area area) {
		this.area = area;
	}
	//@ManyToOne
	//@JoinColumn(name = "jobCategoryId")
	public JobCategory getJobCategory() {
		return jobCategory;
	}
	public void setJobCategory(JobCategory jobCategory) {
		this.jobCategory = jobCategory;
	}
	
}


