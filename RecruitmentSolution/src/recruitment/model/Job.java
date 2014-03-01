package recruitment.model;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

@Entity
public class Job {
	private Integer jobId=0;
	private String title;
	private String jobDesc;
	private String startDate;
	private String address;
	private String phone;
	private Integer numPosition=0;
	private String requirement;
	private Integer salary=0;
	private Employer employer;
	private Area countryId;
	private Area countyId;
	private Area districtId;
	private JobCategory jobCategory;
	private Integer radioList;

	@Id
	@GeneratedValue
	public Integer getJobId() {
		return jobId;
	}
	public void setJobId(Integer jobId) {
		this.jobId = jobId;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getJobDesc() {
		return jobDesc;
	}
	public void setJobDesc(String jobDesc) {
		this.jobDesc = jobDesc;
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
	@ManyToOne
	@JoinColumn(name = "empId")
	public Employer getEmployer() {
		return employer;
	}
	public void setEmployer(Employer employer) {
		this.employer = employer;
	}
	
	@ManyToOne
	@JoinColumn(name = "jobCategoryId")
	public JobCategory getJobCategory() {
		return jobCategory;
	}
	public void setJobCategory(JobCategory jobCategory) {
		this.jobCategory = jobCategory;
	}
	
	@ManyToOne
	@JoinColumn(name = "countryId")
	public Area getCountryId() {
		return countryId;
	}
	public void setCountryId(Area countryId) {
		this.countryId = countryId;
	}
	@ManyToOne
	@JoinColumn(name = "countyId")
	public Area getCountyId() {
		return countyId;
	}
	public void setCountyId(Area countyId) {
		this.countyId = countyId;
	}
	
	@ManyToOne
	@JoinColumn(name = "districtId")
	public Area getDistrictId() {
		return districtId;
	}
	public void setDistrictId(Area districtId) {
		this.districtId = districtId;
	}
	@Transient
	public Integer getRadioList() {
		return radioList;
	}
	public void setRadioList(Integer radioList) {
		this.radioList = radioList;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
}