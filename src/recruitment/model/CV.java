package recruitment.model;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class CV {
	private Integer cvId;
	private String cvTitle;
	private String coverLetter;
	private JobSeeker jobSeeker;
	

	@Id
	@GeneratedValue
	public Integer getCvId() {
		return cvId;
	}
	public void setCvId(Integer cvId) {
		this.cvId = cvId;
	}
	@ManyToOne
	@JoinColumn(name = "jsId")
	public JobSeeker getJobSeeker() {
		return jobSeeker;
	}
	public void setJobSeeker(JobSeeker jobSeeker) {
		this.jobSeeker = jobSeeker;
	}
	public String getCvTitle() {
		return cvTitle;
	}
	public void setCvTitle(String cvTitle) {
		this.cvTitle = cvTitle;
	}

	public String getCoverLetter() {
		return coverLetter;
	}

	public void setCoverLetter(String coverLetter) {
		this.coverLetter = coverLetter;
	}

	
	
}
