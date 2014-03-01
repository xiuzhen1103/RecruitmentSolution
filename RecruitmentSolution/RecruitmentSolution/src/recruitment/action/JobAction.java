package recruitment.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import recruitment.dao.JobDao;
import recruitment.model.Job;
import recruitment.model.JobCategory;
import recruitment.service.JobManager;
import recruitment.vo.JobInfo;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Component("job")
@Scope("prototype")
public class JobAction extends ActionSupport implements ModelDriven{

	private JobManager jm;
	private List<Job> jobs;
	private Job job;
	private JobInfo info = new JobInfo();
	private String message="";

	public JobManager getJm() {
		return jm;
	}
	@Resource(name="jobManager")
	public void setJm(JobManager jm) {
		this.jm = jm;
	}

	public List<Job> getJobs() {
		return jobs;
	}

	public void setJobs(List<Job> jobs) {
		this.jobs = jobs;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public JobInfo getInfo() {
		return info;
	}
	public void setInfo(JobInfo info) {
		this.info = info;
	}
	public String execute() throws Exception {
		Job job = new Job();
		job.setJobDesc(info.getJobDesc());
		job.setStartDate(info.getStartDate());
		job.setAddress(info.getAddress());
		job.setPhone(info.getPhone());
		job.setNumPosition(info.getNumPosition());
		job.setRequirement(info.getRequirement());
		job.setSalary(info.getSalary());
		job.setEmployer(info.getEmployer());
		job.setArea(info.getArea());
		job.setJobCategory(info.getJobCategory());
		jm.add(job);
		return "success";	
	}
	public String delete() throws Exception {
		boolean deleted = jm.delete(info.getJobId());
		if(deleted) {
			message  = "deleted succeeded ";
			return "success";
		}
		message = "deleted failed";
		return "fail";
	}

	public String list() throws Exception {
		this.jobs = jm.getJobs();
		return "list";	
	}
	public String load() throws Exception {
		this.job = this.jm.loadById(info.getJobId());
		return "load";
	}

	public String update() throws Exception {
		boolean updated = jm.update(info.getJobId(), info.getJobDesc(), 
				info.getStartDate(), info.getAddress(),info.getPhone(), info.getNumPosition(), info.getRequirement(),
				info.getSalary(), info.getEmployer(), info.getArea(), info.getJobCategory());
		if(updated) {
			message  = "update succeeded ";
			return "success";
		}
		message = "update failed";
		return "fail";
	}

	@Override
	public Object getModel() {
		return info;
	}

}
