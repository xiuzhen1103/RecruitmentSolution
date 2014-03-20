package recruitment.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import recruitment.model.Job;
import recruitment.model.PastExperience;
import recruitment.service.PExpManager;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Component("pe")
@Scope("prototype")
public class PastExperienceAction extends ActionSupport implements ModelDriven{
	private PastExperience pe = new PastExperience();
	private List<PastExperience> pes;
	private String message="";
	private PExpManager pm;

	public PastExperience getPe() {
		return pe;
	}
	public void setPe(PastExperience pe) {
		this.pe = pe;
	}

	public List<PastExperience> getPes() {
		return pes;
	}
	public void setPes(List<PastExperience> pes) {
		this.pes = pes;
	}
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public PExpManager getPm() {
		return pm;
	}
	@Resource(name="pxManager")
	public void setPm(PExpManager pm) {
		this.pm = pm;
	}

	public String execute() throws Exception{
		pm.add(pe);
		return "success";
	}
	public String update() throws Exception {
		boolean updated = pm.update(pe);
		if(updated) {
			message = "update succeeded";
			return "success";
		}
		else {
			message = "update failed";
			return "failed";
		}	
	}
	public String delete() throws Exception {
		boolean deleted = pm.delete(pe);
		if(deleted) {
			message = "delete succeeded";
			return "success";
		}
		else {
			message = "delete failed";
			return "failed";
		}	
	}
	
	public String list() throws Exception {
		this.pes = pm.getPExbyJsId(pe);
		return "list";	
	}

	@Override
	public Object getModel() {
		return pe;
	}

}
