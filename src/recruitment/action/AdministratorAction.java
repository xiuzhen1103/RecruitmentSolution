package recruitment.action;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import recruitment.model.Administrator;
import recruitment.service.AdministratorManager;
import util.mail.MailSenderInfo;
import util.mail.SimpleMailSender;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Component("admin")
@Scope("prototype")
public class AdministratorAction extends ActionSupport implements ModelDriven{
	
	private static final long serialVersionUID = 1L;
	private Administrator admin = new Administrator();
	private AdministratorManager am;
	private String message="";
	private String subject;
	private String content;
	private String email;

	@Override
	public Object getModel() {
		return admin;
	}
	
	public Administrator getAdmin() {
		return admin;
	}

	public void setAdmin(Administrator admin) {
		this.admin = admin;
	}

	public AdministratorManager getAm() {
		return am;
	}
	@Resource(name="adminManager")
	public void setAm(AdministratorManager am) {
		this.am = am;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public String isLogin() throws Exception {
		boolean authenticated = am.login(admin.getUsername(), admin.getPassword());
		if (authenticated) {
			message = "login succeeded ";
			ServletActionContext.getRequest().getSession().setAttribute("admin", admin);
			return "success";
		} else {
			message = "login failed ";
			return "fail";
		}
	}
	public String logout() throws Exception {
		ServletActionContext.getRequest().getSession().removeAttribute("admin");
		return "logout";
	}
	
	
	public String execute() throws Exception {
		contactEmail();
		return "success";
	}
	
	
	public void contactEmail() {
		MailSenderInfo mailInfo = new MailSenderInfo();
		mailInfo.setMailServerHost("smtp.qq.com");   
	    mailInfo.setMailServerPort("25");
	    mailInfo.setValidate(true); 
	    
	    mailInfo.setUserName("27248466");
		mailInfo.setFromAddress("27248466@qq.com");
		mailInfo.setPassword("zhen1606...");
		
		mailInfo.setToAddress("c10712147@mydit.ie");
		mailInfo.setSubject(subject);   
		content = "This is from email of " + email + "\n" + content;
	    mailInfo.setContent(content);
	    SimpleMailSender sms = new SimpleMailSender();
	    
	    sms.sendTextMail(mailInfo);
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
	
	
}
