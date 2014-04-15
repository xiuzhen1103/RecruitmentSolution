package recruitment.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

@Entity
public class ApplyJob {
	private Integer applyJobId;
	private JobSeeker jobseeker;
	private Job job;
	private CV cv;
	private Integer radioList;
	
	@Id
	@GeneratedValue
	public Integer getApplyJobId() {
		return applyJobId;
	}
	public void setApplyJobId(Integer applyJobId) {
		this.applyJobId = applyJobId;
	}
	@ManyToOne
    @JoinColumn(name = "jobseekerId")
	public JobSeeker getJobseeker() {
		return jobseeker;
	}
	public void setJobseeker(JobSeeker jobseeker) {
		this.jobseeker = jobseeker;
	}
	@ManyToOne
    @JoinColumn(name = "jobId")
	public Job getJob() {
		return job;
	}
	public void setJob(Job job) {
		this.job = job;
	}
	
	@Transient
	public Integer getRadioList() {
		return radioList;
	}
	public void setRadioList(Integer radioList) {
		this.radioList = radioList;
	}
	@OneToOne
    @JoinColumn(name = "cvId")
	public CV getCv() {
		return cv;
	}
	public void setCv(CV cv) {
		this.cv = cv;
	}
	
}
