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
import recruitment.model.JobSeeker;
import recruitment.service.InterviewRecordManager;
import recruitment.service.JobSeekerManager;
import util.mail.MailSenderInfo;
import util.mail.SimpleMailSender;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("ir")
@Scope("prototype")
public class InterviewRecordAction extends ActionSupport implements ModelDriven<InterviewRecord> {
	  private InterviewRecordManager irManager;
    private static final long serialVersionUID = -6866693134281209692L;
    private JobSeekerManager jsm;
    private InterviewRecord ir = new InterviewRecord();
    private List<InterviewRecord> irs = new ArrayList<InterviewRecord>();

    public String toUpdate() {
        ir = irManager.loadById(ir.getInterviewId());
        return "toUpdate";
    }

    public String preSend() {
        return "preSend";
    }

    public String send() throws DataAccessException, Exception {
        ir.setEm(this.getEmployerFromSession());
        ir.setStatus(1);
        
        irManager.addIR(ir);
        
        this.sendEmailToJobSeeker(irManager.loadById(ir.getInterviewId()));
        
        return "send";
    }

    private void sendEmailToJobSeeker(InterviewRecord ir) throws Exception {
        MailSenderInfo mailInfo = new MailSenderInfo();
        mailInfo.setMailServerHost("smtp.qq.com");
        mailInfo.setMailServerPort("25");
        mailInfo.setValidate(true);

        mailInfo.setUserName("27248466");
        mailInfo.setFromAddress("27248466@qq.com");
        mailInfo.setPassword("zhen1606...");
        
       Integer jsId = ir.getJs().getJsId();
        JobSeeker js = jsm.loadByJsId(jsId);
        System.out.println(js.getEmail());
        mailInfo.setToAddress(js.getEmail());
        mailInfo.setSubject("[Interview Letter]Welcome to join our company");
        mailInfo.setContent("I'm very glad to invite you attend our company interview at " + ir.getInterviewTime()
                + ", my phone is " + ir.getPhone() + "\n Best Regards \n"   + ir.getEm().getCompanyName() );
        
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

    public String update() {
        int status = ir.getStatus();
        ir = irManager.loadById(ir.getInterviewId());
        if (status == 0 || status == 1) {
            ir.getJs().setStatus(0);
        } else if (status == 2) {
            ir.getJs().setStatus(1);
        }
        ir.setStatus(status);
        irManager.update(ir);
        return "preUpdate";
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public JobSeekerManager getJsm() {
		return jsm;
	}
	@Resource(name="userManager")
	public void setJsm(JobSeekerManager jsm) {
		this.jsm = jsm;
	}

}
