package recruitment.action;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import recruitment.model.ApplyJob;
import recruitment.model.CV;
import recruitment.model.Job;
import recruitment.service.ApplyJobManager;
import recruitment.service.CVManager;

import com.opensymphony.xwork2.ActionSupport;

@Component("apply")
@Scope("prototype")
public class ApplyJobAction extends ActionSupport{
	private ApplyJob applyJob  = new ApplyJob();
	private ApplyJobManager am;
	private Job job= new Job();
	private int jobId;
	private CV cv;
	
	private List<CV> cvsList ;
	private CVManager cvManager;
	
	public int getJobId() {
		return jobId;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

	private HibernateTemplate hibernateTemplate;
	

	public String execute() throws Exception {
		job.setJobId(this.jobId);
		applyJob.setJob(job);
		am.add(applyJob);
		return "success";
	}
	
    public String selectCV() throws Exception {
		this.cvsList =  cvManager.getCVByJsId();
		return "selectCV";
	}
	
	public ApplyJob getApplyJob() {
		return applyJob;
	}
	public void setApplyJob(ApplyJob applyJob) {
		this.applyJob = applyJob;
	}

	public ApplyJobManager getAm() {
		return am;
	}

	@Resource(name="applyJobManager")
	public void setAm(ApplyJobManager am) {
		this.am = am;
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public CV getCv() {
		return cv;
	}

	public void setCv(CV cv) {
		this.cv = cv;
	}

	public List<CV> getCvsList() {
		return cvsList;
	}

	public void setCvsList(List<CV> cvsList) {
		this.cvsList = cvsList;
	}

	public CVManager getCvManager() {
		return cvManager;
	}
	@Resource(name="cvManager")
	public void setCvManager(CVManager cvManager) {
		this.cvManager = cvManager;
	}
}
