package recruitment.vo;

public class JobSeekerInfo {
	private Integer jsId=0;
	private String username;
	private String password;
	private String password2;
	private String name;
	private String address;
	private String email;
	private String phone;
	private Integer expectedSalary;
	
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
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public Integer getJsId() {
		return jsId;
	}
	public void setJsId(Integer jsId) {
		this.jsId = jsId;
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
