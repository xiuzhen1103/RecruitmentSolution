package recruitment.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import recruitment.model.Employer;
import recruitment.service.EmployerManager;
import recruitment.vo.EmployerInfo;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("emp")
@Scope("prototype")
public class EmployerAction extends ActionSupport implements ModelDriven {
	private EmployerInfo emInfo = new EmployerInfo();
	private EmployerManager empM;
	private List <Employer> employers;
	private Employer employer;
	private int empId;
	private String message="";

	public List<Employer> getEmployers() {
		return employers;
	}

	public void setEmployers(List<Employer> employers) {
		this.employers = employers;
	}

	public EmployerInfo getEmInfo() {
		return emInfo;
	}

	public void setEmInfo(EmployerInfo emInfo) {
		this.emInfo = emInfo;
	}

	public EmployerManager getEmpM() {
		return empM;
	}

	@Resource(name="empManager")
	public void setEmpM(EmployerManager empM) {
		this.empM = empM;
	}

	public Employer getEmployer() {
		return employer;
	}

	public void setEmployer(Employer employer) {
		this.employer = employer;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String execute() throws Exception {
		Employer emp = new Employer();
		BeanUtils.copyProperties(emInfo, emp);
		if(empM.checkEmpUsernameExists(emp)) {
			message = "user name is exist";
			return "fail";
		}
		if(empM.checkEmpEmailExists(emp)){
			message = "email is exist";
			return "fail";
		}
		empM.addEmp(emp);

		return "success";
	}

	public String loadUserbyEmpId() throws Exception{
		this.employer = this.empM.loadByEmpId(emInfo.getEmpId());
		return "load";
	}

	public String delete() throws Exception{

		boolean	deleted = empM.deleteEmployer(emInfo.getEmpId());

		if(deleted) {
			message = "delete succeeded";
			return "success";
		}
		else {
			message = "delete failed, Employer id is not exist";
			return "fail";
		}
	}

	public String isLogin() throws Exception {
		boolean authenticated = empM.login(emInfo.getEmail(), emInfo.getPassword());
		if (authenticated) {
			message = "login succeeded ";
			return "success";
		} else {
			message = "login failed ";
			return "fail";
		}
	}
	
	@Override
	public Object getModel() {
		return emInfo;
	}

	public String list() throws Exception {
		this.employers = empM.getEmployers();
		return "list";
	}
	
	public String updateEmp()throws Exception {
		boolean updated = empM.update(emInfo.getEmpId(),emInfo.getPhone(),emInfo.getContactName(),
				emInfo.getCompanyName(),emInfo.getAddress(),emInfo.getWebSite(),emInfo.getCompanySize(), emInfo.getCompanyType());
		if(updated) {
			message = "update succeeded ";
			return "success";
		}
			message = "update failed";
		return "fail";
	}

}
