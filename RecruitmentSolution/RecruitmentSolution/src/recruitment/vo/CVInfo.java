package recruitment.vo;

import java.sql.Blob;

import recruitment.model.JobSeeker;

public class CVInfo {
	private Integer cvId;
	private String cvTitle;
	private String cvDesc;
	private String coverLetter;
	private String uploadCV;
	private JobSeeker jobSeeker;
	
	
	public Integer getCvId() {
		return cvId;
	}
	public void setCvId(Integer cvId) {
		this.cvId = cvId;
	}
	public String getCvTitle() {
		return cvTitle;
	}
	public void setCvTitle(String cvTitle) {
		this.cvTitle = cvTitle;
	}
	public String getCvDesc() {
		return cvDesc;
	}
	public void setCvDesc(String cvDesc) {
		this.cvDesc = cvDesc;
	}
	public String getCoverLetter() {
		return coverLetter;
	}
	public void setCoverLetter(String coverLetter) {
		this.coverLetter = coverLetter;
	}
	public String getUploadCV() {
		return uploadCV;
	}
	public void setUploadCV(String uploadCV) {
		this.uploadCV = uploadCV;
	}
	public JobSeeker getJobSeeker() {
		return jobSeeker;
	}
	public void setJobSeeker(JobSeeker jobSeeker) {
		this.jobSeeker = jobSeeker;
	}
	
	

	
	

}
