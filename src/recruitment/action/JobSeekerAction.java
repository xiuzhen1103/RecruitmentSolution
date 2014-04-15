package recruitment.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;
import java.util.ResourceBundle;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import recruitment.model.CV;
import recruitment.model.Employer;
import recruitment.model.Job;
import recruitment.model.JobSeeker;
import recruitment.model.Skill;
import recruitment.model.SkillCategory;
import recruitment.service.CVManager;
import recruitment.service.JobSeekerManager;
import recruitment.service.SkillCategoryManager;
import recruitment.service.SkillManager;
import util.mail.MailSenderInfo;
import util.mail.SimpleMailSender;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("js")
@Scope("prototype")
public class JobSeekerAction extends ActionSupport implements ModelDriven {
	private JobSeekerManager     um;
	private List<JobSeeker>      jobseekers;
	private JobSeeker            js      = new JobSeeker();
	private List<Job>            jobs;
	private Job                  job     = new Job();
	private String               message = "";
	private String               currentPassword;
	private SkillCategoryManager skillCategoryM;
	private List<SkillCategory>  listMainSkillCategory;
	private List<SkillCategory>  listSubSkillCategory;
	// private SkillCategory skillCategory;
	private Skill                skill;
	private List<Skill>          listSkills;
	private boolean              flag;
	private SkillManager         sm;
	private SkillCategory        sc;
	private SkillCategoryManager skillCategoryManager;
	private List<SkillCategory> listMainSkillCategorys;
	private List<SkillCategory>  listSubSkillCategorys;
	private List<Skill>          listSkill;
	private SkillCategory        skillCategory;
	private CVManager cvManager;
	private List<CV> cvs;
	private CV oneCv;
	private Integer jsId;
	private String CVname;
	private String sort;
	private static int flag2 =0;
	private File upload;  
	private String filename;
	private String uploadFileName;  


	public SkillCategory getSkillCategory() {
		return skillCategory;
	}

	public void setSkillCategory(SkillCategory skillCategory) {
		this.skillCategory = skillCategory;
	}

	public JobSeeker getJs() {
		return js;
	}

