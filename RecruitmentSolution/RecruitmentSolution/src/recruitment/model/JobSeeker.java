package recruitment.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import recruitment.vo.JobSeekerInfo;

@Entity
public class JobSeeker {
	private Integer jsId;
	private String username;
	private String password;
	private String name;
	private String address;
	private String email;
	private String phone;
	private Integer expectedSalary;

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

}
