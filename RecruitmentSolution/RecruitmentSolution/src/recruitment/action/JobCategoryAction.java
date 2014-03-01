package recruitment.action;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import recruitment.model.JobCategory;
import recruitment.service.JobCategoryManager;
import recruitment.vo.JobCategoryInfo;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Component("jc")
@Scope("prototype")
public class JobCategoryAction extends ActionSupport implements ModelDriven{
	private JobCategoryInfo jcInfo;
	private JobCategoryManager jcM;
	private String message="";

	public JobCategoryInfo getJcInfo() {
		return jcInfo;
	}

	public void setJcInfo(JobCategoryInfo jcInfo) {
		this.jcInfo = jcInfo;
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
		JobCategory jc = new JobCategory();
		BeanUtils.copyProperties(jcInfo, jc);
		jcM.add(jc);
		return "success";
	}

	@Override
	public Object getModel() {
		return jcInfo;
	}

}
