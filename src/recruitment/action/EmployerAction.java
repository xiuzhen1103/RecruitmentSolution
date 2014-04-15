package recruitment.action;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import recruitment.model.Employer;
import recruitment.service.EmployerManager;
import util.mail.MailSenderInfo;
import util.mail.SimpleMailSender;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("emp")
@Scope("prototype")
public class EmployerAction extends ActionSupport implements ModelDriven {
	private static final long serialVersionUID = 1L;
	private EmployerManager empM;
	private List <Employer> employers;
	private Employer emp = new Employer();
	private String message="";
	private String currentPassword;

	public String getCurrentPassword() {
		return currentPassword;
	}

	public void setCurrentPassword(String currentPassword) {
		this.currentPassword = currentPassword;
	}

	public List<Employer> getEmployers() {
		return employers;
	}

	public void setEmployers(List<Employer> employers) {
		this.employers = employers;
	}

	public EmployerManager getEmpM() {
		return empM;
	}

	@Resource(name="empManager")
	public void setEmpM(EmployerManager empM) {
		this.empM = empM;
	}

	public Employer getEmp() {
		return emp;
	}

	public void setEmp(Employer emp) {
		this.emp = emp;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public void welcomeEmail() {
		MailSenderInfo mailInfo = new MailSenderInfo();
		mailInfo.setMailServerHost("smtp.qq.com");   
	    mailInfo.setMailServerPort("25");
	    mailInfo.setValidate(true); 
	    
	    mailInfo.setUserName("27248466");
		mailInfo.setFromAddress("27248466@qq.com");
		mailInfo.setPassword("");
		
		mailInfo.setToAddress(emp.getEmail());
		mailInfo.setSubject("Welcome to register with Recruitment Solution software");   
	    mailInfo.setContent("Thank you for  " + emp.getUsername()+ " to use Recruitment Solution software");
	    SimpleMailSender sms = new SimpleMailSender();
	    
	    sms.sendTextMail(mailInfo);
	}

	@Override
	public String execute() throws Exception {
		if(empM.checkEmpUsernameExists(emp)) {
			message = "user name is exist";
			return "fail";
		}
		if(empM.checkEmpEmailExists(emp)){
			message = "email is exist";
			return "fail";
		}
		empM.addEmp(emp);
		welcomeEmail();
		
		return "success";
	}

	public String load() throws Exception{
		this.emp = this.empM.loadByEmpId(emp);
		return "load";
	}
	
	public String get() throws Exception{
		this.emp = this.empM.loadByEmpId(emp);
		return "get";
	}

	public String delete() throws Exception{
		boolean	deleted = empM.deleteEmployer(emp);
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
		if (this.empM.login(emp) != null) {
			message = "login succeeded ";
			ServletActionContext.getRequest().getSession().setAttribute("emp_user", emp);
			return "success";
		} else {
			message = "login failed ";
			return "fail";
		}
	}
	
	public String logout() throws Exception {
		ServletActionContext.getRequest().getSession().removeAttribute("employer");
		return "logout";
	}
	
	@Override
	public Object getModel() {
		return emp;
	}

	public String list() throws Exception {
		this.employers = empM.getEmployers(this.emp);
		System.out.println(emp.getWebSite());
		return "list";
	}
	
	public String updateEmp()throws Exception {
		boolean updated = empM.update(emp);
		if(updated) {
			message = "update succeeded ";
			return "success";
		}
			message = "update failed";
		return "fail";
	}
	
	public String updatePassword()throws Exception {
		boolean updated = empM.updatePassword(emp, currentPassword);
		if(updated) {
			message = "update succeeded ";
			return "success";
		}
			message = "update failed";
		return "fail";
	}
	
	public String checkUsernameExist() throws Exception {
		ServletActionContext.getResponse().getWriter().print(empM.checkEmpUsernameExists(emp));
		return null;
	}
	
	public String checkEmailExist() throws Exception {
		ServletActionContext.getResponse().getWriter().print(empM.checkEmpEmailExists(emp));
		return null;
	}


	

}
