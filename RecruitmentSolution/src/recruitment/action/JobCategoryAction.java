package recruitment.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import recruitment.model.Job;
import recruitment.model.JobCategory;
import recruitment.service.JobCategoryManager;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Component("jc")
@Scope("prototype")
public class JobCategoryAction extends ActionSupport implements ModelDriven{
	private JobCategory jc = new JobCategory();
	private JobCategoryManager jcM;
	private String message="";
	private List<JobCategory> jcs;

	public List<JobCategory> getJcs() {
		return jcs;
	}

	public void setJcs(List<JobCategory> jcs) {
		this.jcs = jcs;
	}

	public JobCategory getJc() {
		return jc;
	}

	public void setJc(JobCategory jc) {
		this.jc = jc;
	}

	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}

	public JobCategoryManager getJcM() {
		return jcM;
	}

	@Resource(name="jobCategoryManager")
	public void setJcM(JobCategoryManager jcM) {
		this.jcM = jcM;
	}

	public String execute() throws Exception {
		jcM.add(jc);
		return "success";
	}

	@Override
	public Object getModel() {
		return jc;
	}
	
	public String list() throws Exception {
		this.jcs = jcM.getJobCategory(this.jc);
		return "list";
	}
	
	public String load() throws Exception {
		this.jc = jcM.load(jc);
		return "load";
	}
	
	public String delete() throws Exception {
		boolean deleted = jcM.delete(this.jc);
		if(deleted) {
			message  = "deleted succeeded ";
			return "success";
		}
		message = "deleted failed";
		return "fail";
		}
	
	public String update() throws Exception {
		boolean updated = jcM.update(jc);
		if(updated) {
			message  = "update succeeded ";
			return "success";
		}
		message = "update failed";
		return "fail";
	}
	

	
	
	
}


