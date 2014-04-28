package recruitment.action;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import recruitment.model.Employer;
import recruitment.model.JobSeeker;
import recruitment.service.DbDao;
import recruitment.service.EmployerManager;
import util.mail.MailSenderInfo;
import util.mail.SimpleMailSender;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("emp")
@Scope("prototype")
public class EmployerAction extends ActionSupport implements ModelDriven {
	private static final long serialVersionUID = 1L;
	private EmployerManager empM;
	private List <Employer> employers;
	private Employer emp = new Employer();
	private String message="";
	private String currentPassword;
	private File upload;  
	private String filename;
	private String uploadFileName;  
	private String sort;
	private static int flag2 =0;
	
	private DbDao dbDao;

	public String getCurrentPassword() {
		return currentPassword;
	}

	public void setCurrentPassword(String currentPassword) {
		this.currentPassword = currentPassword;
	}

	public List<Employer> getEmployers() {
		return employers;
	}

	public void setEmployers(List<Employer> employers) {
		this.employers = employers;
	}

	public EmployerManager getEmpM() {
		return empM;
	}

	@Resource(name="empManager")
	public void setEmpM(EmployerManager empM) {
		this.empM = empM;
	}

	public Employer getEmp() {
		return emp;
	}

	public void setEmp(Employer emp) {
		this.emp = emp;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public void welcomeEmail() {
		MailSenderInfo mailInfo = new MailSenderInfo();
		mailInfo.setMailServerHost("smtp.qq.com");   
	    mailInfo.setMailServerPort("25");
	    mailInfo.setValidate(true); 
	    
	    mailInfo.setUserName("27248466");
		mailInfo.setFromAddress("27248466@qq.com");
		mailInfo.setPassword("zhen1606...");
		
		mailInfo.setToAddress(emp.getEmail());
		mailInfo.setSubject("Welcome to register with Recruitment Solution software");   
	    mailInfo.setContent("Thank you for  " + emp.getUsername()+ " to use Recruitment Solution software");
	    SimpleMailSender sms = new SimpleMailSender();
	    
	    sms.sendTextMail(mailInfo);
	}

	@Override
	public String execute() throws Exception {
		if(empM.checkEmpUsernameExists(emp)) {
			message = "user name is exist";
			return "fail";
		}
		if(empM.checkEmpEmailExists(emp)){
			message = "email is exist";
			return "fail";
		}
		emp.setImage("emp_default.jpg");	
		empM.addEmp(emp);
		Integer id=emp.getEmpId();
		if(getUploadFileName()!=null) {
		try{
			ResourceBundle rb = ResourceBundle.getBundle("uploadDirectory");
	    	String path = rb.getString("emp_filename");
			System.out.println(path);
			 filename = path+File.separator+this.getUploadFileName();
			String[] strs = filename.split("\\\\");
			
			StringBuffer sb = new StringBuffer();
	        for(int i = 0; i < strs.length; i ++){
	            if(i == strs.length-1)
	                sb.append(id+"_");
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

		emp.setImage(image);
		empM.addEmp(emp);
		}
		welcomeEmail();
		return "success_register";
	}

	public String load() throws Exception{
		this.emp = this.empM.loadByEmpId(emp);
		return "load";
	}
	
	public String eGet() throws Exception{
		this.emp = this.empM.loadByEmpId(emp);
		return "eGet";
	}
	
	public String get() throws Exception{
		this.emp = this.empM.loadByEmpId(emp);
		return "get";
	}

	public String delete() throws Exception{
		boolean	deleted = empM.deleteEmployer(emp);
		if(deleted) {
			message = "delete succeeded";
			return "success";
		}
		else {
			message = "delete failed, Employer id is not exist";
			return "fail";
		}
	}

	public String isLogin() throws Exception {
		emp = empM.login(emp);
		if (emp != null) {
			message = "login succeeded ";
			
			Employer e = (Employer) dbDao.get(Employer.class, emp.getEmpId());
			e.setLoginTime(new Date());
			dbDao.save(e);
			ServletActionContext.getRequest().getSession().setAttribute("employer", emp);
			return "success";
		} else {
			message = "login failed ";
			return "fail";
		}
	}
	
	public String logout() throws Exception {
		ServletActionContext.getRequest().getSession().removeAttribute("employer");
		return "logout";
	}
	
	@Override
	public Object getModel() {
		return emp;
	}

	public String list() throws Exception {
		this.employers = empM.getEmployers(this.emp);
		System.out.println(emp.getWebSite());
		return "list";
	}
	
	public String updateEmp()throws Exception {
		Employer e = (Employer) ServletActionContext.getRequest().getSession().getAttribute("employer");
		Integer id = emp.getEmpId();
		emp.setImage(e.getImage());
		
		boolean updated = empM.update(emp);
		if(updated) {
			message = "update succeeded ";
			
		}
		else{
			message = "update failed";
		return "fail";
		}
		if(getUploadFileName()!=null) {
			try{
				
				ResourceBundle rb = ResourceBundle.getBundle("uploadDirectory");
				String path = rb.getString("emp_filename");
				System.out.println(path);
				filename = path+File.separator+this.getUploadFileName();
				String[] strs = filename.split("\\\\");

				StringBuffer sb = new StringBuffer();
				for(int i = 0; i < strs.length; i ++){
					if(i == strs.length-1)
						sb.append( id+"_");
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
			}catch(Exception e1){
				e1.printStackTrace();
			}
			String image = filename.substring(filename.lastIndexOf("\\")+1);

			emp.setImage(image);
			empM.update(emp);
		}
		
		return "success";
		
	}
	
	public String checkEmpPassword() {
		try {
			Employer j = empM.loadByEmpId(emp);
			ServletActionContext.getResponse().getWriter().print(j.getPassword().equals(currentPassword));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public String updatePassword()throws Exception {
		boolean updated = empM.updatePassword(emp, currentPassword);
		if(updated) {
			message = "update succeeded ";
			return "success";
		}
			message = "update failed";
		return "fail";
	}
	
	public String checkUsernameExist() throws Exception {
		ServletActionContext.getResponse().getWriter().print(empM.checkEmpUsernameExists(emp));
		return null;
	}
	
	public String checkEmailExist() throws Exception {
		ServletActionContext.getResponse().getWriter().print(empM.checkEmpEmailExists(emp));
		return null;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public DbDao getDbDao() {
		return dbDao;
	}

	@Resource
	public void setDbDao(DbDao dbDao) {
		this.dbDao = dbDao;
	}
	
	public String sortEmp() throws Exception {

		if(flag2%2==0) {
			this.employers = empM.sortEmpByParamAsc(sort);
			flag2++;
		}
		else if(flag2%2 != 0) {
			this.employers = empM.sortEmpByParamDesc(sort);
			flag2++;
		}

		return "sortEmp";
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
		EmployerAction.flag2 = flag2;
	}
	
	
	
}