	public void setJs(JobSeeker js) {
		this.js = js;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public List<Job> getJobs() {
		return jobs;
	}

	public void setJobs(List<Job> jobs) {
		this.jobs = jobs;
	}

	private Employer getEmployerFromSession() {
		return (Employer) ServletActionContext.getRequest().getSession().getAttribute("employer");
	}

	public String list() throws Exception {
		Employer employer = this.getEmployerFromSession();
		Integer empId = null;
		if (null != employer) {
			empId = employer.getEmpId();
		}
		this.jobseekers = um.getJobSeekersByEmpId(this.js, empId);
		return "list";
	}
	
	public String listJsForAdmin() throws Exception {
		Integer id = null;
		this.jobseekers = um.getJobSeekersForAdmin(this.js);
		return "listJsForAdmin";
	}
	

	public String listByJc() throws Exception {
		Employer employer = this.getEmployerFromSession();
		Integer empId = null;
		if (null != employer) {
			empId = employer.getEmpId();
		}
		this.jobseekers = um.getJobSeekersByEmpId(this.js, empId);
		this.listMainSkillCategorys = skillCategoryManager.listMainSkillCategory(skillCategory);
		return "listByJc";
	}

	public JobSeekerManager getUm() {
		return um;
	}

	@Resource(name = "userManager")
	public void setUm(JobSeekerManager um) {
		this.um = um;
	}

	public void welcomeEmail() {
		MailSenderInfo mailInfo = new MailSenderInfo();
		mailInfo.setMailServerHost("smtp.qq.com");
		mailInfo.setMailServerPort("25");
		mailInfo.setValidate(true);

		mailInfo.setUserName("27248466");
		mailInfo.setFromAddress("27248466@qq.com");
		mailInfo.setPassword("zhen1606...");

		mailInfo.setToAddress(js.getEmail());
		mailInfo.setSubject("Welcome to register with Recruitment Solution software");
		mailInfo.setContent("Thank you for  " + js.getUsername() + " to use Recruitment Solution software");
		SimpleMailSender sms = new SimpleMailSender();

		sms.sendTextMail(mailInfo);
	}

	public String execute() throws Exception {
		if (um.checkJsUsernameExists(js)) {
			message = "user name is exist";
			return "fail";
		}
		if (um.checkJsEmailExists(js)) {
			message = "email is exist";
			return "fail";
		}
			try{
				ResourceBundle rb = ResourceBundle.getBundle("uploadDirectory");
		    	String path = rb.getString("filename");
				System.out.println(path);
				 filename = path+File.separator+this.getUploadFileName();
				String[] strs = filename.split("\\\\");
				StringBuffer sb = new StringBuffer();
		        for(int i = 0; i < strs.length; i ++){
		            if(i == strs.length-1)
		                sb.append("upload/" );
		            sb.append(strs[i]);
		            if(i != strs.length-1)
		            	sb.append("\\");
		        }
		      filename = sb.toString();
				FileInputStream in = new FileInputStream(upload);
				File destFile = new File(filename);
				FileOutputStream out = new FileOutputStream(destFile);  
				byte[]b = new byte[1024];  
				int len = 0;  
				while((len=in.read(b))>0){  
					out.write(b,0,len);  
				}  
				in.close();
				out.close();  
			}catch(Exception e){
				e.printStackTrace();
			}
		String image = filename.substring(filename.lastIndexOf("\\")+1);

		js.setImage(image);
		um.add(js);
		welcomeEmail();
		return "success";
	}

	public String get() throws Exception {
		this.js = this.um.loadByJsId(js);
		return "get";
	}

	public String load() throws Exception {
		this.js = this.um.loadByJsId(js);
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

	public String getCurrentPassword() {
		return currentPassword;
	}

	public void setCurrentPassword(String currentPassword) {
		this.currentPassword = currentPassword;
	}

	@Override
	public Object getModel() {
		return js;
	}

	public String isLogin() throws Exception {
		if (this.um.login(js) != null) {
			message = "login succeeded ";
			ServletActionContext.getRequest().getSession().setAttribute("user", js);
			return "success";
		} else {
			message = "login failed";
			return "fail";
		}
	}

	public String updateJs() throws Exception {
		boolean updated = um.update(js);
		if (updated) {
			message = "update succeeded ";
			return "success";
		}
		message = "update failed";
		return "fail";
	}

	public String detail() throws Exception {
		js = um.loadByJsId(js);
		this.cvs = cvManager.getOneCVDetail(js.getJsId());
		return "detail";
	}

	public String delete() throws Exception {
		boolean deleted = um.deleteJobSeeker(js);
		if (deleted) {
			message = "delete succeeded";
			return "success";
		} else {
			message = "delete failed, jobSeeker id is not exist";
			return "fail";
		}
	}

	public String loadByEmail() throws Exception {
		this.js = this.um.loadByJsId(js);
		return "loadByEmail";
	}

	public String logout() throws Exception {
		ServletActionContext.getRequest().getSession().removeAttribute("jobSeeker");
		return "logout";
	}

	public String updatePassword() throws Exception {
		boolean updated = um.updatePassword(js, currentPassword);
		if (updated) {
			message = "update succeeded ";
			return "success";
		}
		message = "update failed";
		return "fail";
	}

	public String registerJs() throws Exception {
		this.listMainSkillCategory = skillCategoryM.listMainSkillCategory(sc);
		return "registerJs";
	}

	public String emailExists() throws Exception {
		if (um.checkJsEmailExists(this.js)) {
			flag = false;
			message = "User Exist";
			return "fail";
		} else {
			flag = true;
			message = "Your Can Register it";
			return "success";
		}
	}

	public SkillCategoryManager getSkillCategoryM() {
		return skillCategoryM;
	}

	@Resource(name = "skillCategoryManager")
	public void setSkillCategoryM(SkillCategoryManager skillCategoryM) {
		this.skillCategoryM = skillCategoryM;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public SkillCategory getSc() {
		return sc;
	}

	public void setSc(SkillCategory sc) {
		this.sc = sc;
	}

	public String checkUsernameExist() throws Exception {
		ServletActionContext.getResponse().getWriter().print(um.checkJsUsernameExists(js));
		return null;
	}

	public String checkEmailExist() throws Exception {
		ServletActionContext.getResponse().getWriter().print(um.checkJsEmailExists(js));
		return null;
	}

	public String listSubSkillCategory() throws Exception {
		this.listSubSkillCategory = skillCategoryManager.getSubSkillCategory(sc);
		StringBuffer sb = new StringBuffer();
		for (SkillCategory subskillCategory : listSubSkillCategory) {
			sb.append(subskillCategory.getSkillCategoryId()).append("_").append(subskillCategory.getName()).append(",");
		}
		ServletActionContext.getResponse().getWriter().print(sb.toString());
		return null;
	}

	public String listSkill() throws Exception {
		this.listSkills = sm.getSkillsBySc(sc);
		StringBuffer sb = new StringBuffer();
		// sb.append("0").append("_").append("Please Select Skills").append(",");
		for (Skill skill : listSkills) {
			String temp = "<input type=\"checkbox\" name=\"js.checkboxes\" value=\"" + skill.getSkillId() + "\"/> "
			+ skill.getName();
			sb.append(temp);
		}
		System.out.println(sb.toString());
		ServletActionContext.getResponse().getWriter().print(sb.toString());
		return null;
	}

	public Skill getSkill() {
		return skill;
	}

	public void setSkill(Skill skill) {
		this.skill = skill;
	}

	public List<Skill> getListSkills() {
		return listSkills;
	}

	public void setListSkills(List<Skill> listSkills) {
		this.listSkills = listSkills;
	}

	public SkillManager getSm() {
		return sm;
	}

	@Resource(name = "skillManager")
	public void setSm(SkillManager sm) {
		this.sm = sm;
	}

	public List<SkillCategory> getListMainSkillCategory() {
		return listMainSkillCategory;
	}

	public void setListMainSkillCategory(List<SkillCategory> listMainSkillCategory) {
		this.listMainSkillCategory = listMainSkillCategory;
	}

	public List<SkillCategory> getListSubSkillCategory() {
		return listSubSkillCategory;
	}

	public void setListSubSkillCategory(List<SkillCategory> listSubSkillCategory) {
		this.listSubSkillCategory = listSubSkillCategory;
	}

	public SkillCategoryManager getSkillCategoryManager() {
		return skillCategoryManager;
	}

	@Resource(name = "skillCategoryManager")
	public void setSkillCategoryManager(SkillCategoryManager skillCategoryManager) {
		this.skillCategoryManager = skillCategoryManager;
	}

	public List<SkillCategory> getListSubSkillCategorys() {
		return listSubSkillCategorys;
	}

	public void setListSubSkillCategorys(List<SkillCategory> listSubSkillCategorys) {
		this.listSubSkillCategorys = listSubSkillCategorys;
	}

	public List<Skill> getListSkill() {
		return listSkill;
	}

	public void setListSkill(List<Skill> listSkill) {
		this.listSkill = listSkill;
	}

	public String lisOneCV() throws Exception {
		this.cvs = cvManager.getOneCVDetail(jsId);
		return "lisOneCV";
	}

	public List<SkillCategory> getListMainSkillCategorys() {
		return listMainSkillCategorys;
	}

	public void setListMainSkillCategorys(List<SkillCategory> listMainSkillCategorys) {
		this.listMainSkillCategorys = listMainSkillCategorys;
	}

	public CVManager getCvManager() {
		return cvManager;
	}
	@Resource(name="cvManager")
	public void setCvManager(CVManager cvManager) {
		this.cvManager = cvManager;
	}

	public List<CV> getCvs() {
		return cvs;
	}

	public void setCvs(List<CV> cvs) {
		this.cvs = cvs;
	}

	public CV getOneCv() {
		return oneCv;
	}

	public void setOneCv(CV oneCv) {
		this.oneCv = oneCv;
	}

	public Integer getJsId() {
		return jsId;
	}

	public void setJsId(Integer jsId) {
		this.jsId = jsId;
	}

	public String getCVname() {
		return CVname;
	}

	public void setCVname(String cVname) {
		CVname = cVname;
	}
	
	public String sortJs() throws Exception {

		if(flag2%2==0) {
			this.jobseekers = um.sortJsByParamAsc(sort);
			flag2++;
		}
		else if(flag2%2 != 0) {
			this.jobseekers = um.sortJsByParamDesc(sort);
			flag2++;
		}
		
		return "sortJs";
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public static int getFlag2() {
		return flag2;
	}

	public static void setFlag2(int flag2) {
		JobSeekerAction.flag2 = flag2;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	
	
	
	

}
