package recruitment.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import recruitment.model.CV;
import recruitment.service.CVManager;
import recruitment.vo.CVInfo;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Component("cv")
@Scope("prototype")
public class CVAction extends ActionSupport implements ModelDriven{
	private CVInfo cvInfo;
	private List<CV> cvs;
	private String message="";
	private CVManager cvm;

	public CVManager getCvm() {
		return cvm;
	}
	@Resource(name="cvManager")
	public void setCvm(CVManager cvm) {
		this.cvm = cvm;
	}

	@Override
	public Object getModel() {
		return cvInfo;
	}

	public CVInfo getCvInfo() {
		return cvInfo;
	}

	public void setCvInfo(CVInfo cvInfo) {
		this.cvInfo = cvInfo;
	}

	public List<CV> getCvs() {
		return cvs;
	}

	public void setCvs(List<CV> cvs) {
		this.cvs = cvs;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String execute() throws Exception{
		CV cv = new CV();
		cv.setCvTitle(cvInfo.getCvTitle());
		cv.setCvDesc(cvInfo.getCvDesc());
		cv.setCoverLetter(cvInfo.getCoverLetter());
		cv.setUploadCV(cvInfo.getUploadCV());
		cv.setJobSeeker(cvInfo.getJobSeeker());
		cvm.addCV(cv);
		return "success";
	}

	public String delete() throws Exception{
		boolean deleted = cvm.deleteCV(cvInfo.getCvId());
		if(deleted) {
			message="delete succeeded";
			return "success";
		}
		else {
			message = "delete failed, Employer id is not exist";
			return "fail";
		}
	}

	public String update() throws Exception {
		boolean updated = cvm.updateCV(cvInfo.getCvId(), cvInfo.getCvTitle(), cvInfo.getCvDesc(), 
				cvInfo.getCoverLetter(), cvInfo.getUploadCV(), cvInfo.getJobSeeker());
		if(updated) {
			message = "update succeeded";
			return "success";
		}
		else {
			message = "update failed";
			return "failed";
		}
	}
}
