package recruitment.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;

import recruitment.model.Employer;
import recruitment.model.InterviewRecord;
import recruitment.model.Job;
import recruitment.model.JobSeeker;
import recruitment.service.InterviewRecordManager;
import recruitment.service.JobManager;
import recruitment.service.JobSeekerManager;
import util.mail.MailSenderInfo;
import util.mail.SimpleMailSender;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("ir")
@Scope("prototype")
public class InterviewRecordAction extends ActionSupport implements ModelDriven<InterviewRecord> {
    private static final long      serialVersionUID = -6866693134281209692L;
    private InterviewRecordManager irManager;
    private JobSeekerManager       jsm;
    private JobManager             jm;
    private JobSeeker js;
    private InterviewRecord        ir               = new InterviewRecord();
    private List<InterviewRecord>  irs              = new ArrayList<InterviewRecord>();
 
    private String                 tips;
    private String sort;


    public String preSend() {
        return "preSend";
    }

    public String send() throws DataAccessException, Exception {
    
        if (isAlreadySend()) {
            tips = "you had already send!";
            return "preSend";
        }
 
        if (isEmployed()) {
        	tips = "Jobseeker employed!";
        	return "preSend";
        	
        }
        else {
        ir.setEm(this.getEmployerFromSession());
        ir.setStatus(1);
        irManager.addIR(ir);
  
 
        Job job = jm.loadById(ir.getJob());
        if (job.getNumPosition() > 0) {
            jm.update(job);
        }

        String subject = "[Interview Letter]Welcome to join our company";
        String content = "I'm very glad to invite you attend our company interview at " + ir.getInterviewTime()
                + ", my phone is " + ir.getPhone() + "\n Best Regards \n"   + ir.getEm().getCompanyName();
        this.sendEmailToJobSeeker(irManager.loadById(ir.getInterviewId()), subject, content);
        }
        return "send";
    }

    private boolean isAlreadySend() {
        return null != irManager.loadByJobAndJsAndEmp(ir.getJob().getJobId(), ir.getJs().getJsId(), this
                .getEmployerFromSession().getEmpId());
    }
    
    
    private boolean isEmployed() throws Exception {
    	JobSeeker j = jsm.loadByJsId(ir.getJs().getJsId());
    	return j.getStatus() == 1;	     	
    }
       
    private void sendEmailToJobSeeker(InterviewRecord ir, String subject, String content) throws Exception {
        MailSenderInfo mailInfo = new MailSenderInfo();
        mailInfo.setMailServerHost("smtp.qq.com");
        mailInfo.setMailServerPort("25");
        mailInfo.setValidate(true);

        mailInfo.setUserName("27248466");
        mailInfo.setFromAddress("27248466@qq.com");
        mailInfo.setPassword("zhen1606...");

        Integer jsId = ir.getJs().getJsId();
        JobSeeker js = jsm.loadByJsId(jsId);
        mailInfo.setToAddress(js.getEmail());
        mailInfo.setSubject(subject);
        mailInfo.setContent(content);

        SimpleMailSender sms = new SimpleMailSender();

        sms.sendTextMail(mailInfo);
    }

    public String listSend() {
        ir.setEm(this.getEmployerFromSession());
        irs = irManager.loadIRs(ir);
        return "listSend";
    }

    public String listMySend() {
        ir.setJs(this.getJobSeekerFromSession());
        irs = irManager.loadIRs(ir);
        return "listMySend";
    }

    public String preUpdate() {
        ir = irManager.loadById(ir.getInterviewId());
        return "preUpdate";
    }

    public String update() throws Exception {
        int status = ir.getStatus();
        ir = irManager.loadById(ir.getInterviewId());
        if (status == 0 || status == 1) {
            String subject = "Interview";
            String content = "We have completed our interviews at this stage and I am afraid you have not been successful.Thank you for coming in to see us and I wish you the best in your job hunting. \n Best Regards \n"   + ir.getEm().getCompanyName();
            this.sendEmailToJobSeeker(irManager.loadById(ir.getInterviewId()), subject, content);
            
        } else if (status == 2 && !isEmployed()) {
        	 if(ir.getJob().getNumPosition() != 0 ) {
            ir.getJs().setStatus(1);
            ir.getJob().setNumPosition(ir.getJob().getNumPosition()-1);
            String subject = "[Offer Letter]Welcome to join our company";
            String content = "I'm very glad to tell you, you have be one of our company.\n Best Regards \n"   + ir.getEm().getCompanyName();
            this.sendEmailToJobSeeker(irManager.loadById(ir.getInterviewId()), subject, content);
            
         }
        	 
        }
        else {
        	tips = "This jobseeker is employed!";
        	 return "preResult";
        }
        
        ir.setStatus(status);
        irManager.update(ir);
        return "success";
    }
    
    public String delete() throws Exception{
		boolean deleted = irManager.delete(ir);
		if(deleted) {
			tips="delete succeeded";
			return "success";
		}
		else {
			tips = "delete failed, Employer id is not exist";
			return "fail";
		}
	}
    
   
    private Employer getEmployerFromSession() {
        return (Employer) ServletActionContext.getRequest().getSession().getAttribute("employer");
    }

    private JobSeeker getJobSeekerFromSession() {
        return (JobSeeker) ServletActionContext.getRequest().getSession().getAttribute("user");
    }

    @Override
    public InterviewRecord getModel() {
        return ir;
    }

    public InterviewRecord getIr() {
        return ir;
    }

    public void setIr(InterviewRecord ir) {
        this.ir = ir;
    }

    public InterviewRecordManager getIrManager() {
        return irManager;
    }

    @Resource
    public void setIrManager(InterviewRecordManager irManager) {
        this.irManager = irManager;
    }

    public List<InterviewRecord> getIrs() {
        return irs;
    }

    public void setIrs(List<InterviewRecord> irs) {
        this.irs = irs;
    }

    public JobSeekerManager getJsm() {
        return jsm;
    }

    @Resource(name = "userManager")
    public void setJsm(JobSeekerManager jsm) {
        this.jsm = jsm;
    }

    @Resource(name = "jobManager")
    public void setJm(JobManager jm) {
        this.jm = jm;
    }

    public String getTips() {
        return tips;
    }

    public void setTips(String tips) {
        this.tips = tips;
    }

	public JobSeeker getJs() {
		return js;
	}

	public void setJs(JobSeeker js) {
		this.js = js;
	}

    
}
