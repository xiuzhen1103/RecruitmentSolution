package recruitment.action;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import recruitment.model.Administrator;
import recruitment.service.AdministratorManager;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Component("admin")
@Scope("prototype")
public class AdministratorAction extends ActionSupport implements ModelDriven{
	
	private static final long serialVersionUID = 1L;
	private Administrator admin = new Administrator();
	private AdministratorManager am;
	private String message="";

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
	
}
