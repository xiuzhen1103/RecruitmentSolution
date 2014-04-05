package recruitment.model;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

@Entity
public class JobSeeker {
	private Integer jsId;
	private String username;
	private String password;
	private String password2;
	private String name;
	private String address;
	private String email;
	private String phone;
	private Integer expectedSalary=0;
	private Integer status = 0;
	private Integer radioList;
	private Integer[] checkboxes;
	//private Skill skill;
	private Set<JobSeekerSkill> jobSeekerSkill = new HashSet<JobSeekerSkill>(0);
	

	public  JobSeeker() { 
	}
	@Id
	@GeneratedValue
	public Integer getJsId() {
		return jsId;
	}
	public void setJsId(Integer jsId) {
		this.jsId = jsId;
	}
	@Transient
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getExpectedSalary() {
		return expectedSalary;
	}
	public void setExpectedSalary(Integer expectedSalary) {
		this.expectedSalary = expectedSalary;
	}
	
	public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {
        this.status = status;
    }
    @Transient
	public Integer getRadioList() {
		return radioList;
	}
	public void setRadioList(Integer radioList) {
		this.radioList = radioList;
	}
	@Transient
	public Integer[] getCheckboxes() {
		return checkboxes;
	}
	public void setCheckboxes(Integer[] checkboxes) {
		this.checkboxes = checkboxes;
	}
	/*
	@ManyToOne
	@JoinColumn(name = "skillId")
	public Skill getSkill() {
		return skill;
	}
	public void setSkill(Skill skill) {
		this.skill = skill;
	}
	*/
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "jobSeeker")
	@JoinColumn(name = "jsId")
	public Set<JobSeekerSkill> getJobSeekerSkill() {
		return jobSeekerSkill;
	}
	public void setJobSeekerSkill(Set<JobSeekerSkill> jobSeekerSkill) {
		this.jobSeekerSkill = jobSeekerSkill;
	}
	@Override
	public String toString() {
		return "JobSeeker [jsId=" + jsId + ", username=" + username
				+ ", password=" + password + ", password2=" + password2
				+ ", name=" + name + ", address=" + address + ", email="
				+ email + ", phone=" + phone + ", expectedSalary="
				+ expectedSalary + ", radioList=" + radioList + ", checkboxes="
				+ Arrays.toString(checkboxes) + "]";
	}

}
