package recruitment.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import recruitment.model.JobSeeker;
import recruitment.service.JobSeekerManager;
import recruitment.vo.JobSeekerInfo;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("js")
@Scope("prototype")
public class JobSeekerAction extends ActionSupport implements ModelDriven{

	private JobSeekerInfo info = new JobSeekerInfo();
	private JobSeekerManager um;
	private List <JobSeeker> jobseekers;
	private JobSeeker jobSeeker;
	private String message="";

	public JobSeeker getJobSeeker() {
		return jobSeeker;
	}

	public void setJobSeeker(JobSeeker jobSeeker) {
		this.jobSeeker = jobSeeker;
	}

	public JobSeekerInfo getInfo() {
		return info;
	}

	public void setInfo(JobSeekerInfo info) {
		this.info = info;
	}

	public String list() throws Exception {
		this.jobseekers = um.getJobSeekers();
		return "list";
	}

	public JobSeekerManager getUm() {
		return um;
	}

	@Resource(name="userManager")
	public void setUm(JobSeekerManager um) {
		this.um = um;
	}

	public String execute() throws Exception {
		JobSeeker js = new JobSeeker();
		BeanUtils.copyProperties(info, js);
		if(um.checkJsUsernameExists(js)) {
			message = "user name is exist";
			return "fail";
		}
		if(um.checkJsEmailExists(js)){
			message = "email is exist";
			return "fail";
		}
		um.add(js);
		return "success";
	}

	public String searchUserbyJsId() throws Exception{
		this.jobSeeker = this.um.loadByJsId(info.getJsId());
		return "load";
	}
	public List<JobSeeker> getJobseekers() {
		return jobseekers;
	}

	public void setJobseekers(List<JobSeeker> jobseekers) {
		this.jobseekers = jobseekers;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public Object getModel() {
		return info;
	}

	public String isLogin() throws Exception {
		boolean authenticated = this.um.login(info.getEmail(), info.getPassword());
		if (authenticated) {
			message = "login succeeded ";
			return "success";
		} else {
			message = "login failed";
			return "fail";
		}
	}

	public String updateJs()throws Exception {
		boolean updated = um.update(info.getJsId(), info.getUsername(), info.getPassword(), info.getName(), 
				info.getAddress(), info.getEmail(), info.getPhone(), info.getExpectedSalary());
		if(updated) {
			message = "update succeeded ";
			return "success";
		}
			message = "update failed";
		return "fail";
	}

	public String delete() throws Exception{
		boolean deleted = um.deleteJobSeeker(info.getJsId());
		if(deleted) {
			message = "delete succeeded";
			return "success";
		}
		else {
			message = "delete failed, jobSeeker id is not exist";
			return "fail";
		}
	}

}
