package recruitment.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import recruitment.service.AdministratorManager;
import recruitment.vo.AdministratorInfo;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Component("admin")
@Scope("prototype")
public class AdministratorAction extends ActionSupport implements ModelDriven{
	private AdministratorInfo adminInfo;
	private AdministratorManager am;
	private String message="";

	@Override
	public Object getModel() {
		return adminInfo;
	}

	public AdministratorInfo getAdminInfo() {
		return adminInfo;
	}

	public void setAdminInfo(AdministratorInfo adminInfo) {
		this.adminInfo = adminInfo;
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
		boolean authenticated = am.login(adminInfo.getUsername(), adminInfo.getPassword());
		if (authenticated) {
			message = "login succeeded ";
			return "success";
		} else {
			message = "login failed ";
			return "fail";
		}
	}
	
}
