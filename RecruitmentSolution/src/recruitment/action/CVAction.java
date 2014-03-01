package recruitment.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.CopyUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import recruitment.model.CV;
import recruitment.model.JobSeeker;
import recruitment.service.CVManager;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Component("cv")
@Scope("prototype")
public class CVAction extends ActionSupport implements ModelDriven{

	private static final long serialVersionUID = 4063974590820176683L;
	private CV cv = new CV();
	private List<CV> cvs;
	private String message="";
	private CVManager cvm;

	private File upload;  
	private String uploadFileName;  
	private String uploadContentType;  
	private String name;
	private File[] files;
	private String filename;

	public CVManager getCvm() {
		return cvm;
	}
	@Resource(name="cvManager")
	public void setCvm(CVManager cvm) {
		this.cvm = cvm;
	}

	@Override
	public Object getModel() {
		return cv;
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

	public File[] getFiles() {
		return files;
	}
	public void setFiles(File[] files) {
		this.files = files;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public CV getCv() {
		return cv;
	}
	public void setCv(CV cv) {
		this.cv = cv;
	}


	public String delete() throws Exception{
		boolean deleted = cvm.deleteCV(cv);
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
		boolean updated = cvm.updateCV(cv);
		if(updated) {
			message = "update succeeded";
			return "success";
		}
		else {
			message = "update failed";
			return "failed";
		}
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String upload()throws Exception{  
		try{
			JobSeeker js = (JobSeeker) ServletActionContext.getRequest().getSession().getAttribute("jobSeeker");
			Integer id = js.getJsId();
			String path = ServletActionContext.getServletContext().getRealPath("/upload");  
			filename = path+File.separator+this.getUploadFileName();
			String[] strs = filename.split("\\\\");
			StringBuffer sb = new StringBuffer();
	        for(int i = 0; i < strs.length; i ++){
	            if(i == strs.length-1)
	                sb.append(id+"_" );
	            sb.append(strs[i]);
	            if(i != strs.length-1)
	            	sb.append("\\");
	        }
	      filename = sb.toString();
			//filename = id + "_" +filename;
			FileInputStream in = new FileInputStream(upload);
			File destFile = new File(filename);
			 //destFile.renameTo(new   File(filename+"." + id));
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
		String title = filename.substring(filename.lastIndexOf("\\")+1);
		cv.setCvTitle(title);
		cvm.addCV(cv);
		return "upload";  
	}
	
		 
	public String list() throws Exception {
		this.cvs = cvm.getCVByJsId(this.cv);
		return "list";	
	}
	
	@SuppressWarnings("deprecation")
	public String downLoadCV() throws Exception{
		  HttpServletRequest request = ServletActionContext.getRequest();
		  HttpServletResponse response = ServletActionContext.getResponse();
		  String fileName =request.getParameter("filename"); 
		 // String resourceId= request.getParameter("resourceId");
		 // int userId = (Integer) ServletActionContext.getRequest().getSession().getAttribute("jobSeeker");
		 // this.resourceService.addDownLoadResource(userId, Integer.parseInt(resourceId));
		  fileName = new String(fileName.getBytes("iso-8859-1"),"utf-8");
		  System.out.println("current file name>>>>>>:"+fileName);
	        String fullpath = ServletActionContext.getRequest().getRealPath("/upload")+"/"+fileName;
	        InputStream in = null;
	       // File file = new File(fullpath);
	        	 try { 
	                 in = new FileInputStream(fullpath); 
	                 System.out.print(" read success"); 
	                 response.reset();
	                 response.setCharacterEncoding("utf-8");
	                 ServletActionContext.getRequest().setCharacterEncoding("utf-8");
	                 response.setContentType("application/x-pn-realmedia"); 
	                 response.addHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(fileName,"UTF-8") + "\""); 
	                 CopyUtils.copy(in, response.getOutputStream());
	             } catch (FileNotFoundException e) { 
	                 e.printStackTrace(); 
	                 request.setAttribute("message", "file not exist"); 
	             } catch (IOException e) { 
	                 return null; 
	             } catch (Exception e) { 
	                 e.printStackTrace(); 
	                 return null; 
	             } finally { 
	                 if (in != null) { 
	                     try { 
	                         in.close(); 
	                     } catch (IOException e) { 
	                         e.printStackTrace(); 
	                     } 
	                 } 
	             } 
	        return "success"; 
	    } 

		
	


}
